	#bank text
	#bank data
	;#globl	Cion_running_task
	Cion_running_task:	#res 4
	;#globl	Cion_first_ready_task
	Cion_first_ready_task:	#res 4
	;#globl	Cion_last_ready_task
	Cion_last_ready_task:	#res 4
	;#globl	Cion_sleeping_task_list
	Cion_sleeping_task_list:	#res 4
	;#globl	Cion_task_postponed_flag
Cion_task_postponed_flag:	#d32	0
	;#globl	Cion_task_postponed_switches
Cion_task_postponed_switches:	#d32	0
Cktime_last_count:	#d32	0
Cutime_last_count:	#d32	0
	#bank text
	#align 32
Ctask_append_ready:	push	fp, sp
	mv	fp, sp
	lw	a0, 8(fp)
	bnez	a0, L300
	j	L299
L300:
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	push	a0, sp
	llw	a0, Cion_first_ready_task
	pop	a1, sp
	beq	a1, a0, L302
	j	L301
L302:
	lw	a0, 8(fp)
	ssw	a0, Cion_last_ready_task, t0
	ssw	a0, Cion_first_ready_task, t0
	j	L303
L301:
	li	a0, 8
	push	a0, sp
	llw	a0, Cion_last_ready_task
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 8(fp)
	ssw	a0, Cion_last_ready_task, t0
L303:
	j	L299
L299:
	pop	fp, sp
	ret
	;#globl	Ctask_running_append_ready
	#align 32
Ctask_running_append_ready:	push	fp, sp
	mv	fp, sp
	llw	a0, Cion_running_task
	push	a0, sp
	push	ra, sp
	call	Ctask_append_ready
	pop	ra, sp
	addi	sp, sp, 4
	j	L304
L304:
	pop	fp, sp
	ret
	#align 32
Ctask_kstack_alloc:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	addi	a0, fp, -12
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -12
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -12
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	sw	a0, 0(a1)
	llw	a0, Cpaging_ctx
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 1
	push	a0, sp
	addi	a0, fp, -12
	push	a0, sp
	push	ra, sp
	call	Calloc_frame
	pop	ra, sp
	addi	sp, sp, 16
	addi	a0, fp, -12
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 4096
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -12
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -12
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	sw	a0, 0(a1)
	llw	a0, Cpaging_ctx
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 1
	push	a0, sp
	addi	a0, fp, -12
	push	a0, sp
	push	ra, sp
	call	Calloc_frame
	pop	ra, sp
	addi	sp, sp, 16
	j	L305
L305:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cmultitasking_init
	#align 32
Cmultitasking_init:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L308
	j	L307
L308:
	li	a0, -80
	j	L306
L307:
	lw	a0, 8(fp)
	push	a0, sp
	llw	a0, CKernelStackTop
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	llw	a0, Cpaging_currpt
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	llw	a0, Cion_first_ready_task
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, -1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cclock_read_counter
	pop	ra, sp
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 28
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	#bank data
L309:
	#d8	"K"
	#d8	"E"
	#d8	"R"
	#d8	"N"
	#d8	"E"
	#d8	"L"
	#d8	0
	#d8	0
	#bank text
	la	a0, L309
	push	a0, sp
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cstrcpy
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, 8(fp)
	ssw	a0, Cion_running_task, t0
	li	a0, 0
	j	L306
L306:
	pop	fp, sp
	ret
	;#globl	Ccreate_task
	#align 32
Ccreate_task:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 40
	push	a0, sp
	push	ra, sp
	call	Ckmalloc
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 12
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	llw	a0, Cpaging_currpt
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 8
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 4
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 28
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 7
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 32
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cstrncpy
	pop	ra, sp
	addi	sp, sp, 12
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Ctask_append_ready
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Ctask_new_ktask
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, -4(fp)
	j	L310
L310:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Ctask_schedule
	#align 32
Ctask_schedule:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 0
	push	a0, sp
	llw	a0, Cion_task_postponed_switches
	pop	a1, sp
	bne	a1, a0, L313
	j	L312
