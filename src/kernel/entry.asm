#bank text
_start:
    li sp, kernel_stack
    call get_timer_dev
    call get_kb_dev
    call get_drive_dev
    call INITIALIZE_IVT
    call _clear
    la  a0, __kernel_end
    ssw  a0, CKernelEnd, t1 
    li   a0, 2
    priority a0, t0, t1
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
    lw t1, 0(a1) ; load number of entries
    addi a1, a1, 4 ; point a1 to first constant
.loop:
    lw a2, 0(a1) ; load first case
    beq a2, a0, .match
    addi a1, a1, 8
    subi t1, t1, 1
    beqz t1, .nomatch
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

Cint_clear:
        push    fp, sp
        mv      fp, sp
        cli
        pop     fp, sp
        ret


Cint_set:
        push    fp, sp
        mv      fp, sp
        sti
        pop     fp, sp
        ret

Cset_priority:
        push    fp, sp
        mv      fp, sp
        lw      a0, 8(fp)
        priority a0, t0, t1
        pop     fp, sp
        ret

Craise:
    la a0, raise_error
    call Cbios_puts
    ret

C__CALLRET: #d32 0
C__call:
    push    fp, sp
    mv      fp, sp
    lw      a0, 8(fp)
    li      t0, 0x014
    trace   t0, a0, zero, zero
    push    ra, sp
    jalr    ra, 0(a0)
    pop     ra, sp
    trace   t0, a0, zero, zero 
    ssw     a0, C__CALLRET, t0
    pop     fp, sp
    ret

C__FLOAT: #d32 0
C__floats:
        addi r2,r2,-32
        sw  r8,28(r2)
        addi  r8,r2,16
        la r30,.l2
        lw r30,0(r30)
        sw r30,-8+16(r8)
        lw r10,-8+16(r8)
.l1:
        lw  r8,28(r2)
        ssw r8, C__FLOAT, t0
        addi  r2,r2,32
        jalr r0,0(r1)
.l2:
        #d32   0x42cc0000

Cloader_user_exec:
    push    fp, sp
    mv      fp, sp
    llw     a0, Cprogram_entry
    llw     tp, Cprogram_stack
    ssw     ra, Cion_reentry, t0 ; to be restored by C_kernel_reenter()
    ; Transfer to USER Mode! 
    umode.toggle a0, tp

C_kernel_reenter:
    push    fp, sp
    mv      fp, sp
    llw     ra, Cion_reentry
    pop     fp, sp
    sti
    ret

; extern void sbd(uint8_t byte, int32_t addr16);
Csbd:
    push    fp, sp
    mv      fp, sp
    lw      a0, 8(fp)
    lw      a1, 12(fp)
    sbd     a0, 0(a1)
    pop     fp, sp
    ret


Clwd:
    push    fp, sp
    mv      fp, sp
    lw      a0, 8(fp)
    sbd     a0, 0(a0)
    pop     fp, sp
    ret

SREGTMP = 0x210
Cion_lock_scheduler:
    gsreg   t1
    cli
    swd     t1, SREGTMP(zero)
    ;trace   ra, zero, zero, ra
    ret

Cion_unlock_scheduler:
    lwd     t1, SREGTMP(zero)
    ssreg   t1
    ret

C_interrupt_disable:
    gsreg   t1
    swd     t1, SREGTMP(zero)
    cli
    ret

C_interrupt_enable:
    lwd     t1, SREGTMP(zero)
    ssreg   t1
    ret

C_cli:
    cli
    ret

C_sti:
    sti
    ret

#bank data
flush: #d "\n\r\0"
raise_error: #d "raise() not implemented!\n\r\0"
return: #d "main() returned\n\r\0"
CKernelPhys: #d32 KERNEL_ADDR
CKernelEnd: #d32 0

#bank bss
;#globl __bbss_start_
__bbss_start_:
#res KERNEL_STACK_SIZE
;#globl CKernelStackTop
CKernelStackTop:
kernel_stack:
;#globl __kernel_end
__kernel_end: