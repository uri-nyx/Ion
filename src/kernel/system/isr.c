#include "include/system/int.h"

void* interrupt_handlers[256];
static int times;

void isr_handler(int interrupt)
{
  int (*handler)();
  handler = interrupt_handlers[interrupt];
  handler();
}

void irq_handler(int interrupt)
{
  int (*handler)();
  handler = interrupt_handlers[interrupt];
  handler();
}

void register_interrupt_handler(char n, int (*handler)())
{
  interrupt_handlers[(int)n] = handler;
}