	#bank text
	;#globl	Cion_lock_system
	#align 32
Cion_lock_system:	push	fp, sp
	mv	fp, sp
	push	ra, sp
	call	C_interrupt_disable
	pop	ra, sp
	llw	a0, Cion_task_postponed_switches
	llw	t0, Cion_task_postponed_switches;cgincgw
	addi	t0, t0, 1
	ssw	t0, Cion_task_postponed_switches, t5
	j	L231
L231:
	pop	fp, sp
	ret
	;#globl	Cion_unlock_system
	#align 32
Cion_unlock_system:	push	fp, sp
	mv	fp, sp
	llw	a0, Cion_task_postponed_switches
	llw	t0, Cion_task_postponed_switches
	subi	t0, t0, 1
	ssw	t0, Cion_task_postponed_switches, t5
	li	a0, 0
	push	a0, sp
	llw	a0, Cion_task_postponed_switches
	pop	a1, sp
	beq	a1, a0, L234
	j	L233
L234:
	li	a0, 0
	push	a0, sp
	llw	a0, Cion_task_postponed_flag
	pop	a1, sp
	bne	a1, a0, L236
	j	L235
L236:
	li	a0, 0
	ssw	a0, Cion_task_postponed_flag, t0
	push	ra, sp
	call	Ctask_schedule
	pop	ra, sp
L235:
L233:
	push	ra, sp
	call	C_interrupt_enable
	pop	ra, sp
	j	L232
L232:
	pop	fp, sp
	ret
