#bank text
; void switch_to_task(struct ion_task_cb *next_task);
Cswitch_to_task:
        ; Save previous task's state
        ; Register file is supposed to be saved by the interrupt handler

        llw     t6, Cion_task_postponed_switches
        beqz    t6, .continue
        li      t6, 1
        ssw     t6, Cion_task_postponed_flag, t0
        ret

        .continue:

        mv      t6, sp
        save    ra, t5, t6


        lw      t0, 124(t6)
        llw     t6, Cion_running_task
        sw      sp, 0(t6)       ; The first field of struct ion_task_cb
        lw      a0, 4(t6)

        li      a1, 2           ; RUNNING state
        beq     a0, a1, .change_to_ready
        j       .set_running_state
        
        .change_to_ready:
        li      a0, 1           ; READY state
        sw      a0, 4(t6)
        sw      zero, 8(t6)

        ; check if first ready task is NULL
        llw     a0, Cion_first_ready_task
        beqz    a0, ..no_ready_tasks

        llw     a0, Cion_last_ready_task
        sw      t6, 8(a0)       ; last->next = current
        ssw     t6, Cion_last_ready_task, a0 ; last = current;
        j       .set_running_state

        ..no_ready_tasks:
        ; ion_first_ready_task = ion_last_ready_task = task;
        ssw     t6, Cion_first_ready_task, a0
        ssw     t6, Cion_last_ready_task, a0

        .set_running_state:
        sw      a1, 4(t0)       ; set next task to RUNNING
        ;j $
 
        ;Load next task's cb
        ssw     t0, Cion_running_task, t6

        lw      sp, 0(t0)       ; The stack of next_task
       
        lw      a0, 12(t0)       ; The page table of next_task

        mmu.getpt      a1       ; The page table of the current task
        beq     a0, a1, .nosw   ; if the page table is the same between tasks, don't switch
        mmu.switch a0, a0, (0, 0)   ; else, switch to its address space

        .nosw:
        addi    t6, sp, -120
       
        restore ra, t5, t6

        ret

; void task_new_ktask(void *kstack, int (*entry)())
;#globl Ctask_new_ktask
Ctask_new_ktask:
        ; VARIABLES IN DATA MEM FOR SCRATCH REGS
        .TMP0 = 0x200
        .TMP1 = 0x204
        .TMP2 = 0x208
        .TMP3 = 0x20C
        cli
        lw      t6, 8(sp)
        swd     t6, .TMP1(zero) ; kstask entry
        lw      t6, 4(sp)
        swd     t6, .TMP0(zero) ; kstack

        push    t6, sp
        push    ra, sp
        call    Ctask_kstack_alloc
        pop     ra, sp
        pop     t6, sp

        ; save this return
        swd     ra, .TMP3(zero)
        ; save this stack
        swd     sp, .TMP2(zero)

        addi    sp, t6, -120
        lwd     ra, .TMP1(zero)
        save    ra, t5, t6

        lwd     ra, .TMP3(zero)
        lwd     sp, .TMP2(zero)

        sti
        ret

