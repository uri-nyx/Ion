#ifndef FAT12_H
#define FAT12_H

#ifndef __LINT
#include "include/drivers/disk.h"
#include "include/system/error.h"
#include "include/system/fs.h"
#else
#include "disk.h"
#include "error.h"
#include "fs.h"
#endif

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
        char bpb_oem[8];
        char bpb_sectors_per_cluster;
        char bpb_number_fat;
        char bpb_media_descriptor;
        char ebr_drive_number;
        char ebr_signature;
        char ebr_volume_label[11];
        char ebr_sys_ident[8];

        int bpb_bytes_per_sector;
        int bpb_reserved_sectors;
        int bpb_rootdir_entries;
        int bpb_total_sectors;
        int bpb_sectors_per_fat;
        int bpb_hidden_sectors;
        int bpb_large_sector_count;
        int ebr_volume_id;
} fat12_header_t;

/**
 * @brief the FAT12 mount information
 *
 */
typedef struct _fat12_mountinfo {
        int sectors;
        int sector_size;
        int sectors_per_cluster;
        int fat_offset;
        int root_entries;
        int root_offset;
        int root_size;
        int fat_size;
        int fat_entry_size;
        int data_area_offset;
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
        char flags;
        char creation_ms;
        int  creation_time;
        int  creation_date;
        int  last_access;
        int  modification_time;
        int  modification_date;
        int  first_cluster;
        int  size;
} fat12_entry;

struct fat_time {
        int  time, date;
        char ms;
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
 * @return ion_file* a file descriptor on success, NULL on error
 */
int fat12_open(ion_file *outfile, struct disk *device, char *path);

/**
 * @brief Closes a FAT12 file
 *
 * @param file the file descriptor of the file to close
 * @return int 0 on success, otherwise an error code
 */
int fat12_close(ion_file *file);

/**
 * @brief Write data to an open file
 *
 * @param file the file descriptor
 * @param buff data to write
 * @param count the amount of bytes to write from buff
 * @return int 0 on success, otherwise an error code
 */
int fat12_write(ion_file *file, void *buff, int count);

/**
 * @brief Read fata from an open file
 *
 * @param file the file descriptor
 * @param[out] buff a buffer in where to read the data
 * @param count the amount of bytes to read
 * @return int 0 on success, otherwise an error code
 */
int fat12_read(ion_file *file, void *buff, int count);

/**
 * @brief Mounts a FAT12 filesystem
 *
 * @param fat12 the filesystem
 * @param device the device to mount
 * @return int 0 on success, otherwise an error code
 */
int fat12_mount(ion_fs *fat12, struct disk *device);

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
int fat12_seek(ion_file *file, int offset, int flags);

/**
 * @brief Creates a file or truncates existing one
 *
 * @param fat12
 * @param path
 * @param flags ION_FS_RDONLY, ION_FS_SYSTEM, or 0 for a normal file
 * @return int o on success, otherwise an error cde
 */
int fat12_create_file(ion_fs *fat12, char *path, int flags);

/**
 * @brief Creates a directory
 *
 * @param fat12
 * @param path
 * @return int 0 on success, otherwise an error code
 */
int fat12_create_dir(ion_fs *fat12, char *path);

/**
 * @brief Marks a file as deleted and deallocates its clusters
 *
 * @param fat12
 * @param path
 * @return int 0 on success, otherwise an error code
 */
int fat12_delete_file(ion_fs *fat12, char *path);

/**
 * @brief Marks an empty directory as deleted
 *
 * @param fat12
 * @param path
 * @return int 0 on success, otherwise an error code
 */
int fat12_delete_dir(ion_fs *fat12, char *path);

/**
 * @brief Renames a file or directory, moving its entry if necessary
 * 
 * @param fat12 
 * @param old 
 * @param new 
 * @return int 0 on success, otherwise an error code
 */
int fat12_rename(ion_fs *fat12, char *old, char *new);

#endif /* FAT12_H */
