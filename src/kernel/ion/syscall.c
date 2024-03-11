#include <ion.h>
#include <ion/syscall.h>
#include <ion/clock.h>
#include <ion/error.h>

int syscall(int a7, int a0, int a1, int a2)
{
        switch (a7) {
        case CLOSE:
                return syscall_close(a0);
                break;
        case CREAT:
                return syscall_creat((char *)a0, a1); /* // TODO */
                break;
        case EXECVE:
                return syscall_execve((char *)a0, (const char **)a1,
                                      (const char **)a2); /* // TODO */

                break;
        case EXIT:
                syscall_exit((int)a0);
                break;
        case FORK:
                return syscall_fork(); /* // TODO */
                break;
        case LSEEK:
                return syscall_lseek((int)a0, (int)a1, (int)a2);
                break;
        case OPEN:
                return syscall_open((char *)a0, (int)a1);
                break;
        case READ:
                return syscall_read((int)a0, (void *)a1, (int)a2);
                break;
        case RENAME:
                return syscall_rename((char *)a0, (char *)a1); /* // TODO */
                break;
        case SBRK:
                return (int)syscall_sbrk((int)a0); /* // TODO */
                break;
        case TIME:
                return syscall_time(); /* // TODO */
                break;
        case UNLINK:
                return syscall_unlink((char *)a0); /* // TODO */
                break;
        case WAIT:
                return syscall_wait((int *)a0); /* // TODO */
                break;
        case WRITE:
                return syscall_write((int)a0, (void *)a1, (int)a1);
                break;
        default:
                return ION_EBADSCALL;
                break;
        }
}

ion_errcode syscall_close(int fd)
{
        return 0;
}
ion_errcode syscall_creat(const char *path, int mode)
{
        return 0;
} /* // TODO */
ion_errcode syscall_execve(const char *path, const char *argv[], const char *envp[])
{
        return 0;
} /* // TODO */

ion_errcode syscall_fork(void)
{
        return 0;
} /* // TODO */
ion_errcode syscall_lseek(int fd, int pos, int how)
{
        return 0;
}
ion_errcode syscall_open(const char *path, int flags)
{
        return 0;
}
ion_errcode syscall_read(int fd, void *buf, usize len)
{
        return 0;
}
ion_errcode syscall_rename(const char *old, const char *new)
{
        return 0;
} /* // TODO */
void *syscall_sbrk(int size)
{
        return (void *)0;
} /* // TODO */
ion_errcode syscall_time(void)
{
        return clock_unix_time();
}
ion_errcode syscall_unlink(const char *path)
{
        return 0;
} /* // TODO */
ion_errcode syscall_wait(int *rc)
{
        return 0;
} /* // TODO */
ion_errcode syscall_write(int fd, const void *buf, usize len)
{
        return 0;
}
