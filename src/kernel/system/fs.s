	#bank text
	#bank data
	;#globl	Cfilesystems
	Cfilesystems:	#res 104
	;#globl	Cfs_currid
Cfs_currid:	#d32	0
	#bank text
	;#globl	Cfs_next_subpath
	#align 32
Cfs_next_subpath:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	lw	a0, 8(fp)
	sw	a0, -8(fp)
L11:
	lw	a0, 12(fp)
	lw	t0, 12(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, 12(fp)
	lbu	a0, 0(a0);notaligned
	sb	a0, -1(fp)
	beqz	a0, L10
	li	a0, 47
	push	a0, sp
	mv	a0, zero
	lbu	a0, -1(fp)
	pop	a1, sp
	beq	a1, a0, L13
	j	L12
L13:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, 12(fp)
	j	L9
L12:
	lw	a0, -8(fp)
	push	a0, sp
	mv	a0, zero
	lbu	a0, -1(fp)
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	j	L11
L10:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 0
	j	L9
L9:
	addi	sp, sp, 8
	pop	fp, sp
	ret
	;#globl	Cfs_path_and_fname
	#align 32
Cfs_path_and_fname:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cstrlen
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -12(fp)
	lw	a0, -12(fp)
	sw	a0, -8(fp)
L15:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a0, a1, L19
	j	L17
L19:
	j	L16
L18:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	subi	t0, t0, 1; cgdeclw
	sw	t0, -8(fp)
	j	L15
L16:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 47
	pop	a1, sp
	beq	a1, a0, L21
	j	L20
L21:
	li	a0, 65793
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Cmemcpy
	pop	ra, sp
	addi	sp, sp, 12
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	j	L14
L20:
	j	L18
L17:
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, 8(fp)
	j	L14
L14:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cfs_open_file
	#align 32
Cfs_open_file:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	lw	a0, 12(fp)
	beqz	a0, L23
	li	a0, 97
	sb	a0, -1(fp)
	lw	a0, 12(fp)
	sw	a0, -8(fp)
	li	a0, 1
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	beq	a1, a0, L25
	j	L24
L25:
	lw	a0, 12(fp)
	lbu	a0, 0(a0);notaligned
	sb	a0, -1(fp)
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
L24:
	la	a0, Cfilesystems
	push	a0, sp
	mv	a0, zero
	lbu	a0, -1(fp)
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	beqz	a0, L26
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	mv	a0, zero
	lbu	a0, -1(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Cfilesystems
	push	a0, sp
	mv	a0, zero
	lbu	a0, -1(fp)
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -12(fp)
	lw	a0, -12(fp)
	j	L22
	j	L27
L26:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, -41
	j	L22
L27:
	j	L28
L23:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, -40
	j	L22
L28:
L22:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cfs_read_file
	#align 32
Cfs_read_file:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L31
	j	L30
L31:
	li	a0, -44
	j	L29
L30:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L33
	j	L32
L33:
	li	a0, -41
	j	L29
L32:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 12
	j	L29
L29:
	pop	fp, sp
	ret
	;#globl	Cfs_close_file
	#align 32
Cfs_close_file:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L36
	j	L35
L36:
	li	a0, -44
	j	L34
L35:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L38
	j	L37
L38:
	li	a0, -41
	j	L34
L37:
	la	a0, Cfilesystems
	push	a0, sp
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 20
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 4
	j	L34
L34:
	pop	fp, sp
	ret
	;#globl	Cfs_register_fs
	#align 32
Cfs_register_fs:	push	fp, sp
	mv	fp, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L41
	j	L40
L41:
	li	a0, -42
	j	L39
L40:
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L43
	j	L42
L43:
	li	a0, -43
	j	L39
L42:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, 12(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	j	L39
L39:
	pop	fp, sp
	ret
	;#globl	Cfs_unregister_fs
	#align 32
Cfs_unregister_fs:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L46
	j	L45
L46:
	li	a0, -43
	j	L44
L45:
	li	a0, 0
	sw	a0, -4(fp)
L47:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	blt	a1, a0, L51
	j	L49
L51:
	j	L48
L50:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L47
L48:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L53
	j	L52
L53:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
L52:
	j	L50
L49:
	li	a0, 0
	j	L44
L44:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cfs_unregister_fs_byid
	#align 32
Cfs_unregister_fs_byid:	push	fp, sp
	mv	fp, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L56
	j	L55
L56:
	li	a0, -42
	j	L54
L55:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, 8(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	j	L54
L54:
	pop	fp, sp
	ret
