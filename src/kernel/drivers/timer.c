#include "include/drivers/timer.h"
#include "include/ion/clock.h"
#include "include/ion/txtmod.h"
#include "include/system/int.h"
#include "include/system/lock.h"
#include "include/system/task.h"
#include <stdio.h>

extern struct txtmod_ctx global_ctx;

/* The timer interval interrupt handler */
static int timer_callback()
{
        static int          uptime = 0;
        struct ion_task_cb *next_task;
        struct ion_task_cb *this_task;

        ion_lock_system();
        uptime = clock_read_counter();

        // Move everything from the sleeping task list into a temporary variable
        // and make the sleeping task list empty
        //p_sleeping_tasks();
        next_task              = ion_sleeping_task_list;
        ion_sleeping_task_list = NULL;

        // For each task, wake it up or put it back on the sleeping task list

        while (next_task != NULL) {
                this_task = next_task;
                next_task = this_task->next_task;
                // trace(0x12345);
                if (this_task->sleep_expiry <= uptime) {
                        // Task needs to be woken up
                        // trace(0x123456);
                        txtmod_printf(&global_ctx, "Wakin up task %s, expiry set for %d\n", this_task->name, this_task->sleep_expiry);
                        task_unblock(this_task);
                } else {
                        // Task needs to be put back on the sleeping task list
                        this_task->next_task   = ion_sleeping_task_list;
                        ion_sleeping_task_list = this_task;
                }
        }

        // Done, unlock the scheduler (and do any postponed task switches!)

        ion_unlock_system();
}

void timer_init()
{
        int  interval = 0xffff;
        char freq     = 255;
        /* Firstly, register our timer callback. */
        register_interrupt_handler(IRQ_TIMER_INTERVAL, timer_callback);
        timer_interval_set(interval, freq);
}
