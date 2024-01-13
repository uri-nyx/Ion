#include "include/drivers/fat12.h"
#include "include/drivers/hw.h"
#include "include/drivers/kb.h"
#include "include/ion/clock.h"
#include "include/ion/txtmod.h"
#include "include/system/error.h"
#include "include/system/kmalloc.h"
#include <ctype.h>
#include <stdio.h>
#include <string.h>

extern struct txtmod_ctx global_ctx;

static int fat12_dont_read  = 0;
static int fat12_write_zero = 0;

static int fat12_get_cluster(ion_fs *fat12, int mark);

static int to_be16(int le16)
{
        return ((le16 << 8) & 0xff00) | ((le16 >> 8) & 0xff);
}

static int to_le16(int be16)
{
        return ((be16 << 8) & 0xff00) | ((be16 >> 8) & 0xff);
}

/* Checks if a file name is 8.3. Returns 0 on success */
static int fat12_check_fname(char *fname)
{
        int i, j;

        for (i = 0; i < 9; i++) {
                if (fname[i] == '.')
                        break;
                if (fname[i] == '\0')
                        return 0;
        }

        for (j = i + 1; j < i + 5; j++) {
                if (fname[j] == '\0')
                        return 0;
        }
        return 1;
}

/* Parses an 8.3 name into 11 chars (as a null terminated string)*/
static void fat12_parse_fname(char *in, char *parsed)
{
        char  c;
        char *p;
        int   i;
        memset(parsed, ' ', 11);
        i = 0;
        p = in;
        while (c = *p++) {
                if (c == '.') {
                        i = 8;
                        continue;
                }
                parsed[i] = toupper(c);
                i++;
        }

        parsed[11] = 0;
}

static int fat12_parse_header(struct disk *drive, fat12_header_t *out)
{
        char buff[513];
        int  i, err;
        if (err = disk_load_sector(drive, 0, buff)) {
                return err;
        }
        for (i = 0; i < 8; i++) {
                out->bpb_oem[i]       = buff[BPB_OEM + i];
                out->ebr_sys_ident[i] = buff[EBR_SYS + i];
        }

        for (i = 0; i < 11; i++) {
                out->ebr_volume_label[i] = buff[EBR_LAB + i];
        }

        out->bpb_sectors_per_cluster = buff[BPB_SPC];
        out->bpb_number_fat          = buff[BPB_NFAT];
        out->bpb_media_descriptor    = buff[BPB_TYPE];
        out->ebr_drive_number        = buff[EBR_DRIVE];
        out->ebr_signature           = buff[EBR_SIGN];

        out->bpb_bytes_per_sector = buff[BPB_BPS] | buff[BPB_BPS + 1] << 8;
        out->bpb_reserved_sectors = buff[BPB_NRS] | buff[BPB_NRS + 1] << 8;
        out->bpb_rootdir_entries  = buff[BPB_RENT] | buff[BPB_RENT + 1] << 8;
        out->bpb_total_sectors = buff[BPB_SECTORS] | buff[BPB_SECTORS + 1] << 8;
        out->bpb_sectors_per_fat = buff[BPB_SPFAT] | buff[BPB_SPFAT + 1] << 8;
        out->bpb_hidden_sectors = buff[BPB_HIDDEN] | buff[BPB_HIDDEN + 1] << 8 |
                                  buff[BPB_HIDDEN + 2] << 16 |
                                  buff[BPB_HIDDEN + 3] << 24;
        out->bpb_large_sector_count = buff[BPB_LSCT] | buff[BPB_LSCT + 1] << 8 |
                                      buff[BPB_LSCT + 2] << 16 |
                                      buff[BPB_LSCT + 3] << 24;
        out->ebr_volume_id = buff[EBR_ID] | buff[EBR_ID + 1] << 8 |
                             buff[EBR_ID + 2] << 16 | buff[EBR_ID + 3] << 24;

        return 0;
}

static void fat12_get_mount_info(fat12_header_t *header, fat12_mountinfo *info)
{
        info->sectors      = header->bpb_total_sectors;
        info->fat_offset   = header->bpb_reserved_sectors;
        info->root_entries = header->bpb_rootdir_entries;
        info->root_offset =
                header->bpb_number_fat * header->bpb_sectors_per_fat + 1;
        info->root_size = ((header->bpb_rootdir_entries * 32) +
                           (header->bpb_bytes_per_sector - 1)) /
                          header->bpb_bytes_per_sector;
        info->fat_size       = header->bpb_sectors_per_fat;
        info->fat_entry_size = 8; //?
        info->sector_size    = header->bpb_bytes_per_sector;
        info->data_area_offset =
                header->bpb_reserved_sectors +
                (header->bpb_number_fat * header->bpb_sectors_per_fat) +
                info->root_size;
        info->sectors_per_cluster = header->bpb_sectors_per_cluster;
}

