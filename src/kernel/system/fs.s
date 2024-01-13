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
L20:
	lw	a0, 12(fp)
	lw	t0, 12(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, 12(fp)
	lbu	a0, 0(a0);notaligned
	sb	a0, -1(fp)
	beqz	a0, L19
	li	a0, 47
	push	a0, sp
	mv	a0, zero
	lbu	a0, -1(fp)
	pop	a1, sp
	beq	a1, a0, L22
	j	L21
L22:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, 12(fp)
	j	L18
L21:
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
	j	L20
L19:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 0
	j	L18
L18:
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
L24:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a0, a1, L28
	j	L26
L28:
	j	L25
L27:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	subi	t0, t0, 1; cgdeclw
	sw	t0, -8(fp)
	j	L24
L25:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 47
	pop	a1, sp
	beq	a1, a0, L30
	j	L29
L30:
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
	j	L23
L29:
	j	L27
L26:
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, 8(fp)
	j	L23
L23:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cfs_fname_from_path
	#align 32
Cfs_fname_from_path:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cstrlen
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -8(fp)
	lw	a0, -8(fp)
	sw	a0, -4(fp)
L32:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a0, a1, L36
	j	L34
L36:
	j	L33
L35:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	subi	t0, t0, 1; cgdeclw
	sw	t0, -4(fp)
	j	L32
L33:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 47
	pop	a1, sp
	beq	a1, a0, L38
	j	L37
L38:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	j	L31
L37:
	j	L35
L34:
	lw	a0, 8(fp)
	j	L31
L31:
	addi	sp, sp, 8
	pop	fp, sp
	ret
	;#globl	Cfs_open_file
	#align 32
Cfs_open_file:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -16
	lw	a0, 12(fp)
	beqz	a0, L40
	li	a0, 0
	sw	a0, -4(fp)
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
	beq	a1, a0, L42
	j	L41
L42:
	lw	a0, 12(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
L41:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -16(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L44
	j	L43
L44:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, -42
	j	L39
	j	L45
L43:
	lw	a0, -16(fp)
	beqz	a0, L46
	li	a0, 44
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 12(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 16
	sw	a0, -12(fp)
	lw	a0, -12(fp)
	beqz	a0, L47
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, -12(fp)
	j	L39
L47:
	lw	a0, 16(fp)
	j	L49
L50:
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
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
	j	L48
L51:
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 262144
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L52:
	j	L48
L53:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, -54
	j	L39
	j	L48
	j	L48
L49:
	la	a1, L54
	j	switch
L54:
	#d32	3
	#d32	0, L50
	#d32	1, L51
	#d32	2, L52
	#d32	L53
L48:
	#bank data
L55:
	#d8	"O"
	#d8	"p"
	#d8	"e"
	#d8	"n"
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
	#d8	"w"
	#d8	"i"
	#d8	"t"
	#d8	"h"
	#d8	32
	#d8	"f"
	#d8	"l"
	#d8	"a"
	#d8	"g"
	#d8	"s"
	#d8	32
	#d8	91
	#d8	37
	#d8	"p"
	#d8	93
	#d8	10
	#d8	0
	#d8	0
	#d8	0
	#bank text
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	la	a0, L55
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 16
	j	L56
L46:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, -41
	j	L39
L56:
L45:
	j	L57
L40:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, -40
	j	L39
L57:
L39:
	addi	sp, sp, 16
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
	beq	a1, a0, L60
	j	L59
L60:
	li	a0, -44
	j	L58
L59:
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
	beq	a1, a0, L62
	j	L61
L62:
	li	a0, -41
	j	L58
L61:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L64
	j	L63
L64:
	li	a0, -53
	j	L58
L63:
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
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 12(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 16
	j	L58
L58:
	pop	fp, sp
	ret
	;#globl	Cfs_write_file
	#align 32
Cfs_write_file:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L67
	j	L66
L67:
	li	a0, -44
	j	L65
L66:
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
	beq	a1, a0, L69
	j	L68
L69:
	li	a0, -41
	j	L65
L68:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L71
	j	L70
L71:
	li	a0, -53
	j	L65
L70:
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
	li	a0, 36
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 12(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 16
	j	L65
L65:
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
	beq	a1, a0, L74
	j	L73
L74:
	li	a0, -44
	j	L72
L73:
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
	beq	a1, a0, L76
	j	L75
L76:
	li	a0, -41
	j	L72
L75:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L78
	j	L77
L78:
	li	a0, -53
	j	L72
L77:
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
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 4(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 8
	j	L72
L72:
	pop	fp, sp
	ret
	;#globl	Cfs_create_file
	#align 32
Cfs_create_file:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L81
	j	L80
L81:
	li	a0, -40
	j	L79
L80:
	li	a0, 0
	sw	a0, -4(fp)
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	beq	a1, a0, L83
	j	L82
L83:
	lw	a0, 8(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
L82:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -12(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L85
	j	L84
L85:
	li	a0, -42
	j	L79
	j	L86
L84:
	li	a0, 0
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	beq	a1, a0, L88
	j	L87
L88:
	li	a0, -43
	j	L79
L87:
L86:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, 12(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 16
	j	L79
L79:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cfs_delete_file
	#align 32
Cfs_delete_file:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L91
	j	L90
L91:
	li	a0, -40
	j	L89
L90:
	li	a0, 0
	sw	a0, -4(fp)
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	beq	a1, a0, L93
	j	L92
L93:
	lw	a0, 8(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
L92:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -12(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L95
	j	L94
L95:
	li	a0, -42
	j	L89
	j	L96
L94:
	li	a0, 0
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	beq	a1, a0, L98
	j	L97
L98:
	li	a0, -43
	j	L89
L97:
L96:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, 8(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 12
	j	L89
L89:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cfs_create_dir
	#align 32
Cfs_create_dir:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L101
	j	L100
L101:
	li	a0, -40
	j	L99
L100:
	li	a0, 0
	sw	a0, -4(fp)
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	beq	a1, a0, L103
	j	L102
L103:
	lw	a0, 8(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
L102:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -12(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L105
	j	L104
L105:
	li	a0, -42
	j	L99
	j	L106
L104:
	li	a0, 0
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	beq	a1, a0, L108
	j	L107
L108:
	li	a0, -43
	j	L99
L107:
L106:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
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
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, 8(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 12
	j	L99
L99:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cfs_delete_dir
	#align 32
Cfs_delete_dir:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L111
	j	L110
L111:
	li	a0, -40
	j	L109
L110:
	li	a0, 0
	sw	a0, -4(fp)
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	beq	a1, a0, L113
	j	L112
L113:
	lw	a0, 8(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
L112:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -12(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L115
	j	L114
L115:
	li	a0, -42
	j	L109
	j	L116
L114:
	li	a0, 0
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	beq	a1, a0, L118
	j	L117
L118:
	li	a0, -43
	j	L109
L117:
L116:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, 8(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 12
	j	L109
L109:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cfs_rename
	#align 32
Cfs_rename:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
	bnez	a0, L120
	li	a0, 0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
L120:
	beqz	a0, L121
	li	a0, -40
	j	L119
L121:
	li	a0, 0
	sw	a0, -4(fp)
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
	bnez	a0, L122
	li	a0, 1
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
L122:
	beqz	a0, L123
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
	beqz	a0, L124
	li	a0, 1
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
	beqz	a0, L124
	lw	a0, 8(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	lw	a0, 12(fp)
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sub	a0, a1, a0
	snez	a0, a0
L124:
	beqz	a0, L125
	li	a0, -58
	j	L119
L125:
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	beq	a1, a0, L128
	j	L126
L128:
	lw	a0, 8(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	j	L127
L126:
	lw	a0, 12(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
L127:
	sw	a0, -4(fp)
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
L123:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -12(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L130
	j	L129
L130:
	li	a0, -42
	j	L119
	j	L131
L129:
	li	a0, 0
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	beq	a1, a0, L133
	j	L132
L133:
	li	a0, -43
	j	L119
L132:
L131:
	la	a0, Cfilesystems
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 28
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, 12(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 16
	j	L119
L119:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cfs_lseek
	#align 32
Cfs_lseek:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L136
	j	L135
L136:
	li	a0, -44
	j	L134
L135:
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
	beq	a1, a0, L138
	j	L137
L138:
	li	a0, -41
	j	L134
L137:
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
	li	a0, 48
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 4(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 8
	j	L134
L134:
	pop	fp, sp
	ret
	;#globl	Cfs_rewind
	#align 32
Cfs_rewind:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L141
	j	L140
L141:
	li	a0, -44
	j	L139
L140:
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
	beq	a1, a0, L143
	j	L142
L143:
	li	a0, -41
	j	L139
L142:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L145
	j	L144
L145:
	li	a0, -53
	j	L139
L144:
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
	li	a0, 48
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 12(sp)
	lw	a0, 0(a0)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 16
	j	L139
L139:
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
	bge	a1, a0, L148
	j	L147
L148:
	li	a0, -42
	j	L146
L147:
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L150
	j	L149
L150:
	li	a0, -43
	j	L146
L149:
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
	j	L146
L146:
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
	beq	a1, a0, L153
	j	L152
L153:
	li	a0, -43
	j	L151
L152:
	li	a0, 0
	sw	a0, -4(fp)
L154:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	blt	a1, a0, L158
	j	L156
L158:
	j	L155
L157:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L154
L155:
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
	beq	a1, a0, L160
	j	L159
L160:
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
L159:
	j	L157
L156:
	li	a0, 0
	j	L151
L151:
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
	bge	a1, a0, L163
	j	L162
L163:
	li	a0, -42
	j	L161
L162:
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
	j	L161
L161:
	pop	fp, sp
	ret
