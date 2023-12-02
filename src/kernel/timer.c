#include "include/timer.h"
#include "include/txtmod.h"
#include "include/int.h"


int tick = 0;
int key = 0;

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
   register_interrupt_handlers(IRQ_TIMER_INTERVAL, timer_callback);
   timer_interval_set(interval, freq);
} 