static void fat12_parse_entry(fat12_entry *entry, char *buff)
{
        int i;

        for (i = 0; i < 8; i++) {
                entry->fname[i] = buff[FAT12_ENTRY_FNAME + i];
        }
        for (i = 0; i < 3; i++) {
                entry->ext[i] = buff[FAT12_ENTRY_EXT + i];
        }

        entry->flags         = buff[FAT12_ENTRY_FLAGS];
        entry->creation_ms   = buff[FAT12_ENTRY_CMS];
        entry->creation_time = buff[FAT12_ENTRY_CTIME] |
                               buff[FAT12_ENTRY_CTIME + 1] << 8;
        entry->creation_date = buff[FAT12_ENTRY_CDATE] |
                               buff[FAT12_ENTRY_CDATE + 1] << 8;
        entry->last_access = buff[FAT12_ENTRY_LAST /**/] |
                             buff[FAT12_ENTRY_LAST + 1] << 8;
        entry->modification_time = buff[FAT12_ENTRY_MTIME] |
                                   buff[FAT12_ENTRY_MTIME + 1] << 8;
        entry->modification_date = buff[FAT12_ENTRY_MDATE] |
                                   buff[FAT12_ENTRY_MDATE + 1] << 8;
        entry->first_cluster = buff[FAT12_ENTRY_FCHI + 1] << 24 |
                               buff[FAT12_ENTRY_FCHI] << 16 |
                               buff[FAT12_ENTRY_FCLO + 1] << 8 |
                               buff[FAT12_ENTRY_FCLO];
        entry->size = buff[FAT12_ENTRY_FSIZE + 3] << 24 |
                      buff[FAT12_ENTRY_FSIZE + 2] << 16 |
                      buff[FAT12_ENTRY_FSIZE + 1] << 8 |
                      buff[FAT12_ENTRY_FSIZE];
}

static void fat12_unparse_entry(fat12_entry *entry, char *buff)
{
        int i;

        for (i = 0; i < 8; i++) {
                buff[FAT12_ENTRY_FNAME + i] = entry->fname[i];
        }
        for (i = 0; i < 3; i++) {
                buff[FAT12_ENTRY_EXT + i] = entry->ext[i];
        }

        buff[FAT12_ENTRY_FLAGS]     = entry->flags;
        buff[FAT12_ENTRY_CMS]       = entry->creation_ms;
        buff[FAT12_ENTRY_CTIME]     = entry->creation_time & 0xff;
        buff[FAT12_ENTRY_CTIME + 1] = entry->creation_time >> 8;
        buff[FAT12_ENTRY_CDATE]     = entry->creation_date & 0xff;
        buff[FAT12_ENTRY_CDATE + 1] = entry->creation_date >> 8;
        buff[FAT12_ENTRY_LAST]      = entry->last_access & 0xff;
        buff[FAT12_ENTRY_LAST + 1]  = entry->last_access >> 8;
        buff[FAT12_ENTRY_MTIME]     = entry->modification_time & 0xff;
        buff[FAT12_ENTRY_MTIME + 1] = entry->modification_time >> 8;
        buff[FAT12_ENTRY_MDATE]     = entry->modification_date & 0xff;
        buff[FAT12_ENTRY_MDATE + 1] = entry->modification_date >> 8;

        buff[FAT12_ENTRY_FCHI]     = (entry->first_cluster >> 16) & 0xff;
        buff[FAT12_ENTRY_FCHI + 1] = (entry->first_cluster >> 24) & 0xff;
        buff[FAT12_ENTRY_FCLO]     = entry->first_cluster & 0xff;
        buff[FAT12_ENTRY_FCLO + 1] = (entry->first_cluster >> 8) & 0xff;

        buff[FAT12_ENTRY_FSIZE + 3] = entry->size >> 24;
        buff[FAT12_ENTRY_FSIZE + 2] = entry->size >> 16;
        buff[FAT12_ENTRY_FSIZE + 1] = entry->size >> 8;
        buff[FAT12_ENTRY_FSIZE]     = entry->size & 0xff;
}

static int fat12_find_dir(ion_fs *fat12, ion_file *directory, ion_file *file,
                          void *buff, char *fname)
{
        char             dirname[12];
        int              i, j;
        int              sectors_in_dir, entries_per_sector;
        fat12_entry      dir;
        fat12_mountinfo *info;
        struct ion_error err;

        info = (struct _fat12_mountinfo *)fat12->meta;
        if (info == NULL)
                return ION_ENOMOUNT;
        /* DIRECTORY ENDS WHEN ENTRY IS 0 */
        sectors_in_dir     = info->sectors_per_cluster;
        entries_per_sector = info->sector_size / FAT12_ENTRY_LEN;

        for (i = 0; i < sectors_in_dir; i++) {
                err.number = fat12_read(directory, buff, info->sector_size);
                if (err.number)
                        return err.number;

                for (j = 0; j < entries_per_sector; j++) {
                        if (0 == *(char *)buff + j * FAT12_ENTRY_LEN)
                                goto notfound;
                        fat12_parse_entry(&dir, buff + j * FAT12_ENTRY_LEN);

                        memcpy(dirname, dir.fname, 11);
                        dirname[11] = 0;
                        if (strcmp(fname, dirname) == 0) {
                                file->device        = fat12->device.dev;
                                file->cluster       = dir.first_cluster;
                                file->first_cluster = dir.first_cluster;
                                file->eof           = 0;
                                file->lenght        = dir.size;
                                file->pos           = 0;
                                file->entry_block =
                                        i + info->data_area_offset +
                                        ((directory->first_cluster - 2)) *
                                                info->sectors_per_cluster;
                                file->entry_offset = j * FAT12_ENTRY_LEN;

                                file->flags = 0;
                                if (dir.flags & FAT12_DIRECTORY)
                                        file->flags |= ION_FS_DIR;
                                else
                                        file->flags |= ION_FS_FILE;

                                if (dir.flags & FAT12_READ_ONLY)
                                        file->flags |= ION_FS_RDONLY;
                                if (dir.flags & FAT12_SYSTEM)
                                        file->flags |= ION_FS_SYSTEM;
                                return 0;
                        }
                }
        }

notfound:
        file->flags = ION_FS_INVALID;
        return ION_ENOTFOUND;
}

