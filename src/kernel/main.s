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
