#include <drivers/timer.h>
#include <drivers/txtmod.h>
#include <ion.h>
#include <ion/clock.h>
#include <ion/int.h>
#include <ion/lock.h>
#include <ion/task.h>
#include <stdio.h>

extern struct txtmod_ctx tctx;

/* The timer interval interrupt handler */
static void timer_callback(sirius_registers regs)
{
        static u32          uptime = 0;
        struct ion_task_cb *next_task;
        struct ion_task_cb *this_task;

        ion_lock_system();
        uptime = clock_read_counter();

        /*  Move everything from the sleeping task list into a temporary
         * variable */
        /*  // and make the sleeping task list empty */
        /*  //p_sleeping_tasks(); */
        next_task              = Ion_sleeping_task_list;
        Ion_sleeping_task_list = NULL;

        /*  // For each task, wake it up or put it back on the sleeping task
         * list */

        while (next_task != NULL) {
                this_task = next_task;
                next_task = this_task->next_task;
                /*  // trace(0x12345); */
                if (this_task->sleep_expiry <= uptime) {
                        /*  // Task needs to be woken up */
                        /*  // trace(0x123456); */
                        txtmod_printf(&tctx,
                                      "Wakin up task %s, expiry set for %d\n",
                                      this_task->name, this_task->sleep_expiry);
                        ion_unblock(this_task);
                } else {
                        /*  // Task needs to be put back on the sleeping task
                         * list */
                        this_task->next_task   = Ion_sleeping_task_list;
                        Ion_sleeping_task_list = this_task;
                }
        }

        /*  // Done, unlock the scheduler (and do any postponed task switches!)
         */

        ion_unlock_system();
}

void timer_init()
{
        u32 interval = 0xffff;
        u8  freq     = 255;
        /* Firstly, register our timer callback. */
        ion_register_interrupt_handler(IRQ_TIMER_INTERVAL, timer_callback);
        timer_interval_set(interval, freq);
}
