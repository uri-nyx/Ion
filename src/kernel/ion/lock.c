#include <ion/lock.h>
#include <drivers/hw.h>
#include <ion/task.h>

void ion_lock_system(void)
{
        hw_interrupt_disable();
        Ion_task_postponed_switches++;
        return;
}

void ion_unlock_system(void)
{
        Ion_task_postponed_switches--;
        if(Ion_task_postponed_switches == 0) {
        if(Ion_task_postponed_flag != 0) {
            Ion_task_postponed_flag = 0;
            ion_schedule();
        }
    }
    hw_interrupt_enable();
    return;
}

