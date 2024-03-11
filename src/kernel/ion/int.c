#include <ion/int.h>

ion_interrupt_handler_t interrupt_handlers[256];

void ion_interrupt_handler(u8 vector)
{
        sirius_registers        regs = { 0 }; /* TODO: use the actual context */
        ion_interrupt_handler_t handler = interrupt_handlers[vector];
        handler(regs);
}

void ion_register_interrupt_handler(u8 vector, ion_interrupt_handler_t handler)
{
        interrupt_handlers[vector] = handler;
}
