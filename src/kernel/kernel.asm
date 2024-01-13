	#bank text
	#bank data
	;#globl	CIon_priority_level
CIon_priority_level:	#d32	7
	;#globl	Cglobal_ctx
	Cglobal_ctx:	#res 68
	Chp:	#res 28
	Cbitset:	#res 2052
	;#globl	Cstr
	Cstr:	#res 104
	Ct:	#res 4000
	Ckernel_task:	#res 40
	Csubtask:	#res 4
	Ctask3:	#res 4
	Cidle_task:	#res 4
	;#globl	Ctask_return
Ctask_return:	#d32	0
	#bank text
	;#globl	Csyscall_exit
	#align 32
Csyscall_exit:	push	fp, sp
	mv	fp, sp
	#bank data
L2:
	#d8	"E"
	#d8	"x"
	#d8	"i"
	#d8	"t"
	#d8	32
	#d8	"S"
	#d8	"y"
	#d8	"s"
	#d8	"c"
	#d8	"a"
	#d8	"l"
	#d8	"l"
	#d8	33
	#d8	32
	#d8	91
	#d8	37
	#d8	"d"
	#d8	93
	#d8	10
	#d8	0
	#bank text
	lw	a0, 8(fp)
	push	a0, sp
	la	a0, L2
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 12
	lw	a0, 8(fp)
	ssw	a0, Ctask_return, t0
	push	ra, sp
	call	C_kernel_reenter
	pop	ra, sp
	j	L1
L1:
	pop	fp, sp
	ret
	;#globl	Cexception_privilege
	#align 32
Cexception_privilege:	push	fp, sp
	mv	fp, sp
	li	a0, 48879
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	#bank data
L4:
	#d8	"P"
	#d8	"r"
	#d8	"i"
	#d8	"v"
	#d8	"i"
	#d8	"l"
	#d8	"e"
	#d8	"g"
	#d8	"e"
	#d8	32
	#d8	"v"
	#d8	"i"
	#d8	"o"
	#d8	"l"
	#d8	"a"
	#d8	"t"
	#d8	"i"
	#d8	"o"
	#d8	"n"
	#d8	32
	#d8	"e"
	#d8	"x"
	#d8	"c"
	#d8	"e"
	#d8	"p"
	#d8	"t"
	#d8	"i"
	#d8	"o"
	#d8	"n"
	#d8	33
	#d8	10
	#d8	0
	#bank text
	la	a0, L4
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 8
	push	ra, sp
	call	C_kernel_reenter
	pop	ra, sp
	li	a0, -1
	j	L3
L3:
	pop	fp, sp
	ret
	;#globl	Ckinit
	#align 32
Ckinit:	push	fp, sp
	mv	fp, sp
	la	a0, Cbitset
	push	a0, sp
	li	a0, 4096
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Cbitset
	push	a0, sp
	push	ra, sp
	call	Cpaging_init
	pop	ra, sp
	addi	sp, sp, 4
L5:
	pop	fp, sp
	ret
	;#globl	Ckernel_idle_task
	#align 32
Ckernel_idle_task:	push	fp, sp
	mv	fp, sp
L7:
	j	L8
L10:
	j	L7
L8:
	j	L10
L9:
L6:
	pop	fp, sp
	ret
	;#globl	Ckmain
	#align 32
Ckmain:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -448
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 28
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 48
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 56
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 15011840
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 124
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 15
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 80
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 36
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 143
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 60
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 44
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 64
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 20
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 25
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 52
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_clear
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -80
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -80
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -80
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 512
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -80
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 256
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -96
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -96
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -96
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 512
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -96
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 256
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Chp
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 15327232
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Chp
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 15327232
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Csyscall
	push	a0, sp
	li	a0, 32
	push	a0, sp
	push	ra, sp
	call	Cregister_interrupt_handler
	pop	ra, sp
	addi	sp, sp, 8
	la	a0, Cexception_privilege
	push	a0, sp
	li	a0, 6
	push	a0, sp
	push	ra, sp
	call	Cregister_interrupt_handler
	pop	ra, sp
	addi	sp, sp, 8
	push	ra, sp
	call	Ctimer_init
	pop	ra, sp
	la	a0, Cbitset
	push	a0, sp
	la	a0, Chp
	push	a0, sp
	push	ra, sp
	call	Ckmalloc_init
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	Ckb_init
	pop	ra, sp
	addi	sp, sp, 4
	la	a0, Ctps_store_driver
	push	a0, sp
	la	a0, Ctps_load_driver
	push	a0, sp
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	Cdisk_istall_drivers
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -196
	push	a0, sp
	push	ra, sp
	call	Cfat12_init
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -268
	push	a0, sp
	push	ra, sp
	call	Cfat12_init
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -80
	push	a0, sp
	addi	a0, fp, -196
	push	a0, sp
	push	ra, sp
	call	Cfat12_mount
	pop	ra, sp
	addi	sp, sp, 8
	addi	a0, fp, -96
	push	a0, sp
	addi	a0, fp, -268
	push	a0, sp
	push	ra, sp
	call	Cfat12_mount
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 0
	push	a0, sp
	addi	a0, fp, -196
	push	a0, sp
	push	ra, sp
	call	Cfs_register_fs
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 1
	push	a0, sp
	addi	a0, fp, -268
	push	a0, sp
	push	ra, sp
	call	Cfs_register_fs
	pop	ra, sp
	addi	sp, sp, 8
	la	a0, Ckernel_task
	push	a0, sp
	push	ra, sp
	call	Cmultitasking_init
	pop	ra, sp
	addi	sp, sp, 4
	#bank data
L12:
	#d8	"S"
	#d8	"T"
	#d8	"A"
	#d8	"S"
	#d8	"K"
	#d8	0
	#d8	0
	#d8	0
	#bank text
	la	a0, Canother_task
	push	a0, sp
	li	a0, 15007744
	push	a0, sp
	la	a0, L12
	push	a0, sp
	push	ra, sp
	call	Ccreate_task
	pop	ra, sp
	addi	sp, sp, 12
	ssw	a0, Csubtask, t0
	#bank data
L13:
	#d8	"T"
	#d8	"A"
	#d8	"S"
	#d8	"K"
	#d8	"3"
	#d8	0
	#d8	0
	#d8	0
	#bank text
	la	a0, Cyet_another
	push	a0, sp
	li	a0, 14995456
	push	a0, sp
	la	a0, L13
	push	a0, sp
	push	ra, sp
	call	Ccreate_task
	pop	ra, sp
	addi	sp, sp, 12
	ssw	a0, Ctask3, t0
	push	ra, sp
	call	Cp_ready_tasks
	pop	ra, sp
	push	ra, sp
	call	C_sti
	pop	ra, sp
TLlkmain_l:
	push	ra, sp
	call	Cion_lock_scheduler
	pop	ra, sp
	push	ra, sp
	call	Ctask_schedule
	pop	ra, sp
	push	ra, sp
	call	Cion_unlock_scheduler
	pop	ra, sp
	j	TLlkmain_l
L11:
	addi	sp, sp, 448
	pop	fp, sp
	ret
	#bank data
L14:
	#d32	0
	#bank text
	;#globl	Canother_task
	#align 32
Canother_task:	push	fp, sp
	mv	fp, sp
	push	ra, sp
	call	Cion_unlock_scheduler
	pop	ra, sp
TLlanother_task_l:
	push	ra, sp
	call	Cion_lock_scheduler
	pop	ra, sp
	push	ra, sp
	call	Ctask_schedule
	pop	ra, sp
	push	ra, sp
	call	Cion_unlock_scheduler
	pop	ra, sp
	j	TLlanother_task_l
	li	a0, 0
	j	L15
L15:
	pop	fp, sp
	ret
	;#globl	Cyet_another
	#align 32
Cyet_another:	push	fp, sp
	mv	fp, sp
	push	ra, sp
	call	Cion_unlock_scheduler
	pop	ra, sp
TLlyet_another_l:
	push	ra, sp
	call	Cp_ready_tasks
	pop	ra, sp
	#bank data
L17:
	#d8	"S"
	#d8	"l"
	#d8	"e"
	#d8	"e"
	#d8	"p"
	#d8	"i"
	#d8	"n"
	#d8	"g"
	#d8	10
	#d8	0
	#d8	0
	#d8	0
	#bank text
	la	a0, L17
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 1
	push	a0, sp
	push	ra, sp
	call	Ctask_sleep
	pop	ra, sp
	addi	sp, sp, 4
	#bank data
L18:
	#d8	"W"
	#d8	"o"
	#d8	"k"
	#d8	"e"
	#d8	32
	#d8	"u"
	#d8	"p"
	#d8	10
	#d8	0
	#d8	0
	#d8	0
	#d8	0
	#bank text
	la	a0, L18
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 8
	#bank data
L19:
	#d8	"T"
	#d8	"i"
	#d8	"m"
	#d8	"e"
	#d8	58
	#d8	32
	#d8	37
	#d8	"d"
	#d8	10
	#d8	0
	#d8	0
	#d8	0
	#bank text
	push	ra, sp
	call	Cclock_read_counter
	pop	ra, sp
	push	a0, sp
	la	a0, L19
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 12
	j	TLlyet_another_l
	li	a0, 0
	j	L16
L16:
	pop	fp, sp
	ret
	#bank text
	;#globl	Cclock_gettime
	#align 32
Cclock_gettime:	push	fp, sp
	mv	fp, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 244
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 245
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 246
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 247
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 248
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 249
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 250
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	pop	a1, sp
	sw	a0, 0(a1)
L1ION:
	pop	fp, sp
	ret
	;#globl	Cclock_unix_time
	#align 32
Cclock_unix_time:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 244
	push	a0, sp
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	Csbd
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 244
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 245
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 246
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 247
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 244
	push	a0, sp
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	Csbd
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, -4(fp)
	j	L2ION
L2ION:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cclock_read_counter
	#align 32
Cclock_read_counter:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 248
	push	a0, sp
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	Csbd
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 248
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 249
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 250
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 251
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	j	L3ION
L3ION:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#bank text
	;#globl	Csyscall
	#align 32
Csyscall:	push	fp, sp
	mv	fp, sp
	lw	a0, 8(fp)
	j	L6ION
L7ION:
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_close
	pop	ra, sp
	addi	sp, sp, 4
	j	L4ION
	j	L5ION
L8ION:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_creat
	pop	ra, sp
	addi	sp, sp, 8
	j	L4ION
	j	L5ION
L9ION:
	lw	a0, 20(fp)
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_execve
	pop	ra, sp
	addi	sp, sp, 12
	j	L4ION
	j	L5ION
L10ION:
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_exit
	pop	ra, sp
	addi	sp, sp, 4
	j	L5ION
L11ION:
	push	ra, sp
	call	Csyscall_fork
	pop	ra, sp
	j	L4ION
	j	L5ION
L12ION:
	lw	a0, 20(fp)
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_lseek
	pop	ra, sp
	addi	sp, sp, 12
	j	L4ION
	j	L5ION
L13ION:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_open
	pop	ra, sp
	addi	sp, sp, 8
	j	L4ION
	j	L5ION
L14ION:
	lw	a0, 20(fp)
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_read
	pop	ra, sp
	addi	sp, sp, 12
	j	L4ION
	j	L5ION
L15ION:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_rename
	pop	ra, sp
	addi	sp, sp, 8
	j	L4ION
	j	L5ION
L16ION:
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_sbrk
	pop	ra, sp
	addi	sp, sp, 4
	j	L4ION
	j	L5ION
L17ION:
	push	ra, sp
	call	Csyscall_time
	pop	ra, sp
	j	L4ION
	j	L5ION
L18ION:
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_unlink
	pop	ra, sp
	addi	sp, sp, 4
	j	L4ION
	j	L5ION
L19ION:
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_wait
	pop	ra, sp
	addi	sp, sp, 4
	j	L4ION
	j	L5ION
L20ION:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_write
	pop	ra, sp
	addi	sp, sp, 12
	j	L4ION
	j	L5ION
L21ION:
	li	a0, -200
	j	L4ION
	j	L5ION
	j	L5ION
L6ION:
	la	a1, L22ION
	j	switch
L22ION:
	#d32	14
	#d32	0, L7ION
	#d32	1, L8ION
	#d32	2, L9ION
	#d32	3, L10ION
	#d32	4, L11ION
	#d32	5, L12ION
	#d32	6, L13ION
	#d32	7, L14ION
	#d32	8, L15ION
	#d32	9, L16ION
	#d32	10, L17ION
	#d32	11, L18ION
	#d32	12, L19ION
	#d32	13, L20ION
	#d32	L21ION
L5ION:
L4ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_close
	#align 32
Csyscall_close:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L23ION
L23ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_creat
	#align 32
Csyscall_creat:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L24ION
L24ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_execve
	#align 32
Csyscall_execve:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L25ION
L25ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_fork
	#align 32
Csyscall_fork:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L26ION
L26ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_lseek
	#align 32
Csyscall_lseek:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L27ION
L27ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_open
	#align 32
Csyscall_open:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L28ION
L28ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_read
	#align 32
Csyscall_read:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L29ION
L29ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_rename
	#align 32
Csyscall_rename:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L30ION
L30ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_sbrk
	#align 32
Csyscall_sbrk:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L31ION
L31ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_time
	#align 32
Csyscall_time:	push	fp, sp
	mv	fp, sp
	push	ra, sp
	call	Cclock_unix_time
	pop	ra, sp
	j	L32ION
L32ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_unlink
	#align 32
Csyscall_unlink:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L33ION
L33ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_wait
	#align 32
Csyscall_wait:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L34ION
L34ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_write
	#align 32
Csyscall_write:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L35ION
L35ION:
	pop	fp, sp
	ret
	#bank text
	#align 32
Cupdate_cursor:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	mul	zero, a0, a1, a0
	sw	a0, -4(fp)
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	j	L38ION
L39ION:
L40ION:
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	beqz	a0, L41ION
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
L41ION:
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
L42ION:
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	beqz	a0, L43ION
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	sb	a0, 0(a1)
L43ION:
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	j	L37ION
L44ION:
	j	L37ION
	j	L37ION
L38ION:
	la	a1, L45ION
	j	switch
L45ION:
	#d32	3
	#d32	5, L39ION
	#d32	1, L40ION
	#d32	0, L42ION
	#d32	L44ION
L37ION:
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	sw	a0, 0(a1)
L36ION:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Ctxtmod_clear
	#align 32
Ctxtmod_clear:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	sw	a0, -12(fp)
	li	a0, 0
	sw	a0, -4(fp)
L47ION:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	blt	a1, a0, L51ION
	j	L49ION
L51ION:
	j	L48ION
L50ION:
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -4(fp)
	j	L47ION
L48ION:
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a0, a1, L53ION
	j	L52ION
L53ION:
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 28
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
L52ION:
	j	L50ION
L49ION:
L46ION:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Ctxtmod_scroll
	#align 32
Ctxtmod_scroll:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Ccopy
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 0
	sw	a0, -4(fp)
L55ION:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	blt	a1, a0, L59ION
	j	L57ION
L59ION:
	j	L56ION
L58ION:
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -4(fp)
	j	L55ION
L56ION:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a0, a1, L61ION
	j	L60ION
L61ION:
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 28
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
L60ION:
	j	L58ION
