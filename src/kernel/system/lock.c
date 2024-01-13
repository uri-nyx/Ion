#include "include/system/lock.h"
#include "include/drivers/hw.h"
#include "include/system/task.h"

void ion_lock_system(void)
{
        _interrupt_disable();
        ion_task_postponed_switches++;
        return;
}

void ion_unlock_system(void)
{
        ion_task_postponed_switches--;
        if(ion_task_postponed_switches == 0) {
        if(ion_task_postponed_flag != 0) {
            ion_task_postponed_flag = 0;
            task_schedule();
        }
    }
    _interrupt_enable();
    return;
}