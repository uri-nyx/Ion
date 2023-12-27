#include "include/drivers/timer.h"
#include "include/system/int.h"


static int tick = 0;

/* The timer interval interrupt handler */
static int timer_callback()
{
   tick++;
   return 0;
}

void timer_init()
{
   int interval = 0xffff;
   char freq = 255;
   /* Firstly, register our timer callback. */
   register_interrupt_handler(IRQ_TIMER_INTERVAL, timer_callback);
   timer_interval_set(interval, freq);
} 