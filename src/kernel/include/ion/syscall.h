#ifndef SYSCALL_H
#define SYSCALL_H

int syscall(int a7, int a0, int a1, int a2);

int syscall_close(int fd); // done
int syscall_creat(char *path, int mode); // done
int syscall_execve(char *path, char *argv[], char *envp[]); // TODO NEED PROCESS
void  syscall_exit(int rc); // TODO NEED PROCESS
int   syscall_fork(void); // TODO NEED PROCESS
int   syscall_lseek(int fd, int pos, int how); // done
int   syscall_open(char *path, int flags); // done
int   syscall_read(int fd, void *buf, int len); // done
int   syscall_rename(char *old, char *new); // done
void *syscall_sbrk(int size); // TODO NEED PROCESS
int   syscall_time(void); // done
int   syscall_unlink(char *path); // done
int   syscall_wait(int *rc); // TODO NEED PROCESS
int   syscall_write(int fd, void *buf, int len); // done
int   syscall_mkdir(char *path); // done
int   syscall_rmdir(char *path); // done

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