L313:
	li	a0, 1
	ssw	a0, Cion_task_postponed_flag, t0
	li	a0, 0
	j	L311
L312:
	llw	a0, Cion_first_ready_task
	beqz	a0, L314
	llw	a0, Cion_first_ready_task
	sw	a0, -4(fp)
	li	a0, 8
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	ssw	a0, Cion_first_ready_task, t0
	llw	a0, Cion_running_task
	push	a0, sp
	push	ra, sp
	call	Ctask_update_ktime_used
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cswitch_to_task
	pop	ra, sp
	addi	sp, sp, 4
	j	L315
L314:
	li	a0, -81
	j	L311
L315:
	li	a0, 0
	j	L311
L311:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cp_linked_list
	#align 32
Cp_linked_list:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 12(fp)
	sw	a0, -4(fp)
	li	a0, 91
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	beq	a1, a0, L318
	j	L317
L318:
	#bank data
L319:
	#d8	"e"
	#d8	"m"
	#d8	"p"
	#d8	"t"
	#d8	"y"
	#d8	93
	#d8	0
	#d8	0
	#bank text
	la	a0, L319
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_puts
	pop	ra, sp
	addi	sp, sp, 8
	j	L316
L317:
L321:
	lw	a0, -4(fp)
	beqz	a0, L320
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 20(fp)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	sw	a0, -4(fp)
	j	L321
L320:
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 93
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	j	L316
L316:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#align 32
Cprint_task_name:	push	fp, sp
	mv	fp, sp
	#bank data
L323:
	#d8	37
	#d8	"s"
	#d8	0
	#d8	0
	#bank text
	li	a0, 32
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, L323
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 0
	j	L322
L322:
	pop	fp, sp
	ret
	;#globl	Cp_ready_tasks
	#align 32
Cp_ready_tasks:	push	fp, sp
	mv	fp, sp
	#bank data
L325:
	#d8	"R"
	#d8	"e"
	#d8	"a"
	#d8	"d"
	#d8	"y"
	#d8	58
	#d8	32
	#d8	0
	#bank text
	la	a0, L325
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 8
	la	a0, Cprint_task_name
	push	a0, sp
	li	a0, 8
	push	a0, sp
	llw	a0, Cion_first_ready_task
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Cp_linked_list
	pop	ra, sp
	addi	sp, sp, 16
	li	a0, 10
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	j	L324
L324:
	pop	fp, sp
	ret
	;#globl	Cp_sleeping_tasks
	#align 32
Cp_sleeping_tasks:	push	fp, sp
	mv	fp, sp
	#bank data
L327:
	#d8	"S"
	#d8	"l"
	#d8	"e"
	#d8	"e"
	#d8	"p"
	#d8	"i"
	#d8	"n"
	#d8	"g"
	#d8	58
	#d8	32
	#d8	0
	#d8	0
	#bank text
	la	a0, L327
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 8
	la	a0, Cprint_task_name
	push	a0, sp
	li	a0, 8
	push	a0, sp
	llw	a0, Cion_sleeping_task_list
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Cp_linked_list
	pop	ra, sp
	addi	sp, sp, 16
	li	a0, 10
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	j	L326
L326:
	pop	fp, sp
	ret
	;#globl	Ctask_update_utime_used
	#align 32
Ctask_update_utime_used:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	push	ra, sp
	call	Cclock_read_counter
	pop	ra, sp
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	llw	a0, Cutime_last_count
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -8(fp)
	lw	a0, -4(fp)
	ssw	a0, Cutime_last_count, t0
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 20
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 20
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	j	L328
L328:
	addi	sp, sp, 8
	pop	fp, sp
	ret
	;#globl	Ctask_update_ktime_used
	#align 32
Ctask_update_ktime_used:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L331
	j	L330
L331:
	j	L329
L330:
	push	ra, sp
	call	Cclock_read_counter
	pop	ra, sp
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	llw	a0, Cktime_last_count
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -8(fp)
	lw	a0, -4(fp)
	ssw	a0, Cktime_last_count, t0
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	j	L329
L329:
	addi	sp, sp, 8
	pop	fp, sp
	ret
	;#globl	Ctask_kuptime
	#align 32
