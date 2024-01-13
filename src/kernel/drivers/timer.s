	#bank text
	#bank data
L410:
	#d32	0
	#bank text
	#align 32
Ctimer_callback:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	push	ra, sp
	call	Cion_lock_system
	pop	ra, sp
	push	ra, sp
	call	Cclock_read_counter
	pop	ra, sp
	ssw	a0, L410, t0
	llw	a0, Cion_sleeping_task_list
	sw	a0, -4(fp)
	li	a0, 0
	ssw	a0, Cion_sleeping_task_list, t0
L413:
	li	a0, 0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	bne	a1, a0, L414
	j	L412
L414:
	lw	a0, -4(fp)
	sw	a0, -8(fp)
	li	a0, 8
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -4(fp)
	li	a0, 28
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	llw	a0, L410
	pop	a1, sp
	bge	a0, a1, L416
	j	L415
L416:
	#bank data
L417:
	#d8	"W"
	#d8	"a"
	#d8	"k"
	#d8	"i"
	#d8	"n"
	#d8	32
	#d8	"u"
	#d8	"p"
	#d8	32
	#d8	"t"
	#d8	"a"
	#d8	"s"
	#d8	"k"
	#d8	32
	#d8	37
	#d8	"s"
	#d8	44
	#d8	32
	#d8	"e"
	#d8	"x"
	#d8	"p"
	#d8	"i"
	#d8	"r"
	#d8	"y"
	#d8	32
	#d8	"s"
	#d8	"e"
	#d8	"t"
	#d8	32
	#d8	"f"
	#d8	"o"
	#d8	"r"
	#d8	32
	#d8	37
	#d8	"d"
	#d8	10
	#d8	0
	#d8	0
	#d8	0
	#d8	0
	#bank text
	li	a0, 28
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 32
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, L417
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 16
	lw	a0, -8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctask_unblock
	pop	ra, sp
	addi	sp, sp, 4
	j	L418
L415:
	li	a0, 8
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	llw	a0, Cion_sleeping_task_list
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, -8(fp)
	ssw	a0, Cion_sleeping_task_list, t0
L418:
	j	L413
L412:
	push	ra, sp
	call	Cion_unlock_system
	pop	ra, sp
L411:
	addi	sp, sp, 8
	pop	fp, sp
	ret
	;#globl	Ctimer_init
	#align 32
Ctimer_init:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	li	t0, 65535
	sw	t0, -4(fp)
	li	t0, 255
	sw	t0, -8(fp)
	la	a0, Ctimer_callback
	push	a0, sp
	li	a0, 16
	push	a0, sp
	push	ra, sp
	call	Cregister_interrupt_handler
	pop	ra, sp
	addi	sp, sp, 8
	mv	a0, zero
	lbu	a0, -5(fp)
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Ctimer_interval_set
	pop	ra, sp
	addi	sp, sp, 8
L419:
	addi	sp, sp, 8
	pop	fp, sp
	ret
