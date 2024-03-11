/**
 * @file fs.h
 * @author Uri Nyx (rserranof03@usal.es)
 * @brief ION virtual filesystem kernel interface
 * @version 0.1
 * @date 2024-02-15
 *
 * @copyright Copyright (c) 2024
 *
 */
#ifndef FS_H
#define FS_H

#include <drivers/disk.h>
#include <ion.h>

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

typedef struct {
        char  name[32];
        int   flags;
        usize lenght;
        int   id;
        int   eof;
        u32   entry_block;
        usize entry_offset;
        usize pos;
        u32   first_cluster;
        u32   cluster;
        usize blocks;
        u32  *block_list;
        u8    device;
} ion_file;

typedef struct _ion_fs {
        char name[8];
        ion_errcode (*mount)(struct _ion_fs *self, struct disk *device);
        ion_errcode (*creat)(struct _ion_fs *self, const char *path, int flags);
        ion_errcode (*delet)(struct _ion_fs *self, const char *path);
        ion_errcode (*mkdir)(struct _ion_fs *self, const char *path);
        ion_errcode (*rmdir)(struct _ion_fs *self, const char *path);
        ion_errcode (*rename)(struct _ion_fs *self, const char *path,
                              const char *old);
        ion_errcode (*read)(ion_file *file, void *buff, usize size);
        ion_errcode (*write)(ion_file *file, const void *buff, usize size);
        ion_errcode (*close)(ion_file *file);
        ion_errcode (*open)(ion_file *file, struct disk *device,
                            const char *fname);
        ion_errcode (*seek)(ion_file *file, usize offset, int flags);
        void       *meta; /* Metadata needed for the filesystem */
        struct disk device;
} ion_fs;

extern ion_fs *Ion_filesystems[ION_MAX_DEVICES];

ion_errcode ion_create_file(const char *path, int flags);

ion_errcode ion_delete_file(const char *path);

ion_errcode ion_create_dir(const char *path);

ion_errcode ion_delete_dir(const char *path);

/**
 * @brief Renames a file, moving it if necessary. Only moves between the same
 * drive. If a drive letter is speceified in a path and not in another, it is
 * assumed both paths refer to the same drive. If either path specifies a
 * different letter than the other one, ION_ENMVDV is returned
 *
 * @param old the path to replace
 * @param new the replacement
 * @return ion_errcode 0 on success, otherwise an error code
 */
ion_errcode ion_rename(const char *old, const char *new);

/**
 * @brief Opens a file
 *
 * @param[out] file the opened file
 * @param fname the file name (absolute path)
 * @param option in which mode to open the file
 * @return ion_errcode 0 on success, otherwhise an error code
 */
ion_errcode ion_open_file(ion_file *file, const char *fname, int option);

/**
 * @brief Reads data from an open file
 *
 * @param file the file to read from
 * @param[out] buff the buffer to read into
 * @param size the number of bytes to read
 * @return ion_errcode 0 on sucess, otherwise an error code
 */
ion_errcode ion_read_file(ion_file *file, void *buff, usize size);

/**
 * @brief Writes data to an open file
 *
 * @param file the file to write to
 * @param[out] buff the buffer to write
 * @param size the number of bytes to write
 * @return ion_errcode 0 on sucess, otherwise an error code
 */
ion_errcode ion_write_file(ion_file *file, void *buff, int size);

/**
 * @brief Close an pen file
 *
 * @param file the file to close
 * @return ion_errcode 0 on sucess otherwise an error code
 */
ion_errcode ion_close_file(ion_file *file);

/**
 * @brief repositions the file offset of an open file to the argument offset
       according to the directive whence
 *
 * @param file
 * @param offset
 * @param whence
 * @return ion_errcode
 */
ion_errcode ion_lseek(ion_file *file, usize offset, int whence);

/**
 * @brief Register a filesystem driver with the VFS
 *
 * @param fs the filesystem to register
 * @param device the device to claim for that filesystem
 * @return ion_errcode 0 on success, otherwise an error code
 */
ion_errcode ion_register_fs(ion_fs *fs, int device);

/**
 * @brief Unregister a filesystem (from all devices)
 *
 * @param fs the filesystem to unregister
 * @return ion_errcode 0 on success, otherwise an error code
 */
ion_errcode ion_unregister_fs(ion_fs *fs);

/**
 * @brief Unregister (and unclaim) a filesystem from a device
 *
 * @param device the device id to unclaim
 * @return ion_errcode 0 on success, otherwise an error code
 */
ion_errcode ion_unregister_fs_byid(u8 device);

/**
 * @brief returns the parent directory and the rest of a given path
 *
 * @param[out] buff a buffer to fill with the parent
 * @param next a pointer to the path
 * @return char* a pointer to the remaining path after splitting it, NULL if
 * there are no more elements
 */
const char *fs_next_subpath(char *buff, const char *next);

/**
 * @brief returns the last filename and the path
 *
 * @param buff path to file
 * @param[out] path path without the filename
 * @return char* filename
 */
const char *fs_path_and_fname(const char *buff, char *path);

/**
 * @brief Gets the filename from a path
 *
 * @param path
 * @return char*
 */
const char *fs_fname_from_path(const char *path);

#endif /* FS_H */
