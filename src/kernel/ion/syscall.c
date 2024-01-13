#include "include/ion/syscall.h"
#include "include/ion/clock.h"
#include "include/system/error.h"

int syscall(int a7, int a0, int a1, int a2)
{
        switch (a7) {
        case CLOSE:
                return syscall_close(a0);
                break;
        case CREAT:
                return syscall_creat((char *)a0, a1); // TODO
                break;
        case EXECVE:
                return syscall_execve((char *)a0, (char **)a1,
                                      (char **)a2); // TODO

                break;
        case EXIT:
                syscall_exit((int)a0);
                break;
        case FORK:
                return syscall_fork(); // TODO
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
                return syscall_rename((char *)a0, (char *)a1); // TODO
                break;
        case SBRK:
                return (int)syscall_sbrk((int)a0); // TODO
                break;
        case TIME:
                return syscall_time(); // TODO
                break;
        case UNLINK:
                return syscall_unlink((char *)a0); // TODO
                break;
        case WAIT:
                return syscall_wait((int *)a0); // TODO
                break;
        case WRITE:
                return syscall_write((int)a0, (void *)a1, (int)a1);
                break;
        default:
                return ION_EBADSCALL;
                break;
        }
}

int syscall_close(int fd)
{
        return 0;
}
int syscall_creat(char *path, int mode)
{
        return 0;
} // TODO
int syscall_execve(char *path, char *argv[], char *envp[])
{
        return 0;
} // TODO

int syscall_fork(void)
{
        return 0;
} // TODO
int syscall_lseek(int fd, int pos, int how)
{
        return 0;
}
int syscall_open(char *path, int flags)
{
        return 0;
}
int syscall_read(int fd, void *buf, int len)
{
        return 0;
}
int syscall_rename(char *old, char *new)
{
        return 0;
} // TODO
void *syscall_sbrk(int size)
{
        return (void *)0;
} // TODO
int syscall_time(void)
{
        return clock_unix_time();
}
int syscall_unlink(char *path)
{
        return 0;
} // TODO
int syscall_wait(int *rc)
{
        return 0;
} // TODO
int syscall_write(int fd, void *buf, int len)
{
        return 0;
}