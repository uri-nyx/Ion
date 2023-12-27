	#bank text
	#bank data
	;#globl	Ckb_key_pressed
Ckb_key_pressed:	#d32	0
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
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 8
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
L342:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#align 32
Cprintable:	push	fp, sp
	mv	fp, sp
	mv	a0, zero
	lbu	a0, 11(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	slt	a0, a1, a0
	seqz	a0, a0
	beqz	a0, L344
	mv	a0, zero
	lbu	a0, 11(fp)
	push	a0, sp
	li	a0, 126
	pop	a1, sp
	sgt	a0, a1, a0
	seqz	a0, a0
L344:
	snez	a0, a0
	bnez	a0, L345
	mv	a0, zero
	lbu	a0, 11(fp)
	push	a0, sp
	li	a0, 161
	pop	a1, sp
	slt	a0, a1, a0
	seqz	a0, a0
L345:
	beqz	a0, L346
	mv	a0, zero
	lbu	a0, 11(fp)
	j	L343
	j	L347
L346:
	li	a0, 63
	j	L343
L347:
L343:
	pop	fp, sp
	ret
	#align 32
Ckb_callback:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	addi	a0, fp, -12
	push	a0, sp
	push	ra, sp
	call	Ckb_get
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 1
	ssw	a0, Ckb_key_pressed, t0
	li	a0, 0
	j	L348
L348:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Ckb_init
	#align 32
Ckb_init:	push	fp, sp
	mv	fp, sp
	la	a0, Ckb_callback
	push	a0, sp
	li	a0, 11
	push	a0, sp
	push	ra, sp
	call	Cregister_interrupt_handler
	pop	ra, sp
	addi	sp, sp, 8
	la	a0, Ckb_callback
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
L349:
	pop	fp, sp
	ret
