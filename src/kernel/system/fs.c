#include "include/system/fs.h"
#include "include/drivers/disk.h"
#include "include/system/error.h"
#include <stdio.h>
#include <string.h>

ion_fs      *filesystems[ION_MAX_DEVICES];
int fs_currid = 0;

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

        for (i = len; i > 0; i--)
        {
                if (buff[i] == '/') {
                        trace(0x10101);
                        memcpy(path, buff, i);
                        path[i] = 0;
                        return buff + i + 1;
                }
        }

        path[0] = 0;
        return buff;     
}


int fs_open_file(ion_file *file, char *fname)
{
        char  device;
        char *filename;
        int   err;

        if (fname) {
                /* default to device 'a' */
                device   = 'a';
                filename = fname;

                /* in all cases, if fname[1]==':' then the first character must
                 * be device letter */
                if (fname[1] == ':') {
                        device = fname[0];
                        filename += 2;
                }

                if (filesystems[device - 'a']) {
                        file->device = device; // TODO: maybe - 'a'
                        err = filesystems[device - 'a']->open(file, filename);
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

int fs_read_file(ion_file *file, void *buff, int size)
{
        if (file == NULL)
                return ION_ENULLFILE;
        if (filesystems[file->device - 'a'] == NULL)
                return ION_ENOFS;
        return filesystems[file->device - 'a']->read(file, buff, size);
}

int fs_close_file(ion_file *file)
{
        if (file == NULL)
                return ION_ENULLFILE;
        if (filesystems[file->device - 'a'] == NULL)
                return ION_ENOFS;
        return filesystems[file->device - 'a']->close(file);
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