static int fat12_find_root(ion_fs *fat12, ion_file *file, void *buff,
                           char *fname)
{
        char             dirname[12];
        int              i, j;
        int              entries_per_sector;
        fat12_entry      dir;
        fat12_mountinfo *info;
        struct ion_error err;

        info = (struct _fat12_mountinfo *)fat12->meta;
        if (info == NULL)
                return ION_ENOMOUNT;
        entries_per_sector = info->sector_size / FAT12_ENTRY_LEN;

        for (i = 0; i < info->root_size; i++) {
                err.number = disk_load_sector(&fat12->device,
                                              info->root_offset + i, buff);

                if (err.number)
                        return err.number;

                for (j = 0; j < entries_per_sector; j++) {
                        fat12_parse_entry(&dir, buff + j * FAT12_ENTRY_LEN);

                        memcpy(dirname, dir.fname, 11);
                        dirname[11] = 0;
                        if (strcmp(fname, dirname) == 0) {
                                file->device        = fat12->device.dev;
                                file->cluster       = dir.first_cluster;
                                file->first_cluster = dir.first_cluster;
                                file->eof           = 0;
                                file->lenght        = dir.size;
                                file->pos           = 0;
                                file->entry_block   = info->root_offset + i;
                                file->entry_offset  = j * FAT12_ENTRY_LEN;

                                file->flags = 0;
                                if (dir.flags & FAT12_DIRECTORY)
                                        file->flags |= ION_FS_DIR;
                                else
                                        file->flags |= ION_FS_FILE;

                                if (dir.flags & FAT12_READ_ONLY)
                                        file->flags |= ION_FS_RDONLY;
                                if (dir.flags & FAT12_SYSTEM)
                                        file->flags |= ION_FS_SYSTEM;
                                return 0;
                        }
                }
        }
        file->flags = ION_FS_INVALID;
        return ION_ENOTFOUND;
}

static int fat12_free_root_entry(ion_fs *fat12, void *sector, int *sectornum)
{
        int              i, j;
        int              entries_per_sector;
        fat12_mountinfo *info;
        struct ion_error err;

        info = (struct _fat12_mountinfo *)fat12->meta;
        if (info == NULL)
                return ION_ENOMOUNT;
        entries_per_sector = info->sector_size / FAT12_ENTRY_LEN;

        for (i = 0; i < info->root_size; i++) {
                err.number = disk_load_sector(&fat12->device,
                                              info->root_offset + i, sector);

                if (err.number)
                        return err.number;

                for (j = 0; j < entries_per_sector; j++) {
                        switch (((char *)sector)[j * FAT12_ENTRY_LEN]) {
                        case 0x0:
                        case 0x05:
                        case 0xE5:

                                *sectornum = i + info->root_offset;
                                return j * FAT12_ENTRY_LEN;
                                break;
                        default:
                                break;
                        }
                }
        }
        return ION_ERFULL;
}

static int fat12_free_dir_entry(ion_fs *fat12, ion_file *directory,
                                void *sector, int *sectornum)
{
        int              i, j;
        int              entries_per_sector;
        int              entries_in_dir;
        fat12_mountinfo *info;
        struct ion_error err;

        info = (struct _fat12_mountinfo *)fat12->meta;
        if (info == NULL)
                return ION_ENOMOUNT;

        entries_in_dir = (info->sector_size * info->sectors_per_cluster) /
                         FAT12_ENTRY_LEN;
        entries_per_sector = info->sector_size / FAT12_ENTRY_LEN;

        for (i = 0; i < entries_in_dir; i++) {
                err.number = fat12_read(directory, sector, info->sector_size);

                if (err.number)
                        return err.number;

                for (j = 0; j < entries_per_sector; j++) {
                        switch (((char *)sector)[j * FAT12_ENTRY_LEN]) {
                        case 0x0:
                        case 0x05:
                        case 0xE5:
                                *sectornum = i + info->data_area_offset +
                                             (directory->first_cluster - 2) *
                                                     info->sectors_per_cluster;
                                return j * FAT12_ENTRY_LEN;
                                break;
                        default:
                                break;
                        }
                }
        }
        return ION_ERFULL;
}

static int fat12_find(ion_fs *fat12, ion_file *file, char *path)
{
        char            *next, currname[13], pfname[12];
        char            *buff;
        int              i, j, is_root_dir;
        int              entries_per_sector;
        ion_file         currfile, tmp_file;
        fat12_entry      currentry;
        fat12_mountinfo *info;
        struct ion_error err;

        info = (struct _fat12_mountinfo *)fat12->meta;
        if (info == NULL)
                return ION_ENOMOUNT;

        buff = kmalloc_e(info->sector_size, &err);
        if (err.number)
                return err.number;

        next               = path;
        is_root_dir        = 1;
        entries_per_sector = info->sector_size / FAT12_ENTRY_LEN;
        do {
                next = fs_next_subpath(currname, next);
                if (fat12_check_fname(currname)) {
                        kfree(buff);
                        return ION_ENOT8_3;
                }

                fat12_parse_fname(currname, pfname);

                if (is_root_dir) {
                        is_root_dir = 0;
                        err.number =
                                fat12_find_root(fat12, &currfile, buff, pfname);

                        if (err.number) {
                                kfree(buff);
                                return err.number;
                        }

                        strcpy(currfile.name, currname);

                        if (currfile.flags & ION_FS_FILE && next) {
                                kfree(buff);
                                return ION_EEXPECTEDDIR;
                        }
                } else {
                        err.number = fat12_find_dir(fat12, &currfile, &tmp_file,
                                                    buff, pfname);
                        if (err.number) {
                                kfree(buff);
                                return err.number;
                        }

                        memcpy(&currfile, &tmp_file, sizeof(ion_file));

                        strcpy(currfile.name, currname);

                        if (currfile.flags & ION_FS_FILE && next) {
                                kfree(buff);
                                return ION_EEXPECTEDDIR;
                        }
                }
        } while (next);

        memcpy(file, &currfile, sizeof(ion_file));
        kfree(buff);
        return 0;
}

