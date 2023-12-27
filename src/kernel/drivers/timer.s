	#bank text
	#bank data
Ctick:	#d32	0
	#bank text
	#align 32
Ctimer_callback:	push	fp, sp
	mv	fp, sp
	llw	a0, Ctick
	llw	t0, Ctick;cgincgw
	addi	t0, t0, 1
	ssw	t0, Ctick, t5
	li	a0, 0
	j	L350
L350:
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
L351:
	addi	sp, sp, 8
	pop	fp, sp
	ret
