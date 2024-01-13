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
	;#globl	Cclock_unix_time
	#align 32
Cclock_unix_time:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 244
	push	a0, sp
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	Csbd
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 244
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 245
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 246
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 247
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 244
	push	a0, sp
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	Csbd
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, -4(fp)
	j	L2
L2:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cclock_read_counter
	#align 32
Cclock_read_counter:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 248
	push	a0, sp
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	Csbd
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 248
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 249
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 250
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 251
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	j	L3
L3:
	addi	sp, sp, 4
	pop	fp, sp
	ret
