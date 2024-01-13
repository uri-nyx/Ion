	#bank text
	;#globl	CF
	#align 32
CF:	push	fp, sp
	mv	fp, sp
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	j	L1
L1:
	pop	fp, sp
	ret
	;#globl	Cmain
	#align 32
Cmain:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	la	a0, CF
	sw	a0, -4(fp)
	li	a0, 3
	push	a0, sp
	li	a0, 2
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 12
	j	L2
L2:
	addi	sp, sp, 4
	pop	fp, sp
	ret
