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
	bne	a1, a0, L3SYS
	j	L2SYS
L3SYS:
	li	a0, -70
	j	L1SYS
L2SYS:
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
	beqz	a0, L4SYS
	lw	a0, -8(fp)
	j	L1SYS
L4SYS:
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
	beqz	a0, L5SYS
	lw	a0, -8(fp)
	j	L1SYS
L5SYS:
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
	beqz	a0, L6SYS
	lw	a0, -8(fp)
	j	L1SYS
L6SYS:
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
	beqz	a0, L7SYS
	lw	a0, -8(fp)
	j	L1SYS
L7SYS:
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
	beqz	a0, L8SYS
	li	a0, -1
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	sub	a0, a1, a0
	snez	a0, a0
L8SYS:
	beqz	a0, L9SYS
	lw	a0, -8(fp)
	j	L1SYS
L9SYS:
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	j	L1SYS
L1SYS:
	addi	sp, sp, 44
	pop	fp, sp
	ret
	#bank text
	;#globl	Cpanic
	#align 32
Cpanic:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	li	a0, 15011840
	sw	a0, -4(fp)
	li	a0, 0
	sw	a0, -8(fp)
L11SYS:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 4000
	pop	a1, sp
	blt	a1, a0, L15SYS
	j	L13SYS
L15SYS:
	j	L12SYS
L14SYS:
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
	j	L11SYS
L12SYS:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 33
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 1
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 248
	pop	a1, sp
	sb	a0, 0(a1)
	j	L14SYS
L13SYS:
L17SYS:
	li	a0, 1
	beqz	a0, L16SYS
	j	L17SYS
