#ifndef FS_H
#define FS_H
/**
 * @brief Virtual Filesystem implementation for the ION OS
 *
 */

#include "include/drivers/disk.h"

#define ION_MAX_DEVICES 26

#define ION_FS_FILE    1
#define ION_FS_DIR     2
#define ION_FS_INVALID 0
#define ION_FS_RDONLY  0x80000
#define ION_FS_WRONLY  0x40000
#define ION_FS_SYSTEM  0x20000

#define ION_FS_O_RDONLY 0
#define ION_FS_O_WRONLY 1
#define ION_FS_O_RDWR   2

extern int fs_currid;

typedef struct {
        char name[32];
        int  flags;
        int  lenght;
        int  id;
        int  eof;
        int  entry_block;
        int  entry_offset;
        int  pos;
        int  first_cluster;
        int  cluster;
        int  blocks;
        int *block_list;
        int  device;
} ion_file;

typedef struct {
        char name[8];
        int (*mount)(/* ion_fs *self, struct disk *device */);
        int (*creat)(/* ion_fs *self, char *path, int flags*/);
        int (*delet)(/* ion_fs *self, char *path */);
        int (*mkdir)(/* ion_fs *self, char *path */);
        int (*rmdir)(/* ion_fs *self, char *path */);
        int (*rename)(/* ion_fs *self, char *path, char *old */);
        int (*read)(/* ion_file *file, void *buff, int size */);
        int (*write)(/* ion_file *file, void *buff, int size */);
        int (*close)(/* ion_file *file */);
        int (*open)(/* ion_file *file, char *fname */);
        int (*seek)(/* ion_file, int offset, int flags */);
        void       *meta; /* Metadata needed for the filesystem */
        struct disk device;
} ion_fs;

extern ion_fs *filesystems[ION_MAX_DEVICES];

int fs_create_file(char *path, int flags);

int fs_delete_file(char *path);

int fs_create_dir(char *path);

int fs_delete_dir(char *path);

/**
 * @brief Renames a file, moving it if necessary. Only moves between the same
 * drive. If a drive letter is speceified in a path and not in another, it is
 * assumed both paths refer to the same drive. If either path specifies a
 * different letter than the other one, ION_ENMVDV is returned
 *
 * @param old the path to replace
 * @param new the replacement
 * @return int 0 on success, otherwise an error code
 */
int fs_rename(char *old, char *new);

/**
 * @brief Opens a file
 *
 * @param[out] file the opened file
 * @param fname the file name (absolute path)
 * @param option in which mode to open the file
 * @return int 0 on success, otherwhise an error code
 */
int fs_open_file(ion_file *file, char *fname, int option);

/**
 * @brief Reads data from an open file
 *
 * @param file the file to read from
 * @param[out] buff the buffer to read into
 * @param size the number of bytes to read
 * @return int 0 on sucess, otherwise an error code
 */
int fs_read_file(ion_file *file, void *buff, int size);

/**
 * @brief Writes data to an open file
 *
 * @param file the file to write to
 * @param[out] buff the buffer to write
 * @param size the number of bytes to write
 * @return int 0 on sucess, otherwise an error code
 */
int fs_write_file(ion_file *file, void *buff, int size);

/**
 * @brief Close an pen file
 *
 * @param file the file to close
 * @return int 0 on sucess otherwise an error code
 */
int fs_close_file(ion_file *file);

/**
 * @brief repositions the file offset of an open file to the argument offset
       according to the directive whence
 *
 * @param file
 * @param offset
 * @param whence
 * @return int
 */
int fs_lseek(ion_file *file, int offset, int whence);

/**
 * @brief Register a filesystem driver with the VFS
 *
 * @param fs the filesystem to register
 * @param device the device to claim for that filesystem
 * @return int 0 on success, otherwise an error code
 */
int fs_register_fs(ion_fs *fs, int device);

/**
 * @brief Unregister a filesystem (from all devices)
 *
 * @param fs the filesystem to unregister
 * @return int 0 on success, otherwise an error code
 */
int fs_unregister_fs(ion_fs *fs);

/**
 * @brief Unregister (and unclaim) a filesystem from a device
 *
 * @param device the device id to unclaim
 * @return int 0 on success, otherwise an error code
 */
int fs_unregister_fs_byid(int device);

/**
 * @brief returns the parent directory and the rest of a given path
 *
 * @param[out] buff a buffer to fill with the parent
 * @param next a pointer to the path
 * @return char* a pointer to the remaining path after splitting it, NULL if
 * there are no more elements
 */
char *fs_next_subpath(char *buff, char *next);

/**
 * @brief returns the last filename and the path
 *
 * @param buff path to file
 * @param[out] path path without the filename
 * @return char* filename
 */
char *fs_path_and_fname(char *buff, char *path);

/**
 * @brief Gets the filename from a path
 *
 * @param path
 * @return char*
 */
char *fs_fname_from_path(char *path);

#endif /* FS_H */
