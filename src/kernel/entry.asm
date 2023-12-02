#bank text
_start:
    li sp, kernel_stack
    call get_timer_dev
    call get_kb_dev
    call INITIALIZE_IVT
    call _clear
    la  a0, __kernel_end
    ssw  a0, CKernelEnd, t6 
    int.set t5, t6
    li t6, 2
    priority t6, t1, t0
    call Ckinit    
    j $

ENTER:
    call Ckmain
    j $

_clear:
    li t0, 0x200f
    li t1, 0xe5_10_00
    li t2, 80*25
.loop:
    beqz t2, .end
    sh t0, 0(t1)
    addi t1, t1, 2
    subi t2, t2, 1
    j .loop
.end:
    ret

switch:
    push a2, sp
    lw t6, 0(a1) ; load number of entries
    addi a1, a1, 4 ; point a1 to first constant
.loop:
    lw a2, 0(a1) ; load first case
    beq a2, a0, .match
    addi a1, a1, 8
    subi t6, t6, 1
    beqz t6, .nomatch
    j .loop
.match:
    lw a0, 4(a1)  ; load matching label
    pop a2, sp
    jr a0
.nomatch:
    lw a0, 0(a1)  ; load default
    pop a2, sp
    jr a0


Cbios_puts:  push    fp, sp
        mv      fp, sp
        lw      a0, 8(fp)
        li      a1, 0x0f
        syscall zero, 0x12
        pop     fp, sp
        ret

Ctrace:  push    fp, sp
        mv      fp, sp
        lw      a0, 8(fp)
        trace a0, a0, a0, a0
        pop     fp, sp
        ret

Craise:
    la a0, raise_error
    call Cbios_puts
    ret

#bank data
flush: #d "\n\r\0"
raise_error: #d "raise() not implemented!\n\r\0"
return: #d "main() returned\n\r\0"
CKernelPhys: #d32 KERNEL_ADDR
CKernelEnd: #d32 0

#bank bss
#res KERNEL_STACK_SIZE
kernel_stack:
#align 4096 * 8
__kernel_end: