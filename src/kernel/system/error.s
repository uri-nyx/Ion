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
L11:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 4000
	pop	a1, sp
	blt	a1, a0, L15
	j	L13
L15:
	j	L12
L14:
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
	j	L11
L12:
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
	j	L14
L13:
L17:
	li	a0, 1
	beqz	a0, L16
	j	L17
L16:
L10:
	addi	sp, sp, 8
	pop	fp, sp
	ret
