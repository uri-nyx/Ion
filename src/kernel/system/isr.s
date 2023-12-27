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
L57:
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
L58:
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
L59:
	pop	fp, sp
	ret
