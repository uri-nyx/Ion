#bank text
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
    la a0, SYSCALL_HANDLER
    swd a0, 0x20*4(a1)

    ret

SYSCALL_HANDLER:
    push a2, sp
    push a1, sp
    push a0, sp 
    push a7, sp
    push ra, sp
    call Csyscall   ; int syscall(a7, a0, a1, a2), the syscall handler
    pop ra, sp
    sysret


IRQ_BASIC:
    ssw t5, __intcode, t6
    pop t5, sp
    mv t6, sp
    save ra, t5, t6
    mv sp, t6
    llw a0, __intcode
    push a0, sp
    push ra, sp
    call Cirq_handler
    pop ra, sp
    addi sp, sp, 4
    sti
    restore ra, t5, sp
sysret

ISR_BASIC:
    ssw t5, __intcode, t6
    pop t5, sp
    mv t6, sp
    save ra, t5, t6
    mv sp, t6
    llw a0, __intcode
    push a0, sp
    push ra, sp
    call Cisr_handler
    pop ra, sp
    addi sp, sp, 4
    sti
    restore ra, t5, sp
sysret

__intcode: #d32 0

ISR_RESET:
    push t5, sp
    cli
    mv t4, zero
    j ISR_BASIC

ISR_BUS_ERROR:
    push t5, sp
    cli
    li t5, 2
    j ISR_BASIC

ISR_ADDRESS_ERROR:
    push t5, sp
    cli
    li t5, 3
    j ISR_BASIC

ISR_ILLEGAL_INSTRUCTION:
    j $
    push t5, sp
    cli
    li t5, 4
    j ISR_BASIC

ISR_DIVISION_ZERO:
    push t5, sp
    cli
    li t5, 5
    j ISR_BASIC

ISR_PRIVILEGE_VIOLATION:
    push t5, sp
    cli
    li t5, 6
    j ISR_BASIC

ISR_PAGE_FAULT:
    j $
    push t5, sp
    cli
    li t5, 7
    j ISR_BASIC

ISR_ACCESS_VIOLATION:
    push t5, sp
    cli
    li t5, 8
    j ISR_BASIC

ISR_TTY_TRANSMIT:
    push t5, sp
    cli
    li t5, 10
    j IRQ_BASIC

ISR_KBD_CHARACTER:
    push t5, sp
    cli
    li t5, 9 + 2
    j IRQ_BASIC

ISR_KBD_SCANCODE:
    push t5, sp
    cli
    li t5, 10 + 2
    j IRQ_BASIC

ISR_TPS_LOAD_FINISHED:
    push t5, sp
    cli
    li t5, 11 + 2
    j IRQ_BASIC

ISR_DISK_LOAD_FINISHED:
    push t5, sp
    cli
    li t5, 12 + 2
    j IRQ_BASIC

ISR_TIMER_TIMEOUT:
    push t5, sp
    cli
    li t5, 13 + 2
    j IRQ_BASIC

ISR_TIMER_INTERVAL:
    ; cli
    cli
    mv t6, sp
    save ra, t5, t6
    mv sp, t6
    ;swd sp, 0x220(zero)
    push ra, sp
    call Ctimer_callback
    pop ra, sp
    ;lwd t6, 0x220(zero)
    mv t6, sp
    restore ra, t5, t6
    sti
    sysret
    ; sti

ISR_VIDEO_REFRESH:
    push t5, sp
    cli
    li t5, 15 + 2
    j IRQ_BASIC