static void fat12_tofattime(struct ion_time *ion, struct fat_time *dos)
{
        dos->time = ion->hour << 11;
        dos->time |= ion->minute << 5;
        dos->time |= (ion->second / 2 & 0x1f);
        dos->date = (ion->year + 2000 - 1980) << 9;
        dos->date |= (ion->month & 0xf) << 5;
        dos->date |= (ion->day & 0x1f);
        dos->ms = ion->ms;
}

static int fat12_next_cluster(ion_fs *fat12, int prev_cluster)
{
        int              next_cluster;
        char            *FAT;
        fat12_mountinfo *info;
        struct ion_error err;
        int              fat_offset;
        int              fat_sector;
        int              ent_offset;

        info = (struct _fat12_mountinfo *)fat12->meta;
        FAT  = kmalloc_e(info->sector_size * 2, &err);
        if (err.number)
                goto cleanup;

        fat_offset = prev_cluster + (prev_cluster / 2); // multiply by 1.5
        fat_sector = info->fat_offset + (fat_offset / info->sector_size);
        ent_offset = fat_offset % info->sector_size;

        if (err.number = disk_load_sectors(&fat12->device, fat_sector, 2, FAT))
                goto cleanup;

        next_cluster = FAT[ent_offset];
        next_cluster |= FAT[ent_offset + 1] << 8;
        next_cluster = (prev_cluster & 1) ? next_cluster >> 4 :
                                            next_cluster & 0xfff;
        err.number   = next_cluster;

cleanup:
        kfree(FAT);
        return err.number;
}

int fat12_mark_fat_entry(ion_fs *fat12, int cluster, int mark)
{
        char            *FAT;
        fat12_mountinfo *info;
        struct ion_error err;
        int              fat_offset;
        int              fat_sector;
        int              ent_offset;

        info = (struct _fat12_mountinfo *)fat12->meta;
        FAT  = kmalloc_e(info->sector_size * 2, &err);
        if (err.number)
                goto cleanup;

        fat_offset = cluster + (cluster / 2); // multiply by 1.5
        fat_sector = info->fat_offset + (fat_offset / info->sector_size);
        ent_offset = fat_offset % info->sector_size;

        if (err.number = disk_load_sectors(&fat12->device, fat_sector, 2, FAT))
                goto cleanup;

        if (cluster & 1) {
                FAT[ent_offset] &= 0x0f;
                FAT[ent_offset + 1] = 0;
                FAT[ent_offset] |= ((mark << 4) & 0xf0);
                FAT[ent_offset + 1] = ((mark >> 4) & 0xff);
        } else {
                FAT[ent_offset] = 0;
                FAT[ent_offset + 1] &= 0xf0;
                FAT[ent_offset] = mark & 0xff;
                FAT[ent_offset + 1] |= ((mark >> 8) & 0xf);
        }

        disk_store_sectors(&fat12->device, fat_sector, 2, FAT);

        err.number = 0;

cleanup:
        kfree(FAT);
        return err.number;
}

static int fat12_update_entry(ion_file *file, int option)
{
        char             sector[512], *e; // TODO: allocate this dynamically
        ion_fs          *fat12;
        struct ion_error err;
        struct fat_time  ftime;
        struct ion_time  itime;

        if (file == NULL)
                return ION_ENULLFILE;
        if (file->device >= ION_MAX_DEVICES)
                return ION_EDEVTOOBIG;
        if (filesystems[file->device] == NULL)
                return ION_ENOFS;

        fat12 = filesystems[file->device];

        err.number =
                disk_load_sector(&fat12->device, file->entry_block, sector);
        if (err.number)
                return err.number;

        clock_gettime(&itime);
        fat12_tofattime(&itime, &ftime);

        e = (char *)(sector + file->entry_offset);

        if (option & FAT12_O_FREEENTRY) {
                e[0] = 0xe5;
                goto store;
        }

        e[FAT12_ENTRY_FSIZE + 3] = file->lenght >> 24;
        e[FAT12_ENTRY_FSIZE + 2] = file->lenght >> 16;
        e[FAT12_ENTRY_FSIZE + 1] = file->lenght >> 8;
        e[FAT12_ENTRY_FSIZE]     = file->lenght & 0xff;
        e[FAT12_ENTRY_MDATE + 1] = ftime.date >> 8;
        e[FAT12_ENTRY_MDATE]     = ftime.date & 0xff;
        e[FAT12_ENTRY_MTIME + 1] = ftime.time >> 8;
        e[FAT12_ENTRY_MTIME]     = ftime.time & 0xff;
        e[FAT12_ENTRY_LAST + 1]  = ftime.date >> 8;
        e[FAT12_ENTRY_LAST]      = ftime.date & 0xFF;

store:
        err.number =
                disk_store_sector(&fat12->device, file->entry_block, sector);
        if (err.number) {
                return err.number;
        }

        return ION_EOK;
}

