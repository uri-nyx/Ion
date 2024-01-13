#include "include/system/fs.h"
#include "include/drivers/disk.h"
#include "include/drivers/fat12.h"
#include "include/ion/txtmod.h"
#include "include/system/error.h"
#include <stdio.h>
#include <string.h>

// NOTE: calls to drivers are NOT typechecked because we use prototypes

extern struct txtmod_ctx global_ctx;

ion_fs *filesystems[ION_MAX_DEVICES];
int     fs_currid = 0;

char *fs_next_subpath(char *buff, char *next)
{
        char c;
        char *this;
        this = buff;

        while (c = *next++) {
                if (c == '/') {
                        *this = 0;
                        return next;
                }
                *this = c;
                this ++;
        }

        *this = 0;
        return NULL;
}

char *fs_path_and_fname(char *buff, char *path)
{
        char c;
        int  i, len;

        len = strlen(buff);

        for (i = len; i > 0; i--) {
                if (buff[i] == '/') {
                        memcpy(path, buff, i);
                        path[i] = 0;
                        return buff + i + 1;
                }
        }

        path[0] = 0;
        return buff;
}

char *fs_fname_from_path(char *path)
{
        int i, len;

        len = strlen(path);

        for (i = len; i > 0; i--) {
                if (path[i] == '/') {
                        return path + i + 1;
                }
        }

        return path;
}

int fs_open_file(ion_file *file, char *fname, int option)
{
        int     device;
        char   *filename;
        int     err;
        ion_fs *fs;

        if (fname) {
                /* default to device 'a' */
                device   = 'a' - 'a';
                filename = fname;

                /* in all cases, if fname[1]==':' then the first character must
                 * be device letter */
                if (fname[1] == ':') {
                        device = fname[0] - 'a';
                        filename += 2;
                }

                fs = filesystems[device];
                if (device >= ION_MAX_DEVICES) {
                        file->flags = ION_FS_INVALID;
                        return ION_EDEVTOOBIG;
                } else if (fs) {
                        err = fs->open(file, &fs->device, filename);
                        if (err) {
                                file->flags = ION_FS_INVALID;
                                return err;
                        }

                        switch (option) {
                        case ION_FS_O_RDONLY:
                                file->flags |= ION_FS_RDONLY;
                                break;
                        case ION_FS_O_WRONLY:
                                file->flags |= ION_FS_WRONLY;
                        case ION_FS_O_RDWR:
                                break;
                        default:
                                file->flags = ION_FS_INVALID;
                                return ION_EBADOPT;
                                break;
                        }

                        txtmod_printf(&global_ctx,
                                      "Opening file %s, with flags [%p]\n",
                                      file->name, file->flags);

                } else {
                        file->flags = ION_FS_INVALID;
                        return ION_ENOFS;
                }
        } else {
                file->flags = ION_FS_INVALID;
                return ION_ENULLFNAME;
        }
}

int fs_read_file(ion_file *file, void *buff, int size)
{
        if (file == NULL)
                return ION_ENULLFILE;
        if (filesystems[file->device] == NULL)
                return ION_ENOFS;
        if (file->flags == ION_FS_INVALID)
                return ION_EBADF;
        return filesystems[file->device]->read(file, buff, size);
}

int fs_write_file(ion_file *file, void *buff, int size)
{
        if (file == NULL)
                return ION_ENULLFILE;
        if (filesystems[file->device] == NULL)
                return ION_ENOFS;
        if (file->flags == ION_FS_INVALID)
                return ION_EBADF;
        return filesystems[file->device]->write(file, buff, size);
}

int fs_close_file(ion_file *file)
{
        if (file == NULL)
                return ION_ENULLFILE;
        if (filesystems[file->device] == NULL)
                return ION_ENOFS;
        if (file->flags == ION_FS_INVALID)
                return ION_EBADF;
        return filesystems[file->device]->close(file);
}

int fs_create_file(char *path, int flags)
{
        int     device;
        char   *filename;
        ion_fs *fs;

        if (path == NULL)
                return ION_ENULLFNAME;

        device = 'a' - 'a';

        /* in all cases, if fname[1]==':' then the first character must
         * be device letter */
        if (path[1] == ':') {
                device = path[0] - 'a';
                filename += 2;
        }

        fs = filesystems[device];
        if (device >= ION_MAX_DEVICES)
                return ION_EDEVTOOBIG;
        else if (fs == NULL)
                return ION_ENULLFS;

        return filesystems[device]->creat(fs, path, flags);
}

