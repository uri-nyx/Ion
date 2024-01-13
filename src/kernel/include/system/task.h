#ifndef TASK_H
#define TASK_H

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
        int                 page_table;
        int                 parent_pid;
        int                 utime, ktime;
        int                 sleep_expiry;
        char                name[8];
};

struct ion_task_ctx {
        struct ion_task_cb *first;
        struct ion_task_cb *last;
};

/*extern struct ion_task_ctx task_ready_ctx;*/

int                 multitasking_init(struct ion_task_cb *kernel_task);
struct ion_task_cb *create_task(char *name, void *stack, int (*entry)());

/**
 * @brief Schedules a next task, and switches to the currently scheduled
 *
 * @note Caller must ensure to lock the system before calling
 * @return int 0 on success, an error code on failure
 */
int  task_schedule(void);
void task_update_utime_used(struct ion_task_cb *task);
void task_update_ktime_used(struct ion_task_cb *task);
int  task_kuptime(struct ion_task_cb *task);
int  task_uuptime(struct ion_task_cb *task);
void task_block(int reason);
void task_unblock(struct ion_task_cb *task);
void task_tms_sleep_until(int when);
void task_tms_sleep(int tms);
void task_sleep(int seconds);
void task_running_append_ready(void);
void p_ready_tasks(void);

/**
 * @brief Switches to the specified task
 *
 * @note Caller mut ensure to lock the system before calling
 */
extern void switch_to_task(struct ion_task_cb *next_task);
extern void task_new_ktask(void *kstack, int (*entry)());

extern struct ion_task_cb *ion_first_ready_task;
extern struct ion_task_cb *ion_last_ready_task;
extern struct ion_task_cb *ion_running_task;
extern struct ion_task_cb *ion_sleeping_task_list;
extern int                 ion_task_postponed_flag;
extern int                 ion_task_postponed_switches;
#endif /* TASK_H */