static int fat12_next_or_alloc_cluster(ion_fs *fat12, int cluster)
{
        int next_cluster, free_cluster, err;
        next_cluster = fat12_next_cluster(fat12, cluster);

        if (next_cluster < 0) {
                return next_cluster; /* Error code */
        } else if (next_cluster >= 0xff8) {
                /* alloc a free cluster */
                free_cluster = fat12_get_cluster(fat12, 1);

                if (free_cluster == 0) {
                        return ION_ENCLUSTER;
                } else if (free_cluster < 0) {
                        return free_cluster; /* Error code*/
                }

                if (err = fat12_mark_fat_entry(fat12, cluster, free_cluster)) {
                        return err;
                }

                return free_cluster;
        }

        return next_cluster;
}

static int fat12_create_entry(ion_fs *fat12, fat12_entry *entry, char *path)
{
        int   i;
        char *fname, rest_of_path[100]; // TODO: amybe allocate dinamycally
        char  sector[512], entrybuff[FAT12_ENTRY_LEN]; // TODO: allocate this
                                                      // dynamically
        int             offset, err, sectornum;
        ion_file        dir;
        struct fat_time ftime;
        struct ion_time itime;

        err = fat12_find(fat12, &dir, path);
        if (err == ION_EOK)
                return ION_EEXIST;
        else if (err != ION_ENOTFOUND)
                return err;

        fname = fs_path_and_fname(path, rest_of_path);

        clock_gettime(&itime);
        fat12_tofattime(&itime, &ftime);

        entry->creation_ms   = ftime.ms;
        entry->creation_date = ftime.date;
        entry->creation_time = ftime.time;

        entry->last_access       = ftime.date;
        entry->modification_time = ftime.time;
        entry->modification_date = ftime.date;

        if (*rest_of_path) {
                /* We are not creating a file in the root directory */
                fat12_find(fat12, &dir, rest_of_path);

                if (dir.flags & ION_FS_DIR) {
                        /* Iterate and locate last entry */

                        offset = fat12_free_dir_entry(fat12, &dir, sector,
                                                      &sectornum);
                        if (offset < 0)
                                return offset;
                        fat12_unparse_entry(entry, entrybuff);
                        memcpy(sector + offset, entrybuff, FAT12_ENTRY_LEN);
                        disk_store_sector(&fat12->device, sectornum, sector);
                        return ION_EOK;
                } else
                        return ION_EEXPECTEDDIR;
        } else {
                /* We are creating a file in the root directory */

                offset = fat12_free_root_entry(fat12, sector, &sectornum);

                if (offset < 0)
                        return offset;
                fat12_unparse_entry(entry, entrybuff);
                memcpy(sector + offset, entrybuff, FAT12_ENTRY_LEN);
                disk_store_sector(&fat12->device, sectornum, sector);
                return ION_EOK;
        }
}

/* Returns the number of the first free data cluster found, 0 if not more free
 * clusters, or an error code */
static int fat12_get_cluster(ion_fs *fat12, int mark)
{
        int              i, j, entries;
        int              fat_entryhi, fat_entrylo;
        char            *FAT;
        fat12_mountinfo *info;
        struct ion_error err;

        info = (struct _fat12_mountinfo *)fat12->meta;
        FAT  = kmalloc_e(info->sector_size * 2, &err);
        if (err.number)
                goto cleanup;

        for (i = 0; i < info->fat_size; i++) {
                if (err.number = disk_load_sectors(
                            &fat12->device, info->fat_offset + i, 2, FAT))
                        goto cleanup;
                for (j = 0; j < info->sector_size + 1; j += 3) {
                        /*
                        FAT12 FAT entry ll lh hh
                        */

                        fat_entrylo = ((FAT[j + 1] & 0xf) << 8) | FAT[j];
                        fat_entryhi = ((FAT[j + 2] << 4) & 0xFF0) |
                                      ((FAT[j + 1] & 0xF0) >> 4);

                        if (fat_entrylo == 0) {
                                if (mark) {
                                        FAT[j + 1] |= 0xf;
                                        FAT[j] = 0xff;
                                        disk_store_sectors(&fat12->device,
                                                           info->fat_offset + i,
                                                           2, FAT);
                                }
                                err.number =
                                        ((i * info->sector_size) + j * 8) / 12;
                                goto cleanup;
                        }
                        if (fat_entryhi == 0) {
                                if (mark) {
                                        FAT[j + 1] |= 0xf0;
                                        FAT[j + 2] = 0xff;
                                        disk_store_sectors(&fat12->device,
                                                           info->fat_offset + i,
                                                           2, FAT);
                                }
                                err.number =
                                        ((i * info->sector_size) + j * 8) / 12 +
                                        1;
                                goto cleanup;
                        }
                }
        }

        err.number = 0;

cleanup:
        kfree(FAT);
        return err.number;
}

int fat12_mount(ion_fs *fat12, struct disk *device)
{
        struct ion_error         err;
        fat12_header_t           header;
        struct _fat12_mountinfo *info;

        info = (struct _fat12_mountinfo *)kmalloc_e(sizeof(fat12_mountinfo),
                                                    &err);

        if (info == NULL)
                return err.number;
        if (err.number = fat12_parse_header(device, &header))
                return err.number;
        fat12_get_mount_info(&header, info);
        fat12->meta = info;

        fat12->device.dev         = device->dev;
        fat12->device.type        = device->type;
        fat12->device.sectors     = device->sectors;
        fat12->device.sector_size = device->sector_size;
        return 0;
}