L16SYS:
L10SYS:
	addi	sp, sp, 8
	pop	fp, sp
	ret
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
L20SYS:
	lw	a0, 12(fp)
	lw	t0, 12(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, 12(fp)
	lbu	a0, 0(a0);notaligned
	sb	a0, -1(fp)
	beqz	a0, L19SYS
	li	a0, 47
	push	a0, sp
	mv	a0, zero
	lbu	a0, -1(fp)
	pop	a1, sp
	beq	a1, a0, L22SYS
	j	L21SYS
L22SYS:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, 12(fp)
	j	L18SYS
L21SYS:
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
	j	L20SYS
L19SYS:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 0
	j	L18SYS
L18SYS:
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
L24SYS:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a0, a1, L28SYS
	j	L26SYS
L28SYS:
	j	L25SYS
L27SYS:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	subi	t0, t0, 1; cgdeclw
	sw	t0, -8(fp)
	j	L24SYS
L25SYS:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 47
	pop	a1, sp
	beq	a1, a0, L30SYS
	j	L29SYS
L30SYS:
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
	j	L23SYS
L29SYS:
	j	L27SYS
L26SYS:
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, 8(fp)
	j	L23SYS
L23SYS:
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
L32SYS:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a0, a1, L36SYS
	j	L34SYS
L36SYS:
	j	L33SYS
L35SYS:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	subi	t0, t0, 1; cgdeclw
	sw	t0, -4(fp)
	j	L32SYS
L33SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 47
	pop	a1, sp
	beq	a1, a0, L38SYS
	j	L37SYS
L38SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	j	L31SYS
L37SYS:
	j	L35SYS
L34SYS:
	lw	a0, 8(fp)
	j	L31SYS
L31SYS:
	addi	sp, sp, 8
	pop	fp, sp
	ret
	;#globl	Cfs_open_file
	#align 32
Cfs_open_file:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -16
	lw	a0, 12(fp)
	beqz	a0, L40SYS
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
	beq	a1, a0, L42SYS
	j	L41SYS
L42SYS:
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
L41SYS:
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
	bge	a1, a0, L44SYS
	j	L43SYS
L44SYS:
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
	j	L39SYS
	j	L45SYS
L43SYS:
	lw	a0, -16(fp)
	beqz	a0, L46SYS
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
	beqz	a0, L47SYS
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
	j	L39SYS
L47SYS:
	lw	a0, 16(fp)
	j	L49SYS
L50SYS:
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
	j	L48SYS
L51SYS:
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
L52SYS:
	j	L48SYS
L53SYS:
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
	j	L39SYS
	j	L48SYS
	j	L48SYS
L49SYS:
	la	a1, L54SYS
	j	switch
L54SYS:
	#d32	3
	#d32	0, L50SYS
	#d32	1, L51SYS
	#d32	2, L52SYS
	#d32	L53SYS
L48SYS:
	#bank data
L55SYS:
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
	la	a0, L55SYS
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 16
	j	L56SYS
L46SYS:
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
	j	L39SYS
L56SYS:
L45SYS:
	j	L57SYS
L40SYS:
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
	j	L39SYS
L57SYS:
L39SYS:
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
	beq	a1, a0, L60SYS
	j	L59SYS
L60SYS:
	li	a0, -44
	j	L58SYS
L59SYS:
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
	beq	a1, a0, L62SYS
	j	L61SYS
L62SYS:
	li	a0, -41
	j	L58SYS
L61SYS:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L64SYS
	j	L63SYS
L64SYS:
	li	a0, -53
	j	L58SYS
L63SYS:
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
	j	L58SYS
L58SYS:
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
	beq	a1, a0, L67SYS
	j	L66SYS
L67SYS:
	li	a0, -44
	j	L65SYS
L66SYS:
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
	beq	a1, a0, L69SYS
	j	L68SYS
L69SYS:
	li	a0, -41
	j	L65SYS
L68SYS:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L71SYS
	j	L70SYS
L71SYS:
	li	a0, -53
	j	L65SYS
L70SYS:
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
	j	L65SYS
L65SYS:
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
	beq	a1, a0, L74SYS
	j	L73SYS
L74SYS:
	li	a0, -44
	j	L72SYS
L73SYS:
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
	beq	a1, a0, L76SYS
	j	L75SYS
L76SYS:
	li	a0, -41
	j	L72SYS
L75SYS:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L78SYS
	j	L77SYS
L78SYS:
	li	a0, -53
	j	L72SYS
L77SYS:
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
	j	L72SYS
L72SYS:
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
	beq	a1, a0, L81SYS
	j	L80SYS
L81SYS:
	li	a0, -40
	j	L79SYS
L80SYS:
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
	beq	a1, a0, L83SYS
	j	L82SYS
L83SYS:
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
L82SYS:
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
	bge	a1, a0, L85SYS
	j	L84SYS
L85SYS:
	li	a0, -42
	j	L79SYS
	j	L86SYS
L84SYS:
	li	a0, 0
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	beq	a1, a0, L88SYS
	j	L87SYS
L88SYS:
	li	a0, -43
	j	L79SYS
L87SYS:
L86SYS:
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
	j	L79SYS
L79SYS:
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
	beq	a1, a0, L91SYS
	j	L90SYS
L91SYS:
	li	a0, -40
	j	L89SYS
L90SYS:
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
	beq	a1, a0, L93SYS
	j	L92SYS
L93SYS:
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
L92SYS:
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
	bge	a1, a0, L95SYS
	j	L94SYS
L95SYS:
	li	a0, -42
	j	L89SYS
	j	L96SYS
L94SYS:
	li	a0, 0
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	beq	a1, a0, L98SYS
	j	L97SYS
L98SYS:
	li	a0, -43
	j	L89SYS
L97SYS:
L96SYS:
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
	j	L89SYS
L89SYS:
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
	beq	a1, a0, L101SYS
	j	L100SYS
L101SYS:
	li	a0, -40
	j	L99SYS
L100SYS:
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
	beq	a1, a0, L103SYS
	j	L102SYS
L103SYS:
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
L102SYS:
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
	bge	a1, a0, L105SYS
	j	L104SYS
L105SYS:
	li	a0, -42
	j	L99SYS
	j	L106SYS
L104SYS:
	li	a0, 0
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	beq	a1, a0, L108SYS
	j	L107SYS
L108SYS:
	li	a0, -43
	j	L99SYS
L107SYS:
L106SYS:
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
	j	L99SYS
L99SYS:
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
	beq	a1, a0, L111SYS
	j	L110SYS
L111SYS:
	li	a0, -40
	j	L109SYS
L110SYS:
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
	beq	a1, a0, L113SYS
	j	L112SYS
L113SYS:
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
L112SYS:
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
	bge	a1, a0, L115SYS
	j	L114SYS
L115SYS:
	li	a0, -42
	j	L109SYS
	j	L116SYS
L114SYS:
	li	a0, 0
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	beq	a1, a0, L118SYS
	j	L117SYS
L118SYS:
	li	a0, -43
	j	L109SYS
L117SYS:
L116SYS:
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
	j	L109SYS
L109SYS:
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
	bnez	a0, L120SYS
	li	a0, 0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
L120SYS:
	beqz	a0, L121SYS
	li	a0, -40
	j	L119SYS
L121SYS:
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
	bnez	a0, L122SYS
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
L122SYS:
	beqz	a0, L123SYS
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
	beqz	a0, L124SYS
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
	beqz	a0, L124SYS
	lw	a0, 8(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	lw	a0, 12(fp)
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sub	a0, a1, a0
	snez	a0, a0
L124SYS:
	beqz	a0, L125SYS
	li	a0, -58
	j	L119SYS
L125SYS:
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 58
	pop	a1, sp
	beq	a1, a0, L128SYS
	j	L126SYS
L128SYS:
	lw	a0, 8(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	j	L127SYS
L126SYS:
	lw	a0, 12(fp)
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 97
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
L127SYS:
	sw	a0, -4(fp)
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
L123SYS:
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
	bge	a1, a0, L130SYS
	j	L129SYS
L130SYS:
	li	a0, -42
	j	L119SYS
	j	L131SYS
L129SYS:
	li	a0, 0
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	beq	a1, a0, L133SYS
	j	L132SYS
L133SYS:
	li	a0, -43
	j	L119SYS
L132SYS:
L131SYS:
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
	j	L119SYS
L119SYS:
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
	beq	a1, a0, L136SYS
	j	L135SYS
L136SYS:
	li	a0, -44
	j	L134SYS
L135SYS:
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
	beq	a1, a0, L138SYS
	j	L137SYS
L138SYS:
	li	a0, -41
	j	L134SYS
L137SYS:
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
	j	L134SYS
L134SYS:
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
	beq	a1, a0, L141SYS
	j	L140SYS
L141SYS:
	li	a0, -44
	j	L139SYS
L140SYS:
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
	beq	a1, a0, L143SYS
	j	L142SYS
L143SYS:
	li	a0, -41
	j	L139SYS
L142SYS:
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L145SYS
	j	L144SYS
L145SYS:
	li	a0, -53
	j	L139SYS
L144SYS:
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
	j	L139SYS
L139SYS:
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
	bge	a1, a0, L148SYS
	j	L147SYS
L148SYS:
	li	a0, -42
	j	L146SYS
L147SYS:
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L150SYS
	j	L149SYS
L150SYS:
	li	a0, -43
	j	L146SYS
L149SYS:
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
	j	L146SYS
L146SYS:
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
	beq	a1, a0, L153SYS
	j	L152SYS
L153SYS:
	li	a0, -43
	j	L151SYS
L152SYS:
	li	a0, 0
	sw	a0, -4(fp)
L154SYS:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	blt	a1, a0, L158SYS
	j	L156SYS
L158SYS:
	j	L155SYS
L157SYS:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L154SYS
L155SYS:
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
	beq	a1, a0, L160SYS
	j	L159SYS
L160SYS:
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
L159SYS:
	j	L157SYS
L156SYS:
	li	a0, 0
	j	L151SYS
L151SYS:
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
	bge	a1, a0, L163SYS
	j	L162SYS
L163SYS:
	li	a0, -42
	j	L161SYS
L162SYS:
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
	j	L161SYS
L161SYS:
	pop	fp, sp
	ret
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
L164SYS:
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
L165SYS:
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
L166SYS:
	pop	fp, sp
	ret
	#bank text
	#bank data
	Ckheap:	#res 28
	Ckmalloc_bitset:	#res 4
	;#globl	Ckmalloc_err
Ckmalloc_err:	#d32	0
	;#globl	C_arena
C_arena:	#d32	0
	;#globl	C_asize
C_asize:	#d32	0
Cfreep:	#d32	0
	#bank text
	;#globl	Ckmalloc_init
	#align 32
Ckmalloc_init:	push	fp, sp
	mv	fp, sp
	la	a0, Ckheap
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Ckheap
	push	a0, sp
	li	a0, 24
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
	sw	a0, 0(a1)
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 2
	push	a0, sp
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, Ckheap
	push	a0, sp
	push	ra, sp
	call	Calloc_pages_contiguous
	pop	ra, sp
	addi	sp, sp, 24
	ssw	a0, Ckmalloc_err, t0
	lw	a0, 12(fp)
	ssw	a0, Ckmalloc_bitset, t0
	la	a0, Ckheap
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	ssw	a0, C_arena, t0
	li	a0, 2048
	ssw	a0, C_asize, t0
	llw	a0, C_arena
	push	a0, sp
	llw	a0, C_asize
	pop	a1, sp
	sw	a0, 0(a1)
	llw	a0, C_arena
	ssw	a0, Cfreep, t0
	llw	a0, Ckmalloc_err
	j	L167SYS
L167SYS:
	pop	fp, sp
	ret
	#align 32
Cdefrag:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	llw	a0, C_asize
	push	a0, sp
	llw	a0, C_arena
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	sw	a0, -12(fp)
	llw	a0, C_arena
	sw	a0, -4(fp)
L169SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	bltu	a1, a0, L173SYS
	j	L171SYS
L173SYS:
	j	L170SYS
L172SYS:
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	push	ra, sp
	call	Cabs
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	sw	a0, -4(fp)
	j	L169SYS
L170SYS:
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a0, a1, L175SYS
	j	L174SYS
L175SYS:
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	sw	a0, -8(fp)
L176SYS:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	sltu	a0, a1, a0
	beqz	a0, L180SYS
	lw	a0, -8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sgt	a0, a1, a0
L180SYS:
	beqz	a0, L178SYS
	j	L177SYS
L179SYS:
	lw	a0, -8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	sw	a0, -8(fp)
	j	L176SYS
L177SYS:
	j	L179SYS
L178SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	shrli	a0, a0, 2
	pop	a1, sp
	sw	a0, 0(a1)
L174SYS:
	j	L172SYS
L171SYS:
L168SYS:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Ckmalloc
	#align 32
Ckmalloc:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -36
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, 8(fp)
	llw	a0, C_arena
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L183SYS
	j	L182SYS
L183SYS:
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 128
	pop	a1, sp
	bge	a1, a0, L185SYS
	j	L184SYS
L185SYS:
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	ssw	a0, C_asize, t0
	j	L186SYS
L184SYS:
	li	a0, 10
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	ssw	a0, C_asize, t0
L186SYS:
	li	a0, 4
	push	a0, sp
	llw	a0, C_asize
	pop	a1, sp
	mul	zero, a0, a1, a0
	sw	a0, -24(fp)
	li	a0, 4095
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, -4096
	pop	a1, sp
	and	a0, a0, a1
	sw	a0, -24(fp)
	li	a0, 431766
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	llw	a0, Ckmalloc_bitset
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	addi	a0, fp, -36
	push	a0, sp
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Calloc_pages_contiguous
	pop	ra, sp
	addi	sp, sp, 24
	ssw	a0, Ckmalloc_err, t0
	beqz	a0, L187SYS
	li	a0, 0
	j	L181SYS
L187SYS:
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -36
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -36
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -36
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -36
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -36
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	ssw	a0, C_arena, t0
	llw	a0, C_arena
	push	a0, sp
	llw	a0, C_asize
	pop	a1, sp
	sw	a0, 0(a1)
	llw	a0, C_arena
	ssw	a0, Cfreep, t0
L182SYS:
	li	a0, 0
	sw	a0, -20(fp)
L188SYS:
	lw	a0, -20(fp)
	push	a0, sp
	li	a0, 3
	pop	a1, sp
	blt	a1, a0, L192SYS
	j	L190SYS
L192SYS:
	j	L189SYS
L191SYS:
	lw	a0, -20(fp)
	lw	t0, -20(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -20(fp)
	j	L188SYS
L189SYS:
	llw	a0, C_asize
	push	a0, sp
	llw	a0, C_arena
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	sw	a0, -8(fp)
	llw	a0, Cfreep
	sw	a0, -4(fp)
L193SYS:
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	blt	a0, a1, L197SYS
	j	L196SYS
L197SYS:
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	pop	a1, sp
	beq	a1, a0, L199SYS
	j	L198SYS
L199SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	neg	a0, a0
	pop	a1, sp
	sw	a0, 0(a1)
	j	L200SYS
L198SYS:
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	sw	a0, -12(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	neg	a0, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	shlli	a0, a0, 2
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L200SYS:
	lw	a0, -4(fp)
	ssw	a0, Cfreep, t0
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	j	L181SYS
L196SYS:
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	push	ra, sp
	call	Cabs
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	sw	a0, -4(fp)
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	beq	a1, a0, L202SYS
	j	L201SYS
L202SYS:
	llw	a0, C_arena
	sw	a0, -4(fp)
L201SYS:
	lw	a0, -4(fp)
	push	a0, sp
	llw	a0, C_arena
	pop	a1, sp
	sltu	a0, a1, a0
	bnez	a0, L203SYS
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	sltu	a0, a1, a0
	seqz	a0, a0
	bnez	a0, L203SYS
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
L203SYS:
	beqz	a0, L204SYS
	li	a0, -20
	ssw	a0, Ckmalloc_err, t0
	li	a0, 0
	j	L181SYS
L204SYS:
L195SYS:
	llw	a0, Cfreep
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	beq	a1, a0, L205SYS
	j	L193SYS
L205SYS:
L194SYS:
	lw	a0, -20(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L207SYS
	j	L206SYS
L207SYS:
	push	ra, sp
	call	Cdefrag
	pop	ra, sp
	j	L208SYS
L206SYS:
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 128
	pop	a1, sp
	bge	a1, a0, L210SYS
	j	L209SYS
L210SYS:
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -16(fp)
	j	L211SYS
L209SYS:
	li	a0, 10
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	sw	a0, -16(fp)
L211SYS:
	li	a0, 4
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	sw	a0, -24(fp)
	li	a0, 4095
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, -4096
	pop	a1, sp
	and	a0, a0, a1
	sw	a0, -24(fp)
	li	a0, 497559
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	llw	a0, Ckmalloc_bitset
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, -24(fp)
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	addi	a0, fp, -36
	push	a0, sp
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Calloc_pages_contiguous
	pop	ra, sp
	addi	sp, sp, 24
	ssw	a0, Ckmalloc_err, t0
	beqz	a0, L212SYS
	li	a0, 0
	j	L181SYS
L212SYS:
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -36
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -36
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -36
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Ckheap
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -36
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	llw	a0, C_asize
	sw	a0, -12(fp)
	lw	a0, -16(fp)
	push	a0, sp
	llw	a0, C_asize
	pop	a1, sp
	add	a0, a1, a0
	ssw	a0, C_asize, t0
	lw	a0, -8(fp)
	push	a0, sp
	llw	a0, C_asize
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L208SYS:
	j	L191SYS
L190SYS:
	li	a0, -10
	ssw	a0, Ckmalloc_err, t0
	li	a0, 0
	j	L181SYS
L181SYS:
	addi	sp, sp, 36
	pop	fp, sp
	ret
	;#globl	Ckfree
	#align 32
Ckfree:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L215SYS
	j	L214SYS
L215SYS:
	li	a0, 0
	j	L213SYS
L214SYS:
	lw	a0, 8(fp)
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	llw	a0, C_arena
	pop	a1, sp
	sltu	a0, a1, a0
	bnez	a0, L216SYS
	llw	a0, C_asize
	push	a0, sp
	llw	a0, C_arena
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	sltu	a0, a1, a0
	bnez	a0, L216SYS
	li	a0, -4
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	slt	a0, a1, a0
	seqz	a0, a0
L216SYS:
	beqz	a0, L217SYS
	li	a0, -21
	ssw	a0, Ckmalloc_err, t0
	li	a0, -21
	j	L213SYS
L217SYS:
	lw	t0, -4(fp)
	subi	t0, t0, 4 ;cgdecpl
	sw	t0, -4(fp)
	lw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	neg	a0, a0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	j	L213SYS
L213SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Ckmalloc_e
	#align 32
Ckmalloc_e:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ckmalloc
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -4(fp)
	lw	a0, 12(fp)
	push	a0, sp
	llw	a0, Ckmalloc_err
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, -4(fp)
	j	L218SYS
L218SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Ckfree_e
	#align 32
Ckfree_e:	push	fp, sp
	mv	fp, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, 12(fp)
	push	a0, sp
	llw	a0, Ckmalloc_err
	pop	a1, sp
	sw	a0, 0(a1)
L219SYS:
	pop	fp, sp
	ret
	#bank text
	#bank data
	;#globl	Cprogram_entry
Cprogram_entry:	#d32	0
	;#globl	Cprogram_stack
Cprogram_stack:	#d32	0
	;#globl	Cion_reentry
Cion_reentry:	#d32	0
	L220SYS:	#res 32
	#bank text
	;#globl	Cloader_load
	#align 32
Cloader_load:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	li	a0, 32
	push	a0, sp
	la	a0, L220SYS
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfs_read_file
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L222SYS
	lw	a0, -4(fp)
	j	L221SYS
L222SYS:
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfs_rewind
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	beqz	a0, L223SYS
	lw	a0, -4(fp)
	j	L221SYS
L223SYS:
	la	a0, L220SYS
	lw	a0, 0(a0)
	j	L225SYS
L226SYS:
	li	a0, 15007744
	push	a0, sp
	li	a0, 4096
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	la	a0, L220SYS
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
	blt	a1, a0, L228SYS
	j	L227SYS
L228SYS:
	lw	a0, -8(fp)
	j	L221SYS
L227SYS:
	lw	a0, -8(fp)
	ssw	a0, Cprogram_entry, t0
	li	a0, 15011840
	ssw	a0, Cprogram_stack, t0
	li	a0, 0
	j	L221SYS
	j	L224SYS
L229SYS:
	li	a0, -70
	j	L221SYS
	j	L224SYS
	j	L224SYS
L225SYS:
	la	a1, L230SYS
	j	switch
L230SYS:
	#d32	1
	#d32	204, L226SYS
	#d32	L229SYS
L224SYS:
L221SYS:
	addi	sp, sp, 8
	pop	fp, sp
	ret
	#bank text
	;#globl	Cion_lock_system
	#align 32
Cion_lock_system:	push	fp, sp
	mv	fp, sp
	push	ra, sp
	call	C_interrupt_disable
	pop	ra, sp
	llw	a0, Cion_task_postponed_switches
	llw	t0, Cion_task_postponed_switches;cgincgw
	addi	t0, t0, 1
	ssw	t0, Cion_task_postponed_switches, t5
	j	L231SYS
L231SYS:
	pop	fp, sp
	ret
	;#globl	Cion_unlock_system
	#align 32
Cion_unlock_system:	push	fp, sp
	mv	fp, sp
	llw	a0, Cion_task_postponed_switches
	llw	t0, Cion_task_postponed_switches
	subi	t0, t0, 1
	ssw	t0, Cion_task_postponed_switches, t5
	li	a0, 0
	push	a0, sp
	llw	a0, Cion_task_postponed_switches
	pop	a1, sp
	beq	a1, a0, L234SYS
	j	L233SYS
L234SYS:
	li	a0, 0
	push	a0, sp
	llw	a0, Cion_task_postponed_flag
	pop	a1, sp
	bne	a1, a0, L236SYS
	j	L235SYS
L236SYS:
	li	a0, 0
	ssw	a0, Cion_task_postponed_flag, t0
	push	ra, sp
	call	Ctask_schedule
	pop	ra, sp
L235SYS:
L233SYS:
	push	ra, sp
	call	C_interrupt_enable
	pop	ra, sp
	j	L232SYS
L232SYS:
	pop	fp, sp
	ret
	#bank text
	#bank data
	;#globl	Cpaging_ctx
	Cpaging_ctx:	#res 4
	;#globl	Cpaging_currpt
Cpaging_currpt:	#d32	0
	#bank text
	#align 32
Cset_frame:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -8(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	exch	a0, a1
	idiv	zero, a0, a0, a1
	sw	a0, -12(fp)
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L237SYS:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	#align 32
Cclear_frame:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -8(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	exch	a0, a1
	idiv	zero, a0, a0, a1
	sw	a0, -12(fp)
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	not	a0, a0
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L238SYS:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	#align 32
Ctest_frame:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	sw	a0, -8(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	exch	a0, a1
	idiv	zero, a0, a0, a1
	sw	a0, -12(fp)
	li	a0, 4
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	pop	a1, sp
	and	a0, a0, a1
	j	L239SYS
L239SYS:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	#align 32
Cfirst_frame:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	li	a0, 0
	sw	a0, -4(fp)
L241SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	blt	a1, a0, L245SYS
	j	L243SYS
L245SYS:
	j	L242SYS
L244SYS:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L241SYS
L242SYS:
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, -1
	pop	a1, sp
	bne	a1, a0, L247SYS
	j	L246SYS
L247SYS:
	li	a0, 0
	sw	a0, -8(fp)
L248SYS:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	blt	a1, a0, L252SYS
	j	L250SYS
L252SYS:
	j	L249SYS
L251SYS:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	j	L248SYS
L249SYS:
	li	a0, 1
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	sw	a0, -12(fp)
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	and	a0, a0, a1
	bnez	a0, L253SYS
	li	a0, 4
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	j	L240SYS
L253SYS:
	j	L251SYS
L250SYS:
L246SYS:
	j	L244SYS
L243SYS:
L240SYS:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Calloc_pages_contiguous
	#align 32
Calloc_pages_contiguous:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	li	a0, 4
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	sw	a0, -4(fp)
L255SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	blt	a1, a0, L259SYS
	j	L257SYS
L259SYS:
	j	L256SYS
L258SYS:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L255SYS
L256SYS:
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 28(fp)
	push	a0, sp
	lw	a0, 24(fp)
	push	a0, sp
	lw	a0, 20(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Calloc_frame
	pop	ra, sp
	addi	sp, sp, 16
	sw	a0, -8(fp)
	beqz	a0, L260SYS
	lw	a0, -8(fp)
	j	L254SYS
L260SYS:
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
	li	a0, 4096
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	j	L258SYS
L257SYS:
	li	a0, 0
	j	L254SYS
L254SYS:
	addi	sp, sp, 8
	pop	fp, sp
	ret
	;#globl	Crelease_pages_contiguous
	#align 32
Crelease_pages_contiguous:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 0
	sw	a0, -4(fp)
L262SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	blt	a1, a0, L266SYS
	j	L264SYS
L266SYS:
	j	L263SYS
L265SYS:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L262SYS
L263SYS:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cfree_frame
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 4096
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	j	L265SYS
L264SYS:
L261SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Calloc_frame
	#align 32
Calloc_frame:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	bne	a1, a0, L269SYS
	j	L268SYS
L269SYS:
	li	a0, 0
	j	L267SYS
	j	L270SYS
L268SYS:
	lw	a0, 20(fp)
	push	a0, sp
	push	ra, sp
	call	Cfirst_frame
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -4(fp)
	li	a0, -1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	beq	a1, a0, L272SYS
	j	L271SYS
L272SYS:
	li	a0, -10
	j	L267SYS
L271SYS:
	lw	a0, 20(fp)
	push	a0, sp
	li	a0, 4096
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cset_frame
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 12(fp)
	beqz	a0, L273SYS
	li	a0, 2
	j	L274SYS
L273SYS:
	li	a0, 0
L274SYS:
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 16(fp)
	beqz	a0, L275SYS
	li	a0, 1
	j	L276SYS
L275SYS:
	li	a0, 0
L276SYS:
	pop	a1, sp
	or	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 4096
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	llw	a0, Cpaging_currpt
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
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
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	push	ra, sp
	call	Cmmu_map
	pop	ra, sp
	addi	sp, sp, 16
L270SYS:
	li	a0, 0
	j	L267SYS
L267SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cfree_frame
	#align 32
Cfree_frame:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	seqz	a0, a0
	sw	a0, -4(fp)
	beqz	a0, L278SYS
	j	L277SYS
	j	L279SYS
L278SYS:
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cclear_frame
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	llw	a0, Cpaging_currpt
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cmmu_unmap
	pop	ra, sp
	addi	sp, sp, 8
L279SYS:
L277SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cpage_fault_handler
	#align 32
Cpage_fault_handler:	push	fp, sp
	mv	fp, sp
	#bank data
L281SYS:
	#d8	"P"
	#d8	"a"
	#d8	"g"
	#d8	"e"
	#d8	32
	#d8	"F"
	#d8	"a"
	#d8	"u"
	#d8	"l"
	#d8	"t"
	#d8	0
	#d8	0
	#bank text
	la	a0, L281SYS
	push	a0, sp
	push	ra, sp
	call	Cpanic
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -2
	j	L280SYS
L280SYS:
	pop	fp, sp
	ret
	;#globl	Cpaging_init
	#align 32
Cpaging_init:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 8(fp)
	ssw	a0, Cpaging_ctx, t0
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cmemset
	pop	ra, sp
	addi	sp, sp, 12
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	Cset_frame
	pop	ra, sp
	addi	sp, sp, 8
	llw	a0, Cpaging_currpt
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	Cmmu_map
	pop	ra, sp
	addi	sp, sp, 16
	llw	a0, CKernelPhys
	sw	a0, -4(fp)
L284SYS:
	lw	a0, -4(fp)
	push	a0, sp
	llw	a0, CKernelEnd
	pop	a1, sp
	blt	a1, a0, L285SYS
	j	L283SYS
L285SYS:
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 16777215
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	and	a0, a0, a1
	push	a0, sp
	push	ra, sp
	call	Cset_frame
	pop	ra, sp
	addi	sp, sp, 8
	llw	a0, Cpaging_currpt
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cmmu_map
	pop	ra, sp
	addi	sp, sp, 16
	li	a0, 4096
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -4(fp)
	j	L284SYS
L283SYS:
	li	a0, 15011840
	sw	a0, -4(fp)
L287SYS:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 15327232
	pop	a1, sp
	blt	a1, a0, L288SYS
	j	L286SYS
L288SYS:
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 16777215
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	and	a0, a0, a1
	push	a0, sp
	push	ra, sp
	call	Cset_frame
	pop	ra, sp
	addi	sp, sp, 8
	llw	a0, Cpaging_currpt
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cmmu_map
	pop	ra, sp
	addi	sp, sp, 16
	li	a0, 4096
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -4(fp)
	j	L287SYS
L286SYS:
	la	a0, Cpage_fault_handler
	push	a0, sp
	li	a0, 7
	push	a0, sp
	push	ra, sp
	call	Cregister_interrupt_handler
	pop	ra, sp
	addi	sp, sp, 8
	llw	a0, Cprotected_entry
	push	a0, sp
	push	ra, sp
	call	C_mmu_enable
	pop	ra, sp
	addi	sp, sp, 4
L282SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#bank text
	;#globl	Cringbuff_push
	#align 32
Cringbuff_push:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 8
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
	lw	a0, 0(a0)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	bge	a1, a0, L291SYS
	j	L290SYS
L291SYS:
	li	a0, 0
	sw	a0, -4(fp)
L290SYS:
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	beq	a1, a0, L293SYS
	j	L292SYS
L293SYS:
	li	a0, -100
	j	L289SYS
L292SYS:
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Ccopy
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	j	L289SYS
L289SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cringbuff_pop
	#align 32
Cringbuff_pop:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
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
	pop	a1, sp
	beq	a1, a0, L296SYS
	j	L295SYS
L296SYS:
	li	a0, -101
	j	L294SYS
L295SYS:
	li	a0, 4
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
	lw	a0, 0(a0)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	bge	a1, a0, L298SYS
	j	L297SYS
L298SYS:
	li	a0, 0
	sw	a0, -4(fp)
L297SYS:
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Ccopy
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	j	L294SYS
L294SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#bank text
	#bank data
	;#globl	Cion_running_task
	Cion_running_task:	#res 4
	;#globl	Cion_first_ready_task
	Cion_first_ready_task:	#res 4
	;#globl	Cion_last_ready_task
	Cion_last_ready_task:	#res 4
	;#globl	Cion_sleeping_task_list
	Cion_sleeping_task_list:	#res 4
	;#globl	Cion_task_postponed_flag
Cion_task_postponed_flag:	#d32	0
	;#globl	Cion_task_postponed_switches
Cion_task_postponed_switches:	#d32	0
Cktime_last_count:	#d32	0
Cutime_last_count:	#d32	0
	#bank text
	#align 32
Ctask_append_ready:	push	fp, sp
	mv	fp, sp
	lw	a0, 8(fp)
	bnez	a0, L300SYS
	j	L299SYS
L300SYS:
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 0
	push	a0, sp
	llw	a0, Cion_first_ready_task
	pop	a1, sp
	beq	a1, a0, L302SYS
	j	L301SYS
L302SYS:
	lw	a0, 8(fp)
	ssw	a0, Cion_last_ready_task, t0
	ssw	a0, Cion_first_ready_task, t0
	j	L303SYS
L301SYS:
	li	a0, 8
	push	a0, sp
	llw	a0, Cion_last_ready_task
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 8(fp)
	ssw	a0, Cion_last_ready_task, t0
L303SYS:
	j	L299SYS
L299SYS:
	pop	fp, sp
	ret
	;#globl	Ctask_running_append_ready
	#align 32
Ctask_running_append_ready:	push	fp, sp
	mv	fp, sp
	llw	a0, Cion_running_task
	push	a0, sp
	push	ra, sp
	call	Ctask_append_ready
	pop	ra, sp
	addi	sp, sp, 4
	j	L304SYS
L304SYS:
	pop	fp, sp
	ret
	#align 32
Ctask_kstack_alloc:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	addi	a0, fp, -12
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -12
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -12
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
	addi	a0, fp, -12
	push	a0, sp
	push	ra, sp
	call	Calloc_frame
	pop	ra, sp
	addi	sp, sp, 16
	addi	a0, fp, -12
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 4096
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -12
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -12
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
	addi	a0, fp, -12
	push	a0, sp
	push	ra, sp
	call	Calloc_frame
	pop	ra, sp
	addi	sp, sp, 16
	j	L305SYS
L305SYS:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cmultitasking_init
	#align 32
Cmultitasking_init:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L308SYS
	j	L307SYS
L308SYS:
	li	a0, -80
	j	L306SYS
L307SYS:
	lw	a0, 8(fp)
	push	a0, sp
	llw	a0, CKernelStackTop
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	llw	a0, Cpaging_currpt
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	llw	a0, Cion_first_ready_task
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, -1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cclock_read_counter
	pop	ra, sp
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 28
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	#bank data
L309SYS:
	#d8	"K"
	#d8	"E"
	#d8	"R"
	#d8	"N"
	#d8	"E"
	#d8	"L"
	#d8	0
	#d8	0
	#bank text
	la	a0, L309SYS
	push	a0, sp
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cstrcpy
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, 8(fp)
	ssw	a0, Cion_running_task, t0
	li	a0, 0
	j	L306SYS
L306SYS:
	pop	fp, sp
	ret
	;#globl	Ccreate_task
	#align 32
Ccreate_task:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 40
	push	a0, sp
	push	ra, sp
	call	Ckmalloc
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 12
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	llw	a0, Cpaging_currpt
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 8
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 4
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 24
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 28
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 7
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 32
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Cstrncpy
	pop	ra, sp
	addi	sp, sp, 12
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Ctask_append_ready
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Ctask_new_ktask
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, -4(fp)
	j	L310SYS
L310SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Ctask_schedule
	#align 32
Ctask_schedule:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 0
	push	a0, sp
	llw	a0, Cion_task_postponed_switches
	pop	a1, sp
	bne	a1, a0, L313SYS
	j	L312SYS
L313SYS:
	li	a0, 1
	ssw	a0, Cion_task_postponed_flag, t0
	li	a0, 0
	j	L311SYS
L312SYS:
	llw	a0, Cion_first_ready_task
	beqz	a0, L314SYS
	llw	a0, Cion_first_ready_task
	sw	a0, -4(fp)
	li	a0, 8
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	ssw	a0, Cion_first_ready_task, t0
	llw	a0, Cion_running_task
	push	a0, sp
	push	ra, sp
	call	Ctask_update_ktime_used
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cswitch_to_task
	pop	ra, sp
	addi	sp, sp, 4
	j	L315SYS
L314SYS:
	li	a0, -81
	j	L311SYS
L315SYS:
	li	a0, 0
	j	L311SYS
L311SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cp_linked_list
	#align 32
Cp_linked_list:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 12(fp)
	sw	a0, -4(fp)
	li	a0, 91
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	beq	a1, a0, L318SYS
	j	L317SYS
L318SYS:
	#bank data
L319SYS:
	#d8	"e"
	#d8	"m"
	#d8	"p"
	#d8	"t"
	#d8	"y"
	#d8	93
	#d8	0
	#d8	0
	#bank text
	la	a0, L319SYS
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_puts
	pop	ra, sp
	addi	sp, sp, 8
	j	L316SYS
L317SYS:
L321SYS:
	lw	a0, -4(fp)
	beqz	a0, L320SYS
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, 20(fp)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	sw	a0, -4(fp)
	j	L321SYS
L320SYS:
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 93
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	j	L316SYS
L316SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#align 32
Cprint_task_name:	push	fp, sp
	mv	fp, sp
	#bank data
L323SYS:
	#d8	37
	#d8	"s"
	#d8	0
	#d8	0
	#bank text
	li	a0, 32
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	la	a0, L323SYS
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 0
	j	L322SYS
L322SYS:
	pop	fp, sp
	ret
	;#globl	Cp_ready_tasks
	#align 32
Cp_ready_tasks:	push	fp, sp
	mv	fp, sp
	#bank data
L325SYS:
	#d8	"R"
	#d8	"e"
	#d8	"a"
	#d8	"d"
	#d8	"y"
	#d8	58
	#d8	32
	#d8	0
	#bank text
	la	a0, L325SYS
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 8
	la	a0, Cprint_task_name
	push	a0, sp
	li	a0, 8
	push	a0, sp
	llw	a0, Cion_first_ready_task
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Cp_linked_list
	pop	ra, sp
	addi	sp, sp, 16
	li	a0, 10
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	j	L324SYS
L324SYS:
	pop	fp, sp
	ret
	;#globl	Cp_sleeping_tasks
	#align 32
Cp_sleeping_tasks:	push	fp, sp
	mv	fp, sp
	#bank data
L327SYS:
	#d8	"S"
	#d8	"l"
	#d8	"e"
	#d8	"e"
	#d8	"p"
	#d8	"i"
	#d8	"n"
	#d8	"g"
	#d8	58
	#d8	32
	#d8	0
	#d8	0
	#bank text
	la	a0, L327SYS
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 8
	la	a0, Cprint_task_name
	push	a0, sp
	li	a0, 8
	push	a0, sp
	llw	a0, Cion_sleeping_task_list
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Cp_linked_list
	pop	ra, sp
	addi	sp, sp, 16
	li	a0, 10
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	j	L326SYS
L326SYS:
	pop	fp, sp
	ret
	;#globl	Ctask_update_utime_used
	#align 32
Ctask_update_utime_used:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	push	ra, sp
	call	Cclock_read_counter
	pop	ra, sp
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	llw	a0, Cutime_last_count
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -8(fp)
	lw	a0, -4(fp)
	ssw	a0, Cutime_last_count, t0
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 20
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 20
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	j	L328SYS
L328SYS:
	addi	sp, sp, 8
	pop	fp, sp
	ret
	;#globl	Ctask_update_ktime_used
	#align 32
Ctask_update_ktime_used:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L331SYS
	j	L330SYS
L331SYS:
	j	L329SYS
L330SYS:
	push	ra, sp
	call	Cclock_read_counter
	pop	ra, sp
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	llw	a0, Cktime_last_count
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -8(fp)
	lw	a0, -4(fp)
	ssw	a0, Cktime_last_count, t0
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sw	a0, 0(a1)
	j	L329SYS
L329SYS:
	addi	sp, sp, 8
	pop	fp, sp
	ret
	;#globl	Ctask_kuptime
	#align 32
Ctask_kuptime:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L334SYS
	j	L333SYS
L334SYS:
	li	a0, -80
	j	L332SYS
L333SYS:
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctask_update_ktime_used
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	j	L332SYS
L332SYS:
	pop	fp, sp
	ret
	;#globl	Ctask_uuptime
	#align 32
Ctask_uuptime:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L337SYS
	j	L336SYS
L337SYS:
	li	a0, -80
	j	L335SYS
L336SYS:
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctask_update_utime_used
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	j	L335SYS
L335SYS:
	pop	fp, sp
	ret
	;#globl	Ctask_block
	#align 32
Ctask_block:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	llw	a0, Cion_running_task
	pop	a1, sp
	beq	a1, a0, L340SYS
	j	L339SYS
L340SYS:
	j	L338SYS
L339SYS:
	push	ra, sp
	call	Cion_lock_scheduler
	pop	ra, sp
	li	a0, 4
	push	a0, sp
	llw	a0, Cion_running_task
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	push	ra, sp
	call	Ctask_schedule
	pop	ra, sp
	push	ra, sp
	call	Cion_unlock_scheduler
	pop	ra, sp
L338SYS:
	pop	fp, sp
	ret
	;#globl	Ctask_unblock
	#align 32
Ctask_unblock:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	push	a0, sp
	llw	a0, Cion_running_task
	pop	a1, sp
	beq	a1, a0, L343SYS
	j	L342SYS
L343SYS:
	j	L341SYS
L342SYS:
	push	ra, sp
	call	Cion_lock_scheduler
	pop	ra, sp
	li	a0, 0
	push	a0, sp
	llw	a0, Cion_first_ready_task
	pop	a1, sp
	beq	a1, a0, L345SYS
	j	L344SYS
L345SYS:
	li	a0, 43690
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cswitch_to_task
	pop	ra, sp
	addi	sp, sp, 4
	j	L346SYS
L344SYS:
	li	a0, 8
	push	a0, sp
	llw	a0, Cion_last_ready_task
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	lw	a0, 8(fp)
	ssw	a0, Cion_last_ready_task, t0
L346SYS:
	push	ra, sp
	call	Cion_unlock_scheduler
	pop	ra, sp
L341SYS:
	pop	fp, sp
	ret
	;#globl	Ctask_tms_sleep_until
	#align 32
Ctask_tms_sleep_until:	push	fp, sp
	mv	fp, sp
	push	ra, sp
	call	Cion_lock_system
	pop	ra, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cclock_read_counter
	pop	ra, sp
	pop	a1, sp
	blt	a1, a0, L349SYS
	j	L348SYS
L349SYS:
	push	ra, sp
	call	Cion_unlock_scheduler
	pop	ra, sp
	j	L347SYS
L348SYS:
	li	a0, 28
	push	a0, sp
	llw	a0, Cion_running_task
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 8
	push	a0, sp
	llw	a0, Cion_running_task
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	llw	a0, Cion_sleeping_task_list
	pop	a1, sp
	sw	a0, 0(a1)
	llw	a0, Cion_running_task
	ssw	a0, Cion_sleeping_task_list, t0
	push	ra, sp
	call	Cion_unlock_system
	pop	ra, sp
	li	a0, 4
	push	a0, sp
	push	ra, sp
	call	Ctask_block
	pop	ra, sp
	addi	sp, sp, 4
L347SYS:
	pop	fp, sp
	ret
	;#globl	Ctask_tms_sleep
	#align 32
Ctask_tms_sleep:	push	fp, sp
	mv	fp, sp
	push	ra, sp
	call	Cclock_read_counter
	pop	ra, sp
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Ctask_tms_sleep_until
	pop	ra, sp
	addi	sp, sp, 4
L350SYS:
	pop	fp, sp
	ret
	;#globl	Ctask_sleep
	#align 32
Ctask_sleep:	push	fp, sp
	mv	fp, sp
	push	ra, sp
	call	Cclock_read_counter
	pop	ra, sp
	push	a0, sp
	li	a0, 10000
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Ctask_tms_sleep_until
	pop	ra, sp
	addi	sp, sp, 4
L351SYS:
	pop	fp, sp
	ret
