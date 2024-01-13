	#bank text
	#bank data
	;#globl	Cprogram_entry
Cprogram_entry:	#d32	0
	;#globl	Cprogram_stack
Cprogram_stack:	#d32	0
	;#globl	Cion_reentry
Cion_reentry:	#d32	0
	L220:	#res 32
	#bank text
	;#globl	Cloader_load
	#align 32
Cloader_load:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	li	a0, 32
	push	a0, sp
	la	a0, L220
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfs_read_file
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L222
	lw	a0, -4(fp)
	j	L221
L222:
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfs_rewind
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L223
	lw	a0, -4(fp)
	j	L221
L223:
	la	a0, L220
	lw	a0, 0(a0)
	j	L225
L226:
	li	a0, 15007744
	push	a0, sp
	li	a0, 4096
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	la	a0, L220
	push	a0, sp
	push	ra, sp
	call	Caout_load
	pop	ra, sp
	addi	sp, sp, 16
	sw	a0, -8(fp)
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L228
	j	L227
L228:
	lw	a0, -8(fp)
	j	L221
L227:
	lw	a0, -8(fp)
	ssw	a0, Cprogram_entry, t0
	li	a0, 15011840
	ssw	a0, Cprogram_stack, t0
	li	a0, 0
	j	L221
	j	L224
L229:
	li	a0, -70
	j	L221
	j	L224
	j	L224
L225:
	la	a1, L230
	j	switch
L230:
	#d32	1
	#d32	204, L226
	#d32	L229
L224:
L221:
	addi	sp, sp, 8
	pop	fp, sp
	ret
