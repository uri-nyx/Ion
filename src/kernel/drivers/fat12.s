	#bank text
	#bank data
Cfat12_dont_read:	#d32	0
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
	li	a0, 32
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
	beq	a1, a0, L100
	j	L99
L100:
	li	a0, 76
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
	#bank data
L101:
	#d8	"F"
	#d8	"I"
	#d8	"N"
	#d8	"D"
	#d8	32
	#d8	"F"
	#d8	"i"
	#d8	"l"
	#d8	"e"
	#d8	58
	#d8	32
	#d8	37
	#d8	"s"
	#d8	44
	#d8	32
	#d8	"i"
	#d8	"n"
	#d8	32
	#d8	"D"
	#d8	"I"
	#d8	"R"
	#d8	32
	#d8	37
	#d8	"s"
	#d8	32
	#d8	91
	#d8	37
	#d8	"x"
	#d8	93
	#d8	44
	#d8	32
	#d8	"B"
	#d8	"l"
	#d8	"o"
	#d8	"c"
	#d8	"k"
	#d8	58
	#d8	32
	#d8	37
	#d8	"x"
	#d8	10
	#d8	0
	#d8	0
	#d8	0
	#bank text
	li	a0, 48
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 60
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 24(fp)
	push	a0, sp
	la	a0, L101
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 24
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
	beqz	a0, L102
	li	a0, 32
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	j	L103
L102:
	li	a0, 32
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
L103:
	li	a0, 0
	j	L85
L99:
	j	L97
L96:
	j	L91
L90:
	li	a0, 32
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 2
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
	li	a0, 32
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
	beq	a1, a0, L106
	j	L105
L106:
	li	a0, -45
	j	L104
L105:
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
L107:
	lw	a0, -16(fp)
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	blt	a1, a0, L111
	j	L109
L111:
	j	L108
