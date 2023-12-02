#include "include/int.h"
#include "include/txtmod.h"

void* interrupt_handlers[256];
static int times;

void isr_handler(int interrupt)
{
  isr_t;
  handler = interrupt_handlers[interrupt];
  handler();
}

void irq_handler(int interrupt)
{
  isr_t;
  handler = interrupt_handlers[interrupt];
  handler();
}


void register_interrupt_handlers(char n, isr_t /*handler*/)
{
  interrupt_handlers[(int)n] = handler;
}