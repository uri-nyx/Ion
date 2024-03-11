#ifndef TASK_H
#define TASK_H

#include <ion.h>

enum ion_task_state {
        TASK_WAITING,
        TASK_READY,
        TASK_RUNNING,
        TASK_PAUSED,
        TASK_SLEEPING
};

struct ion_task_cb {
        void               *kernel_stack_top;
        int                 state;
        struct ion_task_cb *next_task;
        u32                 page_table;
        u32                 parent_pid;
        u32                 utime, ktime;
        u32                 sleep_expiry;
        char                name[8];
};

struct ion_task_ctx {
        struct ion_task_cb *first;
        struct ion_task_cb *last;
};

/*extern struct ion_task_ctx task_ready_ctx;*/

ion_errcode                 ion_init_multitasking(struct ion_task_cb *kernel_task);
struct ion_task_cb *ion_create_task(const char *name, void *stack, ion_errcode (*entry)());

/**
 * @brief Schedules a next task, and switches to the currently scheduled
 *
 * @note Caller must ensure to lock the system before calling
 * @return int 0 on success, an error code on failure
 */
ion_errcode  ion_schedule(void);
void ion_task_update_utime_used(struct ion_task_cb *task);
void ion_task_update_ktime_used(struct ion_task_cb *task);
u32  ion_task_kuptime(struct ion_task_cb *task);
u32  ion_task_uuptime(struct ion_task_cb *task);
void ion_block(int reason);
void ion_unblock(struct ion_task_cb *task);
void ion_tms_sleep_until(int when);
void ion_tms_sleep(int tms);
void ion_sleep(int seconds);
void ion_running_append_ready(void);
void p_ready_tasks(void);

/**
 * @brief Switches to the specified task
 *
 * @note Caller mut ensure to lock the system before calling
 */
extern void ion_switch_to_task(struct ion_task_cb *next_task);
extern void ion_task_new_ktask(void *kstack, ion_errcode (*entry)());

extern struct ion_task_cb *Ion_first_ready_task;
extern struct ion_task_cb *Ion_last_ready_task;
extern struct ion_task_cb *Ion_running_task;
extern struct ion_task_cb *Ion_sleeping_task_list;
extern int                 Ion_task_postponed_flag;
extern int                 Ion_task_postponed_switches;
#endif /* TASK_H */
