	#bank text
	#bank data
Cfat12_dont_read:	#d32	0
Cfat12_write_zero:	#d32	0
	#bank text
	#align 32
Cto_be16:	push	fp, sp
	mv	fp, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	li	a0, 65280
	pop	a1, sp
	and	a0, a0, a1
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	j	L26
L26:
	pop	fp, sp
	ret
	#align 32
Cto_le16:	push	fp, sp
	mv	fp, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	li	a0, 65280
	pop	a1, sp
	and	a0, a0, a1
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	j	L27
L27:
	pop	fp, sp
	ret
	#align 32
Cfat12_check_fname:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	li	a0, 0
	sw	a0, -4(fp)
L29:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 9
	pop	a1, sp
	blt	a1, a0, L33
	j	L31
L33:
	j	L30
L32:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L29
L30:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 46
	pop	a1, sp
	beq	a1, a0, L35
	j	L34
L35:
	j	L31
L34:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L37
	j	L36
L37:
	li	a0, 0
	j	L28
L36:
	j	L32
L31:
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
L38:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 5
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	blt	a1, a0, L42
	j	L40
L42:
	j	L39
L41:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	j	L38
L39:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L44
	j	L43
L44:
	li	a0, 0
	j	L28
L43:
	j	L41
L40:
	li	a0, 1
	j	L28
L28:
	addi	sp, sp, 8
	pop	fp, sp
	ret
	#align 32
Cfat12_parse_fname:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	li	a0, 11
	push	a0, sp
	li	a0, 32
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemset
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 0
	sw	a0, -12(fp)
	lw	a0, 8(fp)
	sw	a0, -8(fp)
L47:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	lbu	a0, 0(a0);notaligned
	sb	a0, -1(fp)
	beqz	a0, L46
	li	a0, 46
	push	a0, sp
	mv	a0, zero
	lbu	a0, -1(fp)
	pop	a1, sp
	beq	a1, a0, L49
	j	L48
L49:
	li	a0, 8
	sw	a0, -12(fp)
	j	L47
