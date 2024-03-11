#ifndef FAT12_H
#define FAT12_H

#include <drivers/disk.h>
#include <ion.h>
#include <ion/error.h>
#include <ion/fs.h>

#define BPB_OEM     0x3
#define BPB_BPS     0xB
#define BPB_SPC     0xD
#define BPB_NRS     0xE
#define BPB_NFAT    0x10
#define BPB_RENT    0x11
#define BPB_SECTORS 0x13
#define BPB_TYPE    0x15
#define BPB_SPFAT   0x16
#define BPB_SPT     0x18
#define BPB_HEADS   0x1A
#define BPB_HIDDEN  0x1C
#define BPB_LSCT    0x20
#define EBR_DRIVE   0x24
#define EBR_FLAGS   0x25
#define EBR_SIGN    0x26
#define EBR_ID      0x27
#define EBR_LAB     0x2B
#define EBR_SYS     0x36

#define FAT12_FREECLUSTER 0

#define FAT12_O_DEFAULT   0
#define FAT12_O_FREEENTRY 1
#define FAT12_O_MARKEND   1

#define FAT12_READ_ONLY 0x01
#define FAT12_HIDDEN    0x02
#define FAT12_SYSTEM    0x04
#define FAT12_VOLUME_ID 0x08
#define FAT12_DIRECTORY 0x10
#define FAT12_ARCHIVE   0x20
#define FAT12_DEVICE    0x60

/**
 * @brief The FAT12 header
 *
 */
typedef struct fat12_header {
        u8 bpb_oem[8];
        u8 bpb_sectors_per_cluster;
        u8 bpb_number_fat;
        u8 bpb_media_descriptor;
        u8 ebr_drive_number;
        u8 ebr_signature;
        u8 ebr_volume_label[11];
        u8 ebr_sys_ident[8];

        u32 bpb_bytes_per_sector;
        u32 bpb_reserved_sectors;
        u32 bpb_rootdir_entries;
        u32 bpb_total_sectors;
        u32 bpb_sectors_per_fat;
        u32 bpb_hidden_sectors;
        u32 bpb_large_sector_count;
        u32 ebr_volume_id;
} fat12_header_t;

/**
 * @brief the FAT12 mount information
 *
 */
typedef struct _fat12_mountinfo {
        u32 sectors;
        u32 sector_size;
        u32 sectors_per_cluster;
        u32 fat_offset;
        u32 root_entries;
        u32 root_offset;
        u32 root_size;
        u32 fat_size;
        u32 fat_entry_size;
        u32 data_area_offset;
} fat12_mountinfo;

#define FAT12_ENTRY_FNAME 0
#define FAT12_ENTRY_EXT   8
#define FAT12_ENTRY_FLAGS 11
#define FAT12_ENTRY_RES   12
#define FAT12_ENTRY_CMS   13
#define FAT12_ENTRY_CTIME 14
#define FAT12_ENTRY_CDATE 16
#define FAT12_ENTRY_LAST  18
#define FAT12_ENTRY_FCHI  20
#define FAT12_ENTRY_MTIME 22
#define FAT12_ENTRY_MDATE 24
#define FAT12_ENTRY_FCLO  26
#define FAT12_ENTRY_FSIZE 28
#define FAT12_ENTRY_LEN   32

/**
 * @brief A FAT12 directory entry
 *
 */
typedef struct {
        char fname[8], ext[3];
        u8   flags;
        u8   creation_ms;
        u32  creation_time;
        u32  creation_date;
        u32  last_access;
        u32  modification_time;
        u32  modification_date;
        u32  first_cluster;
        u32  size;
} fat12_entry;

struct fat_time {
        i32 time, date;
        u8  ms;
};

/**
 * @brief creates an (unmounted) instance of a FAT12 filesystem
 *
 * @param fat12
 */
void fat12_init(ion_fs *fat12);

/**
 * @brief Opens a given file from a FAT12 disk
 *
 * @param device the disk to search in
 * @param path the path to the file
 * @param flags flags to open the file for
 * @param[out] err the error on failure
 * @return int 0 on success, otherwise an error code
 */
ion_errcode fat12_open(ion_file *outfile, struct disk *device,
                       const char *path);

/**
 * @brief Closes a FAT12 file
 *
 * @param file the file descriptor of the file to close
 * @return int 0 on success, otherwise an error code
 */
ion_errcode fat12_close(ion_file *file);

/**
 * @brief Write data to an open file
 *
 * @param file the file descriptor
 * @param buff data to write
 * @param count the amount of bytes to write from buff
 * @return int 0 on success, otherwise an error code
 */
ion_errcode fat12_write(ion_file *file, const void *buff, usize count);

/**
 * @brief Read fata from an open file
 *
 * @param file the file descriptor
 * @param[out] buff a buffer in where to read the data
 * @param count the amount of bytes to read
 * @return int 0 on success, otherwise an error code
 */
ion_errcode fat12_read(ion_file *file, void *buff, usize count);

/**
 * @brief Mounts a FAT12 filesystem
 *
 * @param fat12 the filesystem
 * @param device the device to mount
 * @return int 0 on success, otherwise an error code
 */
ion_errcode fat12_mount(ion_fs *fat12, struct disk *device);

#define FAT12_SEEK_SET  0
#define FAT12_SEEK_CURR 1
#define FAT12_SEEK_END  2
/**
 * @brief Seeks an offset inside a file
 *
 * @param file the file to seek
 * @param offset the offset to seek
 * @param flags currently 0, SEEK_SET
 * @return int 0 on success, otherwise an error code
 */
ion_errcode fat12_seek(ion_file *file, usize offset, int flags);

/**
 * @brief Creates a file or truncates existing one
 *
 * @param fat12
 * @param path
 * @param flags ION_FS_RDONLY, ION_FS_SYSTEM, or 0 for a normal file
 * @return int o on success, otherwise an error cde
 */
ion_errcode fat12_create_file(ion_fs *fat12, const char *path, int flags);

/**
 * @brief Creates a directory
 *
 * @param fat12
 * @param path
 * @return int 0 on success, otherwise an error code
 */
ion_errcode fat12_create_dir(ion_fs *fat12, const char *path);

/**
 * @brief Marks a file as deleted and deallocates its clusters
 *
 * @param fat12
 * @param path
 * @return int 0 on success, otherwise an error code
 */
ion_errcode fat12_delete_file(ion_fs *fat12, const char *path);

/**
 * @brief Marks an empty directory as deleted
 *
 * @param fat12
 * @param path
 * @return int 0 on success, otherwise an error code
 */
ion_errcode fat12_delete_dir(ion_fs *fat12, const char *path);

/**
 * @brief Renames a file or directory, moving its entry if necessary
 *
 * @param fat12
 * @param old
 * @param new
 * @return int 0 on success, otherwise an error code
 */
ion_errcode fat12_rename(ion_fs *fat12, const char *old, const char *new);

#endif /* FAT12_H */
