#include <drivers/disk.h>
#include <drivers/fs/fat12.h>
#include <drivers/txtmod.h>
#include <ion.h>
#include <ion/error.h>
#include <ion/fs.h>
#include <stdio.h>
#include <string.h>

/* NOTE: calls to drivers are NOT typechecked because we use prototypes */

extern struct txtmod_ctx tctx;

ion_fs *Ion_Ion_filesystems[ION_MAX_DEVICES];
int     Fs_currid = 0;

const char *fs_next_subpath(char *buff, const char *next)
{
        char c;
        char *this;
        this = buff;

        while ((c = *next++)) {
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

const char *fs_path_and_fname(const char *buff, char *path)
{
        int i, len;

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

const char *fs_fname_from_path(const char *path)
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

ion_errcode ion_open_file(ion_file *file, const char *fname, int option)
{
        int         device;
        const char *filename;
        int         err;
        ion_fs     *fs;

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

                fs = Ion_Ion_filesystems[device];
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

                        txtmod_printf(&tctx,
                                      "Opening file %s, with flags [%p]\n",
                                      file->name, file->flags);

                        return err;

                } else {
                        file->flags = ION_FS_INVALID;
                        return ION_ENOFS;
                }
        } else {
                file->flags = ION_FS_INVALID;
                return ION_ENULLFNAME;
        }
}

ion_errcode ion_read_file(ion_file *file, void *buff, usize size)
{
        if (file == NULL)
                return ION_ENULLFILE;
        if (Ion_filesystems[file->device] == NULL)
                return ION_ENOFS;
        if (file->flags == ION_FS_INVALID)
                return ION_EBADF;
        return Ion_filesystems[file->device]->read(file, buff, size);
}

ion_errcode ion_write_file(ion_file *file, void *buff, int size)
{
        if (file == NULL)
                return ION_ENULLFILE;
        if (Ion_filesystems[file->device] == NULL)
                return ION_ENOFS;
        if (file->flags == ION_FS_INVALID)
                return ION_EBADF;
        return Ion_filesystems[file->device]->write(file, buff, size);
}

ion_errcode ion_close_file(ion_file *file)
{
        if (file == NULL)
                return ION_ENULLFILE;
        if (Ion_filesystems[file->device] == NULL)
                return ION_ENOFS;
        if (file->flags == ION_FS_INVALID)
                return ION_EBADF;
        return Ion_filesystems[file->device]->close(file);
}

ion_errcode ion_create_file(const char *path, int flags)
{
        int     device;
        ion_fs *fs;

        if (path == NULL)
                return ION_ENULLFNAME;

        device = 'a' - 'a';

        /* in all cases, if fname[1]==':' then the first character must
         * be device letter */
        if (path[1] == ':') {
                device = path[0] - 'a';
                path += 2;
        }

        fs = Ion_filesystems[device];
        if (device >= ION_MAX_DEVICES)
                return ION_EDEVTOOBIG;
        else if (fs == NULL)
                return ION_ENULLFS;

        return Ion_filesystems[device]->creat(fs, path, flags);
}

ion_errcode ion_delete_file(const char *path)
{
        int     device;
        ion_fs *fs;

        if (path == NULL)
                return ION_ENULLFNAME;

        device = 'a' - 'a';

        /* in all cases, if fname[1]==':' then the first character must
         * be device letter */
        if (path[1] == ':') {
                device = path[0] - 'a';
                path += 2;
        }

        fs = Ion_filesystems[device];
        if (device >= ION_MAX_DEVICES)
                return ION_EDEVTOOBIG;
        else if (fs == NULL)
                return ION_ENULLFS;

        return Ion_filesystems[device]->delet(fs, path);
}

ion_errcode ion_create_dir(const char *path)
{
        int     device;
        ion_fs *fs;

        if (path == NULL)
                return ION_ENULLFNAME;

        device = 'a' - 'a';

        /* in all cases, if fname[1]==':' then the first character must
         * be device letter */
        if (path[1] == ':') {
                device = path[0] - 'a';
                path += 2;
        }

        fs = Ion_filesystems[device];
        if (device >= ION_MAX_DEVICES)
                return ION_EDEVTOOBIG;
        else if (fs == NULL)
                return ION_ENULLFS;

        return Ion_filesystems[device]->mkdir(fs, path);
}

ion_errcode ion_delete_dir(const char *path)
{
        int     device;
        ion_fs *fs;

        if (path == NULL)
                return ION_ENULLFNAME;

        device = 'a' - 'a';

        /* in all cases, if fname[1]==':' then the first character must
         * be device letter */
        if (path[1] == ':') {
                device = path[0] - 'a';
                path += 2;
        }

        fs = Ion_filesystems[device];
        if (device >= ION_MAX_DEVICES)
                return ION_EDEVTOOBIG;
        else if (fs == NULL)
                return ION_ENULLFS;

        return Ion_filesystems[device]->rmdir(fs, path);
}

ion_errcode ion_rename(const char *old, const char *new)
{
        int     device;
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
                old += (old[1] == ':') ? 2 : 0;
                new += (new[1] == ':') ? 2 : 0;
        }

        fs = Ion_filesystems[device];
        if (device >= ION_MAX_DEVICES)
                return ION_EDEVTOOBIG;
        else if (fs == NULL)
                return ION_ENULLFS;

        return Ion_filesystems[device]->rename(fs, old, new);
}

ion_errcode ion_lseek(ion_file *file, usize offset, int whence)
{
        if (file == NULL)
                return ION_ENULLFILE;
        if (Ion_filesystems[file->device] == NULL)
                return ION_ENOFS;
        return Ion_filesystems[file->device]->seek(file, offset, whence);
}

ion_errcode ion_rewind(ion_file *file)
{
        if (file == NULL)
                return ION_ENULLFILE;
        if (Ion_filesystems[file->device] == NULL)
                return ION_ENOFS;
        if (file->flags == ION_FS_INVALID)
                return ION_EBADF;
        return Ion_filesystems[file->device]->seek(file, 0, SEEK_SET);
}

ion_errcode ion_register_fs(ion_fs *fs, int device)
{
        if (device >= ION_MAX_DEVICES)
                return ION_EDEVTOOBIG;
        if (fs == NULL)
                return ION_ENULLFS;

        Ion_filesystems[device] = fs;
        return 0;
}

ion_errcode ion_unregister_fs(ion_fs *fs)
{
        int i;

        if (fs == NULL)
                return ION_ENULLFS;

        for (i = 0; i < ION_MAX_DEVICES; i++) {
                if (Ion_filesystems[i] == fs)
                        Ion_filesystems[i] = NULL;
        }

        return 0;
}

ion_errcode ion_unregister_fs_byid(u8 device)
{
        if (device >= ION_MAX_DEVICES)
                return ION_EDEVTOOBIG;

        Ion_filesystems[device] = NULL;

        return 0;
}
