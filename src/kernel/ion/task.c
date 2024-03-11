#include <drivers/txtmod.h>
#include <ion.h>
#include <ion/clock.h>
#include <ion/error.h>
#include <ion/heap.h>
#include <ion/lock.h>
#include <ion/paging.h>
#include <ion/task.h>
#include <stdio.h>
#include <string.h>

extern void             *KernelStackTop;
extern struct txtmod_ctx tctx;
struct ion_task_cb      *Ion_running_task;
struct ion_task_cb      *Ion_first_ready_task;
struct ion_task_cb      *Ion_last_ready_task;
struct ion_task_cb      *Ion_sleeping_task_list;

int        Ion_task_postponed_flag     = 0;
int        Ion_task_postponed_switches = 0;
static u32 ktime_last_count            = 0;
static u32 utime_last_count            = 0;

static void task_append_ready(struct ion_task_cb *task)
{
        if (!task)
                return;

        task->state     = TASK_READY;
        task->next_task = NULL;

        if (Ion_first_ready_task == NULL) {
                Ion_first_ready_task = Ion_last_ready_task = task;
        } else {
                Ion_last_ready_task->next_task = task;
                Ion_last_ready_task            = task;
        }

        return;
}

void ion_running_append_ready(void)
{
        task_append_ready(Ion_running_task);
        return;
}

static void task_kstack_alloc(void *kstack)
{
        struct ion_page ps;

        ps.page  = (int)kstack;
        ps.frame = 0;
        ps.perm  = 2;
        ion_alloc_frame(&ps, 1, 0, &Ion_paging_ctx);
        ps.page  = (int)kstack - 0x1000; /*  // TODO: find workaround */
        ps.frame = 0;
        ps.perm  = 2;
        ion_alloc_frame(&ps, 1, 0, &Ion_paging_ctx);
        return;
}

int ion_multitasking_init(struct ion_task_cb *kernel_task)
{
        if (kernel_task == NULL)
                return ION_ENULLTASK;
        kernel_task->kernel_stack_top = KernelStackTop;
        kernel_task->page_table       = Ion_currpt;
        kernel_task->next_task        = Ion_first_ready_task;
        kernel_task->state            = TASK_RUNNING;
        kernel_task->parent_pid       = -1;
        kernel_task->utime            = 0;
        kernel_task->ktime            = clock_read_counter();
        kernel_task->sleep_expiry     = 0;
        strcpy(kernel_task->name, "KERNEL");

        Ion_running_task = kernel_task;
        return 0;
}

struct ion_task_cb *create_task(char *name, void *stack, int (*entry)())
{
        struct ion_task_cb *task;

        task = (struct ion_task_cb *)ALLOC(sizeof(struct ion_task_cb));
        task->kernel_stack_top = stack;
        task->page_table       = Ion_currpt;
        task->next_task        = NULL;
        task->state            = TASK_READY;
        task->parent_pid       = 0;
        task->utime            = 0;
        task->ktime            = 0;
        task->sleep_expiry     = 0;
        strncpy(task->name, name, 7);

        task_append_ready(task);

        ion_task_new_ktask(stack, entry);

        return task;
}

int ion_schedule()
{
        struct ion_task_cb *task;

        if (Ion_task_postponed_switches != 0) {
                Ion_task_postponed_flag = 1;
                return 0;
        }
        if (Ion_first_ready_task) {
                /*  //p_ready_tasks(); */
                task                 = Ion_first_ready_task;
                Ion_first_ready_task = task->next_task;
                ion_task_update_ktime_used(Ion_running_task);
                /*  //txtmod_printf(&global_ctx, "Switching from %s to %s\n", */
                /*  //              ion_running_task->name, task->name); */
                ion_switch_to_task(task);
        } else
                return ION_ENOMORETASK;

        return ION_EOK;
}

void p_linked_list(struct txtmod_ctx *ctx, void *head, int next_item_offset,
                   int (*printer)())
{
        char *item;

        item = head;
        txtmod_putc(ctx, '[');

        /*   */
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
        txtmod_printf(&tctx, "Ready: ");
        p_linked_list(&tctx, Ion_first_ready_task, 8, print_task_name);
        txtmod_putc(&tctx, '\n');
        return;
}

void p_sleeping_tasks(void)
{
        txtmod_printf(&tctx, "Sleeping: ");
        p_linked_list(&tctx, Ion_sleeping_task_list, 8, print_task_name);
        txtmod_putc(&tctx, '\n');
        return;
}

void ion_task_update_utime_used(struct ion_task_cb *task)
{
        int curr, elapsed;

        curr             = clock_read_counter();
        elapsed          = curr - utime_last_count;
        utime_last_count = curr;
        task->utime += elapsed;
        return;
}

void ion_task_update_ktime_used(struct ion_task_cb *task)
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

u32 ion_task_kuptime(struct ion_task_cb *task)
{
        if (task == NULL)
                return ION_ENULLTASK;
        ion_task_update_ktime_used(task);
        return task->ktime;
}

u32 ion_task_uuptime(struct ion_task_cb *task)
{
        if (task == NULL)
                return ION_ENULLTASK;
        ion_task_update_utime_used(task);
        return task->utime;
}

void ion_block(int reason)
{
        if (Ion_running_task == NULL) {
                return;
        }
        ion_lock_scheduler();
        Ion_running_task->state = reason;
        ion_schedule();
        ion_unlock_scheduler();
}

void ion_unblock(struct ion_task_cb *task)
{
        if (Ion_running_task == NULL)
                return;
        ion_lock_scheduler();
        if (Ion_first_ready_task == NULL) {
                /*  // Only one task was running before, so pre-empt */
                ion_switch_to_task(task);
        } else {
                /*  // There's at least one task on the "ready to run" queue */
                /*  // already, so don't pre-empt */

                Ion_last_ready_task->next_task = task;
                Ion_last_ready_task            = task;
        }
        ion_unlock_scheduler();
}

void ion_tms_sleep_until(int when)
{
        ion_lock_system();

        /*  // Make sure "when" hasn't already occured */

        if (when < clock_read_counter()) {
                ion_unlock_scheduler();
                return;
        }

        /*  // Set time when task should wake up */

        Ion_running_task->sleep_expiry = when;

        /*  // Add task to the start of the unsorted list of sleeping tasks */

        Ion_running_task->next_task = Ion_sleeping_task_list;
        Ion_sleeping_task_list      = Ion_running_task;

        ion_unlock_system();

        /*  // Find something else for the CPU to do */

        ion_block(TASK_SLEEPING);
}

void ion_tms_sleep(int tms)
{
        ion_tms_sleep_until(clock_read_counter() + tms);
}

void ion_sleep(int seconds)
{
        ion_tms_sleep_until(clock_read_counter() + seconds * 10000);
}
