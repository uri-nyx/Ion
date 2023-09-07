INITIALIZE_IVT:
	la a1, _IVT
	la a0, ISR_TTY_TRANSMIT
	swd a0, IVT_TTY_TRANSMIT(a1)
	la a0, ISR_RESET
    swd a0, IVT_RESET(a1)
	la a0, ISR_BUS_ERROR
    swd a0, IVT_BUS_ERROR(a1)
	la a0, ISR_ADDRESS_ERROR
    swd a0, IVT_ADDRESS_ERROR(a1)
	la a0, ISR_ILLEGAL_INSTRUCTION
    swd a0, IVT_ILLEGAL_INSTRUCTION(a1)
	la a0, ISR_DIVISION_ZERO
    swd a0, IVT_DIVISION_ZERO(a1)
	la a0, ISR_PRIVILEGE_VIOLATION
    swd a0, IVT_PRIVILEGE_VIOLATION(a1)
	la a0, ISR_PAGE_FAULT
    swd a0, IVT_PAGE_FAULT(a1)
	la a0, ISR_ACCESS_VIOLATION
    swd a0, IVT_ACCESS_VIOLATION(a1)
	la a0, ISR_KBD_CHARACTER
    swd a0, IVT_KBD_CHARACTER(a1)
	la a0, ISR_KBD_SCANCODE
    swd a0, IVT_KBD_SCANCODE(a1)
	la a0, ISR_TPS_LOAD_FINISHED
    swd a0, IVT_TPS_LOAD_FINISHED(a1)
	la a0, ISR_DISK_LOAD_FINISHED
    swd a0, IVT_DISK_LOAD_FINISHED(a1)
    la a0, ISR_TIMER_TIMEOUT
    swd a0, IVT_TIMER_TIMEOUT(a1)
    la a0, ISR_TIMER_INTERVAL
    swd a0, IVT_TIMER_INTERVAL(a1)
    la a0, ISR_VIDEO_REFRESH
    swd a0, IVT_VIDEO_REFRESH(a1)

    ret

IRQ_BASIC:
ISR_BASIC:
    push ra, s8
    save s2, s7, s8
    push s9, s2
    addi s4, s2, 0
    subi s3, s2, 4
    call Kernel.interruptHandler
    pop ra, s8
    int.set t5, t6
sysret


ISR_RESET:
    int.clear t5, t6
    push s9, s2
    mv s9, zero
    j ISR_BASIC

ISR_BUS_ERROR:
    int.clear t5, t6
    push s9, s2
    li s9, 2
    j ISR_BASIC

ISR_ADDRESS_ERROR:
    int.clear t5, t6
    push s9, s2
    li s9, 3
    j ISR_BASIC

ISR_ILLEGAL_INSTRUCTION:
    int.clear t5, t6
    push s9, s2
    li s9, 4
    j ISR_BASIC

ISR_DIVISION_ZERO:
    int.clear t5, t6
    push s9, s2
    li s9, 5
    j ISR_BASIC

ISR_PRIVILEGE_VIOLATION:
    int.clear t5, t6
    push s9, s2
    li s9, 6
    j ISR_BASIC

ISR_PAGE_FAULT:
    int.clear t5, t6
    push s9, s2
    li s9, 7
    j ISR_BASIC

ISR_ACCESS_VIOLATION:
    int.clear t5, t6
    push s9, s2
    li s9, 8
    j ISR_BASIC

ISR_TTY_TRANSMIT:
    int.clear t5, t6
    push s9, s2
    li s9, 10
    j IRQ_BASIC

ISR_KBD_CHARACTER:
    int.clear t5, t6
    push s9, s2
    li s9, 9 + 2
    j IRQ_BASIC

ISR_KBD_SCANCODE:
    int.clear t5, t6
    push s9, s2
    li s9, 10 + 2
    j IRQ_BASIC

ISR_TPS_LOAD_FINISHED:
    int.clear t5, t6
    push s9, s2
    li s9, 11 + 2
    j IRQ_BASIC

ISR_DISK_LOAD_FINISHED:
    int.clear t5, t6
    push s9, s2
    li s9, 12 + 2
    j IRQ_BASIC

ISR_TIMER_TIMEOUT:
    int.clear t5, t6
    push s9, s2
    li s9, 13 + 2
    j IRQ_BASIC

ISR_TIMER_INTERVAL:
    int.clear t5, t6
    push s9, s2
    li s9, 14 + 2
    j IRQ_BASIC

ISR_VIDEO_REFRESH:
    int.clear t5, t6
    push s9, s2
    li s9, 15 + 2
    j IRQ_BASIC