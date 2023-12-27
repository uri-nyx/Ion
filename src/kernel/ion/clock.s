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
L1:
	pop	fp, sp
	ret