Ctask_kuptime:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L334
	j	L333
L334:
	li	a0, -80
	j	L332
L333:
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctask_update_ktime_used
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	j	L332
L332:
	pop	fp, sp
	ret
	;#globl	Ctask_uuptime
	#align 32
Ctask_uuptime:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L337
	j	L336
L337:
	li	a0, -80
	j	L335
L336:
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctask_update_utime_used
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	j	L335
L335:
	pop	fp, sp
	ret
	;#globl	Ctask_block
	#align 32
Ctask_block:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	llw	a0, Cion_running_task
	pop	a1, sp
	beq	a1, a0, L340
	j	L339
L340:
	j	L338
L339:
	push	ra, sp
	call	Cion_lock_scheduler
	pop	ra, sp
	li	a0, 4
	push	a0, sp
	llw	a0, Cion_running_task
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	push	ra, sp
	call	Ctask_schedule
	pop	ra, sp
	push	ra, sp
	call	Cion_unlock_scheduler
	pop	ra, sp
L338:
	pop	fp, sp
	ret
	;#globl	Ctask_unblock
	#align 32
Ctask_unblock:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	llw	a0, Cion_running_task
	pop	a1, sp
	beq	a1, a0, L343
	j	L342
L343:
	j	L341
L342:
	push	ra, sp
	call	Cion_lock_scheduler
	pop	ra, sp
	li	a0, 0
	push	a0, sp
	llw	a0, Cion_first_ready_task
	pop	a1, sp
	beq	a1, a0, L345
	j	L344
L345:
	li	a0, 43690
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cswitch_to_task
	pop	ra, sp
	addi	sp, sp, 4
	j	L346
L344:
	li	a0, 8
	push	a0, sp
	llw	a0, Cion_last_ready_task
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 8(fp)
	ssw	a0, Cion_last_ready_task, t0
L346:
	push	ra, sp
	call	Cion_unlock_scheduler
	pop	ra, sp
L341:
	pop	fp, sp
	ret
	;#globl	Ctask_tms_sleep_until
	#align 32
Ctask_tms_sleep_until:	push	fp, sp
	mv	fp, sp
	push	ra, sp
	call	Cion_lock_system
	pop	ra, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cclock_read_counter
	pop	ra, sp
	pop	a1, sp
	blt	a1, a0, L349
	j	L348
L349:
	push	ra, sp
	call	Cion_unlock_scheduler
	pop	ra, sp
	j	L347
L348:
	li	a0, 28
	push	a0, sp
	llw	a0, Cion_running_task
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 8
	push	a0, sp
	llw	a0, Cion_running_task
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	llw	a0, Cion_sleeping_task_list
	pop	a1, sp
	sw	a0, 0(a1)
	llw	a0, Cion_running_task
	ssw	a0, Cion_sleeping_task_list, t0
	push	ra, sp
	call	Cion_unlock_system
	pop	ra, sp
	li	a0, 4
	push	a0, sp
	push	ra, sp
	call	Ctask_block
	pop	ra, sp
	addi	sp, sp, 4
L347:
	pop	fp, sp
	ret
	;#globl	Ctask_tms_sleep
	#align 32
Ctask_tms_sleep:	push	fp, sp
	mv	fp, sp
	push	ra, sp
	call	Cclock_read_counter
	pop	ra, sp
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Ctask_tms_sleep_until
	pop	ra, sp
	addi	sp, sp, 4
L350:
	pop	fp, sp
	ret
	;#globl	Ctask_sleep
	#align 32
Ctask_sleep:	push	fp, sp
	mv	fp, sp
	push	ra, sp
	call	Cclock_read_counter
	pop	ra, sp
	push	a0, sp
	li	a0, 10000
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Ctask_tms_sleep_until
	pop	ra, sp
	addi	sp, sp, 4
L351:
	pop	fp, sp
	ret