int fs_delete_file(char *path)
{
        int     device;
        char   *filename;
        ion_fs *fs;

        if (path == NULL)
                return ION_ENULLFNAME;

        device = 'a' - 'a';

        /* in all cases, if fname[1]==':' then the first character must
         * be device letter */
        if (path[1] == ':') {
                device = path[0] - 'a';
                filename += 2;
        }

        fs = filesystems[device];
        if (device >= ION_MAX_DEVICES)
                return ION_EDEVTOOBIG;
        else if (fs == NULL)
                return ION_ENULLFS;

        return filesystems[device]->delet(fs, path);
}

int fs_create_dir(char *path)
{
        int     device;
        char   *filename;
        ion_fs *fs;

        if (path == NULL)
                return ION_ENULLFNAME;

        device = 'a' - 'a';

        /* in all cases, if fname[1]==':' then the first character must
         * be device letter */
        if (path[1] == ':') {
                device = path[0] - 'a';
                filename += 2;
        }

        fs = filesystems[device];
        if (device >= ION_MAX_DEVICES)
                return ION_EDEVTOOBIG;
        else if (fs == NULL)
                return ION_ENULLFS;

        return filesystems[device]->mkdir(fs, path);
}

int fs_delete_dir(char *path)
{
        int     device;
        char   *filename;
        ion_fs *fs;

        if (path == NULL)
                return ION_ENULLFNAME;

        device = 'a' - 'a';

        /* in all cases, if fname[1]==':' then the first character must
         * be device letter */
        if (path[1] == ':') {
                device = path[0] - 'a';
                filename += 2;
        }

        fs = filesystems[device];
        if (device >= ION_MAX_DEVICES)
                return ION_EDEVTOOBIG;
        else if (fs == NULL)
                return ION_ENULLFS;

        return filesystems[device]->rmdir(fs, path);
}

int fs_rename(char *old, char *new)
{
        int     device;
        char   *filename;
        ion_fs *fs;

        if (old == NULL || new == NULL)
                return ION_ENULLFNAME;

        device = 'a' - 'a';

        /* in all cases, if fname[1]==':' then the first character must
         * be device letter */
        if (old[1] == ':' || new[1] == ':') {
                if (old[1] == ':' && new[1] == ':' && old[0] != new[0])
                        return ION_ENMVDV;
                device = (old[1] == ':') ? old[0] - 'a' : new[0] - 'a';
                filename += 2;
        }

        fs = filesystems[device];
        if (device >= ION_MAX_DEVICES)
                return ION_EDEVTOOBIG;
        else if (fs == NULL)
                return ION_ENULLFS;

        return filesystems[device]->rename(fs, old, new);
}

int fs_lseek(ion_file *file, int offset, int whence)
{
        if (file == NULL)
                return ION_ENULLFILE;
        if (filesystems[file->device] == NULL)
                return ION_ENOFS;
        return filesystems[file->device]->seek(file);
}

int fs_rewind(ion_file *file)
{
        if (file == NULL)
                return ION_ENULLFILE;
        if (filesystems[file->device] == NULL)
                return ION_ENOFS;
        if (file->flags == ION_FS_INVALID)
                return ION_EBADF;
        return filesystems[file->device]->seek(file, 0, SEEK_SET);
}

int fs_register_fs(ion_fs *fs, int device)
{
        if (device >= ION_MAX_DEVICES)
                return ION_EDEVTOOBIG;
        if (fs == NULL)
                return ION_ENULLFS;

        filesystems[device] = fs;
        return 0;
}

int fs_unregister_fs(ion_fs *fs)
{
        int i;

        if (fs == NULL)
                return ION_ENULLFS;

        for (i = 0; i < ION_MAX_DEVICES; i++) {
                if (filesystems[i] == fs)
                        filesystems[i] = NULL;
        }

        return 0;
}

int fs_unregister_fs_byid(int device)
{
        if (device >= ION_MAX_DEVICES)
                return ION_EDEVTOOBIG;

        filesystems[device] = NULL;

        return 0;
}