void fat12_init(ion_fs *fat12)
{
        strcpy(fat12->name, "FAT12");
        fat12->mount = fat12_mount;
        fat12->creat = fat12_create_file;
        fat12->delet = fat12_delete_file;
        fat12->mkdir = fat12_create_dir;
        fat12->rmdir = fat12_delete_dir;
        fat12->read  = fat12_read;
        fat12->write = fat12_write;
        fat12->close = fat12_close;
        fat12->open  = fat12_open;
        fat12->seek  = fat12_seek;
        fat12->meta  = NULL;
}

int fat12_read(ion_file *file, void *buff, int count)
{
        /*TODO: Implement a sound read driver*/
        int              i, j;
        int              left, sectors_left, clusters_left;
        int              sector_index;
        int              fat_index;
        int              fat_sector;
        int              entry_offset;
        int              next_cluster;
        int              cluster_size;
        int              cluster_index;
        int              pos_in_cluster, is_eof;
        int              clusters_to_read;
        char            *data, *FAT;
        ion_fs          *fat12;
        fat12_mountinfo *info;
        struct ion_error err;

        if ((file->flags & ION_FS_FILE) && (file->pos >= file->lenght)) {
                file->eof = 1;
                return ION_EOF;
        }

        if (file == NULL)
                return ION_ENULLFILE;
        if (file->device >= ION_MAX_DEVICES)
                return ION_EDEVTOOBIG;
        if (filesystems[file->device] == NULL)
                return ION_ENOFS;

        if (file->flags & ION_FS_WRONLY)
                return ION_EBADF;

        left         = count;
        fat12        = filesystems[file->device];
        info         = (struct _fat12_mountinfo *)fat12->meta;
        sector_index = info->data_area_offset +
                       (file->cluster - 2) * info->sectors_per_cluster;
        cluster_size     = info->sectors_per_cluster * info->sector_size;
        pos_in_cluster   = file->pos % cluster_size;
        cluster_index    = file->pos / cluster_size;
        is_eof           = (file->pos + count) > file->lenght;
        clusters_to_read = 1 + ((file->pos + count) / cluster_size);

        data = kmalloc_e(cluster_size, &err);
        if (err.number) {
                file->flags = ION_FS_INVALID;
                return err.number;
        }

        if (err.number = disk_load_sectors(&fat12->device, sector_index,
                                           info->sectors_per_cluster, data)) {
                kfree(data);
                return err.number;
        }

        if (pos_in_cluster + count < cluster_size) {
                if (!fat12_dont_read) {
                        memcpy(buff, data + pos_in_cluster, count);
                }
                file->eof = is_eof;
                file->pos += count;
                kfree(data);
                return 0;
        } else {
                if (!fat12_dont_read) {
                        memcpy(buff, data + pos_in_cluster,
                               cluster_size - pos_in_cluster);
                }
                count -= (cluster_size - pos_in_cluster);
                clusters_to_read -= 1;
                pos_in_cluster = 0;
                file->pos += (cluster_size - pos_in_cluster);
        }

        FAT = kmalloc_e(info->sector_size * 2, &err);
        if (err.number) {
                kfree(data);
                return err.number;
        }

        for (i = 0; i < clusters_to_read; i++) {
                fat_index  = file->cluster + (file->cluster / 2);
                fat_sector = info->fat_offset + (fat_index / info->sector_size);
                entry_offset = fat_index % info->sector_size;

                if (err.number = disk_load_sectors(&fat12->device, fat_sector,
                                                   2, FAT)) {
                        kfree(data);
                        kfree(FAT);
                        return err.number;
                }

                next_cluster = FAT[entry_offset] | FAT[entry_offset + 1] << 8;
                next_cluster = (file->cluster & 1) ? next_cluster >> 4 :
                                                     next_cluster & 0xfff;

                if (next_cluster >= 0xff8) {
                        file->eof = 1;
                        kfree(data);
                        kfree(FAT);
                        return (file->flags & ION_FS_FILE) ? ION_EOF : 0;
                        // RETURN EOF
                        // AS ERROR?
                }

                if (next_cluster == 0) {
                        file->eof = 1;
                        kfree(data);
                        kfree(FAT);
                        return ION_EFCORRUPT;
                }

                file->cluster = next_cluster;
                sector_index  = info->data_area_offset +
                               (file->cluster - 2) * info->sectors_per_cluster;
                if (err.number = disk_load_sectors(&fat12->device, sector_index,
                                                   info->sectors_per_cluster,
                                                   data)) {
                        kfree(data);
                        kfree(FAT);
                        return err.number;
                }

                if (count < cluster_size && !fat12_dont_read) {
                        memcpy(buff + (i + 1) * cluster_size, data, count);
                        break;
                } else {
                        if (!fat12_dont_read) {
                                memcpy(buff + (i + 1) * cluster_size, data,
                                       cluster_size);
                        }
                        count -= cluster_size;
                }
        }
        file->cluster = next_cluster;
        file->pos += count;
        file->eof = is_eof;
        kfree(data);
        kfree(FAT);
        return ION_EOK;
}

int fat12_open(ion_file *outfile, struct disk *device, char *path)
{
        struct ion_error err;
        ion_fs          *fat12;
        ion_file         file;

        fat12 = filesystems[device->dev];
        if (fat12 == NULL) {
                err.number = ION_ENOFS;
                goto end;
        }

        err.number = fat12_find(fat12, &file, path);
        if (err.number) {
                goto end;
        }

        file.id = fs_currid++;
        memcpy(outfile, &file, sizeof(ion_file));
end:
        return err.number;
}

