	#bank text
	; globl	Cion_putc
	#align 32
Cion_putc:	push	fp, sp
	mv	fp, sp
	lw	a0, 16(fp)
	push	a0, sp
	mv	a0, zero
	lb	a0, 8(fp)
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 1
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	mv	a0, zero
	lb	a0, 12(fp)
	pop	a1, sp
	sb	a0, 0(a1)
L1:
	pop	fp, sp
	ret
	; globl	Cion_puts
	#align 32
Cion_puts:	push	fp, sp
	mv	fp, sp
L4:
	lw	a0, 8(fp)
	mv	a1, a0
	mv	a0, zero
	lbu	a0, 0(a1)
	beqz	a0, L5
	j	L3
L5:
	lw	a0, 16(fp)
	push	a0, sp
	mv	a0, zero
	lb	a0, 12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	mv	a1, a0
	mv	a0, zero
	lbu	a0, 0(a1)
	push	a0, sp
	push	ra, sp
	call	Cion_putc
	pop	ra, sp
	addi sp, sp, 12
	li	a0, 2
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, 16(fp)
	lw	a0, 8(fp)
	lw	t6, 8(fp)
	addi	t6, t6, 4
	sw	t6, 8(fp)
	j	L4
L3:
L2:
	pop	fp, sp
	ret
	; globl	Cmain
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
	#d8	32
	#d8	"W"
	#d8	"o"
	#d8	"r"
	#d8	"l"
	#d8	"d"
	#d8	32
	#d8	"f"
	#d8	"r"
	#d8	"o"
	#d8	"m"
	#d8	32
	#d8	40
	#d8	"S"
	#d8	"u"
	#d8	"b"
	#d8	41
	#d8	"C"
	#d8	33
	#d8	0
	#d8	0
	#d8	0
	#d8	0
	#bank text
	li	a0, 15014240
	push	a0, sp
	li	a0, 15
	push	a0, sp
	la	a0, L7
	push	a0, sp
	push	ra, sp
	call	Cion_puts
	pop	ra, sp
	addi sp, sp, 12
	li	a0, 0
	j	L6
L6:
	pop	fp, sp
	ret
