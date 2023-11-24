	#bank text
	#bank data
L1:
	#d32	0
	#bank text
	;#globl	Cputs
	#align 32
Cputs:	push	fp, sp
	mv	fp, sp
	li	a0, 15011840
	ssw	a0, L1, t6
L4:
	lw	a0, 8(fp)
	mv	a1, a0
	mv	a0, zero
	lbu	a0, 0(a1)
	beqz	a0, L5
	j	L3
L5:
	llw	a0, L1
	push	a0, sp
	lw	a0, 8(fp)
	lw	t6, 8(fp)
	addi	t6, t6, 4
	sw	t6, 8(fp)
	mv	a1, a0
	mv	a0, zero
	lbu	a0, 0(a1)
	pop	a1, sp
	sb	a0, 0(a1)
	llw	a0, L1
	llw	t6, 0
	addi	t6, t6, 4
	ssw	t6, 0, t5
	j	L4
L3:
L2:
	pop	fp, sp
	ret
	;#globl	Cmain
	#align 32
Cmain:	push	fp, sp
	mv	fp, sp
	#bank data
L7:
	#d8	"H"
	#d8	"e"
	#d8	"l"
	#d8	"l"
	#d8	"o"
	#d8	0
	#d8	0
	#d8	0
	#bank text
	la	a0, L7
	push	a0, sp
	push	ra, sp
	call	Cputs
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 0
	j	L6
L6:
	pop	fp, sp
	ret
