# Exceptions
.equ IVT_RESET               0x00 * 4
.equ IVT_BUS_ERROR           0x02 * 4
.equ IVT_ADDRESS_ERROR       0x03 * 4
.equ IVT_ILLEGAL_INSTRUCTION 0x04 * 4
.equ IVT_DIVISION_ZERO       0x05 * 4
.equ IVT_PRIVILEGE_VIOLATION 0x06 * 4
.equ IVT_PAGE_FAULT          0x07 * 4
.equ IVT_ACCESS_VIOLATION    0x08 * 4

# Interrupts
.equ IVT_TTY_Tx1NSMIT        0x0a * 4
.equ IVT_KBD_CHAx1CTER       0x0b * 4
.equ IVT_KBD_SCANCODE        0x0c * 4
.equ IVT_TPS_LOAD_FINISHED   0x0d * 4
.equ IVT_DISK_LOAD_FINISHED  0x0e * 4
.equ IVT_TIMER_TIMEOUT	 0x0f * 4
.equ IVT_TIMER_INTERVAL 	 0x10 * 4 
.equ IVT_VIDEO_REFRESH	 0x11 * 4 

# Syscall handler (0x20)
.equ IVT_SYSCALL_HANDLER     0x20 * 4

.text
.globl _ivt_init
_ivt_init:
	la x11, _IVT
	la x10, ISR_TTY_Tx1NSMIT
	swd x10, IVT_TTY_Tx1NSMIT, x11
	la x10, ISR_RESET
    swd x10, IVT_RESET, x11
	la x10, ISR_BUS_ERROR
    swd x10, IVT_BUS_ERROR, x11
	la x10, ISR_ADDRESS_ERROR
    swd x10, IVT_ADDRESS_ERROR, x11
	la x10, ISR_ILLEGAL_INSTRUCTION
    swd x10, IVT_ILLEGAL_INSTRUCTION, x11
	la x10, ISR_DIVISION_ZERO
    swd x10, IVT_DIVISION_ZERO, x11
	la x10, ISR_PRIVILEGE_VIOLATION
    swd x10, IVT_PRIVILEGE_VIOLATION, x11
	la x10, ISR_PAGE_FAULT
    swd x10, IVT_PAGE_FAULT, x11
	la x10, ISR_ACCESS_VIOLATION
    swd x10, IVT_ACCESS_VIOLATION, x11
	la x10, ISR_KBD_CHAx1CTER
    swd x10, IVT_KBD_CHAx1CTER, x11
	la x10, ISR_KBD_SCANCODE
    swd x10, IVT_KBD_SCANCODE, x11
	la x10, ISR_TPS_LOAD_FINISHED
    swd x10, IVT_TPS_LOAD_FINISHED, x11
	la x10, ISR_DISK_LOAD_FINISHED
    swd x10, IVT_DISK_LOAD_FINISHED, x11
    la x10, ISR_TIMER_TIMEOUT
    swd x10, IVT_TIMER_TIMEOUT, x11
    la x10, ISR_TIMER_INTERVAL
    swd x10, IVT_TIMER_INTERVAL, x11
    la x10, ISR_VIDEO_REFRESH
    swd x10, IVT_VIDEO_REFRESH, x11
    la x10, SYSCALL_HANDLER
    swd x10, IVT_SYSCALL_HANDLER, x11
    ret

.extern syscall
SYSCALL_HANDLER:
    push x1, x2
    # int syscall(a2, a3, a4, a5), the syscall handler
    call syscall   
    pop x1, x2
    sysret

.bss
__intcode: .space 4

.extern interrupt_handler
.text
IRQ_BASIC:
ISR_BASIC:
    sw x30, __intcode, x31
    pop x30, x2
    mv x31, x2
    save x1, x30, x31
    mv x2, x31
    lw x12, __intcode
    push x1, x2
    call  interrupt_handler
    pop x1, x2
    addi x2, x2, 4
    sti
    restore x1, x30, x2
    sysret


ISR_RESET:
    push x30, x2
    cli
    mv x30, x0
    j ISR_BASIC

ISR_BUS_ERROR:
    push x30, x2
    cli
    li x30, 2
    j ISR_BASIC

ISR_ADDRESS_ERROR:
    push x30, x2
    cli
    li x30, 3
    j ISR_BASIC

ISR_ILLEGAL_INSTRUCTION:
    push x30, x2
    cli
    li x30, 4
    j ISR_BASIC

ISR_DIVISION_ZERO:
    push x30, x2
    cli
    li x30, 5
    j ISR_BASIC

ISR_PRIVILEGE_VIOLATION:
    push x30, x2
    cli
    li x30, 6
    j ISR_BASIC

ISR_PAGE_FAULT:
    push x30, x2
    cli
    li x30, 7
    j ISR_BASIC

ISR_ACCESS_VIOLATION:
    push x30, x2
    cli
    li x30, 8
    j ISR_BASIC

ISR_TTY_Tx1NSMIT:
    push x30, x2
    cli
    li x30, 10
    j IRQ_BASIC

ISR_KBD_CHAx1CTER:
    push x30, x2
    cli
    li x30, 9 + 2
    j IRQ_BASIC

ISR_KBD_SCANCODE:
    push x30, x2
    cli
    li x30, 10 + 2
    j IRQ_BASIC

ISR_TPS_LOAD_FINISHED:
    push x30, x2
    cli
    li x30, 11 + 2
    j IRQ_BASIC

ISR_DISK_LOAD_FINISHED:
    push x30, x2
    cli
    li x30, 12 + 2
    j IRQ_BASIC

ISR_TIMER_TIMEOUT:
    push x30, x2
    cli
    li x30, 13 + 2
    j IRQ_BASIC

.extern timer_callback
ISR_TIMER_INTERVAL:
    cli
    mv x31, x2
    save x1, x30, x31
    mv x2, x31
    push x1, x2
    call timer_callback
    pop x1, x2
    mv x31, x2
    restore x1, x30, x31
    sti
    sysret

ISR_VIDEO_REFRESH:
    push x30, x2
    cli
    li x30, 15 + 2
    j IRQ_BASIC