L48:
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	mv	a0, zero
	lbu	a0, -1(fp)
	push	a0, sp
	push	ra, sp
	call	Ctoupper
	pop	ra, sp
	addi	sp, sp, 4
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -12(fp)
	lw	t0, -12(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -12(fp)
	j	L47
L46:
	li	a0, 11
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
L45:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	#align 32
Cfat12_parse_header:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -524
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sector
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -524(fp)
	beqz	a0, L51
	lw	a0, -524(fp)
	j	L50
L51:
	li	a0, 0
	sw	a0, -520(fp)
L52:
	lw	a0, -520(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	blt	a1, a0, L56
	j	L54
L56:
	j	L53
L55:
	lw	a0, -520(fp)
	lw	t0, -520(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -520(fp)
	j	L52
L53:
	lw	a0, -520(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	lw	a0, -520(fp)
	push	a0, sp
	li	a0, 3
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 40
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -520(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	lw	a0, -520(fp)
	push	a0, sp
	li	a0, 54
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	j	L55
L54:
	li	a0, 0
	sw	a0, -520(fp)
L57:
	lw	a0, -520(fp)
	push	a0, sp
	li	a0, 11
	pop	a1, sp
	blt	a1, a0, L61
	j	L59
L61:
	j	L58
L60:
	lw	a0, -520(fp)
	lw	t0, -520(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -520(fp)
	j	L57
L58:
	li	a0, 28
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -520(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	lw	a0, -520(fp)
	push	a0, sp
	li	a0, 43
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	j	L60
L59:
	li	a0, 8
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 13
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 12
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 21
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 36
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 38
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 48
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 11
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 52
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 14
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 15
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 56
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 17
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 18
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 60
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 19
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 20
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 64
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 22
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 23
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 68
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 28
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 29
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 30
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 31
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 72
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 33
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 34
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 35
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 76
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 39
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 41
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	addi	a0, fp, -516
	push	a0, sp
	li	a0, 42
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	j	L50
L50:
	addi	sp, sp, 524
	pop	fp, sp
	ret
	#align 32
Cfat12_get_mount_info:	push	fp, sp
	mv	fp, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 12
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	exch	a0, a1
	idiv	a0, zero, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 28
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 32
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 4
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 36
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 8
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sw	a0, 0(a1)
L62:
	pop	fp, sp
	ret
	#align 32
Cfat12_parse_entry:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 0
	sw	a0, -4(fp)
L64:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	blt	a1, a0, L68
	j	L66
L68:
	j	L65
L67:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L64
L65:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	j	L67
L66:
	li	a0, 0
	sw	a0, -4(fp)
L69:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 3
	pop	a1, sp
	blt	a1, a0, L73
	j	L71
L73:
	j	L70
L72:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L69
L70:
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	j	L72
L71:
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 11
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 13
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 14
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 15
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 16
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 17
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 28
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 18
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 19
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 22
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 23
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 25
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 40
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 21
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	li	a0, 20
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	li	a0, 27
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	li	a0, 26
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 31
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	li	a0, 30
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	li	a0, 29
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	push	a0, sp
	li	a0, 28
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L63:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#align 32
Cfat12_unparse_entry:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 0
	sw	a0, -4(fp)
L75:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	blt	a1, a0, L79
	j	L77
L79:
	j	L76
L78:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L75
L76:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	j	L78
L77:
	li	a0, 0
	sw	a0, -4(fp)
L80:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 3
	pop	a1, sp
	blt	a1, a0, L84
	j	L82
L84:
	j	L81
L83:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L80
L81:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	j	L83
L82:
	li	a0, 11
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 13
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 14
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 15
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 17
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 18
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 28
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 19
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 28
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 22
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 23
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 25
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 40
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
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
	li	a0, 21
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 40
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 26
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 40
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 27
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 40
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 31
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 30
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 29
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 28
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
L74:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#align 32
Cfat12_find_dir:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -164
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -80(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -80(fp)
	pop	a1, sp
	beq	a1, a0, L87
	j	L86
L87:
	li	a0, -45
	j	L85
L86:
	li	a0, 8
	push	a0, sp
	lw	a0, -80(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -24(fp)
	li	a0, 4
	push	a0, sp
	lw	a0, -80(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -28(fp)
	li	a0, 0
	sw	a0, -16(fp)
L88:
	lw	a0, -16(fp)
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	blt	a1, a0, L92
	j	L90
L92:
	j	L89
L91:
	lw	a0, -16(fp)
	lw	t0, -16(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -16(fp)
	j	L88
L89:
	addi	a0, fp, -164
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -80(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 20(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_read
	pop	ra, sp
	addi	sp, sp, 12
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -164
	lw	a0, 0(a0)
	beqz	a0, L93
	addi	a0, fp, -164
	lw	a0, 0(a0)
	j	L85
L93:
	li	a0, 0
	sw	a0, -20(fp)
L94:
	lw	a0, -20(fp)
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	blt	a1, a0, L98
	j	L96
L98:
	j	L95
L97:
	lw	a0, -20(fp)
	lw	t0, -20(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -20(fp)
	j	L94
L95:
	lw	a0, 20(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 32
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L100
	j	L99
L100:
	j	TLlfat12_find_dir_notfound
L99:
	li	a0, 32
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	lw	a0, 20(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -76
	push	a0, sp
	push	ra, sp
	call	Cfat12_parse_entry
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 11
	push	a0, sp
	addi	a0, fp, -76
	push	a0, sp
	addi	a0, fp, -12
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -12
	push	a0, sp
	li	a0, 11
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	addi	a0, fp, -12
	push	a0, sp
	lw	a0, 24(fp)
	push	a0, sp
	push	ra, sp
	call	Cstrcmp
	pop	ra, sp
	addi	sp, sp, 8
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L102
	j	L101
L102:
	li	a0, 76
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 64
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -76
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 60
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -76
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 44
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 36
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -76
	push	a0, sp
	li	a0, 44
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 56
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 48
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, -80(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 60
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -80(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 52
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 32
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 32
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -76
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L103
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	j	L104
L103:
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L104:
	addi	a0, fp, -76
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L105
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 524288
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L105:
	addi	a0, fp, -76
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L106
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 131072
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L106:
	li	a0, 0
	j	L85
L101:
	j	L97
L96:
	j	L91
L90:
TLlfat12_find_dir_notfound:
	li	a0, 32
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, -46
	j	L85
L85:
	addi	sp, sp, 164
	pop	fp, sp
	ret
	#align 32
Cfat12_find_root:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -160
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -76(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	beq	a1, a0, L109
	j	L108
L109:
	li	a0, -45
	j	L107
L108:
	li	a0, 4
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -24(fp)
	li	a0, 0
	sw	a0, -16(fp)
L110:
	lw	a0, -16(fp)
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	blt	a1, a0, L114
	j	L112
L114:
	j	L111
L113:
	lw	a0, -16(fp)
	lw	t0, -16(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -16(fp)
	j	L110
L111:
	addi	a0, fp, -160
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 20
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sector
	pop	ra, sp
	addi	sp, sp, 12
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -160
	lw	a0, 0(a0)
	beqz	a0, L115
	addi	a0, fp, -160
	lw	a0, 0(a0)
	j	L107
L115:
	li	a0, 0
	sw	a0, -20(fp)
L116:
	lw	a0, -20(fp)
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	blt	a1, a0, L120
	j	L118
L120:
	j	L117
L119:
	lw	a0, -20(fp)
	lw	t0, -20(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -20(fp)
	j	L116
L117:
	li	a0, 32
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	push	ra, sp
	call	Cfat12_parse_entry
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 11
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	addi	a0, fp, -12
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -12
	push	a0, sp
	li	a0, 11
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	addi	a0, fp, -12
	push	a0, sp
	lw	a0, 20(fp)
	push	a0, sp
	push	ra, sp
	call	Cstrcmp
	pop	ra, sp
	addi	sp, sp, 8
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L122
	j	L121
L122:
	li	a0, 76
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 64
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 60
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 44
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 36
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 44
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 56
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 48
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 20
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 52
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 32
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 32
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L123
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	j	L124
L123:
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L124:
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L125
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 524288
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L125:
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L126
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 131072
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L126:
	li	a0, 0
	j	L107
L121:
	j	L119
L118:
	j	L113
L112:
	li	a0, 32
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, -46
	j	L107
L107:
	addi	sp, sp, 160
	pop	fp, sp
	ret
	#align 32
Cfat12_free_root_entry:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -100
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -16(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	beq	a1, a0, L129
	j	L128
L129:
	li	a0, -45
	j	L127
L128:
	li	a0, 4
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -12(fp)
	li	a0, 0
	sw	a0, -4(fp)
L130:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	blt	a1, a0, L134
	j	L132
L134:
	j	L131
L133:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L130
L131:
	addi	a0, fp, -100
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 20
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sector
	pop	ra, sp
	addi	sp, sp, 12
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -100
	lw	a0, 0(a0)
	beqz	a0, L135
	addi	a0, fp, -100
	lw	a0, 0(a0)
	j	L127
L135:
	li	a0, 0
	sw	a0, -8(fp)
L136:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	blt	a1, a0, L140
	j	L138
L140:
	j	L137
L139:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	j	L136
L137:
	li	a0, 32
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	j	L142
L143:
L144:
L145:
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 20
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 32
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	j	L127
	j	L141
L146:
	j	L141
	j	L141
L142:
	la	a1, L147
	j	switch
L147:
	#d32	3
	#d32	0, L143
	#d32	5, L144
	#d32	229, L145
	#d32	L146
L141:
	j	L139
L138:
	j	L133
L132:
	li	a0, -51
	j	L127
L127:
	addi	sp, sp, 100
	pop	fp, sp
	ret
	#align 32
Cfat12_free_dir_entry:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -104
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -20(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	beq	a1, a0, L150
	j	L149
L150:
	li	a0, -45
	j	L148
L149:
	li	a0, 4
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -16(fp)
	li	a0, 4
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -12(fp)
	li	a0, 0
	sw	a0, -4(fp)
L151:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	blt	a1, a0, L155
	j	L153
L155:
	j	L152
L154:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L151
L152:
	addi	a0, fp, -104
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_read
	pop	ra, sp
	addi	sp, sp, 12
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -104
	lw	a0, 0(a0)
	beqz	a0, L156
	addi	a0, fp, -104
	lw	a0, 0(a0)
	j	L148
L156:
	li	a0, 0
	sw	a0, -8(fp)
L157:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	blt	a1, a0, L161
	j	L159
L161:
	j	L158
L160:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	j	L157
L158:
	li	a0, 32
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	j	L163
L164:
L165:
L166:
	lw	a0, 20(fp)
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 60
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 32
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	j	L148
	j	L162
L167:
	j	L162
	j	L162
L163:
	la	a1, L168
	j	switch
L168:
	#d32	3
	#d32	0, L164
	#d32	5, L165
	#d32	229, L166
	#d32	L167
L162:
	j	L160
L159:
	j	L154
L153:
	li	a0, -51
	j	L148
L148:
	addi	sp, sp, 104
	pop	fp, sp
	ret
	#align 32
Cfat12_find:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -348
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -264(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -264(fp)
	pop	a1, sp
	beq	a1, a0, L171
	j	L170
L171:
	li	a0, -45
	j	L169
L170:
	addi	a0, fp, -348
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -264(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	push	ra, sp
	call	Ckmalloc_e
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -36(fp)
	addi	a0, fp, -348
	lw	a0, 0(a0)
	beqz	a0, L172
	addi	a0, fp, -348
	lw	a0, 0(a0)
	j	L169
L172:
	lw	a0, 16(fp)
	sw	a0, -4(fp)
	li	a0, 1
	sw	a0, -48(fp)
	li	a0, 4
	push	a0, sp
	lw	a0, -264(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -52(fp)
L173:
	lw	a0, -4(fp)
	push	a0, sp
	addi	a0, fp, -20
	push	a0, sp
	push	ra, sp
	call	Cfs_next_subpath
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	addi	a0, fp, -20
	push	a0, sp
	push	ra, sp
	call	Cfat12_check_fname
	pop	ra, sp
	addi	sp, sp, 4
	beqz	a0, L176
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -48
	j	L169
L176:
	addi	a0, fp, -32
	push	a0, sp
	addi	a0, fp, -20
	push	a0, sp
	push	ra, sp
	call	Cfat12_parse_fname
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, -48(fp)
	beqz	a0, L177
	li	a0, 0
	sw	a0, -48(fp)
	addi	a0, fp, -348
	push	a0, sp
	addi	a0, fp, -32
	push	a0, sp
	lw	a0, -36(fp)
	push	a0, sp
	addi	a0, fp, -132
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find_root
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -348
	lw	a0, 0(a0)
	beqz	a0, L178
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -348
	lw	a0, 0(a0)
	j	L169
L178:
	addi	a0, fp, -20
	push	a0, sp
	addi	a0, fp, -132
	push	a0, sp
	push	ra, sp
	call	Cstrcpy
	pop	ra, sp
	addi	sp, sp, 8
	addi	a0, fp, -132
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L179
	lw	a0, -4(fp)
L179:
	beqz	a0, L180
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -49
	j	L169
L180:
	j	L181
L177:
	addi	a0, fp, -348
	push	a0, sp
	addi	a0, fp, -32
	push	a0, sp
	lw	a0, -36(fp)
	push	a0, sp
	addi	a0, fp, -212
	push	a0, sp
	addi	a0, fp, -132
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find_dir
	pop	ra, sp
	addi	sp, sp, 20
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -348
	lw	a0, 0(a0)
	beqz	a0, L182
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -348
	lw	a0, 0(a0)
	j	L169
L182:
	li	a0, 80
	push	a0, sp
	addi	a0, fp, -212
	push	a0, sp
	addi	a0, fp, -132
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -20
	push	a0, sp
	addi	a0, fp, -132
	push	a0, sp
	push	ra, sp
	call	Cstrcpy
	pop	ra, sp
	addi	sp, sp, 8
	addi	a0, fp, -132
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L183
	lw	a0, -4(fp)
L183:
	beqz	a0, L184
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -49
	j	L169
L184:
L181:
L175:
	lw	a0, -4(fp)
	bnez	a0, L173
L174:
	li	a0, 80
	push	a0, sp
	addi	a0, fp, -132
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 0
	j	L169
L169:
	addi	sp, sp, 348
	pop	fp, sp
	ret
	#align 32
Cfat12_tofattime:	push	fp, sp
	mv	fp, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 11
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 12(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 12(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 31
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 4
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2000
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1980
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 9
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 15
	pop	a1, sp
	and	a0, a0, a1
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 31
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 8
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sb	a0, 0(a1)
L185:
	pop	fp, sp
	ret
	#align 32
Cfat12_next_cluster:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -108
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -12(fp)
	addi	a0, fp, -96
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Ckmalloc_e
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -8(fp)
	addi	a0, fp, -96
	lw	a0, 0(a0)
	beqz	a0, L187
	j	TLlfat12_next_cluster_cleanup
L187:
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -100(fp)
	li	a0, 12
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -100(fp)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	exch	a0, a1
	idiv	a0, zero, a0, a1
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -104(fp)
	lw	a0, -100(fp)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	exch	a0, a1
	idiv	zero, a0, a0, a1
	sw	a0, -108(fp)
	addi	a0, fp, -96
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 2
	push	a0, sp
	lw	a0, -104(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L188
	j	TLlfat12_next_cluster_cleanup
L188:
	lw	a0, -108(fp)
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	sw	a0, -4(fp)
	li	a0, 1
	push	a0, sp
	lw	a0, -108(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
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
	li	a0, 1
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L189
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	j	L190
L189:
	li	a0, 4095
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	and	a0, a0, a1
L190:
	sw	a0, -4(fp)
	addi	a0, fp, -96
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	sw	a0, 0(a1)
TLlfat12_next_cluster_cleanup:
	lw	a0, -8(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -96
	lw	a0, 0(a0)
	j	L186
L186:
	addi	sp, sp, 108
	pop	fp, sp
	ret
	;#globl	Cfat12_mark_fat_entry
	#align 32
Cfat12_mark_fat_entry:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -104
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -8(fp)
	addi	a0, fp, -92
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Ckmalloc_e
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	addi	a0, fp, -92
	lw	a0, 0(a0)
	beqz	a0, L192
	j	TLlfat12_mark_fat_entry_cleanup
L192:
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -96(fp)
	li	a0, 12
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -96(fp)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	exch	a0, a1
	idiv	a0, zero, a0, a1
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -100(fp)
	lw	a0, -96(fp)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	exch	a0, a1
	idiv	zero, a0, a0, a1
	sw	a0, -104(fp)
	addi	a0, fp, -92
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 2
	push	a0, sp
	lw	a0, -100(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L193
	j	TLlfat12_mark_fat_entry_cleanup
L193:
	li	a0, 1
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L194
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -104(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -104(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 15
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 1
	push	a0, sp
	lw	a0, -104(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -104(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -104(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	li	a0, 240
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 1
	push	a0, sp
	lw	a0, -104(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	j	L195
L194:
	lw	a0, -104(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -104(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -104(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 240
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -104(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 255
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -104(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -104(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 15
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
L195:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 2
	push	a0, sp
	lw	a0, -100(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sectors
	pop	ra, sp
	addi	sp, sp, 16
	addi	a0, fp, -92
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
TLlfat12_mark_fat_entry_cleanup:
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -92
	lw	a0, 0(a0)
	j	L191
L191:
	addi	sp, sp, 104
	pop	fp, sp
	ret
	#align 32
Cfat12_update_entry:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -644
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L198
	j	L197
L198:
	li	a0, -44
	j	L196
L197:
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L200
	j	L199
L200:
	li	a0, -42
	j	L196
L199:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L202
	j	L201
L202:
	li	a0, -41
	j	L196
L201:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -520(fp)
	addi	a0, fp, -604
	push	a0, sp
	addi	a0, fp, -512
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -520(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sector
	pop	ra, sp
	addi	sp, sp, 12
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -604
	lw	a0, 0(a0)
	beqz	a0, L203
	addi	a0, fp, -604
	lw	a0, 0(a0)
	j	L196
L203:
	addi	a0, fp, -644
	push	a0, sp
	push	ra, sp
	call	Cclock_gettime
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -616
	push	a0, sp
	addi	a0, fp, -644
	push	a0, sp
	push	ra, sp
	call	Cfat12_tofattime
	pop	ra, sp
	addi	sp, sp, 8
	addi	a0, fp, -512
	push	a0, sp
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -516(fp)
	li	a0, 1
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L204
	lw	a0, -516(fp)
	push	a0, sp
	li	a0, 229
	pop	a1, sp
	sb	a0, 0(a1)
	j	TLlfat12_update_entry_store
L204:
	li	a0, 31
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 30
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 29
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 28
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 25
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -616
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -616
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 23
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -616
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 22
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -616
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 19
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -616
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 18
	push	a0, sp
	lw	a0, -516(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -616
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
TLlfat12_update_entry_store:
	addi	a0, fp, -604
	push	a0, sp
	addi	a0, fp, -512
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -520(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sector
	pop	ra, sp
	addi	sp, sp, 12
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -604
	lw	a0, 0(a0)
	beqz	a0, L205
	addi	a0, fp, -604
	lw	a0, 0(a0)
	j	L196
L205:
	li	a0, 0
	j	L196
L196:
	addi	sp, sp, 644
	pop	fp, sp
	ret
	#align 32
Cfat12_next_or_alloc_cluster:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_next_cluster
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L208
	j	L207
L208:
	lw	a0, -4(fp)
	j	L206
	j	L209
L207:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 4088
	pop	a1, sp
	bge	a1, a0, L211
	j	L210
L211:
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_get_cluster
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -8(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	beq	a1, a0, L213
	j	L212
L213:
	li	a0, -52
	j	L206
	j	L214
L212:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L216
	j	L215
L216:
	lw	a0, -8(fp)
	j	L206
L215:
L214:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_mark_fat_entry
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -12(fp)
	beqz	a0, L217
	lw	a0, -12(fp)
	j	L206
L217:
	lw	a0, -8(fp)
	j	L206
L210:
L209:
	lw	a0, -4(fp)
	j	L206
L206:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	#align 32
Cfat12_create_entry:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -784
	lw	a0, 16(fp)
	push	a0, sp
	addi	a0, fp, -744
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -660(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -660(fp)
	pop	a1, sp
	beq	a1, a0, L220
	j	L219
L220:
	li	a0, -50
	j	L218
	j	L221
L219:
	li	a0, -46
	push	a0, sp
	lw	a0, -660(fp)
	pop	a1, sp
	bne	a1, a0, L223
	j	L222
L223:
	lw	a0, -660(fp)
	j	L218
L222:
L221:
	addi	a0, fp, -108
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	push	ra, sp
	call	Cfs_path_and_fname
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -8(fp)
	addi	a0, fp, -784
	push	a0, sp
	push	ra, sp
	call	Cclock_gettime
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -756
	push	a0, sp
	addi	a0, fp, -784
	push	a0, sp
	push	ra, sp
	call	Cfat12_tofattime
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 16
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -756
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -756
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -756
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 28
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -756
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 32
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -756
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 36
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -756
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -108
	lbu	a0, 0(a0);notaligned
	beqz	a0, L224
	addi	a0, fp, -108
	push	a0, sp
	addi	a0, fp, -744
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -744
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L225
	addi	a0, fp, -664
	push	a0, sp
	addi	a0, fp, -620
	push	a0, sp
	addi	a0, fp, -744
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_free_dir_entry
	pop	ra, sp
	addi	sp, sp, 16
	sw	a0, -656(fp)
	lw	a0, -656(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L227
	j	L226
L227:
	lw	a0, -656(fp)
	j	L218
L226:
	addi	a0, fp, -652
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_unparse_entry
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 32
	push	a0, sp
	addi	a0, fp, -652
	push	a0, sp
	addi	a0, fp, -620
	push	a0, sp
	lw	a0, -656(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -620
	push	a0, sp
	lw	a0, -664(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sector
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 0
	j	L218
	j	L228
L225:
	li	a0, -49
	j	L218
L228:
	j	L229
L224:
	addi	a0, fp, -664
	push	a0, sp
	addi	a0, fp, -620
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_free_root_entry
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -656(fp)
	lw	a0, -656(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L231
	j	L230
L231:
	lw	a0, -656(fp)
	j	L218
L230:
	addi	a0, fp, -652
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_unparse_entry
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 32
	push	a0, sp
	addi	a0, fp, -652
	push	a0, sp
	addi	a0, fp, -620
	push	a0, sp
	lw	a0, -656(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -620
	push	a0, sp
	lw	a0, -664(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sector
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 0
	j	L218
L229:
L218:
	addi	sp, sp, 784
	pop	fp, sp
	ret
	#align 32
Cfat12_get_cluster:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -112
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -28(fp)
	addi	a0, fp, -112
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Ckmalloc_e
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -24(fp)
	addi	a0, fp, -112
	lw	a0, 0(a0)
	beqz	a0, L233
	j	TLlfat12_get_cluster_cleanup
L233:
	li	a0, 0
	sw	a0, -4(fp)
L234:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 28
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	blt	a1, a0, L238
	j	L236
L238:
	j	L235
L237:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L234
L235:
	addi	a0, fp, -112
	push	a0, sp
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 2
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L239
	j	TLlfat12_get_cluster_cleanup
L239:
	li	a0, 0
	sw	a0, -8(fp)
L240:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	blt	a1, a0, L244
	j	L242
L244:
	j	L241
L243:
	li	a0, 3
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
	j	L240
L241:
	li	a0, 1
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 15
	pop	a1, sp
	and	a0, a0, a1
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -20(fp)
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	li	a0, 4080
	pop	a1, sp
	and	a0, a0, a1
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 240
	pop	a1, sp
	and	a0, a0, a1
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -16(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -20(fp)
	pop	a1, sp
	beq	a1, a0, L246
	j	L245
L246:
	lw	a0, 12(fp)
	beqz	a0, L247
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 15
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 2
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sectors
	pop	ra, sp
	addi	sp, sp, 16
L247:
	addi	a0, fp, -112
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	exch	a0, a1
	idiv	a0, zero, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	j	TLlfat12_get_cluster_cleanup
L245:
	li	a0, 0
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	beq	a1, a0, L249
	j	L248
L249:
	lw	a0, 12(fp)
	beqz	a0, L250
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 240
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 255
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 2
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sectors
	pop	ra, sp
	addi	sp, sp, 16
L250:
	addi	a0, fp, -112
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	exch	a0, a1
	idiv	a0, zero, a0, a1
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	j	TLlfat12_get_cluster_cleanup
L248:
	j	L243
L242:
	j	L237
L236:
	addi	a0, fp, -112
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
TLlfat12_get_cluster_cleanup:
	lw	a0, -24(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -112
	lw	a0, 0(a0)
	j	L232
L232:
	addi	sp, sp, 112
	pop	fp, sp
	ret
	;#globl	Cfat12_mount
	#align 32
Cfat12_mount:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -168
	addi	a0, fp, -84
	push	a0, sp
	li	a0, 40
	push	a0, sp
	push	ra, sp
	call	Ckmalloc_e
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -168(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -168(fp)
	pop	a1, sp
	beq	a1, a0, L253
	j	L252
L253:
	addi	a0, fp, -84
	lw	a0, 0(a0)
	j	L251
L252:
	addi	a0, fp, -84
	push	a0, sp
	addi	a0, fp, -164
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_parse_header
	pop	ra, sp
	addi	sp, sp, 8
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L254
	addi	a0, fp, -84
	lw	a0, 0(a0)
	j	L251
L254:
	lw	a0, -168(fp)
	push	a0, sp
	addi	a0, fp, -164
	push	a0, sp
	push	ra, sp
	call	Cfat12_get_mount_info
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -168(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	j	L251
L251:
	addi	sp, sp, 168
	pop	fp, sp
	ret
	;#globl	Cfat12_init
	#align 32
Cfat12_init:	push	fp, sp
	mv	fp, sp
	#bank data
L256:
	#d8	"F"
	#d8	"A"
	#d8	"T"
	#d8	"1"
	#d8	"2"
	#d8	0
	#d8	0
	#d8	0
	#bank text
	la	a0, L256
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cstrcpy
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_mount
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_create_file
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_delete_file
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_create_dir
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_delete_dir
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_read
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_write
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 40
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_close
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_open
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_seek
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
L255:
	pop	fp, sp
	ret
	;#globl	Cfat12_read
	#align 32
Cfat12_read:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -160
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L258
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	slt	a0, a1, a0
	seqz	a0, a0
L258:
	beqz	a0, L259
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, -1
	j	L257
L259:
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L261
	j	L260
L261:
	li	a0, -44
	j	L257
L260:
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L263
	j	L262
L263:
	li	a0, -42
	j	L257
L262:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L265
	j	L264
L265:
	li	a0, -41
	j	L257
L264:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 262144
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L266
	li	a0, -53
	j	L257
L266:
	lw	a0, 16(fp)
	sw	a0, -12(fp)
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -72(fp)
	li	a0, 52
	push	a0, sp
	lw	a0, -72(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -76(fp)
	li	a0, 36
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -24(fp)
	li	a0, 8
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	sw	a0, -44(fp)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	exch	a0, a1
	idiv	zero, a0, a0, a1
	sw	a0, -52(fp)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	exch	a0, a1
	idiv	a0, zero, a0, a1
	sw	a0, -48(fp)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sgt	a0, a1, a0
	sw	a0, -56(fp)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	exch	a0, a1
	idiv	a0, zero, a0, a1
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -60(fp)
	addi	a0, fp, -160
	push	a0, sp
	lw	a0, -44(fp)
	push	a0, sp
	push	ra, sp
	call	Ckmalloc_e
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -64(fp)
	addi	a0, fp, -160
	lw	a0, 0(a0)
	beqz	a0, L267
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -160
	lw	a0, 0(a0)
	j	L257
L267:
	addi	a0, fp, -160
	push	a0, sp
	lw	a0, -64(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -72(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L268
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -160
	lw	a0, 0(a0)
	j	L257
L268:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	blt	a1, a0, L270
	j	L269
L270:
	llw	a0, Cfat12_dont_read
	bnez	a0, L271
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -52(fp)
	push	a0, sp
	lw	a0, -64(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
L271:
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -56(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 56
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 56
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 0
	j	L257
	j	L272
L269:
	llw	a0, Cfat12_dont_read
	bnez	a0, L273
	lw	a0, -44(fp)
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	lw	a0, -52(fp)
	push	a0, sp
	lw	a0, -64(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
L273:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -44(fp)
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, 16(fp)
	lw	a0, -60(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -60(fp)
	li	a0, 0
	sw	a0, -52(fp)
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 56
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 56
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -44(fp)
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
L272:
	addi	a0, fp, -160
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Ckmalloc_e
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -68(fp)
	addi	a0, fp, -160
	lw	a0, 0(a0)
	beqz	a0, L274
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -160
	lw	a0, 0(a0)
	j	L257
L274:
	li	a0, 0
	sw	a0, -4(fp)
L275:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -60(fp)
	pop	a1, sp
	blt	a1, a0, L279
	j	L277
L279:
	j	L276
L278:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L275
L276:
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -28(fp)
	li	a0, 12
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -28(fp)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	exch	a0, a1
	idiv	a0, zero, a0, a1
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -32(fp)
	lw	a0, -28(fp)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	exch	a0, a1
	idiv	zero, a0, a0, a1
	sw	a0, -36(fp)
	addi	a0, fp, -160
	push	a0, sp
	lw	a0, -68(fp)
	push	a0, sp
	li	a0, 2
	push	a0, sp
	lw	a0, -32(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -72(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L280
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -68(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -160
	lw	a0, 0(a0)
	j	L257
L280:
	lw	a0, -36(fp)
	push	a0, sp
	lw	a0, -68(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -36(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -68(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -40(fp)
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L281
	lw	a0, -40(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	j	L282
L281:
	li	a0, 4095
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	and	a0, a0, a1
L282:
	sw	a0, -40(fp)
	lw	a0, -40(fp)
	push	a0, sp
	li	a0, 4088
	pop	a1, sp
	bge	a1, a0, L284
	j	L283
L284:
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -68(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L285
	li	a0, -1
	j	L286
L285:
	li	a0, 0
L286:
	j	L257
L283:
	li	a0, 0
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	beq	a1, a0, L288
	j	L287
L288:
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -68(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -47
	j	L257
L287:
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 36
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -24(fp)
	addi	a0, fp, -160
	push	a0, sp
	lw	a0, -64(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -72(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L289
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -68(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -160
	lw	a0, 0(a0)
	j	L257
L289:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	slt	a0, a1, a0
	beqz	a0, L290
	llw	a0, Cfat12_dont_read
	seqz	a0, a0
L290:
	beqz	a0, L291
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -64(fp)
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
	j	L277
	j	L292
L291:
	llw	a0, Cfat12_dont_read
	bnez	a0, L293
	lw	a0, -44(fp)
	push	a0, sp
	lw	a0, -64(fp)
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
L293:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, 16(fp)
L292:
	j	L278
L277:
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 56
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 56
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -56(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -68(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 0
	j	L257
L257:
	addi	sp, sp, 160
	pop	fp, sp
	ret
	;#globl	Cfat12_open
	#align 32
Cfat12_open:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -168
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -88(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -88(fp)
	pop	a1, sp
	beq	a1, a0, L296
	j	L295
L296:
	addi	a0, fp, -84
	push	a0, sp
	li	a0, -41
	pop	a1, sp
	sw	a0, 0(a1)
	j	TLlfat12_open_end
L295:
	addi	a0, fp, -84
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	addi	a0, fp, -168
	push	a0, sp
	lw	a0, -88(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find
	pop	ra, sp
	addi	sp, sp, 12
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -84
	lw	a0, 0(a0)
	beqz	a0, L297
	j	TLlfat12_open_end
L297:
	addi	a0, fp, -168
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	llw	a0, Cfs_currid
	llw	t0, Cfs_currid;cgincgw
	addi	t0, t0, 1
	ssw	t0, Cfs_currid, t5
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 80
	push	a0, sp
	addi	a0, fp, -168
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
TLlfat12_open_end:
	addi	a0, fp, -84
	lw	a0, 0(a0)
	j	L294
L294:
	addi	sp, sp, 168
	pop	fp, sp
	ret
	;#globl	Cfat12_close
	#align 32
Cfat12_close:	push	fp, sp
	mv	fp, sp
	llw	a0, Cfs_currid
	llw	t0, Cfs_currid
	subi	t0, t0, 1
	ssw	t0, Cfs_currid, t5
	li	a0, 0
	j	L298
L298:
	pop	fp, sp
	ret
	;#globl	Cfat12_seek
	#align 32
Cfat12_seek:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 16(fp)
	j	L301
L302:
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 1
	ssw	a0, Cfat12_dont_read, t0
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_read
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	li	a0, 0
	ssw	a0, Cfat12_dont_read, t0
	j	L300
L303:
	li	a0, 1
	ssw	a0, Cfat12_dont_read, t0
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_read
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	li	a0, 0
	ssw	a0, Cfat12_dont_read, t0
	j	L300
L304:
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 1
	ssw	a0, Cfat12_write_zero, t0
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_write
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	li	a0, 0
	ssw	a0, Cfat12_write_zero, t0
	j	L300
L305:
	li	a0, -3
	sw	a0, -4(fp)
	j	L300
	j	L300
L301:
	la	a1, L306
	j	switch
L306:
	#d32	3
	#d32	0, L302
	#d32	1, L303
	#d32	2, L304
	#d32	L305
L300:
	lw	a0, -4(fp)
	j	L299
L299:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cfat12_create_file
	#align 32
Cfat12_create_file:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -152
	li	a0, 0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	beq	a1, a0, L309
	j	L308
L309:
	li	a0, -40
	j	L307
L308:
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cfs_fname_from_path
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -8(fp)
	addi	a0, fp, -24
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_parse_fname
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 8
	push	a0, sp
	addi	a0, fp, -24
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	push	ra, sp
	call	Cstrncpy
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 3
	push	a0, sp
	addi	a0, fp, -24
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cstrncpy
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 44
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	sb	a0, 0(a1)
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 131072
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L310
	li	a0, 4
	j	L311
L310:
	li	a0, 0
L311:
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 524288
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L312
	li	a0, 1
	j	L313
L312:
	li	a0, 0
L313:
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, 12(fp)
	push	a0, sp
	addi	a0, fp, -152
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find
	pop	ra, sp
	addi	sp, sp, 12
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L315
	j	L314
L315:
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_delete_file
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L316
	lw	a0, -4(fp)
	j	L307
L316:
L314:
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_get_cluster
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	beq	a1, a0, L318
	j	L317
L318:
	li	a0, -56
	j	L307
	j	L319
L317:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L321
	j	L320
L321:
	lw	a0, -4(fp)
	j	L307
L320:
L319:
	lw	a0, 12(fp)
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_create_entry
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	j	L307
L307:
	addi	sp, sp, 152
	pop	fp, sp
	ret
	;#globl	Cfat12_create_dir
	#align 32
Cfat12_create_dir:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -152
	li	a0, 0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	beq	a1, a0, L324
	j	L323
L324:
	li	a0, -40
	j	L322
L323:
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cfs_fname_from_path
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -8(fp)
	addi	a0, fp, -24
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_parse_fname
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 8
	push	a0, sp
	addi	a0, fp, -24
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	push	ra, sp
	call	Cstrncpy
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 3
	push	a0, sp
	addi	a0, fp, -24
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cstrncpy
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 44
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, 12(fp)
	push	a0, sp
	addi	a0, fp, -152
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find
	pop	ra, sp
	addi	sp, sp, 12
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L326
	j	L325
L326:
	li	a0, -50
	j	L322
L325:
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_get_cluster
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	beq	a1, a0, L328
	j	L327
L328:
	li	a0, -56
	j	L322
	j	L329
L327:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L331
	j	L330
L331:
	lw	a0, -4(fp)
	j	L322
L330:
L329:
	lw	a0, 12(fp)
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_create_entry
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	j	L322
L322:
	addi	sp, sp, 152
	pop	fp, sp
	ret
	;#globl	Cfat12_delete_file
	#align 32
Cfat12_delete_file:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -92
	li	a0, 0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	beq	a1, a0, L334
	j	L333
L334:
	li	a0, -40
	j	L332
L333:
	lw	a0, 12(fp)
	push	a0, sp
	addi	a0, fp, -92
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L335
	lw	a0, -4(fp)
	j	L332
L335:
	addi	a0, fp, -92
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L336
	li	a0, -57
	j	L332
L336:
	addi	a0, fp, -92
	push	a0, sp
	li	a0, 60
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -8(fp)
L337:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_next_cluster
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -12(fp)
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L341
	j	L340
L341:
	lw	a0, -4(fp)
	j	L332
L340:
	li	a0, 0
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_mark_fat_entry
	pop	ra, sp
	addi	sp, sp, 12
	lw	a0, -12(fp)
	sw	a0, -8(fp)
L339:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 4088
	pop	a1, sp
	bge	a1, a0, L342
	j	L337
L342:
L338:
	li	a0, 0
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_mark_fat_entry
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 1
	push	a0, sp
	addi	a0, fp, -92
	push	a0, sp
	push	ra, sp
	call	Cfat12_update_entry
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	j	L332
L332:
	addi	sp, sp, 92
	pop	fp, sp
	ret
	;#globl	Cfat12_delete_dir
	#align 32
Cfat12_delete_dir:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -92
	li	a0, 0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	beq	a1, a0, L345
	j	L344
L345:
	li	a0, -40
	j	L343
L344:
	lw	a0, 12(fp)
	push	a0, sp
	addi	a0, fp, -92
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L346
	lw	a0, -4(fp)
	j	L343
L346:
	addi	a0, fp, -92
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L347
	li	a0, -49
	j	L343
L347:
	addi	a0, fp, -92
	push	a0, sp
	li	a0, 60
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -8(fp)
L348:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_next_cluster
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -12(fp)
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L352
	j	L351
L352:
	lw	a0, -4(fp)
	j	L343
L351:
	li	a0, 0
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_mark_fat_entry
	pop	ra, sp
	addi	sp, sp, 12
	lw	a0, -12(fp)
	sw	a0, -8(fp)
L350:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 4088
	pop	a1, sp
	bge	a1, a0, L353
	j	L348
L353:
L349:
	li	a0, 0
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_mark_fat_entry
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 1
	push	a0, sp
	addi	a0, fp, -92
	push	a0, sp
	push	ra, sp
	call	Cfat12_update_entry
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	j	L343
L343:
	addi	sp, sp, 92
	pop	fp, sp
	ret
	;#globl	Cfat12_write
	#align 32
Cfat12_write:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -136
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L356
	j	L355
L356:
	li	a0, -44
	j	L354
L355:
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L358
	j	L357
L358:
	li	a0, -42
	j	L354
L357:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L360
	j	L359
L360:
	li	a0, -41
	j	L354
L359:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 524288
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L361
	li	a0, -53
	j	L354
L361:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -52(fp)
	li	a0, 52
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -48(fp)
	li	a0, 36
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	sw	a0, -40(fp)
	addi	a0, fp, -136
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Ckmalloc_e
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	addi	a0, fp, -136
	lw	a0, 0(a0)
	beqz	a0, L362
	j	TLlfat12_write_cleanup
L362:
	li	a0, 0
	sw	a0, -12(fp)
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -20(fp)
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -28(fp)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	exch	a0, a1
	idiv	zero, a0, a0, a1
	sw	a0, -32(fp)
	li	a0, 36
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -20(fp)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L363
	j	TLlfat12_write_cleanup
L363:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -32(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	blt	a1, a0, L365
	j	L364
L365:
	llw	a0, Cfat12_write_zero
	beqz	a0, L366
	lw	a0, 16(fp)
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, -32(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cmemset
	pop	ra, sp
	addi	sp, sp, 12
	j	L367
L366:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, -32(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
L367:
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	j	L368
L364:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -32(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	exch	a0, a1
	idiv	a0, zero, a0, a1
	sw	a0, -36(fp)
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -32(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	exch	a0, a1
	idiv	zero, a0, a0, a1
	beqz	a0, L369
	li	a0, 1
	j	L370
L369:
	li	a0, 0
L370:
	push	a0, sp
	lw	a0, -36(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -36(fp)
	llw	a0, Cfat12_write_zero
	beqz	a0, L371
	lw	a0, -40(fp)
	push	a0, sp
	lw	a0, -32(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, -32(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cmemset
	pop	ra, sp
	addi	sp, sp, 12
	j	L372
L371:
	lw	a0, -40(fp)
	push	a0, sp
	lw	a0, -32(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, -32(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
L372:
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -136
	lw	a0, 0(a0)
	beqz	a0, L373
	j	TLlfat12_write_cleanup
L373:
	lw	a0, -36(fp)
	lw	t0, -36(fp)
	subi	t0, t0, 1; cgdeclw
	sw	t0, -36(fp)
	lw	a0, -40(fp)
	push	a0, sp
	lw	a0, -32(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -12(fp)
	li	a0, 0
	sw	a0, -16(fp)
L374:
	lw	a0, -16(fp)
	push	a0, sp
	lw	a0, -36(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	blt	a1, a0, L378
	j	L376
L378:
	j	L375
L377:
	lw	a0, -16(fp)
	lw	t0, -16(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -16(fp)
	j	L374
L375:
	lw	a0, -20(fp)
	push	a0, sp
	lw	a0, -52(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_next_or_alloc_cluster
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -24(fp)
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L380
	j	L379
L380:
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	j	TLlfat12_write_cleanup
L379:
	li	a0, 36
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L381
	j	TLlfat12_write_cleanup
L381:
	lw	a0, -24(fp)
	sw	a0, -20(fp)
	llw	a0, Cfat12_write_zero
	beqz	a0, L382
	lw	a0, -40(fp)
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemset
	pop	ra, sp
	addi	sp, sp, 12
	j	L383
L382:
	lw	a0, -40(fp)
	push	a0, sp
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
L383:
	lw	a0, -40(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -12(fp)
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -136
	lw	a0, 0(a0)
	beqz	a0, L384
	j	TLlfat12_write_cleanup
L384:
	j	L377
L376:
	lw	a0, -20(fp)
	push	a0, sp
	lw	a0, -52(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_next_or_alloc_cluster
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -24(fp)
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L386
	j	L385
L386:
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	j	TLlfat12_write_cleanup
L385:
	li	a0, 36
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	beqz	a0, L387
	j	TLlfat12_write_cleanup
L387:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -44(fp)
	llw	a0, Cfat12_write_zero
	beqz	a0, L388
	lw	a0, -44(fp)
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemset
	pop	ra, sp
	addi	sp, sp, 12
	j	L389
L388:
	lw	a0, -44(fp)
	push	a0, sp
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
L389:
	lw	a0, -44(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -12(fp)
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sectors
	pop	ra, sp
	addi	sp, sp, 16
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -136
	lw	a0, 0(a0)
	beqz	a0, L390
	j	TLlfat12_write_cleanup
L390:
	lw	a0, -24(fp)
	sw	a0, -28(fp)
L368:
TLlfat12_write_end:
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 56
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 56
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sgt	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 36
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 36
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	beqz	a0, L391
	lw	a0, 16(fp)
	j	L392
L391:
	li	a0, 0
L392:
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_update_entry
	pop	ra, sp
	addi	sp, sp, 8
TLlfat12_write_cleanup:
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -136
	lw	a0, 0(a0)
	j	L354
L354:
	addi	sp, sp, 136
	pop	fp, sp
	ret
	#bank data
	L393:	#res 512
	#bank text
	;#globl	Cfat12_rename
	#align 32
Cfat12_rename:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -152
	li	a0, 0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
	bnez	a0, L395
	li	a0, 0
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
L395:
	beqz	a0, L396
	li	a0, -40
	j	L394
L396:
	lw	a0, 16(fp)
	push	a0, sp
	addi	a0, fp, -152
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	li	a0, 0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	beq	a1, a0, L398
	j	L397
L398:
	li	a0, -50
	j	L394
L397:
	lw	a0, 12(fp)
	push	a0, sp
	addi	a0, fp, -152
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_find
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L399
	lw	a0, -4(fp)
	j	L394
L399:
	la	a0, L393
	push	a0, sp
	addi	a0, fp, -152
	push	a0, sp
	li	a0, 48
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sector
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L400
	lw	a0, -4(fp)
	j	L394
L400:
	la	a0, L393
	push	a0, sp
	addi	a0, fp, -152
	push	a0, sp
	li	a0, 52
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	push	ra, sp
	call	Cfat12_parse_entry
	pop	ra, sp
	addi	sp, sp, 8
	la	a0, L393
	push	a0, sp
	addi	a0, fp, -152
	push	a0, sp
	li	a0, 52
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 229
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, L393
	push	a0, sp
	addi	a0, fp, -152
	push	a0, sp
	li	a0, 48
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sector
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L401
	lw	a0, -4(fp)
	j	L394
L401:
	lw	a0, 16(fp)
	push	a0, sp
	push	ra, sp
	call	Cfs_fname_from_path
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -8(fp)
	addi	a0, fp, -24
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_parse_fname
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 8
	push	a0, sp
	addi	a0, fp, -24
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	push	ra, sp
	call	Cstrncpy
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 3
	push	a0, sp
	addi	a0, fp, -24
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cstrncpy
	pop	ra, sp
	addi	sp, sp, 12
	lw	a0, 16(fp)
	push	a0, sp
	addi	a0, fp, -72
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_create_entry
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L402
	lw	a0, -4(fp)
	j	L394
L402:
	li	a0, 0
	j	L394
L394:
	addi	sp, sp, 152
	pop	fp, sp
	ret
