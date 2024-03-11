/**
 * @file int.h
 * @author Uri Nyx (rserranof03@usal.es)
 * @brief ION Interrupt handling for sirius
 * @version 0.1
 * @date 2024-02-15
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#ifndef INT_H
#define INT_H

#include <ion.h>

/* Exceptions                   */
#define ISR_RESET               0x00
#define ISR_BUS_ERROR           0x02
#define ISR_ADDRESS_ERROR       0x03
#define ISR_ILLEGAL_INSTRUCTION 0x04
#define ISR_DIVISION_ZERO       0x05
#define ISR_PRIVILEGE_VIOLATION 0x06
#define ISR_PAGE_FAULT          0x07
#define ISR_ACCESS_VIOLATION    0x08

/* Interrupts                   */
#define IRQ_TTY_TRANSMIT       0x0a
#define IRQ_KBD_CHARACTER      0x0b
#define IRQ_KBD_SCANCODE       0x0c
#define IRQ_TPS_LOAD_FINISHED  0x0d
#define IRQ_DISK_LOAD_FINISHED 0x0e
#define IRQ_TIMER_TIMEOUT      0x0f
#define IRQ_TIMER_INTERVAL     0x10
#define IRQ_VIDEO_REFRESH      0x11
#define IRQ18                  0x12
#define IRQ19                  0x13
#define IRQ20                  0x14
#define IRQ21                  0x15
#define IRQ22                  0x16
#define IRQ23                  0x17
#define IRQ24                  0x18
#define IRQ25                  0x19
#define IRQ26                  0x1a
/*...*/

typedef u32 sirius_registers[32];
typedef void (*ion_interrupt_handler_t)(sirius_registers);

/**
 * @brief Handler for interrupts
 * 
 * @param vector the interrupt vector
 */
void ion_interrupt_handler(u8 vector);

/**
 * @brief Register a handler function for the specified vector. The function
 * shall be of type interrupt_handler_t.
 * 
 * @param vector the interrupt vector for wich to register the callback
 * @param handler the callback function to register
 */
void ion_register_interrupt_handler(u8 vector, ion_interrupt_handler_t handler);

#endif /* INT_H */
