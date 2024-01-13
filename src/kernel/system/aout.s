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
	bne	a1, a0, L3
	j	L2
L3:
	li	a0, -70
	j	L1
L2:
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
	beqz	a0, L4
	lw	a0, -8(fp)
	j	L1
L4:
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
	beqz	a0, L5
	lw	a0, -8(fp)
	j	L1
L5:
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
	beqz	a0, L6
	lw	a0, -8(fp)
	j	L1
L6:
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
	beqz	a0, L7
	lw	a0, -8(fp)
	j	L1
L7:
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
	beqz	a0, L8
	li	a0, -1
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	sub	a0, a1, a0
	snez	a0, a0
L8:
	beqz	a0, L9
	lw	a0, -8(fp)
	j	L1
L9:
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	j	L1
L1:
	addi	sp, sp, 44
	pop	fp, sp
	ret