L57ION:
L54ION:
	addi	sp, sp, 8
	pop	fp, sp
	ret
	;#globl	Ctxtmod_clear_update
	#align 32
Ctxtmod_clear_update:	push	fp, sp
	mv	fp, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_clear
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
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
	sb	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cupdate_cursor
	pop	ra, sp
	addi	sp, sp, 4
L62ION:
	pop	fp, sp
	ret
	#bank data
L63ION:
	#d32	0
L64ION:
	#d32	0
	#bank text
	;#globl	Ctxtmod_putc
	#align 32
Ctxtmod_putc:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	sw	a0, -4(fp)
	li	a0, 8
	push	a0, sp
	mv	a0, zero
	lbu	a0, 15(fp)
	pop	a1, sp
	beq	a1, a0, L67ION
	j	L66ION
L67ION:
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
	beqz	a0, L68ION
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sub	a0, a1, a0
	snez	a0, a0
L68ION:
	beqz	a0, L69ION
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	mv	a1, a0
	lbu	a0, 0(a0);notaligned
	lbu	t0, 0(a1)
	subi	t0, t0, 1
	sb	t0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
L69ION:
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	mv	a1, a0
	lbu	a0, 0(a0);notaligned
	lbu	t0, 0(a1)
	subi	t0, t0, 1
	sb	t0, 0(a1)
L66ION:
	li	a0, 9
	push	a0, sp
	mv	a0, zero
	lbu	a0, 15(fp)
	pop	a1, sp
	beq	a1, a0, L71ION
	j	L70ION
L71ION:
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	not	a0, a0
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	j	L72ION
L70ION:
	li	a0, 13
	push	a0, sp
	mv	a0, zero
	lbu	a0, 15(fp)
	pop	a1, sp
	beq	a1, a0, L74ION
	j	L73ION
L74ION:
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	j	L75ION
L73ION:
	li	a0, 10
	push	a0, sp
	mv	a0, zero
	lbu	a0, 15(fp)
	pop	a1, sp
	beq	a1, a0, L77ION
	j	L76ION
L77ION:
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	mv	a1, a0
	lbu	a0, 0(a0);notaligned
	lbu	t0, 0(a1)
	addi	t0, t0, 1
	sb	t0, 0(a1)
	j	L78ION