int fat12_close(ion_file *file)
{
        fs_currid--;
        return 0;
}

int fat12_seek(ion_file *file, int offset, int flags)
{
        int err;

        switch (flags) {
        case FAT12_SEEK_SET:
                file->pos       = 0;
                fat12_dont_read = 1;
                err             = fat12_read(file, NULL, offset);
                fat12_dont_read = 0;
                break;
        case FAT12_SEEK_CURR:
                fat12_dont_read = 1;
                err             = fat12_read(file, NULL, offset);
                fat12_dont_read = 0;
                break;
        case FAT12_SEEK_END:
                file->pos        = file->lenght;
                fat12_write_zero = 1;
                err              = fat12_write(file, NULL, offset);
                fat12_write_zero = 0;
                break;
        default:
                err = ION_EINVAL;
                break;
        }

        return err;
}

int fat12_create_file(ion_fs *fat12, char *path, int flags)
{
        int         err;
        char       *fname, dosfname[13];
        fat12_entry entry;
        ion_file    file;

        if (path == NULL)
                return ION_ENULLFNAME;

        fname = fs_fname_from_path(path);

        fat12_parse_fname(fname, dosfname);

        strncpy(entry.fname, dosfname, 8);
        strncpy(entry.ext, dosfname + 8, 3);
        entry.size  = 0;
        entry.flags = FAT12_ARCHIVE;
        entry.flags |= (flags & ION_FS_SYSTEM) ? FAT12_SYSTEM : 0;
        entry.flags |= (flags & ION_FS_RDONLY) ? FAT12_READ_ONLY : 0;

        if (fat12_find(fat12, &file, path) == ION_EOK) {
                /* Truncate */
                err = fat12_delete_file(fat12, path);
                if (err)
                        return err;
        }

        entry.first_cluster = err = fat12_get_cluster(fat12, FAT12_O_MARKEND);
        if (err == 0)
                return ION_EDISKFULL;
        else if (err < 0)
                return err;

        err = fat12_create_entry(fat12, &entry, path);
        return err;
}

int fat12_create_dir(ion_fs *fat12, char *path)
{
        int         err;
        char       *fname, dosfname[13];
        fat12_entry entry;
        ion_file    file;

        if (path == NULL)
                return ION_ENULLFNAME;

        fname = fs_fname_from_path(path);

        fat12_parse_fname(fname, dosfname);

        strncpy(entry.fname, dosfname, 8);
        strncpy(entry.ext, dosfname + 8, 3);
        entry.size  = 0;
        entry.flags = FAT12_DIRECTORY;

        if (fat12_find(fat12, &file, path) == ION_EOK)
                return ION_EEXIST;

        entry.first_cluster = err = fat12_get_cluster(fat12, FAT12_O_MARKEND);
        if (err == 0)
                return ION_EDISKFULL;
        else if (err < 0)
                return err;

        err = fat12_create_entry(fat12, &entry, path);
        return err;
}

int fat12_delete_file(ion_fs *fat12, char *path)
{
        int      err, cluster, next_cluster;
        ion_file file;

        if (path == NULL)
                return ION_ENULLFNAME;

        err = fat12_find(fat12, &file, path);
        if (err)
                return err;

        if (file.flags & ION_FS_DIR)
                return ION_EEXPECTEDFILE;

        cluster = file.first_cluster;
        do {
                err = next_cluster = fat12_next_cluster(fat12, cluster);
                if (err < 0)
                        return err;

                fat12_mark_fat_entry(fat12, cluster, FAT12_FREECLUSTER);
                cluster = next_cluster;
        } while (cluster < 0xff8);

        fat12_mark_fat_entry(fat12, cluster, FAT12_FREECLUSTER);

        err = fat12_update_entry(&file, FAT12_O_FREEENTRY);
        return err;
}

int fat12_delete_dir(ion_fs *fat12, char *path)
{
        int      err, cluster, next_cluster;
        ion_file file;

        if (path == NULL)
                return ION_ENULLFNAME;

        err = fat12_find(fat12, &file, path);
        if (err)
                return err;

        if (file.flags & ION_FS_FILE)
                return ION_EEXPECTEDDIR;

        cluster = file.first_cluster;
        do {
                err = next_cluster = fat12_next_cluster(fat12, cluster);
                if (err < 0)
                        return err;

                fat12_mark_fat_entry(fat12, cluster, FAT12_FREECLUSTER);
                cluster = next_cluster;
        } while (cluster < 0xff8);

        fat12_mark_fat_entry(fat12, cluster, FAT12_FREECLUSTER);

        err = fat12_update_entry(&file, FAT12_O_FREEENTRY);
        return err;
}

