.extern Ion_task_postponed_switches
.extern Ion_task_postponed_flag
.extern Ion_running_task
.extern Ion_first_ready_task
.extern Ion_last_ready_task
.text
# void switch_to_task(struct ion_task_cb *next_task)
ion_switch_to_task:
        # Save previous task's state
        # Register file is supposed to be saved by the interrupt handler
        # next_task in x12

        lw      x31, Ion_task_postponed_switches
        beq    x31, x0, .continue
        li      x31, 1
        sw      x31, Ion_task_postponed_flag, x5
        ret

        .continue:

        mv      x31, x2
        save    x1, x30, x31


        #lw      t0, 124(x31)
        lw     x31, Ion_running_task
        sw      x2, 0(x31) # The first field of struct ion_task_cb
        lw      x10, 4(x31)

        li      x11, 2           # RUNNING state
        beq     x10, x11, .change_to_ready
        j       .set_running_state
        
        .change_to_ready:
        li      x10, 1           # READY state
        sw      x10, 4(x31)
        sw      x0, 8(x31)
        
        # check if first ready task is NULL
        lw     x10, Ion_first_ready_task
        beq    x10, x0, .no_ready_tasks

        lw     x10, Ion_last_ready_task
        sw      x31, 8(x10)       # last->next = current
        sw     x31, Ion_last_ready_task, x10 # last = current;
        j       .set_running_state

        .no_ready_tasks:
        # ion_first_ready_task = ion_last_ready_task = task;
        sw     x31, Ion_first_ready_task, x10
        sw     x31, Ion_last_ready_task, x10

        .set_running_state:
        sw      x11, 4(x12)       # set next task to RUNNING
 
        # Load next task's cb
        sw     x12, Ion_running_task, x31

        lw      x2, 0(x12)       # The stack of next_task
       
        lw      x10, 12(x12)       # The page table of next_task

        mmu.getpt      x11       # The page table of the current task
        beq     x10, x11, .nosw   # if the page table is the same between tasks, don't switch
        mmu.switch x10, x10, 0, 0   # else, switch to its address space

        .nosw:
        addi    x31, x2, -120
       
        restore x1, x30, x31
        ret

.extern _task_kstack_alloc
# void task_new_ktask(void *kstack, int (*entry)())
.globl ion_task_new_ktask
ion_task_new_ktask:
        # VARIABLES IN DATA MEM FOR SCx1TCH REGS
        # TMP0 .equ 0x200
        # TMP1 .equ 0x204
        # TMP2 .equ 0x208
        # TMP3 .equ 0x20C

        cli
        swd     x13, 0x204(x0) # kstask entry
        swd     x12, 0x200(x0) # kstack

        push    x1, x2
        call    _task_kstack_alloc
        pop     x1, x2

        # save this return
        swd     x1, 0x20C(x0)
        # save this stack
        swd     x2, 0x208(x0)

        addi    x2, x12, -120
        lwd     x1, 0x204(x0)
        save    x1, x30, x31

        lwd     x1, 0x20C(x0)
        lwd     x2, 0x208(x0)

        sti
        ret