L76ION:
	mv	a0, zero
	lbu	a0, 15(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	bge	a1, a0, L80ION
	j	L79ION
L80ION:
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	j	L82ION
L83ION:
L84ION:
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
L85ION:
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	mv	a0, zero
	lbu	a0, 15(fp)
	pop	a1, sp
	sb	a0, 0(a1)
	j	L81ION
L86ION:
	j	L81ION
	j	L81ION
L82ION:
	la	a1, L87ION
	j	switch
L87ION:
	#d32	3
	#d32	5, L83ION
	#d32	1, L84ION
	#d32	0, L85ION
	#d32	L86ION
L81ION:
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	mv	a1, a0
	lbu	a0, 0(a0);notaligned
	lbu	t0, 0(a1)
	addi	t0, t0, 1
	sb	t0, 0(a1)
L79ION:
L78ION:
L75ION:
L72ION:
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	bge	a1, a0, L89ION
	j	L88ION
L89ION:
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	mv	a1, a0
	lbu	a0, 0(a0);notaligned
	lbu	t0, 0(a1)
	addi	t0, t0, 1
	sb	t0, 0(a1)
L88ION:
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	bge	a1, a0, L91ION
	j	L90ION
L91ION:
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_scroll
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 64
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 64
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	mv	a1, a0
	lbu	a0, 0(a0);notaligned
	lbu	t0, 0(a1)
	subi	t0, t0, 1
	sb	t0, 0(a1)
L90ION:
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cupdate_cursor
	pop	ra, sp
	addi	sp, sp, 4
L65ION:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Ctxtmod_puts
	#align 32
Ctxtmod_puts:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
L94ION:
	lw	a0, 12(fp)
	lw	t0, 12(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, 12(fp)
	lbu	a0, 0(a0);notaligned
	sb	a0, -1(fp)
	beqz	a0, L93ION
	mv	a0, zero
	lbu	a0, -1(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	j	L94ION
L93ION:
L92ION:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#bank data
	L95ION:	#res 4096
	#bank text
	;#globl	Ctxtmod_printf
	#align 32
Ctxtmod_printf:	push	fp, sp
	mv	fp, sp
	addi	a0, fp, 12
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	shlli	a0, a0, 2
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	la	a0, L95ION
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	C_vformat
	pop	ra, sp
	addi	sp, sp, 20
	la	a0, L95ION
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_puts
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 0
	j	L96ION
L96ION:
	pop	fp, sp
	ret
	#bank text
	;#globl	Caout_load
	#align 32
Caout_load:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -44
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 204
	pop	a1, sp
	bne	a1, a0, L3SYS
	j	L2SYS
L3SYS:
	li	a0, -70
	j	L1SYS
L2SYS:
	addi	a0, fp, -20
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -20
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	llw	a0, Cpaging_ctx
	push	a0, sp
	li	a0, 1
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	addi	a0, fp, -32
	push	a0, sp
	addi	a0, fp, -20
	push	a0, sp
	push	ra, sp
	call	Calloc_pages_contiguous
	pop	ra, sp
	addi	sp, sp, 24
	sw	a0, -8(fp)
	lw	a0, -8(fp)
	beqz	a0, L4SYS
	lw	a0, -8(fp)
	j	L1SYS
L4SYS:
	addi	a0, fp, -32
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
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	addi	a0, fp, -44
	push	a0, sp
	addi	a0, fp, -32
	push	a0, sp
	push	ra, sp
	call	Calloc_pages_contiguous
	pop	ra, sp
	addi	sp, sp, 24
	sw	a0, -8(fp)
	lw	a0, -8(fp)
	beqz	a0, L5SYS
	lw	a0, -8(fp)
	j	L1SYS
L5SYS:
	addi	a0, fp, -44
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 20(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -44
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -44
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
	addi	a0, fp, -44
	push	a0, sp
	push	ra, sp
	call	Calloc_frame
	pop	ra, sp
	addi	sp, sp, 16
	sw	a0, -8(fp)
	lw	a0, -8(fp)
	beqz	a0, L6SYS
	lw	a0, -8(fp)
	j	L1SYS
L6SYS:
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	addi	a0, fp, -20
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cfs_read_file
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -8(fp)
	lw	a0, -8(fp)
	beqz	a0, L7SYS
	lw	a0, -8(fp)
	j	L1SYS
L7SYS:
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	addi	a0, fp, -32
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cfs_read_file
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -8(fp)
	lw	a0, -8(fp)
	beqz	a0, L8SYS
	li	a0, -1
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	sub	a0, a1, a0
	snez	a0, a0
L8SYS:
	beqz	a0, L9SYS
	lw	a0, -8(fp)
	j	L1SYS
L9SYS:
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	j	L1SYS
L1SYS:
	addi	sp, sp, 44
	pop	fp, sp
	ret
	#bank text
	;#globl	Cpanic
	#align 32
Cpanic:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	li	a0, 15011840
	sw	a0, -4(fp)
	li	a0, 0
	sw	a0, -8(fp)
L11SYS:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 4000
	pop	a1, sp
	blt	a1, a0, L15SYS
	j	L13SYS
L15SYS:
	j	L12SYS
L14SYS:
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
	j	L11SYS
L12SYS:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 33
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 1
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 248
	pop	a1, sp
	sb	a0, 0(a1)
	j	L14SYS
L13SYS:
L17SYS:
	li	a0, 1
	beqz	a0, L16SYS
	j	L17SYS
L16SYS:
L10SYS:
	addi	sp, sp, 8
	pop	fp, sp
	ret
	#bank text
	#bank data
	;#globl	Cfilesystems
	Cfilesystems:	#res 104
	;#globl	Cfs_currid
Cfs_currid:	#d32	0
	#bank text
	;#globl	Cfs_next_subpath
	#align 32
Cfs_next_subpath:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	lw	a0, 8(fp)
	sw	a0, -8(fp)
L20SYS:
	lw	a0, 12(fp)
	lw	t0, 12(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, 12(fp)
	lbu	a0, 0(a0);notaligned
	sb	a0, -1(fp)
	beqz	a0, L19SYS
	li	a0, 47
	push	a0, sp
	mv	a0, zero
	lbu	a0, -1(fp)
	pop	a1, sp
	beq	a1, a0, L22SYS
	j	L21SYS
L22SYS:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, 12(fp)
	j	L18SYS
L21SYS:
	lw	a0, -8(fp)
	push	a0, sp
	mv	a0, zero
	lbu	a0, -1(fp)
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	j	L20SYS
L19SYS:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 0
	j	L18SYS
L18SYS:
	addi	sp, sp, 8
	pop	fp, sp
	ret
	;#globl	Cfs_path_and_fname
	#align 32
Cfs_path_and_fname:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cstrlen
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -12(fp)
	lw	a0, -12(fp)
	sw	a0, -8(fp)
L24SYS:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a0, a1, L28SYS
	j	L26SYS
L28SYS:
	j	L25SYS
L27SYS:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	subi	t0, t0, 1; cgdeclw
	sw	t0, -8(fp)
	j	L24SYS
L25SYS:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 47
	pop	a1, sp
	beq	a1, a0, L30SYS
	j	L29SYS
L30SYS:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	j	L23SYS
L29SYS:
	j	L27SYS
L26SYS:
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, 8(fp)
	j	L23SYS
L23SYS:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cfs_fname_from_path
	#align 32
Cfs_fname_from_path:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cstrlen
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -8(fp)
	lw	a0, -8(fp)
	sw	a0, -4(fp)
L32SYS:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a0, a1, L36SYS
	j	L34SYS
L36SYS:
	j	L33SYS
L35SYS:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	subi	t0, t0, 1; cgdeclw
	sw	t0, -4(fp)
	j	L32SYS
L33SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 47
	pop	a1, sp
	beq	a1, a0, L38SYS
	j	L37SYS
L38SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	j	L31SYS
L37SYS:
	j	L35SYS
L34SYS:
	lw	a0, 8(fp)
	j	L31SYS
L31SYS:
	addi	sp, sp, 8
	pop	fp, sp
	ret
	;#globl	Cfs_open_file
	#align 32
Cfs_open_file:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -16
	lw	a0, 12(fp)
	beqz	a0, L40SYS
	li	a0, 0
	sw	a0, -4(fp)
	lw	a0, 12(fp)
	sw	a0, -8(fp)
	li	a0, 1
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	beq	a1, a0, L42SYS
	j	L41SYS
L42SYS:
	lw	a0, 12(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
L41SYS:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -16(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L44SYS
	j	L43SYS
L44SYS:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, -42
	j	L39SYS
	j	L45SYS
L43SYS:
	lw	a0, -16(fp)
	beqz	a0, L46SYS
	li	a0, 44
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 12(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 16
	sw	a0, -12(fp)
	lw	a0, -12(fp)
	beqz	a0, L47SYS
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, -12(fp)
	j	L39SYS
L47SYS:
	lw	a0, 16(fp)
	j	L49SYS
L50SYS:
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 524288
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	j	L48SYS
L51SYS:
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 262144
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L52SYS:
	j	L48SYS
L53SYS:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, -54
	j	L39SYS
	j	L48SYS
	j	L48SYS
L49SYS:
	la	a1, L54SYS
	j	switch
L54SYS:
	#d32	3
	#d32	0, L50SYS
	#d32	1, L51SYS
	#d32	2, L52SYS
	#d32	L53SYS
L48SYS:
	#bank data
L55SYS:
	#d8	"O"
	#d8	"p"
	#d8	"e"
	#d8	"n"
	#d8	"i"
	#d8	"n"
	#d8	"g"
	#d8	32
	#d8	"f"
	#d8	"i"
	#d8	"l"
	#d8	"e"
	#d8	32
	#d8	37
	#d8	"s"
	#d8	44
	#d8	32
	#d8	"w"
	#d8	"i"
	#d8	"t"
	#d8	"h"
	#d8	32
	#d8	"f"
	#d8	"l"
	#d8	"a"
	#d8	"g"
	#d8	"s"
	#d8	32
	#d8	91
	#d8	37
	#d8	"p"
	#d8	93
	#d8	10
	#d8	0
	#d8	0
	#d8	0
	#bank text
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	la	a0, L55SYS
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 16
	j	L56SYS
L46SYS:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, -41
	j	L39SYS
L56SYS:
L45SYS:
	j	L57SYS
L40SYS:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, -40
	j	L39SYS
L57SYS:
L39SYS:
	addi	sp, sp, 16
	pop	fp, sp
	ret
	;#globl	Cfs_read_file
	#align 32
Cfs_read_file:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L60SYS
	j	L59SYS
L60SYS:
	li	a0, -44
	j	L58SYS
L59SYS:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L62SYS
	j	L61SYS
L62SYS:
	li	a0, -41
	j	L58SYS
L61SYS:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L64SYS
	j	L63SYS
L64SYS:
	li	a0, -53
	j	L58SYS
L63SYS:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 12(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 16
	j	L58SYS
L58SYS:
	pop	fp, sp
	ret
	;#globl	Cfs_write_file
	#align 32
Cfs_write_file:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L67SYS
	j	L66SYS
L67SYS:
	li	a0, -44
	j	L65SYS
L66SYS:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L69SYS
	j	L68SYS
L69SYS:
	li	a0, -41
	j	L65SYS
L68SYS:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L71SYS
	j	L70SYS
L71SYS:
	li	a0, -53
	j	L65SYS
L70SYS:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 36
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 12(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 16
	j	L65SYS
L65SYS:
	pop	fp, sp
	ret
	;#globl	Cfs_close_file
	#align 32
Cfs_close_file:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L74SYS
	j	L73SYS
L74SYS:
	li	a0, -44
	j	L72SYS
L73SYS:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L76SYS
	j	L75SYS
L76SYS:
	li	a0, -41
	j	L72SYS
L75SYS:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L78SYS
	j	L77SYS
L78SYS:
	li	a0, -53
	j	L72SYS
L77SYS:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 4(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 8
	j	L72SYS
L72SYS:
	pop	fp, sp
	ret
	;#globl	Cfs_create_file
	#align 32
Cfs_create_file:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L81SYS
	j	L80SYS
L81SYS:
	li	a0, -40
	j	L79SYS
L80SYS:
	li	a0, 0
	sw	a0, -4(fp)
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	beq	a1, a0, L83SYS
	j	L82SYS
L83SYS:
	lw	a0, 8(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
L82SYS:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -12(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L85SYS
	j	L84SYS
L85SYS:
	li	a0, -42
	j	L79SYS
	j	L86SYS
L84SYS:
	li	a0, 0
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	beq	a1, a0, L88SYS
	j	L87SYS
L88SYS:
	li	a0, -43
	j	L79SYS
L87SYS:
L86SYS:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, 12(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 16
	j	L79SYS
L79SYS:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cfs_delete_file
	#align 32
Cfs_delete_file:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L91SYS
	j	L90SYS
L91SYS:
	li	a0, -40
	j	L89SYS
L90SYS:
	li	a0, 0
	sw	a0, -4(fp)
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	beq	a1, a0, L93SYS
	j	L92SYS
L93SYS:
	lw	a0, 8(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
L92SYS:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -12(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L95SYS
	j	L94SYS
L95SYS:
	li	a0, -42
	j	L89SYS
	j	L96SYS
L94SYS:
	li	a0, 0
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	beq	a1, a0, L98SYS
	j	L97SYS
L98SYS:
	li	a0, -43
	j	L89SYS
L97SYS:
L96SYS:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, 8(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 12
	j	L89SYS
L89SYS:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cfs_create_dir
	#align 32
Cfs_create_dir:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L101SYS
	j	L100SYS
L101SYS:
	li	a0, -40
	j	L99SYS
L100SYS:
	li	a0, 0
	sw	a0, -4(fp)
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	beq	a1, a0, L103SYS
	j	L102SYS
L103SYS:
	lw	a0, 8(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
L102SYS:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -12(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L105SYS
	j	L104SYS
L105SYS:
	li	a0, -42
	j	L99SYS
	j	L106SYS
L104SYS:
	li	a0, 0
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	beq	a1, a0, L108SYS
	j	L107SYS
L108SYS:
	li	a0, -43
	j	L99SYS
L107SYS:
L106SYS:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 20
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, 8(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 12
	j	L99SYS
L99SYS:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cfs_delete_dir
	#align 32
Cfs_delete_dir:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L111SYS
	j	L110SYS
L111SYS:
	li	a0, -40
	j	L109SYS
L110SYS:
	li	a0, 0
	sw	a0, -4(fp)
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	beq	a1, a0, L113SYS
	j	L112SYS
L113SYS:
	lw	a0, 8(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
L112SYS:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -12(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L115SYS
	j	L114SYS
L115SYS:
	li	a0, -42
	j	L109SYS
	j	L116SYS
L114SYS:
	li	a0, 0
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	beq	a1, a0, L118SYS
	j	L117SYS
L118SYS:
	li	a0, -43
	j	L109SYS
L117SYS:
L116SYS:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, 8(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 12
	j	L109SYS
L109SYS:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cfs_rename
	#align 32
Cfs_rename:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
	bnez	a0, L120SYS
	li	a0, 0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
L120SYS:
	beqz	a0, L121SYS
	li	a0, -40
	j	L119SYS
L121SYS:
	li	a0, 0
	sw	a0, -4(fp)
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
	bnez	a0, L122SYS
	li	a0, 1
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
L122SYS:
	beqz	a0, L123SYS
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
	beqz	a0, L124SYS
	li	a0, 1
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
	beqz	a0, L124SYS
	lw	a0, 8(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	lw	a0, 12(fp)
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sub	a0, a1, a0
	snez	a0, a0
L124SYS:
	beqz	a0, L125SYS
	li	a0, -58
	j	L119SYS
L125SYS:
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	beq	a1, a0, L128SYS
	j	L126SYS
L128SYS:
	lw	a0, 8(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	j	L127SYS
L126SYS:
	lw	a0, 12(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
L127SYS:
	sw	a0, -4(fp)
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
L123SYS:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -12(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L130SYS
	j	L129SYS
L130SYS:
	li	a0, -42
	j	L119SYS
	j	L131SYS
L129SYS:
	li	a0, 0
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	beq	a1, a0, L133SYS
	j	L132SYS
L133SYS:
	li	a0, -43
	j	L119SYS
L132SYS:
L131SYS:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 28
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, 12(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 16
	j	L119SYS
L119SYS:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cfs_lseek
	#align 32
Cfs_lseek:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L136SYS
	j	L135SYS
L136SYS:
	li	a0, -44
	j	L134SYS
L135SYS:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L138SYS
	j	L137SYS
L138SYS:
	li	a0, -41
	j	L134SYS
L137SYS:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 48
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 4(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 8
	j	L134SYS
L134SYS:
	pop	fp, sp
	ret
	;#globl	Cfs_rewind
	#align 32
Cfs_rewind:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L141SYS
	j	L140SYS
L141SYS:
	li	a0, -44
	j	L139SYS
L140SYS:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L143SYS
	j	L142SYS
L143SYS:
	li	a0, -41
	j	L139SYS
L142SYS:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L145SYS
	j	L144SYS
L145SYS:
	li	a0, -53
	j	L139SYS
L144SYS:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 48
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 12(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 16
	j	L139SYS
L139SYS:
	pop	fp, sp
	ret
	;#globl	Cfs_register_fs
	#align 32
Cfs_register_fs:	push	fp, sp
	mv	fp, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L148SYS
	j	L147SYS
L148SYS:
	li	a0, -42
	j	L146SYS
L147SYS:
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L150SYS
	j	L149SYS
L150SYS:
	li	a0, -43
	j	L146SYS
L149SYS:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, 12(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	j	L146SYS
L146SYS:
	pop	fp, sp
	ret
	;#globl	Cfs_unregister_fs
	#align 32
Cfs_unregister_fs:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L153SYS
	j	L152SYS
L153SYS:
	li	a0, -43
	j	L151SYS
L152SYS:
	li	a0, 0
	sw	a0, -4(fp)
L154SYS:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	blt	a1, a0, L158SYS
	j	L156SYS
L158SYS:
	j	L155SYS
L157SYS:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L154SYS
L155SYS:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L160SYS
	j	L159SYS
L160SYS:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
L159SYS:
	j	L157SYS
L156SYS:
	li	a0, 0
	j	L151SYS
L151SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cfs_unregister_fs_byid
	#align 32
Cfs_unregister_fs_byid:	push	fp, sp
	mv	fp, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L163SYS
	j	L162SYS
L163SYS:
	li	a0, -42
	j	L161SYS
L162SYS:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, 8(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	j	L161SYS
L161SYS:
	pop	fp, sp
	ret
	#bank text
	#bank data
	;#globl	Cinterrupt_handlers
	Cinterrupt_handlers:	#res 1024
Ctimes:	#d32	0
	#bank text
	;#globl	Cisr_handler
	#align 32
Cisr_handler:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	la	a0, Cinterrupt_handlers
	push	a0, sp
	lw	a0, 8(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
L164SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cirq_handler
	#align 32
Cirq_handler:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	la	a0, Cinterrupt_handlers
	push	a0, sp
	lw	a0, 8(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
L165SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cregister_interrupt_handler
	#align 32
Cregister_interrupt_handler:	push	fp, sp
	mv	fp, sp
	la	a0, Cinterrupt_handlers
	push	a0, sp
	lw	a0, 8(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	sw	a0, 0(a1)
L166SYS:
	pop	fp, sp
	ret
	#bank text
	#bank data
	Ckheap:	#res 28
	Ckmalloc_bitset:	#res 4
	;#globl	Ckmalloc_err
Ckmalloc_err:	#d32	0
	;#globl	C_arena
C_arena:	#d32	0
	;#globl	C_asize
C_asize:	#d32	0
Cfreep:	#d32	0
	#bank text
	;#globl	Ckmalloc_init
	#align 32
Ckmalloc_init:	push	fp, sp
	mv	fp, sp
	la	a0, Ckheap
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Ckheap
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 2
	push	a0, sp
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Ckheap
	push	a0, sp
	push	ra, sp
	call	Calloc_pages_contiguous
	pop	ra, sp
	addi	sp, sp, 24
	ssw	a0, Ckmalloc_err, t0
	lw	a0, 12(fp)
	ssw	a0, Ckmalloc_bitset, t0
	la	a0, Ckheap
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	ssw	a0, C_arena, t0
	li	a0, 2048
	ssw	a0, C_asize, t0
	llw	a0, C_arena
	push	a0, sp
	llw	a0, C_asize
	pop	a1, sp
	sw	a0, 0(a1)
	llw	a0, C_arena
	ssw	a0, Cfreep, t0
	llw	a0, Ckmalloc_err
	j	L167SYS
L167SYS:
	pop	fp, sp
	ret
	#align 32
Cdefrag:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	llw	a0, C_asize
	push	a0, sp
	llw	a0, C_arena
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	sw	a0, -12(fp)
	llw	a0, C_arena
	sw	a0, -4(fp)
L169SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	bltu	a1, a0, L173SYS
	j	L171SYS
L173SYS:
	j	L170SYS
L172SYS:
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	push	ra, sp
	call	Cabs
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	sw	a0, -4(fp)
	j	L169SYS
L170SYS:
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a0, a1, L175SYS
	j	L174SYS
L175SYS:
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	sw	a0, -8(fp)
L176SYS:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	sltu	a0, a1, a0
	beqz	a0, L180SYS
	lw	a0, -8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sgt	a0, a1, a0
L180SYS:
	beqz	a0, L178SYS
	j	L177SYS
L179SYS:
	lw	a0, -8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	sw	a0, -8(fp)
	j	L176SYS
L177SYS:
	j	L179SYS
L178SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	shrli	a0, a0, 2
	pop	a1, sp
	sw	a0, 0(a1)
L174SYS:
	j	L172SYS
L171SYS:
L168SYS:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Ckmalloc
	#align 32
Ckmalloc:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -36
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, 8(fp)
	llw	a0, C_arena
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L183SYS
	j	L182SYS
L183SYS:
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 128
	pop	a1, sp
	bge	a1, a0, L185SYS
	j	L184SYS
L185SYS:
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	ssw	a0, C_asize, t0
	j	L186SYS
L184SYS:
	li	a0, 10
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	ssw	a0, C_asize, t0
L186SYS:
	li	a0, 4
	push	a0, sp
	llw	a0, C_asize
	pop	a1, sp
	mul	zero, a0, a1, a0
	sw	a0, -24(fp)
	li	a0, 4095
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, -4096
	pop	a1, sp
	and	a0, a0, a1
	sw	a0, -24(fp)
	li	a0, 431766
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	llw	a0, Ckmalloc_bitset
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	addi	a0, fp, -36
	push	a0, sp
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Calloc_pages_contiguous
	pop	ra, sp
	addi	sp, sp, 24
	ssw	a0, Ckmalloc_err, t0
	beqz	a0, L187SYS
	li	a0, 0
	j	L181SYS
L187SYS:
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -36
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -36
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -36
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -36
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -36
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	ssw	a0, C_arena, t0
	llw	a0, C_arena
	push	a0, sp
	llw	a0, C_asize
	pop	a1, sp
	sw	a0, 0(a1)
	llw	a0, C_arena
	ssw	a0, Cfreep, t0
L182SYS:
	li	a0, 0
	sw	a0, -20(fp)
L188SYS:
	lw	a0, -20(fp)
	push	a0, sp
	li	a0, 3
	pop	a1, sp
	blt	a1, a0, L192SYS
	j	L190SYS
L192SYS:
	j	L189SYS
L191SYS:
	lw	a0, -20(fp)
	lw	t0, -20(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -20(fp)
	j	L188SYS
L189SYS:
	llw	a0, C_asize
	push	a0, sp
	llw	a0, C_arena
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	sw	a0, -8(fp)
	llw	a0, Cfreep
	sw	a0, -4(fp)
L193SYS:
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	blt	a0, a1, L197SYS
	j	L196SYS
L197SYS:
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	pop	a1, sp
	beq	a1, a0, L199SYS
	j	L198SYS
L199SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	neg	a0, a0
	pop	a1, sp
	sw	a0, 0(a1)
	j	L200SYS
L198SYS:
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	sw	a0, -12(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	neg	a0, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	shlli	a0, a0, 2
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L200SYS:
	lw	a0, -4(fp)
	ssw	a0, Cfreep, t0
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	j	L181SYS
L196SYS:
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	push	ra, sp
	call	Cabs
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	sw	a0, -4(fp)
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	beq	a1, a0, L202SYS
	j	L201SYS
L202SYS:
	llw	a0, C_arena
	sw	a0, -4(fp)
L201SYS:
	lw	a0, -4(fp)
	push	a0, sp
	llw	a0, C_arena
	pop	a1, sp
	sltu	a0, a1, a0
	bnez	a0, L203SYS
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	sltu	a0, a1, a0
	seqz	a0, a0
	bnez	a0, L203SYS
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
L203SYS:
	beqz	a0, L204SYS
	li	a0, -20
	ssw	a0, Ckmalloc_err, t0
	li	a0, 0
	j	L181SYS
L204SYS:
L195SYS:
	llw	a0, Cfreep
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	beq	a1, a0, L205SYS
	j	L193SYS
L205SYS:
L194SYS:
	lw	a0, -20(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L207SYS
	j	L206SYS
L207SYS:
	push	ra, sp
	call	Cdefrag
	pop	ra, sp
	j	L208SYS
L206SYS:
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 128
	pop	a1, sp
	bge	a1, a0, L210SYS
	j	L209SYS
L210SYS:
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -16(fp)
	j	L211SYS
L209SYS:
	li	a0, 10
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	sw	a0, -16(fp)
L211SYS:
	li	a0, 4
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	sw	a0, -24(fp)
	li	a0, 4095
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, -4096
	pop	a1, sp
	and	a0, a0, a1
	sw	a0, -24(fp)
	li	a0, 497559
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	llw	a0, Ckmalloc_bitset
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	addi	a0, fp, -36
	push	a0, sp
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Calloc_pages_contiguous
	pop	ra, sp
	addi	sp, sp, 24
	ssw	a0, Ckmalloc_err, t0
	beqz	a0, L212SYS
	li	a0, 0
	j	L181SYS
L212SYS:
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -36
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -36
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -36
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -36
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	llw	a0, C_asize
	sw	a0, -12(fp)
	lw	a0, -16(fp)
	push	a0, sp
	llw	a0, C_asize
	pop	a1, sp
	add	a0, a1, a0
	ssw	a0, C_asize, t0
	lw	a0, -8(fp)
	push	a0, sp
	llw	a0, C_asize
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L208SYS:
	j	L191SYS
L190SYS:
	li	a0, -10
	ssw	a0, Ckmalloc_err, t0
	li	a0, 0
	j	L181SYS
L181SYS:
	addi	sp, sp, 36
	pop	fp, sp
	ret
	;#globl	Ckfree
	#align 32
Ckfree:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L215SYS
	j	L214SYS
L215SYS:
	li	a0, 0
	j	L213SYS
L214SYS:
	lw	a0, 8(fp)
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	llw	a0, C_arena
	pop	a1, sp
	sltu	a0, a1, a0
	bnez	a0, L216SYS
	llw	a0, C_asize
	push	a0, sp
	llw	a0, C_arena
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	sltu	a0, a1, a0
	bnez	a0, L216SYS
	li	a0, -4
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	slt	a0, a1, a0
	seqz	a0, a0
L216SYS:
	beqz	a0, L217SYS
	li	a0, -21
	ssw	a0, Ckmalloc_err, t0
	li	a0, -21
	j	L213SYS
L217SYS:
	lw	t0, -4(fp)
	subi	t0, t0, 4 ;cgdecpl
	sw	t0, -4(fp)
	lw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	neg	a0, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	j	L213SYS
L213SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Ckmalloc_e
	#align 32
Ckmalloc_e:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ckmalloc
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -4(fp)
	lw	a0, 12(fp)
	push	a0, sp
	llw	a0, Ckmalloc_err
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, -4(fp)
	j	L218SYS
L218SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Ckfree_e
	#align 32
Ckfree_e:	push	fp, sp
	mv	fp, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, 12(fp)
	push	a0, sp
	llw	a0, Ckmalloc_err
	pop	a1, sp
	sw	a0, 0(a1)
L219SYS:
	pop	fp, sp
	ret
	#bank text
	#bank data
	;#globl	Cprogram_entry
Cprogram_entry:	#d32	0
	;#globl	Cprogram_stack
Cprogram_stack:	#d32	0
	;#globl	Cion_reentry
Cion_reentry:	#d32	0
	L220SYS:	#res 32
	#bank text
	;#globl	Cloader_load
	#align 32
Cloader_load:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	li	a0, 32
	push	a0, sp
	la	a0, L220SYS
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfs_read_file
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L222SYS
	lw	a0, -4(fp)
	j	L221SYS
L222SYS:
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfs_rewind
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L223SYS
	lw	a0, -4(fp)
	j	L221SYS
L223SYS:
	la	a0, L220SYS
	lw	a0, 0(a0)
	j	L225SYS
L226SYS:
	li	a0, 15007744
	push	a0, sp
	li	a0, 4096
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	la	a0, L220SYS
	push	a0, sp
	push	ra, sp
	call	Caout_load
	pop	ra, sp
	addi	sp, sp, 16
	sw	a0, -8(fp)
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L228SYS
	j	L227SYS
L228SYS:
	lw	a0, -8(fp)
	j	L221SYS
L227SYS:
	lw	a0, -8(fp)
	ssw	a0, Cprogram_entry, t0
	li	a0, 15011840
	ssw	a0, Cprogram_stack, t0
	li	a0, 0
	j	L221SYS
	j	L224SYS
L229SYS:
	li	a0, -70
	j	L221SYS
	j	L224SYS
	j	L224SYS
L225SYS:
	la	a1, L230SYS
	j	switch
L230SYS:
	#d32	1
	#d32	204, L226SYS
	#d32	L229SYS
L224SYS:
L221SYS:
	addi	sp, sp, 8
	pop	fp, sp
	ret
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
	j	L231SYS
L231SYS:
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
	beq	a1, a0, L234SYS
	j	L233SYS
L234SYS:
	li	a0, 0
	push	a0, sp
	llw	a0, Cion_task_postponed_flag
	pop	a1, sp
	bne	a1, a0, L236SYS
	j	L235SYS
L236SYS:
	li	a0, 0
	ssw	a0, Cion_task_postponed_flag, t0
	push	ra, sp
	call	Ctask_schedule
	pop	ra, sp
L235SYS:
L233SYS:
	push	ra, sp
	call	C_interrupt_enable
	pop	ra, sp
	j	L232SYS
L232SYS:
	pop	fp, sp
	ret
	#bank text
	#bank data
	;#globl	Cpaging_ctx
	Cpaging_ctx:	#res 4
	;#globl	Cpaging_currpt
Cpaging_currpt:	#d32	0
	#bank text
	#align 32
Cset_frame:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -8(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	exch	a0, a1
	idiv	zero, a0, a0, a1
	sw	a0, -12(fp)
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L237SYS:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	#align 32
Cclear_frame:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -8(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	exch	a0, a1
	idiv	zero, a0, a0, a1
	sw	a0, -12(fp)
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	not	a0, a0
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L238SYS:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	#align 32
Ctest_frame:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -8(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	exch	a0, a1
	idiv	zero, a0, a0, a1
	sw	a0, -12(fp)
	li	a0, 4
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	and	a0, a0, a1
	j	L239SYS
L239SYS:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	#align 32
Cfirst_frame:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	li	a0, 0
	sw	a0, -4(fp)
L241SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	blt	a1, a0, L245SYS
	j	L243SYS
L245SYS:
	j	L242SYS
L244SYS:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L241SYS
L242SYS:
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, -1
	pop	a1, sp
	bne	a1, a0, L247SYS
	j	L246SYS
L247SYS:
	li	a0, 0
	sw	a0, -8(fp)
L248SYS:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	blt	a1, a0, L252SYS
	j	L250SYS
L252SYS:
	j	L249SYS
L251SYS:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	j	L248SYS
L249SYS:
	li	a0, 1
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	sw	a0, -12(fp)
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	and	a0, a0, a1
	bnez	a0, L253SYS
	li	a0, 4
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	j	L240SYS
L253SYS:
	j	L251SYS
L250SYS:
L246SYS:
	j	L244SYS
L243SYS:
L240SYS:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Calloc_pages_contiguous
	#align 32
Calloc_pages_contiguous:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	li	a0, 4
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	sw	a0, -4(fp)
L255SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	blt	a1, a0, L259SYS
	j	L257SYS
L259SYS:
	j	L256SYS
L258SYS:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L255SYS
L256SYS:
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 28(fp)
	push	a0, sp
	lw	a0, 24(fp)
	push	a0, sp
	lw	a0, 20(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Calloc_frame
	pop	ra, sp
	addi	sp, sp, 16
	sw	a0, -8(fp)
	beqz	a0, L260SYS
	lw	a0, -8(fp)
	j	L254SYS
L260SYS:
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 4096
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	j	L258SYS
L257SYS:
	li	a0, 0
	j	L254SYS
L254SYS:
	addi	sp, sp, 8
	pop	fp, sp
	ret
	;#globl	Crelease_pages_contiguous
	#align 32
Crelease_pages_contiguous:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 0
	sw	a0, -4(fp)
L262SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	blt	a1, a0, L266SYS
	j	L264SYS
L266SYS:
	j	L263SYS
L265SYS:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L262SYS
L263SYS:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfree_frame
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 4096
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	j	L265SYS
L264SYS:
L261SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Calloc_frame
	#align 32
Calloc_frame:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	bne	a1, a0, L269SYS
	j	L268SYS
L269SYS:
	li	a0, 0
	j	L267SYS
	j	L270SYS
L268SYS:
	lw	a0, 20(fp)
	push	a0, sp
	push	ra, sp
	call	Cfirst_frame
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -4(fp)
	li	a0, -1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	beq	a1, a0, L272SYS
	j	L271SYS
L272SYS:
	li	a0, -10
	j	L267SYS
L271SYS:
	lw	a0, 20(fp)
	push	a0, sp
	li	a0, 4096
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cset_frame
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 12(fp)
	beqz	a0, L273SYS
	li	a0, 2
	j	L274SYS
L273SYS:
	li	a0, 0
L274SYS:
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 16(fp)
	beqz	a0, L275SYS
	li	a0, 1
	j	L276SYS
L275SYS:
	li	a0, 0
L276SYS:
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 4096
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	llw	a0, Cpaging_currpt
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	push	ra, sp
	call	Cmmu_map
	pop	ra, sp
	addi	sp, sp, 16
L270SYS:
	li	a0, 0
	j	L267SYS
L267SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cfree_frame
	#align 32
Cfree_frame:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	seqz	a0, a0
	sw	a0, -4(fp)
	beqz	a0, L278SYS
	j	L277SYS
	j	L279SYS
L278SYS:
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cclear_frame
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	llw	a0, Cpaging_currpt
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cmmu_unmap
	pop	ra, sp
	addi	sp, sp, 8
L279SYS:
L277SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cpage_fault_handler
	#align 32
Cpage_fault_handler:	push	fp, sp
	mv	fp, sp
	#bank data
L281SYS:
	#d8	"P"
	#d8	"a"
	#d8	"g"
	#d8	"e"
	#d8	32
	#d8	"F"
	#d8	"a"
	#d8	"u"
	#d8	"l"
	#d8	"t"
	#d8	0
	#d8	0
	#bank text
	la	a0, L281SYS
	push	a0, sp
	push	ra, sp
	call	Cpanic
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -2
	j	L280SYS
L280SYS:
	pop	fp, sp
	ret
	;#globl	Cpaging_init
	#align 32
Cpaging_init:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 8(fp)
	ssw	a0, Cpaging_ctx, t0
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cmemset
	pop	ra, sp
	addi	sp, sp, 12
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	Cset_frame
	pop	ra, sp
	addi	sp, sp, 8
	llw	a0, Cpaging_currpt
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	Cmmu_map
	pop	ra, sp
	addi	sp, sp, 16
	llw	a0, CKernelPhys
	sw	a0, -4(fp)
L284SYS:
	lw	a0, -4(fp)
	push	a0, sp
	llw	a0, CKernelEnd
	pop	a1, sp
	blt	a1, a0, L285SYS
	j	L283SYS
L285SYS:
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 16777215
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	and	a0, a0, a1
	push	a0, sp
	push	ra, sp
	call	Cset_frame
	pop	ra, sp
	addi	sp, sp, 8
	llw	a0, Cpaging_currpt
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cmmu_map
	pop	ra, sp
	addi	sp, sp, 16
	li	a0, 4096
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -4(fp)
	j	L284SYS
L283SYS:
	li	a0, 15011840
	sw	a0, -4(fp)
L287SYS:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 15327232
	pop	a1, sp
	blt	a1, a0, L288SYS
	j	L286SYS
L288SYS:
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 16777215
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	and	a0, a0, a1
	push	a0, sp
	push	ra, sp
	call	Cset_frame
	pop	ra, sp
	addi	sp, sp, 8
	llw	a0, Cpaging_currpt
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cmmu_map
	pop	ra, sp
	addi	sp, sp, 16
	li	a0, 4096
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -4(fp)
	j	L287SYS
L286SYS:
	la	a0, Cpage_fault_handler
	push	a0, sp
	li	a0, 7
	push	a0, sp
	push	ra, sp
	call	Cregister_interrupt_handler
	pop	ra, sp
	addi	sp, sp, 8
	llw	a0, Cprotected_entry
	push	a0, sp
	push	ra, sp
	call	C_mmu_enable
	pop	ra, sp
	addi	sp, sp, 4
L282SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#bank text
	;#globl	Cringbuff_push
	#align 32
Cringbuff_push:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	bge	a1, a0, L291SYS
	j	L290SYS
L291SYS:
	li	a0, 0
	sw	a0, -4(fp)
L290SYS:
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	beq	a1, a0, L293SYS
	j	L292SYS
L293SYS:
	li	a0, -100
	j	L289SYS
L292SYS:
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Ccopy
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	j	L289SYS
L289SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cringbuff_pop
	#align 32
Cringbuff_pop:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	beq	a1, a0, L296SYS
	j	L295SYS
L296SYS:
	li	a0, -101
	j	L294SYS
L295SYS:
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	bge	a1, a0, L298SYS
	j	L297SYS
L298SYS:
	li	a0, 0
	sw	a0, -4(fp)
L297SYS:
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Ccopy
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	j	L294SYS
L294SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
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
	bnez	a0, L300SYS
	j	L299SYS
L300SYS:
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
	beq	a1, a0, L302SYS
	j	L301SYS
L302SYS:
	lw	a0, 8(fp)
	ssw	a0, Cion_last_ready_task, t0
	ssw	a0, Cion_first_ready_task, t0
	j	L303SYS
L301SYS:
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
L303SYS:
	j	L299SYS
L299SYS:
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
	j	L304SYS
L304SYS:
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
	j	L305SYS
L305SYS:
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
	beq	a1, a0, L308SYS
	j	L307SYS
L308SYS:
	li	a0, -80
	j	L306SYS
L307SYS:
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
L309SYS:
	#d8	"K"
	#d8	"E"
	#d8	"R"
	#d8	"N"
	#d8	"E"
	#d8	"L"
	#d8	0
	#d8	0
	#bank text
	la	a0, L309SYS
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
	j	L306SYS
L306SYS:
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
	j	L310SYS
L310SYS:
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
	bne	a1, a0, L313SYS
	j	L312SYS
L313SYS:
	li	a0, 1
	ssw	a0, Cion_task_postponed_flag, t0
	li	a0, 0
	j	L311SYS
L312SYS:
	llw	a0, Cion_first_ready_task
	beqz	a0, L314SYS
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
	j	L315SYS
L314SYS:
	li	a0, -81
	j	L311SYS
L315SYS:
	li	a0, 0
	j	L311SYS
L311SYS:
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
	beq	a1, a0, L318SYS
	j	L317SYS
L318SYS:
	#bank data
L319SYS:
	#d8	"e"
	#d8	"m"
	#d8	"p"
	#d8	"t"
	#d8	"y"
	#d8	93
	#d8	0
	#d8	0
	#bank text
	la	a0, L319SYS
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_puts
	pop	ra, sp
	addi	sp, sp, 8
	j	L316SYS
L317SYS:
L321SYS:
	lw	a0, -4(fp)
	beqz	a0, L320SYS
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
	j	L321SYS
L320SYS:
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
	j	L316SYS
L316SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#align 32
Cprint_task_name:	push	fp, sp
	mv	fp, sp
	#bank data
L323SYS:
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
	la	a0, L323SYS
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 0
	j	L322SYS
L322SYS:
	pop	fp, sp
	ret
	;#globl	Cp_ready_tasks
	#align 32
Cp_ready_tasks:	push	fp, sp
	mv	fp, sp
	#bank data
L325SYS:
	#d8	"R"
	#d8	"e"
	#d8	"a"
	#d8	"d"
	#d8	"y"
	#d8	58
	#d8	32
	#d8	0
	#bank text
	la	a0, L325SYS
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
	j	L324SYS
L324SYS:
	pop	fp, sp
	ret
	;#globl	Cp_sleeping_tasks
	#align 32
Cp_sleeping_tasks:	push	fp, sp
	mv	fp, sp
	#bank data
L327SYS:
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
	la	a0, L327SYS
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
	j	L326SYS
L326SYS:
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
	j	L328SYS
L328SYS:
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
	beq	a1, a0, L331SYS
	j	L330SYS
L331SYS:
	j	L329SYS
L330SYS:
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
	j	L329SYS
L329SYS:
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
	beq	a1, a0, L334SYS
	j	L333SYS
L334SYS:
	li	a0, -80
	j	L332SYS
L333SYS:
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
	j	L332SYS
L332SYS:
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
	beq	a1, a0, L337SYS
	j	L336SYS
L337SYS:
	li	a0, -80
	j	L335SYS
L336SYS:
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
	j	L335SYS
L335SYS:
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
	beq	a1, a0, L340SYS
	j	L339SYS
L340SYS:
	j	L338SYS
L339SYS:
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
L338SYS:
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
	beq	a1, a0, L343SYS
	j	L342SYS
L343SYS:
	j	L341SYS
L342SYS:
	push	ra, sp
	call	Cion_lock_scheduler
	pop	ra, sp
	li	a0, 0
	push	a0, sp
	llw	a0, Cion_first_ready_task
	pop	a1, sp
	beq	a1, a0, L345SYS
	j	L344SYS
L345SYS:
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
	j	L346SYS
L344SYS:
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
L346SYS:
	push	ra, sp
	call	Cion_unlock_scheduler
	pop	ra, sp
L341SYS:
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
	blt	a1, a0, L349SYS
	j	L348SYS
L349SYS:
	push	ra, sp
	call	Cion_unlock_scheduler
	pop	ra, sp
	j	L347SYS
L348SYS:
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
L347SYS:
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
L350SYS:
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
L351SYS:
	pop	fp, sp
	ret
	#bank text
	#bank data
	Cdisk_read_drivers:	#res 1024
	Cdisk_write_drivers:	#res 1024
	#bank text
	;#globl	Cdisk_istall_drivers
	#align 32
Cdisk_istall_drivers:	push	fp, sp
	mv	fp, sp
	la	a0, Cdisk_read_drivers
	push	a0, sp
	lw	a0, 8(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Cdisk_write_drivers
	push	a0, sp
	lw	a0, 8(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	sw	a0, 0(a1)
L1DEV:
	pop	fp, sp
	ret
	;#globl	Cdisk_load_sector
	#align 32
Cdisk_load_sector:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	bge	a1, a0, L4DEV
	j	L3DEV
L4DEV:
	li	a0, -30
	j	L2DEV
L3DEV:
	la	a0, Cdisk_read_drivers
	push	a0, sp
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -4(fp)
	beqz	a0, L5DEV
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 0
	j	L2DEV
	j	L6DEV
L5DEV:
	li	a0, -31
	j	L2DEV
L6DEV:
L2DEV:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cdisk_store_sector
	#align 32
Cdisk_store_sector:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	bge	a1, a0, L9DEV
	j	L8DEV
L9DEV:
	li	a0, -30
	j	L7DEV
L8DEV:
	la	a0, Cdisk_write_drivers
	push	a0, sp
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -4(fp)
	beqz	a0, L10DEV
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 0
	j	L7DEV
	j	L11DEV
L10DEV:
	li	a0, -31
	j	L7DEV
L11DEV:
L7DEV:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cdisk_load_sectors
	#align 32
Cdisk_load_sectors:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	lw	a0, 20(fp)
	sw	a0, -12(fp)
	li	a0, 0
	sw	a0, -4(fp)
L13DEV:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	blt	a1, a0, L17DEV
	j	L15DEV
L17DEV:
	j	L14DEV
L16DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L13DEV
L14DEV:
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sector
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -8(fp)
	beqz	a0, L18DEV
	lw	a0, -8(fp)
	j	L12DEV
L18DEV:
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -12(fp)
	j	L16DEV
L15DEV:
	li	a0, 0
	j	L12DEV
L12DEV:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cdisk_store_sectors
	#align 32
Cdisk_store_sectors:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	lw	a0, 20(fp)
	sw	a0, -12(fp)
	li	a0, 0
	sw	a0, -4(fp)
L20DEV:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	blt	a1, a0, L24DEV
	j	L22DEV
L24DEV:
	j	L21DEV
L23DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L20DEV
L21DEV:
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sector
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -8(fp)
	beqz	a0, L25DEV
	lw	a0, -8(fp)
	j	L19DEV
L25DEV:
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -12(fp)
	j	L23DEV
L22DEV:
	li	a0, 0
	j	L19DEV
L19DEV:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	#bank text
	#bank data
Cfat12_dont_read:	#d32	0
Cfat12_write_zero:	#d32	0
	#bank text
	#align 32
Cto_be16:	push	fp, sp
	mv	fp, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	li	a0, 65280
	pop	a1, sp
	and	a0, a0, a1
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	j	L26DEV
L26DEV:
	pop	fp, sp
	ret
	#align 32
Cto_le16:	push	fp, sp
	mv	fp, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	li	a0, 65280
	pop	a1, sp
	and	a0, a0, a1
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	j	L27DEV
L27DEV:
	pop	fp, sp
	ret
	#align 32
Cfat12_check_fname:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	li	a0, 0
	sw	a0, -4(fp)
L29DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 9
	pop	a1, sp
	blt	a1, a0, L33DEV
	j	L31DEV
L33DEV:
	j	L30DEV
L32DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L29DEV
L30DEV:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 46
	pop	a1, sp
	beq	a1, a0, L35DEV
	j	L34DEV
L35DEV:
	j	L31DEV
L34DEV:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L37DEV
	j	L36DEV
L37DEV:
	li	a0, 0
	j	L28DEV
L36DEV:
	j	L32DEV
L31DEV:
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
L38DEV:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 5
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	blt	a1, a0, L42DEV
	j	L40DEV
L42DEV:
	j	L39DEV
L41DEV:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	j	L38DEV
L39DEV:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L44DEV
	j	L43DEV
L44DEV:
	li	a0, 0
	j	L28DEV
L43DEV:
	j	L41DEV
L40DEV:
	li	a0, 1
	j	L28DEV
L28DEV:
	addi	sp, sp, 8
	pop	fp, sp
	ret
	#align 32
Cfat12_parse_fname:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	li	a0, 11
	push	a0, sp
	li	a0, 32
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemset
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 0
	sw	a0, -12(fp)
	lw	a0, 8(fp)
	sw	a0, -8(fp)
L47DEV:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	lbu	a0, 0(a0);notaligned
	sb	a0, -1(fp)
	beqz	a0, L46DEV
	li	a0, 46
	push	a0, sp
	mv	a0, zero
	lbu	a0, -1(fp)
	pop	a1, sp
	beq	a1, a0, L49DEV
	j	L48DEV
L49DEV:
	li	a0, 8
	sw	a0, -12(fp)
	j	L47DEV
L48DEV:
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	mv	a0, zero
	lbu	a0, -1(fp)
	push	a0, sp
	push	ra, sp
	call	Ctoupper
	pop	ra, sp
	addi	sp, sp, 4
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -12(fp)
	lw	t0, -12(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -12(fp)
	j	L47DEV
L46DEV:
	li	a0, 11
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
L45DEV:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	#align 32
Cfat12_parse_header:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -524
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sector
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -524(fp)
	beqz	a0, L51DEV
	lw	a0, -524(fp)
	j	L50DEV
L51DEV:
	li	a0, 0
	sw	a0, -520(fp)
L52DEV:
	lw	a0, -520(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	blt	a1, a0, L56DEV
	j	L54DEV
L56DEV:
	j	L53DEV
L55DEV:
	lw	a0, -520(fp)
	lw	t0, -520(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -520(fp)
	j	L52DEV
L53DEV:
	lw	a0, -520(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	lw	a0, -520(fp)
	push	a0, sp
	li	a0, 3
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 40
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -520(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	lw	a0, -520(fp)
	push	a0, sp
	li	a0, 54
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	j	L55DEV
L54DEV:
	li	a0, 0
	sw	a0, -520(fp)
L57DEV:
	lw	a0, -520(fp)
	push	a0, sp
	li	a0, 11
	pop	a1, sp
	blt	a1, a0, L61DEV
	j	L59DEV
L61DEV:
	j	L58DEV
L60DEV:
	lw	a0, -520(fp)
	lw	t0, -520(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -520(fp)
	j	L57DEV
L58DEV:
	li	a0, 28
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -520(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	lw	a0, -520(fp)
	push	a0, sp
	li	a0, 43
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	j	L60DEV
L59DEV:
	li	a0, 8
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 13
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 12
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 21
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 36
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 38
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 48
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 11
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 52
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 14
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 15
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 56
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 17
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 18
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 60
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 19
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 20
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 64
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 22
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 23
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 68
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 28
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 29
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 30
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 31
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 72
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 33
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 34
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 35
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 76
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 39
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 41
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 42
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	j	L50DEV
L50DEV:
	addi	sp, sp, 524
	pop	fp, sp
	ret
	#align 32
Cfat12_get_mount_info:	push	fp, sp
	mv	fp, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 12
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	exch	a0, a1
	idiv	a0, zero, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 28
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 32
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 4
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 36
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 8
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sw	a0, 0(a1)
L62DEV:
	pop	fp, sp
	ret
	#align 32
Cfat12_parse_entry:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 0
	sw	a0, -4(fp)
L64DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	blt	a1, a0, L68DEV
	j	L66DEV
L68DEV:
	j	L65DEV
L67DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L64DEV
L65DEV:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	j	L67DEV
L66DEV:
	li	a0, 0
	sw	a0, -4(fp)
L69DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 3
	pop	a1, sp
	blt	a1, a0, L73DEV
	j	L71DEV
L73DEV:
	j	L70DEV
L72DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L69DEV
L70DEV:
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	j	L72DEV
L71DEV:
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 11
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 13
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 14
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 15
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 16
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 17
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 28
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 18
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 19
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 22
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 23
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 25
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 40
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 21
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	li	a0, 20
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	li	a0, 27
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	li	a0, 26
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 31
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	li	a0, 30
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	li	a0, 29
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	li	a0, 28
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L63DEV:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#align 32
Cfat12_unparse_entry:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 0
	sw	a0, -4(fp)
L75DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	blt	a1, a0, L79DEV
	j	L77DEV
L79DEV:
	j	L76DEV
L78DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L75DEV
L76DEV:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	j	L78DEV
L77DEV:
	li	a0, 0
	sw	a0, -4(fp)
L80DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 3
	pop	a1, sp
	blt	a1, a0, L84DEV
	j	L82DEV
L84DEV:
	j	L81DEV
L83DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L80DEV
L81DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	j	L83DEV
L82DEV:
	li	a0, 11
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 13
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 14
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 15
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 17
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 18
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 28
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 19
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 28
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 22
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 23
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 25
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 40
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 21
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 40
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 26
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 40
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 27
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 40
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 31
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 30
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 29
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 28
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
L74DEV:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#align 32
Cfat12_find_dir:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -164
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -80(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -80(fp)
	pop	a1, sp
	beq	a1, a0, L87DEV
	j	L86DEV
L87DEV:
	li	a0, -45
	j	L85DEV
L86DEV:
	li	a0, 8
	push	a0, sp
	lw	a0, -80(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -24(fp)
	li	a0, 4
	push	a0, sp
	lw	a0, -80(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -28(fp)
	li	a0, 0
	sw	a0, -16(fp)
L88DEV:
	lw	a0, -16(fp)
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	blt	a1, a0, L92DEV
	j	L90DEV
L92DEV:
	j	L89DEV
L91DEV:
	lw	a0, -16(fp)
	lw	t0, -16(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -16(fp)
	j	L88DEV
L89DEV:
	addi	a0, fp, -164
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -80(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 20(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_read
	pop	ra, sp
	addi	sp, sp, 12
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -164
	lw	a0, 0(a0)
	beqz	a0, L93DEV
	addi	a0, fp, -164
	lw	a0, 0(a0)
	j	L85DEV
L93DEV:
	li	a0, 0
	sw	a0, -20(fp)
L94DEV:
	lw	a0, -20(fp)
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	blt	a1, a0, L98DEV
	j	L96DEV
L98DEV:
	j	L95DEV
L97DEV:
	lw	a0, -20(fp)
	lw	t0, -20(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -20(fp)
	j	L94DEV
L95DEV:
	lw	a0, 20(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 32
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L100DEV
	j	L99DEV
L100DEV:
	j	TLlfat12_find_dir_notfound
L99DEV:
	li	a0, 32
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	lw	a0, 20(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -76
	push	a0, sp
	push	ra, sp
	call	Cfat12_parse_entry
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 11
	push	a0, sp
	addi	a0, fp, -76
	push	a0, sp
	addi	a0, fp, -12
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -12
	push	a0, sp
	li	a0, 11
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	addi	a0, fp, -12
	push	a0, sp
	lw	a0, 24(fp)
	push	a0, sp
	push	ra, sp
	call	Cstrcmp
	pop	ra, sp
	addi	sp, sp, 8
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L102DEV
	j	L101DEV
L102DEV:
	li	a0, 76
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 64
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -76
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 60
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -76
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 44
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 36
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -76
	push	a0, sp
	li	a0, 44
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 56
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 48
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, -80(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 60
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -80(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 52
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 32
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 32
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -76
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L103DEV
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	j	L104DEV
L103DEV:
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L104DEV:
	addi	a0, fp, -76
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L105DEV
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 524288
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L105DEV:
	addi	a0, fp, -76
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L106DEV
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 131072
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L106DEV:
	li	a0, 0
	j	L85DEV
L101DEV:
	j	L97DEV
L96DEV:
	j	L91DEV
L90DEV:
TLlfat12_find_dir_notfound:
	li	a0, 32
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, -46
	j	L85DEV
L85DEV:
	addi	sp, sp, 164
	pop	fp, sp
	ret
	#align 32
Cfat12_find_root:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -160
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -76(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	beq	a1, a0, L109DEV
	j	L108DEV
L109DEV:
	li	a0, -45
	j	L107DEV
L108DEV:
	li	a0, 4
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -24(fp)
	li	a0, 0
	sw	a0, -16(fp)
L110DEV:
	lw	a0, -16(fp)
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	blt	a1, a0, L114DEV
	j	L112DEV
L114DEV:
	j	L111DEV
L113DEV:
	lw	a0, -16(fp)
	lw	t0, -16(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -16(fp)
	j	L110DEV
L111DEV:
	addi	a0, fp, -160
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 20
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sector
	pop	ra, sp
	addi	sp, sp, 12
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -160
	lw	a0, 0(a0)
	beqz	a0, L115DEV
	addi	a0, fp, -160
	lw	a0, 0(a0)
	j	L107DEV
L115DEV:
	li	a0, 0
	sw	a0, -20(fp)
L116DEV:
	lw	a0, -20(fp)
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	blt	a1, a0, L120DEV
	j	L118DEV
L120DEV:
	j	L117DEV
L119DEV:
	lw	a0, -20(fp)
	lw	t0, -20(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -20(fp)
	j	L116DEV
L117DEV:
	li	a0, 32
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	push	ra, sp
	call	Cfat12_parse_entry
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 11
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	addi	a0, fp, -12
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -12
	push	a0, sp
	li	a0, 11
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	addi	a0, fp, -12
	push	a0, sp
	lw	a0, 20(fp)
	push	a0, sp
	push	ra, sp
	call	Cstrcmp
	pop	ra, sp
	addi	sp, sp, 8
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L122DEV
	j	L121DEV
L122DEV:
	li	a0, 76
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 64
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 60
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 44
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 36
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 44
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 56
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 48
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 20
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 52
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 32
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 32
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L123DEV
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	j	L124DEV
L123DEV:
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L124DEV:
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L125DEV
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 524288
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L125DEV:
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L126DEV
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 131072
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L126DEV:
	li	a0, 0
	j	L107DEV
L121DEV:
	j	L119DEV
L118DEV:
	j	L113DEV
L112DEV:
	li	a0, 32
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, -46
	j	L107DEV
L107DEV:
	addi	sp, sp, 160
	pop	fp, sp
	ret
	#align 32
Cfat12_free_root_entry:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -100
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -16(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	beq	a1, a0, L129DEV
	j	L128DEV
L129DEV:
	li	a0, -45
	j	L127DEV
L128DEV:
	li	a0, 4
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -12(fp)
	li	a0, 0
	sw	a0, -4(fp)
L130DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	blt	a1, a0, L134DEV
	j	L132DEV
L134DEV:
	j	L131DEV
L133DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L130DEV
L131DEV:
	addi	a0, fp, -100
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 20
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sector
	pop	ra, sp
	addi	sp, sp, 12
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -100
	lw	a0, 0(a0)
	beqz	a0, L135DEV
	addi	a0, fp, -100
	lw	a0, 0(a0)
	j	L127DEV
L135DEV:
	li	a0, 0
	sw	a0, -8(fp)
L136DEV:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	blt	a1, a0, L140DEV
	j	L138DEV
L140DEV:
	j	L137DEV
L139DEV:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	j	L136DEV
L137DEV:
	li	a0, 32
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	j	L142DEV
L143DEV:
L144DEV:
L145DEV:
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 20
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 32
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	j	L127DEV
	j	L141DEV
L146DEV:
	j	L141DEV
	j	L141DEV
L142DEV:
	la	a1, L147DEV
	j	switch
L147DEV:
	#d32	3
	#d32	0, L143DEV
	#d32	5, L144DEV
	#d32	229, L145DEV
	#d32	L146DEV
L141DEV:
	j	L139DEV
L138DEV:
	j	L133DEV
L132DEV:
	li	a0, -51
	j	L127DEV
L127DEV:
	addi	sp, sp, 100
	pop	fp, sp
	ret
	#align 32
Cfat12_free_dir_entry:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -104
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -20(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	beq	a1, a0, L150DEV
	j	L149DEV
L150DEV:
	li	a0, -45
	j	L148DEV
L149DEV:
	li	a0, 4
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -16(fp)
	li	a0, 4
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -12(fp)
	li	a0, 0
	sw	a0, -4(fp)
L151DEV:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	blt	a1, a0, L155DEV
	j	L153DEV
L155DEV:
	j	L152DEV
L154DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L151DEV
L152DEV:
	addi	a0, fp, -104
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_read
	pop	ra, sp
	addi	sp, sp, 12
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -104
	lw	a0, 0(a0)
	beqz	a0, L156DEV
	addi	a0, fp, -104
	lw	a0, 0(a0)
	j	L148DEV
L156DEV:
	li	a0, 0
	sw	a0, -8(fp)
L157DEV:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	blt	a1, a0, L161DEV
	j	L159DEV
L161DEV:
	j	L158DEV
L160DEV:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	j	L157DEV
L158DEV:
	li	a0, 32
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	j	L163DEV
L164DEV:
L165DEV:
L166DEV:
	lw	a0, 20(fp)
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 60
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 32
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	j	L148DEV
	j	L162DEV
L167DEV:
	j	L162DEV
	j	L162DEV
L163DEV:
	la	a1, L168DEV
	j	switch
L168DEV:
	#d32	3
	#d32	0, L164DEV
	#d32	5, L165DEV
	#d32	229, L166DEV
	#d32	L167DEV
L162DEV:
	j	L160DEV
L159DEV:
	j	L154DEV
L153DEV:
	li	a0, -51
	j	L148DEV
L148DEV:
	addi	sp, sp, 104
	pop	fp, sp
	ret
	#align 32
Cfat12_find:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -348
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -264(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -264(fp)
	pop	a1, sp
	beq	a1, a0, L171DEV
	j	L170DEV
L171DEV:
	li	a0, -45
	j	L169DEV
L170DEV:
	addi	a0, fp, -348
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -264(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	push	ra, sp
	call	Ckmalloc_e
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -36(fp)
	addi	a0, fp, -348
	lw	a0, 0(a0)
	beqz	a0, L172DEV
	addi	a0, fp, -348
	lw	a0, 0(a0)
	j	L169DEV
L172DEV:
	lw	a0, 16(fp)
	sw	a0, -4(fp)
	li	a0, 1
	sw	a0, -48(fp)
	li	a0, 4
	push	a0, sp
	lw	a0, -264(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -52(fp)
L173DEV:
	lw	a0, -4(fp)
	push	a0, sp
	addi	a0, fp, -20
	push	a0, sp
	push	ra, sp
	call	Cfs_next_subpath
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	addi	a0, fp, -20
	push	a0, sp
	push	ra, sp
	call	Cfat12_check_fname
	pop	ra, sp
	addi	sp, sp, 4
	beqz	a0, L176DEV
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -48
	j	L169DEV
L176DEV:
	addi	a0, fp, -32
	push	a0, sp
	addi	a0, fp, -20
	push	a0, sp
	push	ra, sp
	call	Cfat12_parse_fname
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, -48(fp)
	beqz	a0, L177DEV
	li	a0, 0
	sw	a0, -48(fp)
	addi	a0, fp, -348
	push	a0, sp
	addi	a0, fp, -32
	push	a0, sp
	lw	a0, -36(fp)
	push	a0, sp
	addi	a0, fp, -132
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find_root
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -348
	lw	a0, 0(a0)
	beqz	a0, L178DEV
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -348
	lw	a0, 0(a0)
	j	L169DEV
L178DEV:
	addi	a0, fp, -20
	push	a0, sp
	addi	a0, fp, -132
	push	a0, sp
	push	ra, sp
	call	Cstrcpy
	pop	ra, sp
	addi	sp, sp, 8
	addi	a0, fp, -132
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L179DEV
	lw	a0, -4(fp)
L179DEV:
	beqz	a0, L180DEV
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -49
	j	L169DEV
L180DEV:
	j	L181DEV
L177DEV:
	addi	a0, fp, -348
	push	a0, sp
	addi	a0, fp, -32
	push	a0, sp
	lw	a0, -36(fp)
	push	a0, sp
	addi	a0, fp, -212
	push	a0, sp
	addi	a0, fp, -132
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find_dir
	pop	ra, sp
	addi	sp, sp, 20
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -348
	lw	a0, 0(a0)
	beqz	a0, L182DEV
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -348
	lw	a0, 0(a0)
	j	L169DEV
L182DEV:
	li	a0, 80
	push	a0, sp
	addi	a0, fp, -212
	push	a0, sp
	addi	a0, fp, -132
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -20
	push	a0, sp
	addi	a0, fp, -132
	push	a0, sp
	push	ra, sp
	call	Cstrcpy
	pop	ra, sp
	addi	sp, sp, 8
	addi	a0, fp, -132
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L183DEV
	lw	a0, -4(fp)
L183DEV:
	beqz	a0, L184DEV
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -49
	j	L169DEV
L184DEV:
L181DEV:
L175DEV:
	lw	a0, -4(fp)
	bnez	a0, L173DEV
L174DEV:
	li	a0, 80
	push	a0, sp
	addi	a0, fp, -132
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 0
	j	L169DEV
L169DEV:
	addi	sp, sp, 348
	pop	fp, sp
	ret
	#align 32
Cfat12_tofattime:	push	fp, sp
	mv	fp, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 11
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 12(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 12(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 31
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 4
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2000
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1980
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 9
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 15
	pop	a1, sp
	and	a0, a0, a1
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 31
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 8
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sb	a0, 0(a1)
L185DEV:
	pop	fp, sp
	ret
	#align 32
Cfat12_next_cluster:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -108
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -12(fp)
	addi	a0, fp, -96
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Ckmalloc_e
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -8(fp)
	addi	a0, fp, -96
	lw	a0, 0(a0)
	beqz	a0, L187DEV
	j	TLlfat12_next_cluster_cleanup
L187DEV:
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -100(fp)
	li	a0, 12
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -100(fp)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	exch	a0, a1
	idiv	a0, zero, a0, a1
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -104(fp)
	lw	a0, -100(fp)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	exch	a0, a1
	idiv	zero, a0, a0, a1
	sw	a0, -108(fp)
	addi	a0, fp, -96
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 2
	push	a0, sp
	lw	a0, -104(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L188DEV
	j	TLlfat12_next_cluster_cleanup
L188DEV:
	lw	a0, -108(fp)
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	sw	a0, -4(fp)
	li	a0, 1
	push	a0, sp
	lw	a0, -108(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 1
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L189DEV
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	j	L190DEV
L189DEV:
	li	a0, 4095
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	and	a0, a0, a1
L190DEV:
	sw	a0, -4(fp)
	addi	a0, fp, -96
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	sw	a0, 0(a1)
TLlfat12_next_cluster_cleanup:
	lw	a0, -8(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -96
	lw	a0, 0(a0)
	j	L186DEV
L186DEV:
	addi	sp, sp, 108
	pop	fp, sp
	ret
	;#globl	Cfat12_mark_fat_entry
	#align 32
Cfat12_mark_fat_entry:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -104
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -8(fp)
	addi	a0, fp, -92
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Ckmalloc_e
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	addi	a0, fp, -92
	lw	a0, 0(a0)
	beqz	a0, L192DEV
	j	TLlfat12_mark_fat_entry_cleanup
L192DEV:
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -96(fp)
	li	a0, 12
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -96(fp)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	exch	a0, a1
	idiv	a0, zero, a0, a1
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -100(fp)
	lw	a0, -96(fp)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	exch	a0, a1
	idiv	zero, a0, a0, a1
	sw	a0, -104(fp)
	addi	a0, fp, -92
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 2
	push	a0, sp
	lw	a0, -100(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L193DEV
	j	TLlfat12_mark_fat_entry_cleanup
L193DEV:
	li	a0, 1
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L194DEV
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -104(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -104(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 15
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 1
	push	a0, sp
	lw	a0, -104(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -104(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -104(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	li	a0, 240
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 1
	push	a0, sp
	lw	a0, -104(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	j	L195DEV
L194DEV:
	lw	a0, -104(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -104(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -104(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 240
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -104(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 255
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -104(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -104(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 15
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
L195DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 2
	push	a0, sp
	lw	a0, -100(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sectors
	pop	ra, sp
	addi	sp, sp, 16
	addi	a0, fp, -92
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
TLlfat12_mark_fat_entry_cleanup:
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -92
	lw	a0, 0(a0)
	j	L191DEV
L191DEV:
	addi	sp, sp, 104
	pop	fp, sp
	ret
	#align 32
Cfat12_update_entry:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -644
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L198DEV
	j	L197DEV
L198DEV:
	li	a0, -44
	j	L196DEV
L197DEV:
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L200DEV
	j	L199DEV
L200DEV:
	li	a0, -42
	j	L196DEV
L199DEV:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L202DEV
	j	L201DEV
L202DEV:
	li	a0, -41
	j	L196DEV
L201DEV:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -520(fp)
	addi	a0, fp, -604
	push	a0, sp
	addi	a0, fp, -512
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -520(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sector
	pop	ra, sp
	addi	sp, sp, 12
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -604
	lw	a0, 0(a0)
	beqz	a0, L203DEV
	addi	a0, fp, -604
	lw	a0, 0(a0)
	j	L196DEV
L203DEV:
	addi	a0, fp, -644
	push	a0, sp
	push	ra, sp
	call	Cclock_gettime
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -616
	push	a0, sp
	addi	a0, fp, -644
	push	a0, sp
	push	ra, sp
	call	Cfat12_tofattime
	pop	ra, sp
	addi	sp, sp, 8
	addi	a0, fp, -512
	push	a0, sp
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -516(fp)
	li	a0, 1
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L204DEV
	lw	a0, -516(fp)
	push	a0, sp
	li	a0, 229
	pop	a1, sp
	sb	a0, 0(a1)
	j	TLlfat12_update_entry_store
L204DEV:
	li	a0, 31
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 30
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 29
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 28
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 25
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -616
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -616
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 23
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -616
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 22
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -616
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 19
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -616
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 18
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -616
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
TLlfat12_update_entry_store:
	addi	a0, fp, -604
	push	a0, sp
	addi	a0, fp, -512
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -520(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sector
	pop	ra, sp
	addi	sp, sp, 12
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -604
	lw	a0, 0(a0)
	beqz	a0, L205DEV
	addi	a0, fp, -604
	lw	a0, 0(a0)
	j	L196DEV
L205DEV:
	li	a0, 0
	j	L196DEV
L196DEV:
	addi	sp, sp, 644
	pop	fp, sp
	ret
	#align 32
Cfat12_next_or_alloc_cluster:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_next_cluster
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L208DEV
	j	L207DEV
L208DEV:
	lw	a0, -4(fp)
	j	L206DEV
	j	L209DEV
L207DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 4088
	pop	a1, sp
	bge	a1, a0, L211DEV
	j	L210DEV
L211DEV:
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_get_cluster
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -8(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	beq	a1, a0, L213DEV
	j	L212DEV
L213DEV:
	li	a0, -52
	j	L206DEV
	j	L214DEV
L212DEV:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L216DEV
	j	L215DEV
L216DEV:
	lw	a0, -8(fp)
	j	L206DEV
L215DEV:
L214DEV:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_mark_fat_entry
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -12(fp)
	beqz	a0, L217DEV
	lw	a0, -12(fp)
	j	L206DEV
L217DEV:
	lw	a0, -8(fp)
	j	L206DEV
L210DEV:
L209DEV:
	lw	a0, -4(fp)
	j	L206DEV
L206DEV:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	#align 32
Cfat12_create_entry:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -784
	lw	a0, 16(fp)
	push	a0, sp
	addi	a0, fp, -744
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -660(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -660(fp)
	pop	a1, sp
	beq	a1, a0, L220DEV
	j	L219DEV
L220DEV:
	li	a0, -50
	j	L218DEV
	j	L221DEV
L219DEV:
	li	a0, -46
	push	a0, sp
	lw	a0, -660(fp)
	pop	a1, sp
	bne	a1, a0, L223DEV
	j	L222DEV
L223DEV:
	lw	a0, -660(fp)
	j	L218DEV
L222DEV:
L221DEV:
	addi	a0, fp, -108
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	push	ra, sp
	call	Cfs_path_and_fname
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -8(fp)
	addi	a0, fp, -784
	push	a0, sp
	push	ra, sp
	call	Cclock_gettime
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -756
	push	a0, sp
	addi	a0, fp, -784
	push	a0, sp
	push	ra, sp
	call	Cfat12_tofattime
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 16
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -756
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -756
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -756
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 28
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -756
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 32
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -756
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 36
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -756
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -108
	lbu	a0, 0(a0);notaligned
	beqz	a0, L224DEV
	addi	a0, fp, -108
	push	a0, sp
	addi	a0, fp, -744
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -744
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L225DEV
	addi	a0, fp, -664
	push	a0, sp
	addi	a0, fp, -620
	push	a0, sp
	addi	a0, fp, -744
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_free_dir_entry
	pop	ra, sp
	addi	sp, sp, 16
	sw	a0, -656(fp)
	lw	a0, -656(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L227DEV
	j	L226DEV
L227DEV:
	lw	a0, -656(fp)
	j	L218DEV
L226DEV:
	addi	a0, fp, -652
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_unparse_entry
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 32
	push	a0, sp
	addi	a0, fp, -652
	push	a0, sp
	addi	a0, fp, -620
	push	a0, sp
	lw	a0, -656(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -620
	push	a0, sp
	lw	a0, -664(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sector
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 0
	j	L218DEV
	j	L228DEV
L225DEV:
	li	a0, -49
	j	L218DEV
L228DEV:
	j	L229DEV
L224DEV:
	addi	a0, fp, -664
	push	a0, sp
	addi	a0, fp, -620
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_free_root_entry
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -656(fp)
	lw	a0, -656(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L231DEV
	j	L230DEV
L231DEV:
	lw	a0, -656(fp)
	j	L218DEV
L230DEV:
	addi	a0, fp, -652
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_unparse_entry
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 32
	push	a0, sp
	addi	a0, fp, -652
	push	a0, sp
	addi	a0, fp, -620
	push	a0, sp
	lw	a0, -656(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -620
	push	a0, sp
	lw	a0, -664(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sector
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 0
	j	L218DEV
L229DEV:
L218DEV:
	addi	sp, sp, 784
	pop	fp, sp
	ret
	#align 32
Cfat12_get_cluster:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -112
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -28(fp)
	addi	a0, fp, -112
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Ckmalloc_e
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -24(fp)
	addi	a0, fp, -112
	lw	a0, 0(a0)
	beqz	a0, L233DEV
	j	TLlfat12_get_cluster_cleanup
L233DEV:
	li	a0, 0
	sw	a0, -4(fp)
L234DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 28
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	blt	a1, a0, L238DEV
	j	L236DEV
L238DEV:
	j	L235DEV
L237DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L234DEV
L235DEV:
	addi	a0, fp, -112
	push	a0, sp
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 2
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L239DEV
	j	TLlfat12_get_cluster_cleanup
L239DEV:
	li	a0, 0
	sw	a0, -8(fp)
L240DEV:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	blt	a1, a0, L244DEV
	j	L242DEV
L244DEV:
	j	L241DEV
L243DEV:
	li	a0, 3
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
	j	L240DEV
L241DEV:
	li	a0, 1
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 15
	pop	a1, sp
	and	a0, a0, a1
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -20(fp)
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	li	a0, 4080
	pop	a1, sp
	and	a0, a0, a1
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 240
	pop	a1, sp
	and	a0, a0, a1
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -16(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	beq	a1, a0, L246DEV
	j	L245DEV
L246DEV:
	lw	a0, 12(fp)
	beqz	a0, L247DEV
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 15
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 2
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sectors
	pop	ra, sp
	addi	sp, sp, 16
L247DEV:
	addi	a0, fp, -112
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	exch	a0, a1
	idiv	a0, zero, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	j	TLlfat12_get_cluster_cleanup
L245DEV:
	li	a0, 0
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	beq	a1, a0, L249DEV
	j	L248DEV
L249DEV:
	lw	a0, 12(fp)
	beqz	a0, L250DEV
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 240
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 2
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sectors
	pop	ra, sp
	addi	sp, sp, 16
L250DEV:
	addi	a0, fp, -112
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	exch	a0, a1
	idiv	a0, zero, a0, a1
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	j	TLlfat12_get_cluster_cleanup
L248DEV:
	j	L243DEV
L242DEV:
	j	L237DEV
L236DEV:
	addi	a0, fp, -112
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
TLlfat12_get_cluster_cleanup:
	lw	a0, -24(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -112
	lw	a0, 0(a0)
	j	L232DEV
L232DEV:
	addi	sp, sp, 112
	pop	fp, sp
	ret
	;#globl	Cfat12_mount
	#align 32
Cfat12_mount:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -168
	addi	a0, fp, -84
	push	a0, sp
	li	a0, 40
	push	a0, sp
	push	ra, sp
	call	Ckmalloc_e
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -168(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -168(fp)
	pop	a1, sp
	beq	a1, a0, L253DEV
	j	L252DEV
L253DEV:
	addi	a0, fp, -84
	lw	a0, 0(a0)
	j	L251DEV
L252DEV:
	addi	a0, fp, -84
	push	a0, sp
	addi	a0, fp, -164
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_parse_header
	pop	ra, sp
	addi	sp, sp, 8
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L254DEV
	addi	a0, fp, -84
	lw	a0, 0(a0)
	j	L251DEV
L254DEV:
	lw	a0, -168(fp)
	push	a0, sp
	addi	a0, fp, -164
	push	a0, sp
	push	ra, sp
	call	Cfat12_get_mount_info
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -168(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	j	L251DEV
L251DEV:
	addi	sp, sp, 168
	pop	fp, sp
	ret
	;#globl	Cfat12_init
	#align 32
Cfat12_init:	push	fp, sp
	mv	fp, sp
	#bank data
L256DEV:
	#d8	"F"
	#d8	"A"
	#d8	"T"
	#d8	"1"
	#d8	"2"
	#d8	0
	#d8	0
	#d8	0
	#bank text
	la	a0, L256DEV
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cstrcpy
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_mount
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_create_file
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_delete_file
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_create_dir
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_delete_dir
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_read
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_write
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 40
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_close
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_open
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_seek
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
L255DEV:
	pop	fp, sp
	ret
	;#globl	Cfat12_read
	#align 32
Cfat12_read:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -160
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L258DEV
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	slt	a0, a1, a0
	seqz	a0, a0
L258DEV:
	beqz	a0, L259DEV
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, -1
	j	L257DEV
L259DEV:
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L261DEV
	j	L260DEV
L261DEV:
	li	a0, -44
	j	L257DEV
L260DEV:
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L263DEV
	j	L262DEV
L263DEV:
	li	a0, -42
	j	L257DEV
L262DEV:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L265DEV
	j	L264DEV
L265DEV:
	li	a0, -41
	j	L257DEV
L264DEV:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 262144
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L266DEV
	li	a0, -53
	j	L257DEV
L266DEV:
	lw	a0, 16(fp)
	sw	a0, -12(fp)
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -72(fp)
	li	a0, 52
	push	a0, sp
	lw	a0, -72(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -76(fp)
	li	a0, 36
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -24(fp)
	li	a0, 8
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	sw	a0, -44(fp)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	exch	a0, a1
	idiv	zero, a0, a0, a1
	sw	a0, -52(fp)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	exch	a0, a1
	idiv	a0, zero, a0, a1
	sw	a0, -48(fp)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sgt	a0, a1, a0
	sw	a0, -56(fp)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	exch	a0, a1
	idiv	a0, zero, a0, a1
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -60(fp)
	addi	a0, fp, -160
	push	a0, sp
	lw	a0, -44(fp)
	push	a0, sp
	push	ra, sp
	call	Ckmalloc_e
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -64(fp)
	addi	a0, fp, -160
	lw	a0, 0(a0)
	beqz	a0, L267DEV
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -160
	lw	a0, 0(a0)
	j	L257DEV
L267DEV:
	addi	a0, fp, -160
	push	a0, sp
	lw	a0, -64(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -72(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L268DEV
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -160
	lw	a0, 0(a0)
	j	L257DEV
L268DEV:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	blt	a1, a0, L270DEV
	j	L269DEV
L270DEV:
	llw	a0, Cfat12_dont_read
	bnez	a0, L271DEV
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -52(fp)
	push	a0, sp
	lw	a0, -64(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
L271DEV:
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -56(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 56
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 56
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 0
	j	L257DEV
	j	L272DEV
L269DEV:
	llw	a0, Cfat12_dont_read
	bnez	a0, L273DEV
	lw	a0, -44(fp)
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	lw	a0, -52(fp)
	push	a0, sp
	lw	a0, -64(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
L273DEV:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -44(fp)
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, 16(fp)
	lw	a0, -60(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -60(fp)
	li	a0, 0
	sw	a0, -52(fp)
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 56
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 56
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -44(fp)
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
L272DEV:
	addi	a0, fp, -160
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Ckmalloc_e
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -68(fp)
	addi	a0, fp, -160
	lw	a0, 0(a0)
	beqz	a0, L274DEV
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -160
	lw	a0, 0(a0)
	j	L257DEV
L274DEV:
	li	a0, 0
	sw	a0, -4(fp)
L275DEV:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -60(fp)
	pop	a1, sp
	blt	a1, a0, L279DEV
	j	L277DEV
L279DEV:
	j	L276DEV
L278DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L275DEV
L276DEV:
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -28(fp)
	li	a0, 12
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -28(fp)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	exch	a0, a1
	idiv	a0, zero, a0, a1
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -32(fp)
	lw	a0, -28(fp)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	exch	a0, a1
	idiv	zero, a0, a0, a1
	sw	a0, -36(fp)
	addi	a0, fp, -160
	push	a0, sp
	lw	a0, -68(fp)
	push	a0, sp
	li	a0, 2
	push	a0, sp
	lw	a0, -32(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -72(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L280DEV
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -68(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -160
	lw	a0, 0(a0)
	j	L257DEV
L280DEV:
	lw	a0, -36(fp)
	push	a0, sp
	lw	a0, -68(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -36(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -68(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -40(fp)
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L281DEV
	lw	a0, -40(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	j	L282DEV
L281DEV:
	li	a0, 4095
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	and	a0, a0, a1
L282DEV:
	sw	a0, -40(fp)
	lw	a0, -40(fp)
	push	a0, sp
	li	a0, 4088
	pop	a1, sp
	bge	a1, a0, L284DEV
	j	L283DEV
L284DEV:
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -68(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L285DEV
	li	a0, -1
	j	L286DEV
L285DEV:
	li	a0, 0
L286DEV:
	j	L257DEV
L283DEV:
	li	a0, 0
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	beq	a1, a0, L288DEV
	j	L287DEV
L288DEV:
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -68(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -47
	j	L257DEV
L287DEV:
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 36
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -24(fp)
	addi	a0, fp, -160
	push	a0, sp
	lw	a0, -64(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -72(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L289DEV
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -68(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -160
	lw	a0, 0(a0)
	j	L257DEV
L289DEV:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	slt	a0, a1, a0
	beqz	a0, L290DEV
	llw	a0, Cfat12_dont_read
	seqz	a0, a0
L290DEV:
	beqz	a0, L291DEV
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -64(fp)
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
	j	L277DEV
	j	L292DEV
L291DEV:
	llw	a0, Cfat12_dont_read
	bnez	a0, L293DEV
	lw	a0, -44(fp)
	push	a0, sp
	lw	a0, -64(fp)
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
L293DEV:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, 16(fp)
L292DEV:
	j	L278DEV
L277DEV:
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 56
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 56
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -56(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -68(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 0
	j	L257DEV
L257DEV:
	addi	sp, sp, 160
	pop	fp, sp
	ret
	;#globl	Cfat12_open
	#align 32
Cfat12_open:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -168
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -88(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -88(fp)
	pop	a1, sp
	beq	a1, a0, L296DEV
	j	L295DEV
L296DEV:
	addi	a0, fp, -84
	push	a0, sp
	li	a0, -41
	pop	a1, sp
	sw	a0, 0(a1)
	j	TLlfat12_open_end
L295DEV:
	addi	a0, fp, -84
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	addi	a0, fp, -168
	push	a0, sp
	lw	a0, -88(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find
	pop	ra, sp
	addi	sp, sp, 12
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -84
	lw	a0, 0(a0)
	beqz	a0, L297DEV
	j	TLlfat12_open_end
L297DEV:
	addi	a0, fp, -168
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	llw	a0, Cfs_currid
	llw	t0, Cfs_currid;cgincgw
	addi	t0, t0, 1
	ssw	t0, Cfs_currid, t5
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 80
	push	a0, sp
	addi	a0, fp, -168
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
TLlfat12_open_end:
	addi	a0, fp, -84
	lw	a0, 0(a0)
	j	L294DEV
L294DEV:
	addi	sp, sp, 168
	pop	fp, sp
	ret
	;#globl	Cfat12_close
	#align 32
Cfat12_close:	push	fp, sp
	mv	fp, sp
	llw	a0, Cfs_currid
	llw	t0, Cfs_currid
	subi	t0, t0, 1
	ssw	t0, Cfs_currid, t5
	li	a0, 0
	j	L298DEV
L298DEV:
	pop	fp, sp
	ret
	;#globl	Cfat12_seek
	#align 32
Cfat12_seek:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 16(fp)
	j	L301DEV
L302DEV:
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 1
	ssw	a0, Cfat12_dont_read, t0
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_read
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	li	a0, 0
	ssw	a0, Cfat12_dont_read, t0
	j	L300DEV
L303DEV:
	li	a0, 1
	ssw	a0, Cfat12_dont_read, t0
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_read
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	li	a0, 0
	ssw	a0, Cfat12_dont_read, t0
	j	L300DEV
L304DEV:
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 1
	ssw	a0, Cfat12_write_zero, t0
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_write
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	li	a0, 0
	ssw	a0, Cfat12_write_zero, t0
	j	L300DEV
L305DEV:
	li	a0, -3
	sw	a0, -4(fp)
	j	L300DEV
	j	L300DEV
L301DEV:
	la	a1, L306DEV
	j	switch
L306DEV:
	#d32	3
	#d32	0, L302DEV
	#d32	1, L303DEV
	#d32	2, L304DEV
	#d32	L305DEV
L300DEV:
	lw	a0, -4(fp)
	j	L299DEV
L299DEV:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cfat12_create_file
	#align 32
Cfat12_create_file:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -152
	li	a0, 0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	beq	a1, a0, L309DEV
	j	L308DEV
L309DEV:
	li	a0, -40
	j	L307DEV
L308DEV:
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cfs_fname_from_path
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -8(fp)
	addi	a0, fp, -24
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_parse_fname
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 8
	push	a0, sp
	addi	a0, fp, -24
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	push	ra, sp
	call	Cstrncpy
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 3
	push	a0, sp
	addi	a0, fp, -24
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cstrncpy
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 44
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	sb	a0, 0(a1)
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 131072
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L310DEV
	li	a0, 4
	j	L311DEV
L310DEV:
	li	a0, 0
L311DEV:
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 524288
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L312DEV
	li	a0, 1
	j	L313DEV
L312DEV:
	li	a0, 0
L313DEV:
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, 12(fp)
	push	a0, sp
	addi	a0, fp, -152
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find
	pop	ra, sp
	addi	sp, sp, 12
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L315DEV
	j	L314DEV
L315DEV:
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_delete_file
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L316DEV
	lw	a0, -4(fp)
	j	L307DEV
L316DEV:
L314DEV:
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_get_cluster
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	beq	a1, a0, L318DEV
	j	L317DEV
L318DEV:
	li	a0, -56
	j	L307DEV
	j	L319DEV
L317DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L321DEV
	j	L320DEV
L321DEV:
	lw	a0, -4(fp)
	j	L307DEV
L320DEV:
L319DEV:
	lw	a0, 12(fp)
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_create_entry
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	j	L307DEV
L307DEV:
	addi	sp, sp, 152
	pop	fp, sp
	ret
	;#globl	Cfat12_create_dir
	#align 32
Cfat12_create_dir:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -152
	li	a0, 0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	beq	a1, a0, L324DEV
	j	L323DEV
L324DEV:
	li	a0, -40
	j	L322DEV
L323DEV:
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cfs_fname_from_path
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -8(fp)
	addi	a0, fp, -24
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_parse_fname
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 8
	push	a0, sp
	addi	a0, fp, -24
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	push	ra, sp
	call	Cstrncpy
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 3
	push	a0, sp
	addi	a0, fp, -24
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cstrncpy
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 44
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, 12(fp)
	push	a0, sp
	addi	a0, fp, -152
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find
	pop	ra, sp
	addi	sp, sp, 12
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L326DEV
	j	L325DEV
L326DEV:
	li	a0, -50
	j	L322DEV
L325DEV:
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_get_cluster
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	beq	a1, a0, L328DEV
	j	L327DEV
L328DEV:
	li	a0, -56
	j	L322DEV
	j	L329DEV
L327DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L331DEV
	j	L330DEV
L331DEV:
	lw	a0, -4(fp)
	j	L322DEV
L330DEV:
L329DEV:
	lw	a0, 12(fp)
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_create_entry
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	j	L322DEV
L322DEV:
	addi	sp, sp, 152
	pop	fp, sp
	ret
	;#globl	Cfat12_delete_file
	#align 32
Cfat12_delete_file:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -92
	li	a0, 0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	beq	a1, a0, L334DEV
	j	L333DEV
L334DEV:
	li	a0, -40
	j	L332DEV
L333DEV:
	lw	a0, 12(fp)
	push	a0, sp
	addi	a0, fp, -92
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L335DEV
	lw	a0, -4(fp)
	j	L332DEV
L335DEV:
	addi	a0, fp, -92
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L336DEV
	li	a0, -57
	j	L332DEV
L336DEV:
	addi	a0, fp, -92
	push	a0, sp
	li	a0, 60
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -8(fp)
L337DEV:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_next_cluster
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -12(fp)
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L341DEV
	j	L340DEV
L341DEV:
	lw	a0, -4(fp)
	j	L332DEV
L340DEV:
	li	a0, 0
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_mark_fat_entry
	pop	ra, sp
	addi	sp, sp, 12
	lw	a0, -12(fp)
	sw	a0, -8(fp)
L339DEV:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 4088
	pop	a1, sp
	bge	a1, a0, L342DEV
	j	L337DEV
L342DEV:
L338DEV:
	li	a0, 0
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_mark_fat_entry
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 1
	push	a0, sp
	addi	a0, fp, -92
	push	a0, sp
	push	ra, sp
	call	Cfat12_update_entry
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	j	L332DEV
L332DEV:
	addi	sp, sp, 92
	pop	fp, sp
	ret
	;#globl	Cfat12_delete_dir
	#align 32
Cfat12_delete_dir:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -92
	li	a0, 0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	beq	a1, a0, L345DEV
	j	L344DEV
L345DEV:
	li	a0, -40
	j	L343DEV
L344DEV:
	lw	a0, 12(fp)
	push	a0, sp
	addi	a0, fp, -92
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L346DEV
	lw	a0, -4(fp)
	j	L343DEV
L346DEV:
	addi	a0, fp, -92
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L347DEV
	li	a0, -49
	j	L343DEV
L347DEV:
	addi	a0, fp, -92
	push	a0, sp
	li	a0, 60
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -8(fp)
L348DEV:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_next_cluster
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -12(fp)
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L352DEV
	j	L351DEV
L352DEV:
	lw	a0, -4(fp)
	j	L343DEV
L351DEV:
	li	a0, 0
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_mark_fat_entry
	pop	ra, sp
	addi	sp, sp, 12
	lw	a0, -12(fp)
	sw	a0, -8(fp)
L350DEV:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 4088
	pop	a1, sp
	bge	a1, a0, L353DEV
	j	L348DEV
L353DEV:
L349DEV:
	li	a0, 0
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_mark_fat_entry
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 1
	push	a0, sp
	addi	a0, fp, -92
	push	a0, sp
	push	ra, sp
	call	Cfat12_update_entry
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	j	L343DEV
L343DEV:
	addi	sp, sp, 92
	pop	fp, sp
	ret
	;#globl	Cfat12_write
	#align 32
Cfat12_write:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -136
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L356DEV
	j	L355DEV
L356DEV:
	li	a0, -44
	j	L354DEV
L355DEV:
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L358DEV
	j	L357DEV
L358DEV:
	li	a0, -42
	j	L354DEV
L357DEV:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L360DEV
	j	L359DEV
L360DEV:
	li	a0, -41
	j	L354DEV
L359DEV:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 524288
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L361DEV
	li	a0, -53
	j	L354DEV
L361DEV:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -52(fp)
	li	a0, 52
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -48(fp)
	li	a0, 36
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	sw	a0, -40(fp)
	addi	a0, fp, -136
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Ckmalloc_e
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	addi	a0, fp, -136
	lw	a0, 0(a0)
	beqz	a0, L362DEV
	j	TLlfat12_write_cleanup
L362DEV:
	li	a0, 0
	sw	a0, -12(fp)
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -20(fp)
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -28(fp)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	exch	a0, a1
	idiv	zero, a0, a0, a1
	sw	a0, -32(fp)
	li	a0, 36
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -20(fp)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L363DEV
	j	TLlfat12_write_cleanup
L363DEV:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -32(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	blt	a1, a0, L365DEV
	j	L364DEV
L365DEV:
	llw	a0, Cfat12_write_zero
	beqz	a0, L366DEV
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, -32(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cmemset
	pop	ra, sp
	addi	sp, sp, 12
	j	L367DEV
L366DEV:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, -32(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
L367DEV:
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	j	L368DEV
L364DEV:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -32(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	exch	a0, a1
	idiv	a0, zero, a0, a1
	sw	a0, -36(fp)
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -32(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	exch	a0, a1
	idiv	zero, a0, a0, a1
	beqz	a0, L369DEV
	li	a0, 1
	j	L370DEV
L369DEV:
	li	a0, 0
L370DEV:
	push	a0, sp
	lw	a0, -36(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -36(fp)
	llw	a0, Cfat12_write_zero
	beqz	a0, L371DEV
	lw	a0, -40(fp)
	push	a0, sp
	lw	a0, -32(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, -32(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cmemset
	pop	ra, sp
	addi	sp, sp, 12
	j	L372DEV
L371DEV:
	lw	a0, -40(fp)
	push	a0, sp
	lw	a0, -32(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, -32(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
L372DEV:
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -136
	lw	a0, 0(a0)
	beqz	a0, L373DEV
	j	TLlfat12_write_cleanup
L373DEV:
	lw	a0, -36(fp)
	lw	t0, -36(fp)
	subi	t0, t0, 1; cgdeclw
	sw	t0, -36(fp)
	lw	a0, -40(fp)
	push	a0, sp
	lw	a0, -32(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -12(fp)
	li	a0, 0
	sw	a0, -16(fp)
L374DEV:
	lw	a0, -16(fp)
	push	a0, sp
	lw	a0, -36(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	blt	a1, a0, L378DEV
	j	L376DEV
L378DEV:
	j	L375DEV
L377DEV:
	lw	a0, -16(fp)
	lw	t0, -16(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -16(fp)
	j	L374DEV
L375DEV:
	lw	a0, -20(fp)
	push	a0, sp
	lw	a0, -52(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_next_or_alloc_cluster
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -24(fp)
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L380DEV
	j	L379DEV
L380DEV:
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	j	TLlfat12_write_cleanup
L379DEV:
	li	a0, 36
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L381DEV
	j	TLlfat12_write_cleanup
L381DEV:
	lw	a0, -24(fp)
	sw	a0, -20(fp)
	llw	a0, Cfat12_write_zero
	beqz	a0, L382DEV
	lw	a0, -40(fp)
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemset
	pop	ra, sp
	addi	sp, sp, 12
	j	L383DEV
L382DEV:
	lw	a0, -40(fp)
	push	a0, sp
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
L383DEV:
	lw	a0, -40(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -12(fp)
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -136
	lw	a0, 0(a0)
	beqz	a0, L384DEV
	j	TLlfat12_write_cleanup
L384DEV:
	j	L377DEV
L376DEV:
	lw	a0, -20(fp)
	push	a0, sp
	lw	a0, -52(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_next_or_alloc_cluster
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -24(fp)
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L386DEV
	j	L385DEV
L386DEV:
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	j	TLlfat12_write_cleanup
L385DEV:
	li	a0, 36
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L387DEV
	j	TLlfat12_write_cleanup
L387DEV:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -44(fp)
	llw	a0, Cfat12_write_zero
	beqz	a0, L388DEV
	lw	a0, -44(fp)
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemset
	pop	ra, sp
	addi	sp, sp, 12
	j	L389DEV
L388DEV:
	lw	a0, -44(fp)
	push	a0, sp
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
L389DEV:
	lw	a0, -44(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -12(fp)
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -136
	lw	a0, 0(a0)
	beqz	a0, L390DEV
	j	TLlfat12_write_cleanup
L390DEV:
	lw	a0, -24(fp)
	sw	a0, -28(fp)
L368DEV:
TLlfat12_write_end:
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 56
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 56
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sgt	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 36
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 36
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	beqz	a0, L391DEV
	lw	a0, 16(fp)
	j	L392DEV
L391DEV:
	li	a0, 0
L392DEV:
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_update_entry
	pop	ra, sp
	addi	sp, sp, 8
TLlfat12_write_cleanup:
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -136
	lw	a0, 0(a0)
	j	L354DEV
L354DEV:
	addi	sp, sp, 136
	pop	fp, sp
	ret
	#bank data
	L393DEV:	#res 512
	#bank text
	;#globl	Cfat12_rename
	#align 32
Cfat12_rename:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -152
	li	a0, 0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
	bnez	a0, L395DEV
	li	a0, 0
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
L395DEV:
	beqz	a0, L396DEV
	li	a0, -40
	j	L394DEV
L396DEV:
	lw	a0, 16(fp)
	push	a0, sp
	addi	a0, fp, -152
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	beq	a1, a0, L398DEV
	j	L397DEV
L398DEV:
	li	a0, -50
	j	L394DEV
L397DEV:
	lw	a0, 12(fp)
	push	a0, sp
	addi	a0, fp, -152
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L399DEV
	lw	a0, -4(fp)
	j	L394DEV
L399DEV:
	la	a0, L393DEV
	push	a0, sp
	addi	a0, fp, -152
	push	a0, sp
	li	a0, 48
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sector
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L400DEV
	lw	a0, -4(fp)
	j	L394DEV
L400DEV:
	la	a0, L393DEV
	push	a0, sp
	addi	a0, fp, -152
	push	a0, sp
	li	a0, 52
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	push	ra, sp
	call	Cfat12_parse_entry
	pop	ra, sp
	addi	sp, sp, 8
	la	a0, L393DEV
	push	a0, sp
	addi	a0, fp, -152
	push	a0, sp
	li	a0, 52
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 229
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, L393DEV
	push	a0, sp
	addi	a0, fp, -152
	push	a0, sp
	li	a0, 48
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sector
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L401DEV
	lw	a0, -4(fp)
	j	L394DEV
L401DEV:
	lw	a0, 16(fp)
	push	a0, sp
	push	ra, sp
	call	Cfs_fname_from_path
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -8(fp)
	addi	a0, fp, -24
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_parse_fname
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 8
	push	a0, sp
	addi	a0, fp, -24
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	push	ra, sp
	call	Cstrncpy
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 3
	push	a0, sp
	addi	a0, fp, -24
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cstrncpy
	pop	ra, sp
	addi	sp, sp, 12
	lw	a0, 16(fp)
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_create_entry
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L402DEV
	lw	a0, -4(fp)
	j	L394DEV
L402DEV:
	li	a0, 0
	j	L394DEV
L394DEV:
	addi	sp, sp, 152
	pop	fp, sp
	ret
	#bank text
	#bank data
	;#globl	Ckb_key_pressed
Ckb_key_pressed:	#d32	0
	;#globl	Ckpress_buff
	Ckpress_buff:	#res 20
	Ckpress_data:	#res 4
	#bank text
	;#globl	Ckb_get
	#align 32
Ckb_get:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	push	ra, sp
	call	Ckb_lwd
	pop	ra, sp
	sw	a0, -4(fp)
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 65535
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L403DEV:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Ckb_last
	#align 32
Ckb_last:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	llw	a0, Ckb_key_pressed
	beqz	a0, L405DEV
	llw	a0, Ckb_key_pressed
	llw	t0, Ckb_key_pressed
	subi	t0, t0, 1
	ssw	t0, Ckb_key_pressed, t5
	lw	a0, 8(fp)
	push	a0, sp
	la	a0, Ckpress_buff
	push	a0, sp
	push	ra, sp
	call	Cringbuff_pop
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	j	L404DEV
	j	L406DEV
L405DEV:
	li	a0, -60
	j	L404DEV
L406DEV:
L404DEV:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#align 32
Ckb_char_handler:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -28
	push	ra, sp
	call	Cion_lock_system
	pop	ra, sp
	addi	a0, fp, -28
	push	a0, sp
	push	ra, sp
	call	Ckb_get
	pop	ra, sp
	addi	sp, sp, 4
	llw	a0, Ckb_key_pressed
	llw	t0, Ckb_key_pressed;cgincgw
	addi	t0, t0, 1
	ssw	t0, Ckb_key_pressed, t5
	addi	a0, fp, -28
	push	a0, sp
	la	a0, Ckpress_buff
	push	a0, sp
	push	ra, sp
	call	Cringbuff_push
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	push	ra, sp
	call	Cion_unlock_system
	pop	ra, sp
	lw	a0, -4(fp)
	j	L407DEV
L407DEV:
	addi	sp, sp, 28
	pop	fp, sp
	ret
	#align 32
Ckb_scan_handler:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -28
	push	ra, sp
	call	Cion_lock_system
	pop	ra, sp
	addi	a0, fp, -28
	push	a0, sp
	push	ra, sp
	call	Ckb_get
	pop	ra, sp
	addi	sp, sp, 4
	llw	a0, Ckb_key_pressed
	llw	t0, Ckb_key_pressed;cgincgw
	addi	t0, t0, 1
	ssw	t0, Ckb_key_pressed, t5
	addi	a0, fp, -28
	push	a0, sp
	la	a0, Ckpress_buff
	push	a0, sp
	push	ra, sp
	call	Cringbuff_push
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	push	ra, sp
	call	Cion_unlock_system
	pop	ra, sp
	lw	a0, -4(fp)
	j	L408DEV
L408DEV:
	addi	sp, sp, 28
	pop	fp, sp
	ret
	;#globl	Ckb_init
	#align 32
Ckb_init:	push	fp, sp
	mv	fp, sp
	li	a0, 2400
	push	a0, sp
	push	ra, sp
	call	Ckmalloc
	pop	ra, sp
	addi	sp, sp, 4
	ssw	a0, Ckpress_data, t0
	li	a0, 2400
	push	a0, sp
	li	a0, 0
	push	a0, sp
	llw	a0, Ckpress_data
	push	a0, sp
	push	ra, sp
	call	Cmemset
	pop	ra, sp
	addi	sp, sp, 12
	la	a0, Ckpress_buff
	push	a0, sp
	llw	a0, Ckpress_data
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Ckpress_buff
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Ckpress_buff
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Ckpress_buff
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Ckpress_buff
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 2376
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Ckb_char_handler
	push	a0, sp
	li	a0, 11
	push	a0, sp
	push	ra, sp
	call	Cregister_interrupt_handler
	pop	ra, sp
	addi	sp, sp, 8
	la	a0, Ckb_scan_handler
	push	a0, sp
	li	a0, 12
	push	a0, sp
	push	ra, sp
	call	Cregister_interrupt_handler
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ckb_setmode
	pop	ra, sp
	addi	sp, sp, 4
L409DEV:
	pop	fp, sp
	ret
	#bank text
	#bank data
L410DEV:
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
	ssw	a0, L410DEV, t0
	llw	a0, Cion_sleeping_task_list
	sw	a0, -4(fp)
	li	a0, 0
	ssw	a0, Cion_sleeping_task_list, t0
L413DEV:
	li	a0, 0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	bne	a1, a0, L414DEV
	j	L412DEV
L414DEV:
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
	llw	a0, L410DEV
	pop	a1, sp
	bge	a0, a1, L416DEV
	j	L415DEV
L416DEV:
	#bank data
L417DEV:
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
	la	a0, L417DEV
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
	j	L418DEV
L415DEV:
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
L418DEV:
	j	L413DEV
L412DEV:
	push	ra, sp
	call	Cion_unlock_system
	pop	ra, sp
L411DEV:
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
L419DEV:
	addi	sp, sp, 8
	pop	fp, sp
	ret
