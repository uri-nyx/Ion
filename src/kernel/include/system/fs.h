#ifndef FS_H
#define FS_H
/**
 * @brief Virtual Filesystem implementation for the ION OS
 *
 */

#include "include/drivers/disk.h"

#define ION_MAX_DEVICES 26

#define ION_FS_FILE    0
#define ION_FS_DIR     1
#define ION_FS_INVALID 2

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
        int (*read)(/* ion_file *file, void *buff, int size */);
        int (*write)(/* ion_file *file, void *buff, int size */);
        int (*close)(/* ion_file *file */);
        int (*open)(/* ion_file *file, char *fname */);
        int (*seek)(/* ion_file, int offset, int flags */);
        void       *meta; /* Metadata needed for the filesystem */
        struct disk device;
} ion_fs;

extern ion_fs *filesystems[ION_MAX_DEVICES];

/**
 * @brief Opens a file
 *
 * @param[out] file the opened file
 * @param fname the file name (absolute path)
 * @return int 0 on success, otherwhise an error code
 */
int fs_open_file(ion_file *file, char *fname);

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
 * @brief Close an pen file
 *
 * @param file the file to close
 * @return int 0 on sucess otherwise an error code
 */
int fs_close_file(ion_file *file);

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

#endif /* FS_H */
