#include "include/system/task.h"
#include "include/ion/clock.h"
#include "include/ion/txtmod.h"
#include "include/system/error.h"
#include "include/system/kmalloc.h"
#include "include/system/lock.h"
#include "include/system/paging.h"
#include <stdio.h>
#include <string.h>

extern void             *KernelStackTop;
extern struct txtmod_ctx global_ctx;
struct ion_task_cb      *ion_running_task;
struct ion_task_cb      *ion_first_ready_task;
struct ion_task_cb      *ion_last_ready_task;
struct ion_task_cb      *ion_sleeping_task_list;

int        ion_task_postponed_flag     = 0;
int        ion_task_postponed_switches = 0;
static int ktime_last_count            = 0;
static int utime_last_count            = 0;

static void task_append_ready(struct ion_task_cb *task)
{
        if (!task)
                return;

        task->state     = TASK_READY;
        task->next_task = NULL;

        if (ion_first_ready_task == NULL) {
                ion_first_ready_task = ion_last_ready_task = task;
        } else {
                ion_last_ready_task->next_task = task;
                ion_last_ready_task            = task;
        }

        return;
}

void task_running_append_ready(void)
{
        task_append_ready(ion_running_task);
        return;
}

static void task_kstack_alloc(void *kstack)
{
        struct ion_page ps;

        ps.page  = (int)kstack;
        ps.frame = 0;
        ps.perm  = 2;
        alloc_frame(&ps, 1, 0, paging_ctx);
        ps.page  = (int)kstack - 0x1000; // TODO: find workaround
        ps.frame = 0;
        ps.perm  = 2;
        alloc_frame(&ps, 1, 0, paging_ctx);
        return;
}

int multitasking_init(struct ion_task_cb *kernel_task)
{
        if (kernel_task == NULL)
                return ION_ENULLTASK;
        kernel_task->kernel_stack_top = KernelStackTop;
        kernel_task->page_table       = paging_currpt;
        kernel_task->next_task        = ion_first_ready_task;
        kernel_task->state            = TASK_RUNNING;
        kernel_task->parent_pid       = -1;
        kernel_task->utime            = 0;
        kernel_task->ktime            = clock_read_counter();
        kernel_task->sleep_expiry     = 0;
        strcpy(kernel_task->name, "KERNEL");

        ion_running_task = kernel_task;
        return 0;
}

struct ion_task_cb *create_task(char *name, void *stack, int (*entry)())
{
        struct ion_task_cb *task;

        task = (struct ion_task_cb *)kmalloc(sizeof(struct ion_task_cb));
        task->kernel_stack_top = stack;
        task->page_table       = paging_currpt;
        task->next_task        = NULL;
        task->state            = TASK_READY;
        task->parent_pid       = 0;
        task->utime            = 0;
        task->ktime            = 0;
        task->sleep_expiry     = 0;
        strncpy(task->name, name, 7);

        task_append_ready(task);

        task_new_ktask(stack, entry);

        return task;
}

int task_schedule()
{
        
        struct ion_task_cb *task;

        if (ion_task_postponed_switches != 0) {
                ion_task_postponed_flag = 1;
                return 0;
        }
        if (ion_first_ready_task) {
                //p_ready_tasks();
                task                 = ion_first_ready_task;
                ion_first_ready_task = task->next_task;
                task_update_ktime_used(ion_running_task);
                //txtmod_printf(&global_ctx, "Switching from %s to %s\n",
                //              ion_running_task->name, task->name);
                switch_to_task(task);
        } else
                return ION_ENOMORETASK;

        return ION_EOK;
}

void p_linked_list(struct txtmod_ctx *ctx, void *head, int next_item_offset,
                   int (*printer)())
{
        void *item;

        item = head;
        txtmod_putc(ctx, '[');

        // trace(0xdeadf0);
        if (item == NULL) {
                txtmod_puts(ctx, "empty]");
                return;
        }
        while (item) {
                printer(ctx, item);
                txtmod_putc(ctx, ',');
                txtmod_putc(ctx, ' ');
                item += next_item_offset;
                item = (void *)*(int *)item;
        }
        txtmod_putc(ctx, '\b');
        txtmod_putc(ctx, '\b');
        txtmod_putc(ctx, ']');
        return;
}

static int print_task_name(struct txtmod_ctx *ctx, void *item)
{
        txtmod_printf(ctx, "%s", ((struct ion_task_cb *)item)->name);
        return 0;
}

void p_ready_tasks(void)
{
        txtmod_printf(&global_ctx, "Ready: ");
        p_linked_list(&global_ctx, ion_first_ready_task, 8, print_task_name);
        txtmod_putc(&global_ctx, '\n');
        return;
}

void p_sleeping_tasks(void)
{
        txtmod_printf(&global_ctx, "Sleeping: ");
        p_linked_list(&global_ctx, ion_sleeping_task_list, 8, print_task_name);
        txtmod_putc(&global_ctx, '\n');
        return;
}

void task_update_utime_used(struct ion_task_cb *task)
{
        int curr, elapsed;

        curr             = clock_read_counter();
        elapsed          = curr - utime_last_count;
        utime_last_count = curr;
        task->utime += elapsed;
        return;
}

void task_update_ktime_used(struct ion_task_cb *task)
{
        int curr, elapsed;

        if (task == NULL)
                return;

        curr             = clock_read_counter();
        elapsed          = curr - ktime_last_count;
        ktime_last_count = curr;
        task->ktime += elapsed;
        return;
}

int task_kuptime(struct ion_task_cb *task)
{
        if (task == NULL)
                return ION_ENULLTASK;
        task_update_ktime_used(task);
        return task->ktime;
}

int task_uuptime(struct ion_task_cb *task)
{
        if (task == NULL)
                return ION_ENULLTASK;
        task_update_utime_used(task);
        return task->utime;
}

void task_block(int reason)
{
        if (ion_running_task == NULL) {
                return;
        }
        ion_lock_scheduler();
        ion_running_task->state = reason;
        task_schedule();
        ion_unlock_scheduler();
}

void task_unblock(struct ion_task_cb *task)
{
        if (ion_running_task == NULL)
                return;
        ion_lock_scheduler();
        if (ion_first_ready_task == NULL) {
                trace(0xaaaa);
                // Only one task was running before, so pre-empt
                switch_to_task(task);
        } else {
                // There's at least one task on the "ready to run" queue
                // already, so don't pre-empt

                ion_last_ready_task->next_task = task;
                ion_last_ready_task            = task;
        }
        ion_unlock_scheduler();
}

void task_tms_sleep_until(int when)
{
        ion_lock_system();

        // Make sure "when" hasn't already occured

        if (when < clock_read_counter()) {
                ion_unlock_scheduler();
                return;
        }

        // Set time when task should wake up

        ion_running_task->sleep_expiry = when;

        // Add task to the start of the unsorted list of sleeping tasks

        ion_running_task->next_task = ion_sleeping_task_list;
        ion_sleeping_task_list      = ion_running_task;

        ion_unlock_system();

        // Find something else for the CPU to do

        task_block(TASK_SLEEPING);
}

void task_tms_sleep(int tms)
{
        task_tms_sleep_until(clock_read_counter() + tms);
}

void task_sleep(int seconds)
{
        task_tms_sleep_until(clock_read_counter() + seconds * 10000);
}