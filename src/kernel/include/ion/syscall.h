#ifndef SYSCALL_H
#define SYSCALL_H

#include <ion.h>

ion_errcode syscall(int a7, int a0, int a1, int a2);

ion_errcode syscall_close(int fd); /* done */
ion_errcode syscall_creat(const char *path, int mode); /* done */
ion_errcode syscall_execve(const char *path, const char *argv[], const char *envp[]); /* TODO NEED PROCESS */
void  syscall_exit(int rc); /* TODO NEED PROCESS */
ion_errcode   syscall_fork(void); /* TODO NEED PROCESS */
ion_errcode   syscall_lseek(int fd, int pos, int how); /* done */
ion_errcode   syscall_open(const char *path, int flags); /* done */
ion_errcode   syscall_read(int fd, void *buf, usize len); /* done */
ion_errcode   syscall_rename(const char *old, const char *new); /* done */
void *syscall_sbrk(int size); /* TODO NEED PROCESS */
ion_errcode   syscall_time(void); /* done */
ion_errcode   syscall_unlink(const char *path); /* done */
ion_errcode   syscall_wait(int *rc); /* TODO NEED PROCESS */
ion_errcode   syscall_write(int fd, const void *buf, usize len); /* done */
ion_errcode   syscall_mkdir(const char *path); /* done */
ion_errcode   syscall_rmdir(const char *path); /* done */

enum {
        CLOSE,
        CREAT,
        EXECVE,
        EXIT,
        FORK,
        LSEEK,
        OPEN,
        READ,
        RENAME,
        SBRK,
        TIME,
        UNLINK,
        WAIT,
        WRITE,
        MKDIR,
        RMDIR
};

#endif /* SYSCALL_H */