int fat12_write(ion_file *file, void *buff, int count)
{
        char            *cluster;
        int              sector_index, curr, i;
        int              prev_cluster, next_cluster, current_cluster;
        int              pos_in_cluster, clusters_to_write;
        int              cluster_size, len;
        fat12_mountinfo *info;
        ion_fs          *fat12;
        struct ion_error err;

        if (file == NULL)
                return ION_ENULLFILE;
        if (file->device >= ION_MAX_DEVICES)
                return ION_EDEVTOOBIG;
        if (filesystems[file->device] == NULL)
                return ION_ENOFS;

        if (file->flags & ION_FS_RDONLY)
                return ION_EBADF;

        fat12 = filesystems[file->device];
        info  = (struct _fat12_mountinfo *)fat12->meta;

        sector_index = info->data_area_offset +
                       (file->cluster - 2) * info->sectors_per_cluster;
        cluster_size = info->sectors_per_cluster * info->sector_size;
        cluster =
                kmalloc_e(info->sectors_per_cluster * info->sector_size, &err);
        if (err.number)
                goto cleanup;

        curr            = 0;
        prev_cluster    = file->cluster;
        current_cluster = file->cluster;
        pos_in_cluster  = file->pos % cluster_size;

        sector_index = info->data_area_offset +
                       (prev_cluster - 2) * info->sectors_per_cluster;

        if (err.number = disk_load_sectors(&fat12->device, sector_index,
                                           info->sectors_per_cluster, cluster))
                goto cleanup;

        if (pos_in_cluster + count < cluster_size) {
                if (fat12_write_zero)
                        memset(cluster + pos_in_cluster, 0, count);
                else
                        memcpy(cluster + pos_in_cluster, buff, count);
                err.number = disk_store_sectors(&fat12->device, sector_index,
                                                info->sectors_per_cluster,
                                                cluster);
        } else {
                // I have to write cluster_size - (pos_in_cluster) in loaded
                // cluster,
                // (pos_in_cluster+count) / cluster_size is the number of
                // clusters we have to write in store 230 starting in 30 loaded
                // cluster: 70 next cluster: 100 last cluster: 60
                clusters_to_write = (pos_in_cluster + count) / cluster_size;
                clusters_to_write +=
                        ((pos_in_cluster + count) % cluster_size) ? 1 : 0;

                // In loaded cluster
                if (fat12_write_zero)
                        memset(cluster + pos_in_cluster, 0,
                               cluster_size - pos_in_cluster);
                else
                        memcpy(cluster + pos_in_cluster, buff,
                               cluster_size - pos_in_cluster);
                err.number = disk_store_sectors(&fat12->device, sector_index,
                                                info->sectors_per_cluster,
                                                cluster);
                if (err.number)
                        goto cleanup;

                clusters_to_write--;
                curr = cluster_size - pos_in_cluster;

                for (i = 0; i < clusters_to_write - 1; i++) {
                        next_cluster = fat12_next_or_alloc_cluster(
                                fat12, prev_cluster);
                        if (next_cluster < 0) {
                                err.number = next_cluster;
                                goto cleanup;
                        }

                        sector_index =
                                info->data_area_offset +
                                (next_cluster - 2) * info->sectors_per_cluster;

                        if (err.number = disk_load_sectors(
                                    &fat12->device, sector_index,
                                    info->sectors_per_cluster, cluster))
                                goto cleanup;

                        prev_cluster = next_cluster;

                        if (fat12_write_zero)
                                memset(cluster, 0, cluster_size);
                        else
                                memcpy(cluster, buff + curr, cluster_size);
                        curr += cluster_size;
                        err.number = disk_store_sectors(
                                &fat12->device, sector_index,
                                info->sectors_per_cluster, cluster);
                        if (err.number)
                                goto cleanup;
                }

                // The tail cluster

                next_cluster = fat12_next_or_alloc_cluster(fat12, prev_cluster);
                if (next_cluster < 0) {
                        err.number = next_cluster;
                        goto cleanup;
                }

                sector_index = info->data_area_offset +
                               (next_cluster - 2) * info->sectors_per_cluster;

                if (err.number = disk_load_sectors(&fat12->device, sector_index,
                                                   info->sectors_per_cluster,
                                                   cluster))
                        goto cleanup;

                // first: 90 (sz - pos), inter:
                len = count - curr;

                if (fat12_write_zero)
                        memset(cluster, 0, len);
                else
                        memcpy(cluster, buff + curr, len);
                curr += len;
                err.number = disk_store_sectors(&fat12->device, sector_index,
                                                info->sectors_per_cluster,
                                                cluster);
                if (err.number)
                        goto cleanup;

                current_cluster = next_cluster;
        }

end:
        file->pos += count;
        file->eof = file->pos > file->lenght;
        file->lenght += file->eof ? count : 0;
        file->cluster = current_cluster;
        fat12_update_entry(file, FAT12_O_DEFAULT);
cleanup:
        kfree(cluster);
        return err.number;
}

int fat12_rename(ion_fs *fat12, char *old, char *new)
{
        int         err;
        char       *fname, dosfname[13];
        static char sector[512];
        fat12_entry oldentry;
        ion_file    file;

        if (old == NULL || new == NULL)
                return ION_ENULLFNAME;

        err = fat12_find(fat12, &file, new);
        if (err == ION_EOK)
                return ION_EEXIST;

        err = fat12_find(fat12, &file, old);
        if (err)
                return err;

        err = disk_load_sector(&fat12->device, file.entry_block, sector);
        if (err)
                return err;

        fat12_parse_entry(&oldentry, sector + file.entry_offset);

        sector[file.entry_offset] = 0xe5;
        err = disk_store_sector(&fat12->device, file.entry_block, sector);
        if (err)
                return err;

        fname = fs_fname_from_path(new);
        fat12_parse_fname(fname, dosfname);
        strncpy(oldentry.fname, dosfname, 8);
        strncpy(oldentry.ext, dosfname + 8, 3);
        err = fat12_create_entry(fat12, &oldentry, new);

        if (err)
                return err;

        return ION_EOK;
}