L110:
	lw	a0, -16(fp)
	lw	t0, -16(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -16(fp)
	j	L107
L108:
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
	li	a0, 36
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
	beqz	a0, L112
	addi	a0, fp, -160
	lw	a0, 0(a0)
	j	L104
L112:
	li	a0, 0
	sw	a0, -20(fp)
L113:
	lw	a0, -20(fp)
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	blt	a1, a0, L117
	j	L115
L117:
	j	L114
L116:
	lw	a0, -20(fp)
	lw	t0, -20(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -20(fp)
	j	L113
L114:
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
	beq	a1, a0, L119
	j	L118
L119:
	li	a0, 76
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
	#bank data
L120:
	#d8	"F"
	#d8	"I"
	#d8	"N"
	#d8	"D"
	#d8	32
	#d8	"I"
	#d8	"N"
	#d8	32
	#d8	"R"
	#d8	"O"
	#d8	"O"
	#d8	"T"
	#d8	32
	#d8	37
	#d8	"s"
	#d8	32
	#d8	"f"
	#d8	"i"
	#d8	"r"
	#d8	"s"
	#d8	"t"
	#d8	58
	#d8	32
	#d8	37
	#d8	"x"
	#d8	44
	#d8	32
	#d8	"e"
	#d8	"n"
	#d8	"t"
	#d8	"r"
	#d8	"y"
	#d8	32
	#d8	37
	#d8	"x"
	#d8	10
	#d8	0
	#d8	0
	#d8	0
	#d8	0
	#bank text
	li	a0, 48
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 60
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 20(fp)
	push	a0, sp
	la	a0, L120
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 20
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
	beqz	a0, L121
	li	a0, 32
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	j	L122
L121:
	li	a0, 32
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
L122:
	li	a0, 0
	j	L104
L118:
	j	L116
L115:
	j	L110
L109:
	li	a0, 32
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, -46
	j	L104
L104:
	addi	sp, sp, 160
	pop	fp, sp
	ret
	#align 32
Cfat12_free_root_entry:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -100
	li	a0, 32
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
	beq	a1, a0, L125
	j	L124
L125:
	li	a0, -45
	j	L123
L124:
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
L126:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	blt	a1, a0, L130
	j	L128
L130:
	j	L127
L129:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L126
L127:
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
	li	a0, 36
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
	beqz	a0, L131
	addi	a0, fp, -100
	lw	a0, 0(a0)
	j	L123
L131:
	li	a0, 0
	sw	a0, -8(fp)
L132:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	blt	a1, a0, L136
	j	L134
L136:
	j	L133
L135:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	j	L132
L133:
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
	j	L138
L139:
L140:
L141:
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
	j	L123
	j	L137
L142:
	j	L137
	j	L137
L138:
	la	a1, L143
	j	switch
L143:
	#d32	3
	#d32	0, L139
	#d32	5, L140
	#d32	229, L141
	#d32	L142
L137:
	j	L135
L134:
	j	L129
L128:
	li	a0, -51
	j	L123
L123:
	addi	sp, sp, 100
	pop	fp, sp
	ret
	#align 32
Cfat12_free_dir_entry:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -104
	li	a0, 32
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
	beq	a1, a0, L146
	j	L145
L146:
	li	a0, -45
	j	L144
L145:
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
L147:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	blt	a1, a0, L151
	j	L149
L151:
	j	L148
L150:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L147
L148:
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
	beqz	a0, L152
	addi	a0, fp, -104
	lw	a0, 0(a0)
	j	L144
L152:
	li	a0, 0
	sw	a0, -8(fp)
L153:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	blt	a1, a0, L157
	j	L155
L157:
	j	L154
L156:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	j	L153
L154:
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
	j	L159
L160:
L161:
L162:
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
	j	L144
	j	L158
L163:
	j	L158
	j	L158
L159:
	la	a1, L164
	j	switch
L164:
	#d32	3
	#d32	0, L160
	#d32	5, L161
	#d32	229, L162
	#d32	L163
L158:
	j	L156
L155:
	j	L150
L149:
	li	a0, -51
	j	L144
L144:
	addi	sp, sp, 104
	pop	fp, sp
	ret
	#align 32
Cfat12_find:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -348
	li	a0, 32
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
	beq	a1, a0, L167
	j	L166
L167:
	li	a0, -45
	j	L165
L166:
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
	beqz	a0, L168
	addi	a0, fp, -348
	lw	a0, 0(a0)
	j	L165
L168:
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
L169:
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
	beqz	a0, L172
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -48
	j	L165
L172:
	addi	a0, fp, -32
	push	a0, sp
	addi	a0, fp, -20
	push	a0, sp
	push	ra, sp
	call	Cfat12_parse_fname
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, -48(fp)
	beqz	a0, L173
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
	beqz	a0, L174
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -348
	lw	a0, 0(a0)
	j	L165
L174:
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
	li	a0, 0
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L175
	lw	a0, -4(fp)
L175:
	beqz	a0, L176
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -49
	j	L165
L176:
	j	L177
L173:
	#bank data
L178:
	#d8	"F"
	#d8	"i"
	#d8	"n"
	#d8	"d"
	#d8	"i"
	#d8	"n"
	#d8	"g"
	#d8	32
	#d8	37
	#d8	"s"
	#d8	10
	#d8	0
	#bank text
	addi	a0, fp, -132
	push	a0, sp
	la	a0, L178
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 12
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
	beqz	a0, L179
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -348
	lw	a0, 0(a0)
	j	L165
L179:
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
	li	a0, 0
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L180
	lw	a0, -4(fp)
L180:
	beqz	a0, L181
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -49
	j	L165
L181:
L177:
L171:
	lw	a0, -4(fp)
	bnez	a0, L169
L170:
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
	j	L165
L165:
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
L182:
	pop	fp, sp
	ret
	#align 32
Cfat12_next_cluster:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -108
	li	a0, 32
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
	beqz	a0, L184
	j	TLlfat12_next_cluster_cleanup
L184:
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
	li	a0, 36
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
	beqz	a0, L185
	j	TLlfat12_next_cluster_cleanup
L185:
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
	beqz	a0, L186
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	j	L187
L186:
	li	a0, 4095
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	and	a0, a0, a1
L187:
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
	j	L183
L183:
	addi	sp, sp, 108
	pop	fp, sp
	ret
	;#globl	Cfat12_mark_fat_entry
	#align 32
Cfat12_mark_fat_entry:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -104
	li	a0, 32
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
	beqz	a0, L189
	j	TLlfat12_mark_fat_entry_cleanup
L189:
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
	li	a0, 36
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
	beqz	a0, L190
	j	TLlfat12_mark_fat_entry_cleanup
L190:
	li	a0, 1
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L191
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
	j	L192
L191:
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
L192:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 2
	push	a0, sp
	lw	a0, -100(fp)
	push	a0, sp
	li	a0, 36
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
	j	L188
L188:
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
	beq	a1, a0, L195
	j	L194
L195:
	li	a0, -44
	j	L193
L194:
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L197
	j	L196
L197:
	li	a0, -42
	j	L193
L196:
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
	beq	a1, a0, L199
	j	L198
L199:
	li	a0, -41
	j	L193
L198:
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
	li	a0, 36
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
	beqz	a0, L200
	addi	a0, fp, -604
	lw	a0, 0(a0)
	j	L193
L200:
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
	#bank data
L201:
	#d8	"U"
	#d8	"p"
	#d8	"d"
	#d8	"a"
	#d8	"t"
	#d8	"i"
	#d8	"n"
	#d8	"g"
	#d8	32
	#d8	"e"
	#d8	"n"
	#d8	"t"
	#d8	"r"
	#d8	"y"
	#d8	32
	#d8	"f"
	#d8	"o"
	#d8	"r"
	#d8	32
	#d8	"f"
	#d8	"i"
	#d8	"l"
	#d8	"e"
	#d8	32
	#d8	37
	#d8	"s"
	#d8	58
	#d8	32
	#d8	"l"
	#d8	"e"
	#d8	"n"
	#d8	32
	#d8	37
	#d8	"d"
	#d8	44
	#d8	32
	#d8	"i"
	#d8	"n"
	#d8	32
	#d8	"b"
	#d8	"l"
	#d8	"o"
	#d8	"c"
	#d8	"k"
	#d8	32
	#d8	37
	#d8	"x"
	#d8	44
	#d8	32
	#d8	"o"
	#d8	"f"
	#d8	"f"
	#d8	"s"
	#d8	"e"
	#d8	"t"
	#d8	32
	#d8	37
	#d8	"x"
	#d8	46
	#d8	32
	#d8	"D"
	#d8	"a"
	#d8	"t"
	#d8	"e"
	#d8	58
	#d8	32
	#d8	37
	#d8	"p"
	#d8	10
	#d8	0
	#d8	0
	#d8	0
	#bank text
	addi	a0, fp, -616
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 48
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
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	la	a0, L201
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 28
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
	li	a0, 36
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
	beqz	a0, L202
	#bank data
L203:
	#d8	"E"
	#d8	"r"
	#d8	"r"
	#d8	"o"
	#d8	"r"
	#d8	32
	#d8	"u"
	#d8	"p"
	#d8	"d"
	#d8	"a"
	#d8	"t"
	#d8	"i"
	#d8	"n"
	#d8	"g"
	#d8	32
	#d8	"e"
	#d8	"n"
	#d8	"t"
	#d8	"r"
	#d8	"y"
	#d8	33
	#d8	32
	#d8	91
	#d8	37
	#d8	"d"
	#d8	93
	#d8	10
	#d8	0
	#bank text
	addi	a0, fp, -604
	lw	a0, 0(a0)
	push	a0, sp
	la	a0, L203
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -604
	lw	a0, 0(a0)
	j	L193
L202:
	li	a0, 0
	j	L193
L193:
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
	blt	a1, a0, L206
	j	L205
L206:
	lw	a0, -4(fp)
	j	L204
	j	L207
L205:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 4088
	pop	a1, sp
	bge	a1, a0, L209
	j	L208
L209:
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_get_cluster
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -8(fp)
	#bank data
L210:
	#d8	"F"
	#d8	"r"
	#d8	"e"
	#d8	"e"
	#d8	32
	#d8	"c"
	#d8	"l"
	#d8	"u"
	#d8	"s"
	#d8	"t"
	#d8	"e"
	#d8	"r"
	#d8	32
	#d8	91
	#d8	37
	#d8	"x"
	#d8	93
	#d8	9
	#d8	0
	#d8	0
	#bank text
	lw	a0, -8(fp)
	push	a0, sp
	la	a0, L210
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 1909
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 0
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	beq	a1, a0, L212
	j	L211
L212:
	li	a0, 1908
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -52
	j	L204
	j	L213
L211:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L215
	j	L214
L215:
	li	a0, 1907
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -8(fp)
	j	L204
L214:
L213:
	li	a0, 1906
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
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
	beqz	a0, L216
	lw	a0, -12(fp)
	j	L204
L216:
	li	a0, 1910
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -8(fp)
	j	L204
L208:
L207:
	#bank data
L217:
	#d8	"N"
	#d8	"e"
	#d8	"x"
	#d8	"t"
	#d8	32
	#d8	"c"
	#d8	"l"
	#d8	"u"
	#d8	"s"
	#d8	"t"
	#d8	"e"
	#d8	"r"
	#d8	32
	#d8	91
	#d8	37
	#d8	"x"
	#d8	93
	#d8	9
	#d8	0
	#d8	0
	#bank text
	lw	a0, -4(fp)
	push	a0, sp
	la	a0, L217
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 1911
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -4(fp)
	j	L204
L204:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cfat12_create_entry
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
	li	a0, 1
	pop	a1, sp
	beq	a1, a0, L226
	j	L225
L226:
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
	blt	a1, a0, L228
	j	L227
L228:
	lw	a0, -656(fp)
	j	L218
L227:
	#bank data
L229:
	#d8	"C"
	#d8	"r"
	#d8	"e"
	#d8	"a"
	#d8	"t"
	#d8	"i"
	#d8	"n"
	#d8	"g"
	#d8	32
	#d8	"f"
	#d8	"i"
	#d8	"l"
	#d8	"e"
	#d8	32
	#d8	37
	#d8	"s"
	#d8	44
	#d8	32
	#d8	"D"
	#d8	"A"
	#d8	"T"
	#d8	"E"
	#d8	58
	#d8	32
	#d8	37
	#d8	"d"
	#d8	32
	#d8	"T"
	#d8	"I"
	#d8	"M"
	#d8	"E"
	#d8	58
	#d8	32
	#d8	37
	#d8	"d"
	#d8	32
	#d8	"M"
	#d8	"S"
	#d8	58
	#d8	32
	#d8	37
	#d8	"d"
	#d8	10
	#d8	0
	#bank text
	li	a0, 16
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 20
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	la	a0, L229
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 24
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
	li	a0, 36
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
	j	L230
L225:
	li	a0, -49
	j	L218
L230:
	j	L231
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
	blt	a1, a0, L233
	j	L232
L233:
	lw	a0, -656(fp)
	j	L218
L232:
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
	li	a0, 36
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
L231:
L218:
	addi	sp, sp, 784
	pop	fp, sp
	ret
	;#globl	Cfat12_get_cluster
	#align 32
Cfat12_get_cluster:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -112
	li	a0, 32
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
	beqz	a0, L235
	j	TLlfat12_get_cluster_cleanup
L235:
	li	a0, 0
	sw	a0, -4(fp)
L236:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 28
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	blt	a1, a0, L240
	j	L238
L240:
	j	L237
L239:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L236
L237:
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
	li	a0, 36
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
	beqz	a0, L241
	j	TLlfat12_get_cluster_cleanup
L241:
	li	a0, 0
	sw	a0, -8(fp)
L242:
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
	blt	a1, a0, L246
	j	L244
L246:
	j	L243
L245:
	li	a0, 3
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
	j	L242
L243:
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
	beq	a1, a0, L248
	j	L247
L248:
	lw	a0, 12(fp)
	beqz	a0, L249
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
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sectors
	pop	ra, sp
	addi	sp, sp, 16
L249:
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
L247:
	li	a0, 0
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	beq	a1, a0, L251
	j	L250
L251:
	lw	a0, 12(fp)
	beqz	a0, L252
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
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sectors
	pop	ra, sp
	addi	sp, sp, 16
L252:
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
L250:
	j	L245
L244:
	j	L239
L238:
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
	j	L234
L234:
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
	beq	a1, a0, L255
	j	L254
L255:
	addi	a0, fp, -84
	lw	a0, 0(a0)
	j	L253
L254:
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
	beqz	a0, L256
	addi	a0, fp, -84
	lw	a0, 0(a0)
	j	L253
L256:
	lw	a0, -168(fp)
	push	a0, sp
	addi	a0, fp, -164
	push	a0, sp
	push	ra, sp
	call	Cfat12_get_mount_info
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -168(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 36
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
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 36
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
	li	a0, 36
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
	j	L253
L253:
	addi	sp, sp, 168
	pop	fp, sp
	ret
	;#globl	Cfat12_init
	#align 32
Cfat12_init:	push	fp, sp
	mv	fp, sp
	#bank data
L258:
	#d8	"F"
	#d8	"A"
	#d8	"T"
	#d8	"1"
	#d8	"2"
	#d8	0
	#d8	0
	#d8	0
	#bank text
	la	a0, L258
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
	la	a0, Cfat12_read
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_close
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_open
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 28
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Cfat12_seek
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
L257:
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
	li	a0, 0
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
	beqz	a0, L260
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
L260:
	beqz	a0, L261
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
	j	L259
L261:
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L263
	j	L262
L263:
	li	a0, -44
	j	L259
L262:
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L265
	j	L264
L265:
	li	a0, -42
	j	L259
L264:
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
	beq	a1, a0, L267
	j	L266
L267:
	li	a0, -41
	j	L259
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
	li	a0, 32
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
	beqz	a0, L268
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -160
	lw	a0, 0(a0)
	j	L259
L268:
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
	li	a0, 36
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
	beqz	a0, L269
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -160
	lw	a0, 0(a0)
	j	L259
L269:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	blt	a1, a0, L271
	j	L270
L271:
	llw	a0, Cfat12_dont_read
	bnez	a0, L272
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
L272:
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
	j	L259
	j	L273
L270:
	llw	a0, Cfat12_dont_read
	bnez	a0, L274
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
L274:
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
L273:
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
	beqz	a0, L275
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -160
	lw	a0, 0(a0)
	j	L259
L275:
	li	a0, 0
	sw	a0, -4(fp)
L276:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -60(fp)
	pop	a1, sp
	blt	a1, a0, L280
	j	L278
L280:
	j	L277
L279:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L276
L277:
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
	li	a0, 36
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
	beqz	a0, L281
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
	j	L259
L281:
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
	beqz	a0, L282
	lw	a0, -40(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	j	L283
L282:
	li	a0, 4095
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	and	a0, a0, a1
L283:
	sw	a0, -40(fp)
	lw	a0, -40(fp)
	push	a0, sp
	li	a0, 4088
	pop	a1, sp
	bge	a1, a0, L285
	j	L284
L285:
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
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L288
	j	L286
L288:
	li	a0, -1
	j	L287
L286:
	li	a0, 0
L287:
	j	L259
L284:
	li	a0, 0
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	beq	a1, a0, L290
	j	L289
L290:
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
	j	L259
L289:
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
	li	a0, 36
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
	beqz	a0, L291
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
	j	L259
L291:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	slt	a0, a1, a0
	beqz	a0, L292
	llw	a0, Cfat12_dont_read
	seqz	a0, a0
L292:
	beqz	a0, L293
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
	j	L278
	j	L294
L293:
	llw	a0, Cfat12_dont_read
	bnez	a0, L295
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
L295:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, 16(fp)
L294:
	j	L279
L278:
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
	j	L259
L259:
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
	beq	a1, a0, L298
	j	L297
L298:
	addi	a0, fp, -84
	push	a0, sp
	li	a0, -41
	pop	a1, sp
	sw	a0, 0(a1)
	j	TLlfat12_open_end
L297:
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
	beqz	a0, L299
	j	TLlfat12_open_end
L299:
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
	j	L296
L296:
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
L300:
	pop	fp, sp
	ret
	;#globl	Cfat12_seek
	#align 32
Cfat12_seek:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 16(fp)
	j	L303
L304:
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
	j	L302
L305:
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
	j	L302
L306:
	li	a0, -2
	sw	a0, -4(fp)
	j	L302
	j	L302
L303:
	la	a1, L307
	j	switch
L307:
	#d32	2
	#d32	0, L304
	#d32	1, L305
	#d32	L306
L302:
	lw	a0, -4(fp)
	j	L301
L301:
	addi	sp, sp, 4
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
	beq	a1, a0, L310
	j	L309
L310:
	li	a0, -44
	j	L308
L309:
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L312
	j	L311
L312:
	li	a0, -42
	j	L308
L311:
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
	beq	a1, a0, L314
	j	L313
L314:
	li	a0, -41
	j	L308
L313:
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
	li	a0, 32
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
	beqz	a0, L315
	j	TLlfat12_write_cleanup
L315:
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	sb	a0, 0(a1)
	#bank data
L316:
	#d8	"W"
	#d8	"r"
	#d8	"i"
	#d8	"t"
	#d8	"i"
	#d8	"n"
	#d8	"g"
	#d8	32
	#d8	37
	#d8	"d"
	#d8	32
	#d8	"b"
	#d8	"y"
	#d8	"t"
	#d8	"e"
	#d8	"s"
	#d8	32
	#d8	"t"
	#d8	"o"
	#d8	32
	#d8	"f"
	#d8	"i"
	#d8	"l"
	#d8	"e"
	#d8	32
	#d8	37
	#d8	"s"
	#d8	58
	#d8	32
	#d8	"s"
	#d8	"e"
	#d8	"c"
	#d8	"t"
	#d8	"o"
	#d8	"r"
	#d8	32
	#d8	37
	#d8	"x"
	#d8	32
	#d8	40
	#d8	37
	#d8	"x"
	#d8	44
	#d8	32
	#d8	37
	#d8	"x"
	#d8	44
	#d8	32
	#d8	37
	#d8	"d"
	#d8	41
	#d8	32
	#d8	"c"
	#d8	"l"
	#d8	"u"
	#d8	"s"
	#d8	"t"
	#d8	"e"
	#d8	"r"
	#d8	32
	#d8	37
	#d8	"x"
	#d8	10
	#d8	0
	#bank text
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
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
	li	a0, 36
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	la	a0, L316
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 36
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 15
	pop	a1, sp
	sb	a0, 0(a1)
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
	li	a0, 1365
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -20(fp)
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
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
	li	a0, 36
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
	beqz	a0, L317
	j	TLlfat12_write_cleanup
L317:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -32(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	blt	a1, a0, L319
	j	L318
L319:
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
	li	a0, 36
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
	j	L320
L318:
	#bank data
L321:
	#d8	"N"
	#d8	"e"
	#d8	"e"
	#d8	"d"
	#d8	"e"
	#d8	"d"
	#d8	58
	#d8	32
	#d8	37
	#d8	"d"
	#d8	44
	#d8	32
	#d8	"p"
	#d8	"o"
	#d8	"s"
	#d8	58
	#d8	32
	#d8	37
	#d8	"d"
	#d8	44
	#d8	32
	#d8	"s"
	#d8	"i"
	#d8	"z"
	#d8	"e"
	#d8	58
	#d8	32
	#d8	37
	#d8	"d"
	#d8	10
	#d8	0
	#d8	0
	#bank text
	lw	a0, -40(fp)
	push	a0, sp
	lw	a0, -32(fp)
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	la	a0, L321
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 20
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
	beqz	a0, L322
	li	a0, 1
	j	L323
L322:
	li	a0, 0
L323:
	push	a0, sp
	lw	a0, -36(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -36(fp)
	#bank data
L324:
	#d8	"C"
	#d8	"l"
	#d8	"u"
	#d8	"s"
	#d8	"t"
	#d8	"e"
	#d8	"r"
	#d8	"s"
	#d8	32
	#d8	"t"
	#d8	"o"
	#d8	32
	#d8	"w"
	#d8	"r"
	#d8	"i"
	#d8	"t"
	#d8	"e"
	#d8	58
	#d8	32
	#d8	37
	#d8	"d"
	#d8	46
	#d8	32
	#d8	"W"
	#d8	"r"
	#d8	"i"
	#d8	"t"
	#d8	"i"
	#d8	"n"
	#d8	"g"
	#d8	32
	#d8	37
	#d8	"d"
	#d8	32
	#d8	"b"
	#d8	"y"
	#d8	"t"
	#d8	"e"
	#d8	"s"
	#d8	32
	#d8	"i"
	#d8	"n"
	#d8	32
	#d8	"l"
	#d8	"o"
	#d8	"a"
	#d8	"d"
	#d8	"e"
	#d8	"d"
	#d8	32
	#d8	"c"
	#d8	"l"
	#d8	"u"
	#d8	"s"
	#d8	"t"
	#d8	"e"
	#d8	"r"
	#d8	10
	#d8	0
	#d8	0
	#bank text
	lw	a0, -40(fp)
	push	a0, sp
	lw	a0, -32(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	lw	a0, -36(fp)
	push	a0, sp
	la	a0, L324
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 16
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
	li	a0, 36
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
	beqz	a0, L325
	j	TLlfat12_write_cleanup
L325:
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
L326:
	lw	a0, -16(fp)
	push	a0, sp
	lw	a0, -36(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	blt	a1, a0, L330
	j	L328
L330:
	j	L327
L329:
	lw	a0, -16(fp)
	lw	t0, -16(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -16(fp)
	j	L326
L327:
	li	a0, 6908265
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
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
	blt	a1, a0, L332
	j	L331
L332:
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	j	TLlfat12_write_cleanup
L331:
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
	li	a0, 1366
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
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
	li	a0, 36
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
	beqz	a0, L333
	j	TLlfat12_write_cleanup
L333:
	lw	a0, -24(fp)
	sw	a0, -20(fp)
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
	li	a0, 36
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
	beqz	a0, L334
	j	TLlfat12_write_cleanup
L334:
	j	L329
L328:
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
	blt	a1, a0, L336
	j	L335
L336:
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	j	TLlfat12_write_cleanup
L335:
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
	li	a0, 1367
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
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
	li	a0, 36
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
	beqz	a0, L337
	j	TLlfat12_write_cleanup
L337:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -44(fp)
	#bank data
L338:
	#d8	"W"
	#d8	"r"
	#d8	"i"
	#d8	"t"
	#d8	"i"
	#d8	"n"
	#d8	"g"
	#d8	32
	#d8	37
	#d8	"d"
	#d8	32
	#d8	40
	#d8	"c"
	#d8	"u"
	#d8	"r"
	#d8	"r"
	#d8	32
	#d8	37
	#d8	"d"
	#d8	41
	#d8	32
	#d8	"b"
	#d8	"y"
	#d8	"t"
	#d8	"e"
	#d8	"s"
	#d8	32
	#d8	"i"
	#d8	"n"
	#d8	32
	#d8	"t"
	#d8	"h"
	#d8	"e"
	#d8	32
	#d8	"t"
	#d8	"a"
	#d8	"i"
	#d8	"l"
	#d8	32
	#d8	"c"
	#d8	"l"
	#d8	"u"
	#d8	"s"
	#d8	"t"
	#d8	"e"
	#d8	"r"
	#d8	32
	#d8	91
	#d8	37
	#d8	"x"
	#d8	93
	#d8	10
	#d8	0
	#d8	0
	#d8	0
	#d8	0
	#bank text
	lw	a0, -24(fp)
	push	a0, sp
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, -44(fp)
	push	a0, sp
	la	a0, L338
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 20
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
	li	a0, 36
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
	beqz	a0, L339
	j	TLlfat12_write_cleanup
L339:
	lw	a0, -24(fp)
	sw	a0, -28(fp)
L320:
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
	beqz	a0, L340
	lw	a0, 16(fp)
	j	L341
L340:
	li	a0, 0
L341:
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
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_update_entry
	pop	ra, sp
	addi	sp, sp, 4
TLlfat12_write_cleanup:
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -136
	lw	a0, 0(a0)
	j	L308
L308:
	addi	sp, sp, 136
	pop	fp, sp
	ret
