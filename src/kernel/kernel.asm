	#bank text
	#bank data
	;#globl	Cglobal_ctx
	Cglobal_ctx:	#res 68
	Chp:	#res 28
	Cbitset:	#res 2052
	;#globl	Cstr
	Cstr:	#res 104
	#bank text
	;#globl	Ckinit
	#align 32
Ckinit:	push	fp, sp
	mv	fp, sp
	la	a0, Cbitset
	push	a0, sp
	li	a0, 4096
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Cbitset
	push	a0, sp
	push	ra, sp
	call	Cpaging_init
	pop	ra, sp
	addi	sp, sp, 4
L1:
	pop	fp, sp
	ret
	;#globl	Ckmain
	#align 32
Ckmain:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -312
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 28
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 48
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 56
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 15011840
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 124
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 15
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 80
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 36
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 143
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 60
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 44
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 5
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 64
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 20
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 25
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	li	a0, 52
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	sb	a0, 0(a1)
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_clear
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -76
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -76
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -76
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 512
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -76
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 256
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Chp
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 15327232
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Chp
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 15327232
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Cbitset
	push	a0, sp
	la	a0, Chp
	push	a0, sp
	push	ra, sp
	call	Ckmalloc_init
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	Ckb_init
	pop	ra, sp
	addi	sp, sp, 4
	la	a0, Ctps_store_driver
	push	a0, sp
	la	a0, Ctps_load_driver
	push	a0, sp
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	Cdisk_istall_drivers
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -156
	push	a0, sp
	push	ra, sp
	call	Cfat12_init
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -76
	push	a0, sp
	addi	a0, fp, -156
	push	a0, sp
	push	ra, sp
	call	Cfat12_mount
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 1
	push	a0, sp
	addi	a0, fp, -156
	push	a0, sp
	push	ra, sp
	call	Cfs_register_fs
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 256
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	#bank data
L3:
	#d8	"H"
	#d8	"E"
	#d8	"L"
	#d8	"L"
	#d8	"O"
	#d8	46
	#d8	"C"
	#d8	"O"
	#d8	"M"
	#d8	0
	#d8	0
	#d8	0
	#bank text
	la	a0, L3
	push	a0, sp
	addi	a0, fp, -236
	push	a0, sp
	addi	a0, fp, -156
	push	a0, sp
	push	ra, sp
	call	Cfat12_find
	pop	ra, sp
	addi	sp, sp, 12
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	#bank data
L4:
	#d8	"F"
	#d8	"i"
	#d8	"l"
	#d8	"e"
	#d8	32
	#d8	"f"
	#d8	"o"
	#d8	"u"
	#d8	"n"
	#d8	"d"
	#d8	58
	#d8	32
	#d8	37
	#d8	"s"
	#d8	44
	#d8	32
	#d8	37
	#d8	"d"
	#d8	10
	#d8	0
	#bank text
	addi	a0, fp, -236
	push	a0, sp
	li	a0, 36
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	addi	a0, fp, -236
	push	a0, sp
	la	a0, L4
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 16
	li	a0, 32
	push	a0, sp
	addi	a0, fp, -44
	push	a0, sp
	addi	a0, fp, -236
	push	a0, sp
	push	ra, sp
	call	Cfat12_read
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -300
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -44
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Cbitset
	push	a0, sp
	li	a0, 1
	push	a0, sp
	li	a0, 0
	push	a0, sp
	addi	a0, fp, -44
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	addi	a0, fp, -312
	push	a0, sp
	addi	a0, fp, -300
	push	a0, sp
	push	ra, sp
	call	Calloc_pages_contiguous
	pop	ra, sp
	addi	sp, sp, 24
	addi	a0, fp, -300
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -44
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -300
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -300
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -312
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Cbitset
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 1
	push	a0, sp
	addi	a0, fp, -44
	push	a0, sp
	li	a0, 20
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	addi	a0, fp, -312
	push	a0, sp
	addi	a0, fp, -300
	push	a0, sp
	push	ra, sp
	call	Calloc_pages_contiguous
	pop	ra, sp
	addi	sp, sp, 24
	li	a0, 0
	push	a0, sp
	li	a0, 0
	push	a0, sp
	addi	a0, fp, -236
	push	a0, sp
	push	ra, sp
	call	Cfat12_seek
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 512
	push	a0, sp
	addi	a0, fp, -44
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	addi	a0, fp, -236
	push	a0, sp
	push	ra, sp
	call	Cfat12_read
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 0
	push	a0, sp
	addi	a0, fp, -44
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	addi	a0, fp, -236
	push	a0, sp
	push	ra, sp
	call	Cfat12_seek
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 256
	push	a0, sp
	addi	a0, fp, -44
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	addi	a0, fp, -236
	push	a0, sp
	push	ra, sp
	call	Cfat12_read
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -44
	lw	a0, 0(a0)
	lw	a0, 0(a0)
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 10
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	#bank data
L5:
	#d8	"N"
	#d8	"e"
	#d8	"x"
	#d8	"t"
	#d8	32
	#d8	"f"
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
	#d8	"i"
	#d8	"n"
	#d8	32
	#d8	"d"
	#d8	"e"
	#d8	"v"
	#d8	"i"
	#d8	"c"
	#d8	"e"
	#d8	32
	#d8	37
	#d8	"d"
	#d8	58
	#d8	32
	#d8	37
	#d8	"d"
	#d8	10
	#d8	0
	#bank text
	li	a0, 0
	push	a0, sp
	addi	a0, fp, -156
	push	a0, sp
	push	ra, sp
	call	Cfat12_get_cluster
	pop	ra, sp
	addi	sp, sp, 8
	push	a0, sp
	addi	a0, fp, -156
	push	a0, sp
	li	a0, 36
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	la	a0, L5
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 16
	addi	a0, fp, -288
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -288
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	addi	a0, fp, -288
	push	a0, sp
	li	a0, 20
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -288
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 84
	pop	a1, sp
	sb	a0, 0(a1)
	addi	a0, fp, -288
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 88
	pop	a1, sp
	sb	a0, 0(a1)
	addi	a0, fp, -288
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 84
	pop	a1, sp
	sb	a0, 0(a1)
	addi	a0, fp, -288
	push	a0, sp
	li	a0, 40
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	push	a0, sp
	addi	a0, fp, -156
	push	a0, sp
	push	ra, sp
	call	Cfat12_get_cluster
	pop	ra, sp
	addi	sp, sp, 8
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -288
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	sb	a0, 0(a1)
	#bank data
L6:
	#d8	"H"
	#d8	"E"
	#d8	"L"
	#d8	"L"
	#d8	"O"
	#d8	32
	#d8	32
	#d8	32
	#d8	0
	#d8	0
	#d8	0
	#d8	0
	#bank text
	la	a0, L6
	sw	a0, -60(fp)
	li	a0, 0
	sw	a0, -48(fp)
L7:
	lw	a0, -48(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	blt	a1, a0, L11
	j	L9
L11:
	j	L8
L10:
	lw	a0, -48(fp)
	lw	t0, -48(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -48(fp)
	j	L7
L8:
	addi	a0, fp, -288
	push	a0, sp
	lw	a0, -48(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -48(fp)
	push	a0, sp
	lw	a0, -60(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	j	L10
L9:
	addi	a0, fp, -288
	push	a0, sp
	li	a0, 28
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -288
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -288
	push	a0, sp
	li	a0, 36
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	addi	a0, fp, -288
	push	a0, sp
	li	a0, 44
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 16384
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	#bank data
L12:
	#d8	"D"
	#d8	"O"
	#d8	"C"
	#d8	"S"
	#d8	47
	#d8	"H"
	#d8	"E"
	#d8	"L"
	#d8	"L"
	#d8	"O"
	#d8	46
	#d8	"T"
	#d8	"X"
	#d8	"T"
	#d8	0
	#d8	0
	#bank text
	la	a0, L12
	push	a0, sp
	addi	a0, fp, -288
	push	a0, sp
	addi	a0, fp, -156
	push	a0, sp
	push	ra, sp
	call	Cfat12_create_entry
	pop	ra, sp
	addi	sp, sp, 12
	#bank data
L13:
	#d8	"0"
	#d8	9
	#d8	"L"
	#d8	"o"
	#d8	"r"
	#d8	"e"
	#d8	"m"
	#d8	32
	#d8	"i"
	#d8	"p"
	#d8	"s"
	#d8	"u"
	#d8	"m"
	#d8	32
	#d8	"d"
	#d8	"o"
	#d8	"l"
	#d8	"o"
	#d8	"r"
	#d8	32
	#d8	"s"
	#d8	"i"
	#d8	"t"
	#d8	32
	#d8	"a"
	#d8	"m"
	#d8	"e"
	#d8	"t"
	#d8	44
	#d8	32
	#d8	"c"
	#d8	"o"
	#d8	"n"
	#d8	"s"
	#d8	"e"
	#d8	"c"
	#d8	"t"
	#d8	"e"
	#d8	"t"
	#d8	"u"
	#d8	"r"
	#d8	32
	#d8	"a"
	#d8	"d"
	#d8	"i"
	#d8	"p"
	#d8	"i"
	#d8	"s"
	#d8	"c"
	#d8	"i"
	#d8	"n"
	#d8	"g"
	#d8	32
	#d8	"e"
	#d8	"l"
	#d8	"i"
	#d8	"t"
	#d8	46
	#d8	32
	#d8	"D"
	#d8	"o"
	#d8	"n"
	#d8	"e"
	#d8	"c"
	#d8	32
	#d8	"i"
	#d8	"d"
	#d8	32
	#d8	"n"
	#d8	"i"
	#d8	"b"
	#d8	"h"
	#d8	32
	#d8	"e"
	#d8	"u"
	#d8	32
	#d8	"o"
	#d8	"d"
	#d8	"i"
	#d8	"o"
	#d8	32
	#d8	"e"
	#d8	"l"
	#d8	"e"
	#d8	"i"
	#d8	"f"
	#d8	"e"
	#d8	"n"
	#d8	"d"
	#d8	32
	#d8	"d"
	#d8	"i"
	#d8	"c"
	#d8	"t"
	#d8	"u"
	#d8	"m"
	#d8	32
	#d8	"a"
	#d8	"c"
	#d8	32
	#d8	"a"
	#d8	"t"
	#d8	32
	#d8	"f"
	#d8	"e"
	#d8	"l"
	#d8	"i"
	#d8	"s"
	#d8	46
	#d8	32
	#d8	"P"
	#d8	"r"
	#d8	"o"
	#d8	"i"
	#d8	"n"
	#d8	32
	#d8	"f"
	#d8	"i"
	#d8	"n"
	#d8	"i"
	#d8	"b"
	#d8	"u"
	#d8	"s"
	#d8	32
	#d8	"n"
	#d8	"e"
	#d8	"c"
	#d8	32
	#d8	"p"
	#d8	"u"
	#d8	"r"
	#d8	"u"
	#d8	"s"
	#d8	32
	#d8	"q"
	#d8	"u"
	#d8	"i"
	#d8	"s"
	#d8	32
	#d8	"f"
	#d8	"i"
	#d8	"n"
	#d8	"i"
	#d8	"b"
	#d8	"u"
	#d8	"s"
	#d8	46
	#d8	32
	#d8	"N"
	#d8	"u"
	#d8	"n"
	#d8	"c"
	#d8	32
	#d8	"q"
	#d8	"u"
	#d8	"a"
	#d8	"m"
	#d8	32
	#d8	"e"
	#d8	"r"
	#d8	"o"
	#d8	"s"
	#d8	44
	#d8	32
	#d8	"t"
	#d8	"e"
	#d8	"m"
	#d8	"p"
	#d8	"o"
	#d8	"r"
	#d8	32
	#d8	"v"
	#d8	"e"
	#d8	"l"
	#d8	32
	#d8	"p"
	#d8	"o"
	#d8	"r"
	#d8	"t"
	#d8	"t"
	#d8	"i"
	#d8	"t"
	#d8	"o"
	#d8	"r"
	#d8	32
	#d8	"a"
	#d8	44
	#d8	32
	#d8	"p"
	#d8	"l"
	#d8	"a"
	#d8	"c"
	#d8	"e"
	#d8	"r"
	#d8	"a"
	#d8	"t"
	#d8	32
	#d8	"s"
	#d8	"e"
	#d8	"d"
	#d8	32
	#d8	"e"
	#d8	"x"
	#d8	46
	#d8	32
	#d8	"V"
	#d8	"i"
	#d8	"v"
	#d8	"a"
	#d8	"m"
	#d8	"u"
	#d8	"s"
	#d8	32
	#d8	"n"
	#d8	"o"
	#d8	"n"
	#d8	32
	#d8	"t"
	#d8	"e"
	#d8	"m"
	#d8	"p"
	#d8	"o"
	#d8	"r"
	#d8	32
	#d8	"l"
	#d8	"o"
	#d8	"r"
	#d8	"e"
	#d8	"m"
	#d8	46
	#d8	32
	#d8	"U"
	#d8	"t"
	#d8	32
	#d8	"a"
	#d8	"l"
	#d8	"i"
	#d8	"q"
	#d8	"u"
	#d8	"a"
	#d8	"m"
	#d8	32
	#d8	"l"
	#d8	"a"
	#d8	"c"
	#d8	"u"
	#d8	"s"
	#d8	32
	#d8	"n"
	#d8	"u"
	#d8	"l"
	#d8	"l"
	#d8	"a"
	#d8	44
	#d8	32
	#d8	"l"
	#d8	"a"
	#d8	"c"
	#d8	"i"
	#d8	"n"
	#d8	"i"
	#d8	"a"
	#d8	32
	#d8	"v"
	#d8	"u"
	#d8	"l"
	#d8	"p"
	#d8	"u"
	#d8	"t"
	#d8	"a"
	#d8	"t"
	#d8	"e"
	#d8	32
	#d8	"s"
	#d8	"e"
	#d8	"m"
	#d8	32
	#d8	"v"
	#d8	"u"
	#d8	"l"
	#d8	"p"
	#d8	"u"
	#d8	"t"
	#d8	"a"
	#d8	"t"
	#d8	"e"
	#d8	32
	#d8	"a"
	#d8	46
	#d8	32
	#d8	"D"
	#d8	"o"
	#d8	"n"
	#d8	"e"
	#d8	"c"
	#d8	32
	#d8	"l"
	#d8	"u"
	#d8	"c"
	#d8	"t"
	#d8	"u"
	#d8	"s"
	#d8	32
	#d8	"m"
	#d8	"a"
	#d8	"x"
	#d8	"i"
	#d8	"m"
	#d8	"u"
	#d8	"s"
	#d8	32
	#d8	"r"
	#d8	"i"
	#d8	"s"
	#d8	"u"
	#d8	"s"
	#d8	32
	#d8	"v"
	#d8	"e"
	#d8	"l"
	#d8	32
	#d8	"a"
	#d8	"l"
	#d8	"i"
	#d8	"q"
	#d8	"u"
	#d8	"e"
	#d8	"t"
	#d8	46
	#d8	32
	#d8	"A"
	#d8	"e"
	#d8	"n"
	#d8	"e"
	#d8	"a"
	#d8	"n"
	#d8	32
	#d8	"s"
	#d8	"e"
	#d8	"d"
	#d8	32
	#d8	"l"
	#d8	"a"
	#d8	"c"
	#d8	"i"
	#d8	"n"
	#d8	"i"
	#d8	"a"
	#d8	32
	#d8	"a"
	#d8	"u"
	#d8	"g"
	#d8	"u"
	#d8	"e"
	#d8	46
	#d8	32
	#d8	"A"
	#d8	"l"
	#d8	"i"
	#d8	"q"
	#d8	"u"
	#d8	"a"
	#d8	"m"
	#d8	32
	#d8	"v"
	#d8	"i"
	#d8	"t"
	#d8	"a"
	#d8	"e"
	#d8	32
	#d8	"r"
	#d8	"h"
	#d8	"o"
	#d8	"n"
	#d8	"c"
	#d8	"u"
	#d8	"s"
	#d8	32
	#d8	"m"
	#d8	"a"
	#d8	"g"
	#d8	"n"
	#d8	"a"
	#d8	46
	#d8	32
	#d8	"C"
	#d8	"u"
	#d8	"r"
	#d8	"a"
	#d8	"b"
	#d8	"i"
	#d8	"t"
	#d8	"u"
	#d8	"r"
	#d8	32
	#d8	"v"
	#d8	"e"
	#d8	"l"
	#d8	32
	#d8	"e"
	#d8	"f"
	#d8	"f"
	#d8	"i"
	#d8	"c"
	#d8	"i"
	#d8	"t"
	#d8	"u"
	#d8	"r"
	#d8	32
	#d8	"m"
	#d8	"a"
	#d8	"g"
	#d8	"n"
	#d8	"a"
	#d8	46
	#d8	32
	#d8	"M"
	#d8	"a"
	#d8	"e"
	#d8	"c"
	#d8	"e"
	#d8	"n"
	#d8	"a"
	#d8	"s"
	#d8	32
	#d8	"c"
	#d8	"o"
	#d8	"n"
	#d8	"v"
	#d8	"a"
	#d8	"l"
	#d8	"l"
	#d8	"i"
	#d8	"s"
	#d8	32
	#d8	"s"
	#d8	"i"
	#d8	"t"
	#d8	32
	#d8	"a"
	#d8	"m"
	#d8	"e"
	#d8	"t"
	#d8	32
	#d8	"q"
	#d8	"u"
	#d8	"a"
	#d8	"m"
	#d8	32
	#d8	"s"
	#d8	"e"
	#d8	"d"
	#d8	32
	#d8	"t"
	#d8	"i"
	#d8	"n"
	#d8	"c"
	#d8	"i"
	#d8	"d"
	#d8	"u"
	#d8	"n"
	#d8	"t"
	#d8	46
	#d8	32
	#d8	"I"
	#d8	"n"
	#d8	32
	#d8	"h"
	#d8	"a"
	#d8	"c"
	#d8	32
	#d8	"h"
	#d8	"a"
	#d8	"b"
	#d8	"i"
	#d8	"t"
	#d8	"a"
	#d8	"s"
	#d8	"s"
	#d8	"e"
	#d8	32
	#d8	"p"
	#d8	"l"
	#d8	"a"
	#d8	"t"
	#d8	"e"
	#d8	"a"
	#d8	32
	#d8	"d"
	#d8	"i"
	#d8	"c"
	#d8	"t"
	#d8	"u"
	#d8	"m"
	#d8	"s"
	#d8	"t"
	#d8	32
	#d8	"n"
	#d8	"i"
	#d8	"s"
	#d8	"i"
	#d8	46
	#d8	0
	#d8	0
	#bank text
	la	a0, L13
	sw	a0, -60(fp)
	li	a0, 1911
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 80
	push	a0, sp
	push	ra, sp
	call	Ckmalloc
	pop	ra, sp
	addi	sp, sp, 4
	sw	a0, -240(fp)
	#bank data
L14:
	#d8	"D"
	#d8	"O"
	#d8	"C"
	#d8	"S"
	#d8	47
	#d8	"H"
	#d8	"E"
	#d8	"L"
	#d8	"L"
	#d8	"O"
	#d8	46
	#d8	"T"
	#d8	"X"
	#d8	"T"
	#d8	0
	#d8	0
	#bank text
	li	a0, 0
	push	a0, sp
	la	a0, L14
	push	a0, sp
	addi	a0, fp, -156
	push	a0, sp
	li	a0, 36
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -240(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_open
	pop	ra, sp
	addi	sp, sp, 16
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 1
	push	a0, sp
	li	a0, 0
	push	a0, sp
	lw	a0, -240(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_seek
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 0
	sw	a0, -48(fp)
L15:
	lw	a0, -48(fp)
	push	a0, sp
	li	a0, 10
	pop	a1, sp
	blt	a1, a0, L19
	j	L17
L19:
	j	L16
L18:
	lw	a0, -48(fp)
	lw	t0, -48(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -48(fp)
	j	L15
L16:
	lw	a0, -48(fp)
	push	a0, sp
	li	a0, 2800
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -60(fp)
	push	a0, sp
	lw	a0, -48(fp)
	push	a0, sp
	li	a0, 48
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, -60(fp)
	push	a0, sp
	push	ra, sp
	call	Cstrlen
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	lw	a0, -60(fp)
	push	a0, sp
	lw	a0, -240(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_write
	pop	ra, sp
	addi	sp, sp, 12
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	j	L18
L17:
	#bank data
L20:
	#d8	10
	#d8	9
	#d8	"V"
	#d8	"i"
	#d8	"v"
	#d8	"i"
	#d8	"a"
	#d8	32
	#d8	"u"
	#d8	"n"
	#d8	32
	#d8	"h"
	#d8	"i"
	#d8	"d"
	#d8	"a"
	#d8	"l"
	#d8	"g"
	#d8	"o"
	#d8	46
	#d8	46
	#d8	46
	#d8	0
	#d8	0
	#d8	0
	#bank text
	la	a0, L20
	sw	a0, -60(fp)
	lw	a0, -60(fp)
	push	a0, sp
	push	ra, sp
	call	Cstrlen
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	lw	a0, -60(fp)
	push	a0, sp
	lw	a0, -240(fp)
	push	a0, sp
	push	ra, sp
	call	Cfat12_write
	pop	ra, sp
	addi	sp, sp, 12
TLlkmain_time:
	addi	a0, fp, -104
	push	a0, sp
	push	ra, sp
	call	Cclock_gettime
	pop	ra, sp
	addi	sp, sp, 4
	#bank data
L21:
	#d8	"Y"
	#d8	"E"
	#d8	"A"
	#d8	"R"
	#d8	58
	#d8	32
	#d8	37
	#d8	"d"
	#d8	44
	#d8	32
	#d8	"M"
	#d8	"O"
	#d8	"N"
	#d8	"T"
	#d8	"H"
	#d8	58
	#d8	32
	#d8	37
	#d8	"d"
	#d8	44
	#d8	32
	#d8	"D"
	#d8	"A"
	#d8	"Y"
	#d8	58
	#d8	32
	#d8	37
	#d8	"d"
	#d8	44
	#d8	32
	#d8	"H"
	#d8	"O"
	#d8	"U"
	#d8	"R"
	#d8	58
	#d8	32
	#d8	37
	#d8	"d"
	#d8	44
	#d8	32
	#d8	"M"
	#d8	"I"
	#d8	"N"
	#d8	"U"
	#d8	"T"
	#d8	"E"
	#d8	58
	#d8	32
	#d8	37
	#d8	"d"
	#d8	44
	#d8	32
	#d8	"S"
	#d8	"E"
	#d8	"C"
	#d8	"O"
	#d8	"N"
	#d8	"D"
	#d8	58
	#d8	32
	#d8	37
	#d8	"d"
	#d8	44
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
	addi	a0, fp, -104
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	addi	a0, fp, -104
	push	a0, sp
	li	a0, 20
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	addi	a0, fp, -104
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	addi	a0, fp, -104
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	addi	a0, fp, -104
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	addi	a0, fp, -104
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	addi	a0, fp, -104
	lw	a0, 0(a0)
	push	a0, sp
	la	a0, L21
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 36
L22:
	j	L23
L25:
	j	L22
L23:
	j	L25
L24:
L2:
	addi	sp, sp, 312
	pop	fp, sp
	ret
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
L1ION:
	pop	fp, sp
	ret
	#bank text
	#align 32
Cupdate_cursor:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	mul	zero, a0, a1, a0
	sw	a0, -4(fp)
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	beqz	a0, L3ION
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	j	L5ION
L6ION:
L7ION:
	li	a0, 56
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
	add	a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 36
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
L8ION:
	li	a0, 56
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
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 32
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
	j	L4ION
L9ION:
	j	L4ION
	j	L4ION
L5ION:
	la	a1, L10ION
	j	switch
L10ION:
	#d32	3
	#d32	5, L6ION
	#d32	1, L7ION
	#d32	0, L8ION
	#d32	L9ION
L4ION:
L3ION:
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	sw	a0, 0(a1)
L2ION:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Ctxtmod_clear
	#align 32
Ctxtmod_clear:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	sw	a0, -12(fp)
	li	a0, 0
	sw	a0, -4(fp)
L12ION:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	blt	a1, a0, L16ION
	j	L14ION
L16ION:
	j	L13ION
L15ION:
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -4(fp)
	j	L12ION
L13ION:
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a0, a1, L18ION
	j	L17ION
L18ION:
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 28
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
L17ION:
	j	L15ION
L14ION:
L11ION:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Ctxtmod_scroll
	#align 32
Ctxtmod_scroll:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	push	ra, sp
	call	Ccopy
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 0
	sw	a0, -4(fp)
L20ION:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	blt	a1, a0, L24ION
	j	L22ION
L24ION:
	j	L21ION
L23ION:
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -4(fp)
	j	L20ION
L21ION:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a0, a1, L26ION
	j	L25ION
L26ION:
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 28
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
L25ION:
	j	L23ION
L22ION:
L19ION:
	addi	sp, sp, 8
	pop	fp, sp
	ret
	;#globl	Ctxtmod_clear_update
	#align 32
Ctxtmod_clear_update:	push	fp, sp
	mv	fp, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_clear
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
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
	sb	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cupdate_cursor
	pop	ra, sp
	addi	sp, sp, 4
L27ION:
	pop	fp, sp
	ret
	;#globl	Ctxtmod_putc
	#align 32
Ctxtmod_putc:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 8
	push	a0, sp
	mv	a0, zero
	lbu	a0, 15(fp)
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
	beqz	a0, L29ION
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
L29ION:
	beqz	a0, L30ION
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	mv	a1, a0
	lbu	a0, 0(a0);notaligned
	lbu	t0, 0(a1)
	subi	t0, t0, 1
	sb	t0, 0(a1)
	j	L31ION
L30ION:
	li	a0, 9
	push	a0, sp
	mv	a0, zero
	lbu	a0, 15(fp)
	pop	a1, sp
	beq	a1, a0, L33ION
	j	L32ION
L33ION:
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 52
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	not	a0, a0
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	j	L34ION
L32ION:
	li	a0, 13
	push	a0, sp
	mv	a0, zero
	lbu	a0, 15(fp)
	pop	a1, sp
	beq	a1, a0, L36ION
	j	L35ION
L36ION:
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
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
	sb	a0, 0(a1)
	j	L37ION
L35ION:
	li	a0, 10
	push	a0, sp
	mv	a0, zero
	lbu	a0, 15(fp)
	pop	a1, sp
	beq	a1, a0, L39ION
	j	L38ION
L39ION:
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
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
	sb	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	mv	a1, a0
	lbu	a0, 0(a0);notaligned
	lbu	t0, 0(a1)
	addi	t0, t0, 1
	sb	t0, 0(a1)
	j	L40ION
L38ION:
	mv	a0, zero
	lbu	a0, 15(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	bge	a1, a0, L42ION
	j	L41ION
L42ION:
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	push	a0, sp
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	sw	a0, -4(fp)
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	j	L44ION
L45ION:
L46ION:
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	sb	a0, 0(a1)
L47ION:
	li	a0, 56
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	mv	a0, zero
	lbu	a0, 15(fp)
	pop	a1, sp
	sb	a0, 0(a1)
	j	L43ION
L48ION:
	j	L43ION
	j	L43ION
L44ION:
	la	a1, L49ION
	j	switch
L49ION:
	#d32	3
	#d32	5, L45ION
	#d32	1, L46ION
	#d32	0, L47ION
	#d32	L48ION
L43ION:
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	mv	a1, a0
	lbu	a0, 0(a0);notaligned
	lbu	t0, 0(a1)
	addi	t0, t0, 1
	sb	t0, 0(a1)
L41ION:
L40ION:
L37ION:
L34ION:
L31ION:
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	bge	a1, a0, L51ION
	j	L50ION
L51ION:
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	mv	a1, a0
	lbu	a0, 0(a0);notaligned
	lbu	t0, 0(a1)
	addi	t0, t0, 1
	sb	t0, 0(a1)
L50ION:
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	bge	a1, a0, L53ION
	j	L52ION
L53ION:
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_scroll
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 64
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 64
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 48
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	pop	a1, sp
	mul	zero, a0, a1, a0
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	mv	a1, a0
	lbu	a0, 0(a0);notaligned
	lbu	t0, 0(a1)
	subi	t0, t0, 1
	sb	t0, 0(a1)
L52ION:
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cupdate_cursor
	pop	ra, sp
	addi	sp, sp, 4
L28ION:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Ctxtmod_puts
	#align 32
Ctxtmod_puts:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
L56ION:
	lw	a0, 12(fp)
	lw	t0, 12(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, 12(fp)
	lbu	a0, 0(a0);notaligned
	sb	a0, -1(fp)
	beqz	a0, L55ION
	mv	a0, zero
	lbu	a0, -1(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	j	L56ION
L55ION:
L54ION:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#bank data
	L57ION:	#res 4096
	#bank text
	;#globl	Ctxtmod_printf
	#align 32
Ctxtmod_printf:	push	fp, sp
	mv	fp, sp
	addi	a0, fp, 12
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	shlli	a0, a0, 2
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	la	a0, L57ION
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	C_vformat
	pop	ra, sp
	addi	sp, sp, 20
	la	a0, L57ION
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_puts
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 0
	j	L58ION
L58ION:
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
L2SYS:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 4000
	pop	a1, sp
	blt	a1, a0, L6SYS
	j	L4SYS
L6SYS:
	j	L3SYS
L5SYS:
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
	j	L2SYS
L3SYS:
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
	j	L5SYS
L4SYS:
L8SYS:
	li	a0, 1
	beqz	a0, L7SYS
	j	L8SYS
L7SYS:
L1SYS:
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
L11SYS:
	lw	a0, 12(fp)
	lw	t0, 12(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, 12(fp)
	lbu	a0, 0(a0);notaligned
	sb	a0, -1(fp)
	beqz	a0, L10SYS
	li	a0, 47
	push	a0, sp
	mv	a0, zero
	lbu	a0, -1(fp)
	pop	a1, sp
	beq	a1, a0, L13SYS
	j	L12SYS
L13SYS:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, 12(fp)
	j	L9SYS
L12SYS:
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
	j	L11SYS
L10SYS:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 0
	j	L9SYS
L9SYS:
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
L15SYS:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a0, a1, L19SYS
	j	L17SYS
L19SYS:
	j	L16SYS
L18SYS:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	subi	t0, t0, 1; cgdeclw
	sw	t0, -8(fp)
	j	L15SYS
L16SYS:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 47
	pop	a1, sp
	beq	a1, a0, L21SYS
	j	L20SYS
L21SYS:
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
	j	L14SYS
L20SYS:
	j	L18SYS
L17SYS:
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
	lw	a0, 8(fp)
	j	L14SYS
L14SYS:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cfs_open_file
	#align 32
Cfs_open_file:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	lw	a0, 12(fp)
	beqz	a0, L23SYS
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
	beq	a1, a0, L25SYS
	j	L24SYS
L25SYS:
	lw	a0, 12(fp)
	lbu	a0, 0(a0);notaligned
	sb	a0, -1(fp)
	li	a0, 2
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
L24SYS:
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
	beqz	a0, L26SYS
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
	j	L22SYS
	j	L27SYS
L26SYS:
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
	j	L22SYS
L27SYS:
	j	L28SYS
L23SYS:
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
	j	L22SYS
L28SYS:
L22SYS:
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
	beq	a1, a0, L31SYS
	j	L30SYS
L31SYS:
	li	a0, -44
	j	L29SYS
L30SYS:
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
	beq	a1, a0, L33SYS
	j	L32SYS
L33SYS:
	li	a0, -41
	j	L29SYS
L32SYS:
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
	j	L29SYS
L29SYS:
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
	beq	a1, a0, L36SYS
	j	L35SYS
L36SYS:
	li	a0, -44
	j	L34SYS
L35SYS:
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
	beq	a1, a0, L38SYS
	j	L37SYS
L38SYS:
	li	a0, -41
	j	L34SYS
L37SYS:
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
	j	L34SYS
L34SYS:
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
	bge	a1, a0, L41SYS
	j	L40SYS
L41SYS:
	li	a0, -42
	j	L39SYS
L40SYS:
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L43SYS
	j	L42SYS
L43SYS:
	li	a0, -43
	j	L39SYS
L42SYS:
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
	j	L39SYS
L39SYS:
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
	beq	a1, a0, L46SYS
	j	L45SYS
L46SYS:
	li	a0, -43
	j	L44SYS
L45SYS:
	li	a0, 0
	sw	a0, -4(fp)
L47SYS:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	blt	a1, a0, L51SYS
	j	L49SYS
L51SYS:
	j	L48SYS
L50SYS:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L47SYS
L48SYS:
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
	beq	a1, a0, L53SYS
	j	L52SYS
L53SYS:
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
L52SYS:
	j	L50SYS
L49SYS:
	li	a0, 0
	j	L44SYS
L44SYS:
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
	bge	a1, a0, L56SYS
	j	L55SYS
L56SYS:
	li	a0, -42
	j	L54SYS
L55SYS:
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
	j	L54SYS
L54SYS:
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
L57SYS:
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
L58SYS:
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
L59SYS:
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
	j	L60SYS
L60SYS:
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
L62SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	bltu	a1, a0, L66SYS
	j	L64SYS
L66SYS:
	j	L63SYS
L65SYS:
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
	j	L62SYS
L63SYS:
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a0, a1, L68SYS
	j	L67SYS
L68SYS:
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	sw	a0, -8(fp)
L69SYS:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	sltu	a0, a1, a0
	beqz	a0, L73SYS
	lw	a0, -8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sgt	a0, a1, a0
L73SYS:
	beqz	a0, L71SYS
	j	L70SYS
L72SYS:
	lw	a0, -8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	sw	a0, -8(fp)
	j	L69SYS
L70SYS:
	j	L72SYS
L71SYS:
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
L67SYS:
	j	L65SYS
L64SYS:
L61SYS:
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
	beq	a1, a0, L76SYS
	j	L75SYS
L76SYS:
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 128
	pop	a1, sp
	bge	a1, a0, L78SYS
	j	L77SYS
L78SYS:
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	ssw	a0, C_asize, t0
	j	L79SYS
L77SYS:
	li	a0, 10
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	ssw	a0, C_asize, t0
L79SYS:
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
	beqz	a0, L80SYS
	li	a0, 0
	j	L74SYS
L80SYS:
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
L75SYS:
	li	a0, 0
	sw	a0, -20(fp)
L81SYS:
	lw	a0, -20(fp)
	push	a0, sp
	li	a0, 3
	pop	a1, sp
	blt	a1, a0, L85SYS
	j	L83SYS
L85SYS:
	j	L82SYS
L84SYS:
	lw	a0, -20(fp)
	lw	t0, -20(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -20(fp)
	j	L81SYS
L82SYS:
	llw	a0, C_asize
	push	a0, sp
	llw	a0, C_arena
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	sw	a0, -8(fp)
	llw	a0, Cfreep
	sw	a0, -4(fp)
L86SYS:
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	blt	a0, a1, L90SYS
	j	L89SYS
L90SYS:
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	pop	a1, sp
	beq	a1, a0, L92SYS
	j	L91SYS
L92SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	neg	a0, a0
	pop	a1, sp
	sw	a0, 0(a1)
	j	L93SYS
L91SYS:
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
L93SYS:
	lw	a0, -4(fp)
	ssw	a0, Cfreep, t0
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	j	L74SYS
L89SYS:
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
	beq	a1, a0, L95SYS
	j	L94SYS
L95SYS:
	llw	a0, C_arena
	sw	a0, -4(fp)
L94SYS:
	lw	a0, -4(fp)
	push	a0, sp
	llw	a0, C_arena
	pop	a1, sp
	sltu	a0, a1, a0
	bnez	a0, L96SYS
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	sltu	a0, a1, a0
	seqz	a0, a0
	bnez	a0, L96SYS
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
L96SYS:
	beqz	a0, L97SYS
	li	a0, -20
	ssw	a0, Ckmalloc_err, t0
	li	a0, 0
	j	L74SYS
L97SYS:
L88SYS:
	llw	a0, Cfreep
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	beq	a1, a0, L98SYS
	j	L86SYS
L98SYS:
L87SYS:
	lw	a0, -20(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L100SYS
	j	L99SYS
L100SYS:
	push	ra, sp
	call	Cdefrag
	pop	ra, sp
	j	L101SYS
L99SYS:
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 128
	pop	a1, sp
	bge	a1, a0, L103SYS
	j	L102SYS
L103SYS:
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -16(fp)
	j	L104SYS
L102SYS:
	li	a0, 10
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	sw	a0, -16(fp)
L104SYS:
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
	beqz	a0, L105SYS
	li	a0, 0
	j	L74SYS
L105SYS:
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
L101SYS:
	j	L84SYS
L83SYS:
	li	a0, -10
	ssw	a0, Ckmalloc_err, t0
	li	a0, 0
	j	L74SYS
L74SYS:
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
	beq	a1, a0, L108SYS
	j	L107SYS
L108SYS:
	li	a0, 0
	j	L106SYS
L107SYS:
	lw	a0, 8(fp)
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	llw	a0, C_arena
	pop	a1, sp
	sltu	a0, a1, a0
	bnez	a0, L109SYS
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
	bnez	a0, L109SYS
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
L109SYS:
	beqz	a0, L110SYS
	li	a0, -21
	ssw	a0, Ckmalloc_err, t0
	li	a0, -21
	j	L106SYS
L110SYS:
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
	j	L106SYS
L106SYS:
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
	j	L111SYS
L111SYS:
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
L112SYS:
	pop	fp, sp
	ret
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
L113SYS:
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
L114SYS:
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
	j	L115SYS
L115SYS:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	#align 32
Cfirst_frame:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	li	a0, 0
	sw	a0, -4(fp)
L117SYS:
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
	blt	a1, a0, L121SYS
	j	L119SYS
L121SYS:
	j	L118SYS
L120SYS:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L117SYS
L118SYS:
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
	bne	a1, a0, L123SYS
	j	L122SYS
L123SYS:
	li	a0, 0
	sw	a0, -8(fp)
L124SYS:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	blt	a1, a0, L128SYS
	j	L126SYS
L128SYS:
	j	L125SYS
L127SYS:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	j	L124SYS
L125SYS:
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
	bnez	a0, L129SYS
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
	j	L116SYS
L129SYS:
	j	L127SYS
L126SYS:
L122SYS:
	j	L120SYS
L119SYS:
L116SYS:
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
L131SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	blt	a1, a0, L135SYS
	j	L133SYS
L135SYS:
	j	L132SYS
L134SYS:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L131SYS
L132SYS:
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
	beqz	a0, L136SYS
	lw	a0, -8(fp)
	j	L130SYS
L136SYS:
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
	j	L134SYS
L133SYS:
	li	a0, 0
	j	L130SYS
L130SYS:
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
L138SYS:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	blt	a1, a0, L142SYS
	j	L140SYS
L142SYS:
	j	L139SYS
L141SYS:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L138SYS
L139SYS:
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
	j	L141SYS
L140SYS:
L137SYS:
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
	bne	a1, a0, L145SYS
	j	L144SYS
L145SYS:
	li	a0, 0
	j	L143SYS
	j	L146SYS
L144SYS:
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
	beq	a1, a0, L148SYS
	j	L147SYS
L148SYS:
	li	a0, -10
	j	L143SYS
L147SYS:
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
	beqz	a0, L149SYS
	li	a0, 2
	j	L150SYS
L149SYS:
	li	a0, 0
L150SYS:
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
	beqz	a0, L151SYS
	li	a0, 1
	j	L152SYS
L151SYS:
	li	a0, 0
L152SYS:
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
	addi	sp, sp, 12
L146SYS:
	li	a0, 0
	j	L143SYS
L143SYS:
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
	beqz	a0, L154SYS
	j	L153SYS
	j	L155SYS
L154SYS:
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
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cmmu_unmap
	pop	ra, sp
	addi	sp, sp, 4
L155SYS:
L153SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cpage_fault_handler
	#align 32
Cpage_fault_handler:	push	fp, sp
	mv	fp, sp
	#bank data
L157SYS:
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
	la	a0, L157SYS
	push	a0, sp
	push	ra, sp
	call	Cpanic
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -2
	j	L156SYS
L156SYS:
	pop	fp, sp
	ret
	;#globl	Cpaging_init
	#align 32
Cpaging_init:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
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
	llw	a0, CKernelPhys
	sw	a0, -4(fp)
L160SYS:
	lw	a0, -4(fp)
	push	a0, sp
	llw	a0, CKernelEnd
	pop	a1, sp
	blt	a1, a0, L161SYS
	j	L159SYS
L161SYS:
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cset_frame
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cmmu_map
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 4096
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -4(fp)
	j	L160SYS
L159SYS:
	li	a0, 15011840
	sw	a0, -4(fp)
L163SYS:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 15327232
	pop	a1, sp
	blt	a1, a0, L164SYS
	j	L162SYS
L164SYS:
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cset_frame
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Cmmu_map
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 4096
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -4(fp)
	j	L163SYS
L162SYS:
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
L158SYS:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#bank text
	#bank data
	Cdisk_read_drivers:	#res 1024
	Cdisk_write_drivers:	#res 1024
	#bank text
	;#globl	Cdisk_istall_drivers
	#align 32
Cdisk_istall_drivers:	push	fp, sp
	mv	fp, sp
	la	a0, Cdisk_read_drivers
	push	a0, sp
	lw	a0, 8(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Cdisk_write_drivers
	push	a0, sp
	lw	a0, 8(fp)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	sw	a0, 0(a1)
L1DEV:
	pop	fp, sp
	ret
	;#globl	Cdisk_load_sector
	#align 32
Cdisk_load_sector:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	bge	a1, a0, L4DEV
	j	L3DEV
L4DEV:
	li	a0, -30
	j	L2DEV
L3DEV:
	la	a0, Cdisk_read_drivers
	push	a0, sp
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -4(fp)
	beqz	a0, L5DEV
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 0
	j	L2DEV
	j	L6DEV
L5DEV:
	li	a0, -31
	j	L2DEV
L6DEV:
L2DEV:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cdisk_store_sector
	#align 32
Cdisk_store_sector:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	bge	a1, a0, L9DEV
	j	L8DEV
L9DEV:
	li	a0, -30
	j	L7DEV
L8DEV:
	la	a0, Cdisk_write_drivers
	push	a0, sp
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -4(fp)
	beqz	a0, L10DEV
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	push	ra, sp
	jalr	 ra, 0(a0)
	pop	ra, sp
	addi	sp, sp, 12
	li	a0, 0
	j	L7DEV
	j	L11DEV
L10DEV:
	li	a0, -31
	j	L7DEV
L11DEV:
L7DEV:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cdisk_load_sectors
	#align 32
Cdisk_load_sectors:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	lw	a0, 20(fp)
	sw	a0, -12(fp)
	li	a0, 0
	sw	a0, -4(fp)
L13DEV:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	blt	a1, a0, L17DEV
	j	L15DEV
L17DEV:
	j	L14DEV
L16DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L13DEV
L14DEV:
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cdisk_load_sector
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -8(fp)
	beqz	a0, L18DEV
	lw	a0, -8(fp)
	j	L12DEV
L18DEV:
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -12(fp)
	j	L16DEV
L15DEV:
	li	a0, 0
	j	L12DEV
L12DEV:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Cdisk_store_sectors
	#align 32
Cdisk_store_sectors:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	lw	a0, 20(fp)
	sw	a0, -12(fp)
	li	a0, 0
	sw	a0, -4(fp)
L20DEV:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	blt	a1, a0, L24DEV
	j	L22DEV
L24DEV:
	j	L21DEV
L23DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L20DEV
L21DEV:
	lw	a0, -12(fp)
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cdisk_store_sector
	pop	ra, sp
	addi	sp, sp, 12
	sw	a0, -8(fp)
	beqz	a0, L25DEV
	lw	a0, -8(fp)
	j	L19DEV
L25DEV:
	li	a0, 12
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -12(fp)
	j	L23DEV
L22DEV:
	li	a0, 0
	j	L19DEV
L19DEV:
	addi	sp, sp, 12
	pop	fp, sp
	ret
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
	j	L26DEV
L26DEV:
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
	j	L27DEV
L27DEV:
	pop	fp, sp
	ret
	#align 32
Cfat12_check_fname:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	li	a0, 0
	sw	a0, -4(fp)
L29DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 9
	pop	a1, sp
	blt	a1, a0, L33DEV
	j	L31DEV
L33DEV:
	j	L30DEV
L32DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L29DEV
L30DEV:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 46
	pop	a1, sp
	beq	a1, a0, L35DEV
	j	L34DEV
L35DEV:
	j	L31DEV
L34DEV:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L37DEV
	j	L36DEV
L37DEV:
	li	a0, 0
	j	L28DEV
L36DEV:
	j	L32DEV
L31DEV:
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
L38DEV:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 5
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	add	a0, a1, a0
	pop	a1, sp
	blt	a1, a0, L42DEV
	j	L40DEV
L42DEV:
	j	L39DEV
L41DEV:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	j	L38DEV
L39DEV:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L44DEV
	j	L43DEV
L44DEV:
	li	a0, 0
	j	L28DEV
L43DEV:
	j	L41DEV
L40DEV:
	li	a0, 1
	j	L28DEV
L28DEV:
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
L47DEV:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	lbu	a0, 0(a0);notaligned
	sb	a0, -1(fp)
	beqz	a0, L46DEV
	li	a0, 46
	push	a0, sp
	mv	a0, zero
	lbu	a0, -1(fp)
	pop	a1, sp
	beq	a1, a0, L49DEV
	j	L48DEV
L49DEV:
	li	a0, 8
	sw	a0, -12(fp)
	j	L47DEV
L48DEV:
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
	j	L47DEV
L46DEV:
	li	a0, 11
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sb	a0, 0(a1)
L45DEV:
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
	beqz	a0, L51DEV
	lw	a0, -524(fp)
	j	L50DEV
L51DEV:
	li	a0, 0
	sw	a0, -520(fp)
L52DEV:
	lw	a0, -520(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	blt	a1, a0, L56DEV
	j	L54DEV
L56DEV:
	j	L53DEV
L55DEV:
	lw	a0, -520(fp)
	lw	t0, -520(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -520(fp)
	j	L52DEV
L53DEV:
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
	j	L55DEV
L54DEV:
	li	a0, 0
	sw	a0, -520(fp)
L57DEV:
	lw	a0, -520(fp)
	push	a0, sp
	li	a0, 11
	pop	a1, sp
	blt	a1, a0, L61DEV
	j	L59DEV
L61DEV:
	j	L58DEV
L60DEV:
	lw	a0, -520(fp)
	lw	t0, -520(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -520(fp)
	j	L57DEV
L58DEV:
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
	j	L60DEV
L59DEV:
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
	j	L50DEV
L50DEV:
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
L62DEV:
	pop	fp, sp
	ret
	#align 32
Cfat12_parse_entry:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 0
	sw	a0, -4(fp)
L64DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	blt	a1, a0, L68DEV
	j	L66DEV
L68DEV:
	j	L65DEV
L67DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L64DEV
L65DEV:
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
	j	L67DEV
L66DEV:
	li	a0, 0
	sw	a0, -4(fp)
L69DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 3
	pop	a1, sp
	blt	a1, a0, L73DEV
	j	L71DEV
L73DEV:
	j	L70DEV
L72DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L69DEV
L70DEV:
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
	j	L72DEV
L71DEV:
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
L63DEV:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#align 32
Cfat12_unparse_entry:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 0
	sw	a0, -4(fp)
L75DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	blt	a1, a0, L79DEV
	j	L77DEV
L79DEV:
	j	L76DEV
L78DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L75DEV
L76DEV:
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
	j	L78DEV
L77DEV:
	li	a0, 0
	sw	a0, -4(fp)
L80DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 3
	pop	a1, sp
	blt	a1, a0, L84DEV
	j	L82DEV
L84DEV:
	j	L81DEV
L83DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L80DEV
L81DEV:
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
	j	L83DEV
L82DEV:
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
L74DEV:
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
	beq	a1, a0, L87DEV
	j	L86DEV
L87DEV:
	li	a0, -45
	j	L85DEV
L86DEV:
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
L88DEV:
	lw	a0, -16(fp)
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	blt	a1, a0, L92DEV
	j	L90DEV
L92DEV:
	j	L89DEV
L91DEV:
	lw	a0, -16(fp)
	lw	t0, -16(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -16(fp)
	j	L88DEV
L89DEV:
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
	beqz	a0, L93DEV
	addi	a0, fp, -164
	lw	a0, 0(a0)
	j	L85DEV
L93DEV:
	li	a0, 0
	sw	a0, -20(fp)
L94DEV:
	lw	a0, -20(fp)
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	blt	a1, a0, L98DEV
	j	L96DEV
L98DEV:
	j	L95DEV
L97DEV:
	lw	a0, -20(fp)
	lw	t0, -20(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -20(fp)
	j	L94DEV
L95DEV:
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
	beq	a1, a0, L100DEV
	j	L99DEV
L100DEV:
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
L101DEV:
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
	la	a0, L101DEV
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
	beqz	a0, L102DEV
	li	a0, 32
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	j	L103DEV
L102DEV:
	li	a0, 32
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
L103DEV:
	li	a0, 0
	j	L85DEV
L99DEV:
	j	L97DEV
L96DEV:
	j	L91DEV
L90DEV:
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
	j	L85DEV
L85DEV:
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
	beq	a1, a0, L106DEV
	j	L105DEV
L106DEV:
	li	a0, -45
	j	L104DEV
L105DEV:
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
L107DEV:
	lw	a0, -16(fp)
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, -76(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	blt	a1, a0, L111DEV
	j	L109DEV
L111DEV:
	j	L108DEV
L110DEV:
	lw	a0, -16(fp)
	lw	t0, -16(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -16(fp)
	j	L107DEV
L108DEV:
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
	beqz	a0, L112DEV
	addi	a0, fp, -160
	lw	a0, 0(a0)
	j	L104DEV
L112DEV:
	li	a0, 0
	sw	a0, -20(fp)
L113DEV:
	lw	a0, -20(fp)
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	blt	a1, a0, L117DEV
	j	L115DEV
L117DEV:
	j	L114DEV
L116DEV:
	lw	a0, -20(fp)
	lw	t0, -20(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -20(fp)
	j	L113DEV
L114DEV:
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
	beq	a1, a0, L119DEV
	j	L118DEV
L119DEV:
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
L120DEV:
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
	la	a0, L120DEV
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
	beqz	a0, L121DEV
	li	a0, 32
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	sw	a0, 0(a1)
	j	L122DEV
L121DEV:
	li	a0, 32
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
L122DEV:
	li	a0, 0
	j	L104DEV
L118DEV:
	j	L116DEV
L115DEV:
	j	L110DEV
L109DEV:
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
	j	L104DEV
L104DEV:
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
	beq	a1, a0, L125DEV
	j	L124DEV
L125DEV:
	li	a0, -45
	j	L123DEV
L124DEV:
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
L126DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 24
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	blt	a1, a0, L130DEV
	j	L128DEV
L130DEV:
	j	L127DEV
L129DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L126DEV
L127DEV:
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
	beqz	a0, L131DEV
	addi	a0, fp, -100
	lw	a0, 0(a0)
	j	L123DEV
L131DEV:
	li	a0, 0
	sw	a0, -8(fp)
L132DEV:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	blt	a1, a0, L136DEV
	j	L134DEV
L136DEV:
	j	L133DEV
L135DEV:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	j	L132DEV
L133DEV:
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
	j	L138DEV
L139DEV:
L140DEV:
L141DEV:
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
	j	L123DEV
	j	L137DEV
L142DEV:
	j	L137DEV
	j	L137DEV
L138DEV:
	la	a1, L143DEV
	j	switch
L143DEV:
	#d32	3
	#d32	0, L139DEV
	#d32	5, L140DEV
	#d32	229, L141DEV
	#d32	L142DEV
L137DEV:
	j	L135DEV
L134DEV:
	j	L129DEV
L128DEV:
	li	a0, -51
	j	L123DEV
L123DEV:
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
	beq	a1, a0, L146DEV
	j	L145DEV
L146DEV:
	li	a0, -45
	j	L144DEV
L145DEV:
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
L147DEV:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	blt	a1, a0, L151DEV
	j	L149DEV
L151DEV:
	j	L148DEV
L150DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L147DEV
L148DEV:
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
	beqz	a0, L152DEV
	addi	a0, fp, -104
	lw	a0, 0(a0)
	j	L144DEV
L152DEV:
	li	a0, 0
	sw	a0, -8(fp)
L153DEV:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	blt	a1, a0, L157DEV
	j	L155DEV
L157DEV:
	j	L154DEV
L156DEV:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	j	L153DEV
L154DEV:
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
	j	L159DEV
L160DEV:
L161DEV:
L162DEV:
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
	j	L144DEV
	j	L158DEV
L163DEV:
	j	L158DEV
	j	L158DEV
L159DEV:
	la	a1, L164DEV
	j	switch
L164DEV:
	#d32	3
	#d32	0, L160DEV
	#d32	5, L161DEV
	#d32	229, L162DEV
	#d32	L163DEV
L158DEV:
	j	L156DEV
L155DEV:
	j	L150DEV
L149DEV:
	li	a0, -51
	j	L144DEV
L144DEV:
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
	beq	a1, a0, L167DEV
	j	L166DEV
L167DEV:
	li	a0, -45
	j	L165DEV
L166DEV:
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
	beqz	a0, L168DEV
	addi	a0, fp, -348
	lw	a0, 0(a0)
	j	L165DEV
L168DEV:
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
L169DEV:
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
	beqz	a0, L172DEV
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -48
	j	L165DEV
L172DEV:
	addi	a0, fp, -32
	push	a0, sp
	addi	a0, fp, -20
	push	a0, sp
	push	ra, sp
	call	Cfat12_parse_fname
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, -48(fp)
	beqz	a0, L173DEV
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
	beqz	a0, L174DEV
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -348
	lw	a0, 0(a0)
	j	L165DEV
L174DEV:
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
	beqz	a0, L175DEV
	lw	a0, -4(fp)
L175DEV:
	beqz	a0, L176DEV
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -49
	j	L165DEV
L176DEV:
	j	L177DEV
L173DEV:
	#bank data
L178DEV:
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
	la	a0, L178DEV
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
	beqz	a0, L179DEV
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -348
	lw	a0, 0(a0)
	j	L165DEV
L179DEV:
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
	beqz	a0, L180DEV
	lw	a0, -4(fp)
L180DEV:
	beqz	a0, L181DEV
	lw	a0, -36(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -49
	j	L165DEV
L181DEV:
L177DEV:
L171DEV:
	lw	a0, -4(fp)
	bnez	a0, L169DEV
L170DEV:
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
	j	L165DEV
L165DEV:
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
L182DEV:
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
	beqz	a0, L184DEV
	j	TLlfat12_next_cluster_cleanup
L184DEV:
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
	beqz	a0, L185DEV
	j	TLlfat12_next_cluster_cleanup
L185DEV:
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
	beqz	a0, L186DEV
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	j	L187DEV
L186DEV:
	li	a0, 4095
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	and	a0, a0, a1
L187DEV:
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
	j	L183DEV
L183DEV:
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
	beqz	a0, L189DEV
	j	TLlfat12_mark_fat_entry_cleanup
L189DEV:
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
	beqz	a0, L190DEV
	j	TLlfat12_mark_fat_entry_cleanup
L190DEV:
	li	a0, 1
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	and	a0, a0, a1
	beqz	a0, L191DEV
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
	j	L192DEV
L191DEV:
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
L192DEV:
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
	j	L188DEV
L188DEV:
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
	beq	a1, a0, L195DEV
	j	L194DEV
L195DEV:
	li	a0, -44
	j	L193DEV
L194DEV:
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L197DEV
	j	L196DEV
L197DEV:
	li	a0, -42
	j	L193DEV
L196DEV:
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
	beq	a1, a0, L199DEV
	j	L198DEV
L199DEV:
	li	a0, -41
	j	L193DEV
L198DEV:
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
	beqz	a0, L200DEV
	addi	a0, fp, -604
	lw	a0, 0(a0)
	j	L193DEV
L200DEV:
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
L201DEV:
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
	la	a0, L201DEV
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
	beqz	a0, L202DEV
	#bank data
L203DEV:
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
	la	a0, L203DEV
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_printf
	pop	ra, sp
	addi	sp, sp, 12
	addi	a0, fp, -604
	lw	a0, 0(a0)
	j	L193DEV
L202DEV:
	li	a0, 0
	j	L193DEV
L193DEV:
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
	blt	a1, a0, L206DEV
	j	L205DEV
L206DEV:
	lw	a0, -4(fp)
	j	L204DEV
	j	L207DEV
L205DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 4088
	pop	a1, sp
	bge	a1, a0, L209DEV
	j	L208DEV
L209DEV:
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
L210DEV:
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
	la	a0, L210DEV
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
	beq	a1, a0, L212DEV
	j	L211DEV
L212DEV:
	li	a0, 1908
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -52
	j	L204DEV
	j	L213DEV
L211DEV:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a1, a0, L215DEV
	j	L214DEV
L215DEV:
	li	a0, 1907
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -8(fp)
	j	L204DEV
L214DEV:
L213DEV:
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
	beqz	a0, L216DEV
	lw	a0, -12(fp)
	j	L204DEV
L216DEV:
	li	a0, 1910
	push	a0, sp
	push	ra, sp
	call	Ctrace
	pop	ra, sp
	addi	sp, sp, 4
	lw	a0, -8(fp)
	j	L204DEV
L208DEV:
L207DEV:
	#bank data
L217DEV:
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
	la	a0, L217DEV
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
	j	L204DEV
L204DEV:
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
	beq	a1, a0, L220DEV
	j	L219DEV
L220DEV:
	li	a0, -50
	j	L218DEV
	j	L221DEV
L219DEV:
	li	a0, -46
	push	a0, sp
	lw	a0, -660(fp)
	pop	a1, sp
	bne	a1, a0, L223DEV
	j	L222DEV
L223DEV:
	lw	a0, -660(fp)
	j	L218DEV
L222DEV:
L221DEV:
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
	beqz	a0, L224DEV
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
	beq	a1, a0, L226DEV
	j	L225DEV
L226DEV:
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
	blt	a1, a0, L228DEV
	j	L227DEV
L228DEV:
	lw	a0, -656(fp)
	j	L218DEV
L227DEV:
	#bank data
L229DEV:
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
	la	a0, L229DEV
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
	j	L218DEV
	j	L230DEV
L225DEV:
	li	a0, -49
	j	L218DEV
L230DEV:
	j	L231DEV
L224DEV:
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
	blt	a1, a0, L233DEV
	j	L232DEV
L233DEV:
	lw	a0, -656(fp)
	j	L218DEV
L232DEV:
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
	j	L218DEV
L231DEV:
L218DEV:
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
	beqz	a0, L235DEV
	j	TLlfat12_get_cluster_cleanup
L235DEV:
	li	a0, 0
	sw	a0, -4(fp)
L236DEV:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 28
	push	a0, sp
	lw	a0, -28(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	pop	a1, sp
	blt	a1, a0, L240DEV
	j	L238DEV
L240DEV:
	j	L237DEV
L239DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L236DEV
L237DEV:
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
	beqz	a0, L241DEV
	j	TLlfat12_get_cluster_cleanup
L241DEV:
	li	a0, 0
	sw	a0, -8(fp)
L242DEV:
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
	blt	a1, a0, L246DEV
	j	L244DEV
L246DEV:
	j	L243DEV
L245DEV:
	li	a0, 3
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -8(fp)
	j	L242DEV
L243DEV:
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
	beq	a1, a0, L248DEV
	j	L247DEV
L248DEV:
	lw	a0, 12(fp)
	beqz	a0, L249DEV
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
L249DEV:
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
L247DEV:
	li	a0, 0
	push	a0, sp
	lw	a0, -16(fp)
	pop	a1, sp
	beq	a1, a0, L251DEV
	j	L250DEV
L251DEV:
	lw	a0, 12(fp)
	beqz	a0, L252DEV
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
L252DEV:
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
L250DEV:
	j	L245DEV
L244DEV:
	j	L239DEV
L238DEV:
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
	j	L234DEV
L234DEV:
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
	beq	a1, a0, L255DEV
	j	L254DEV
L255DEV:
	addi	a0, fp, -84
	lw	a0, 0(a0)
	j	L253DEV
L254DEV:
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
	beqz	a0, L256DEV
	addi	a0, fp, -84
	lw	a0, 0(a0)
	j	L253DEV
L256DEV:
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
	j	L253DEV
L253DEV:
	addi	sp, sp, 168
	pop	fp, sp
	ret
	;#globl	Cfat12_init
	#align 32
Cfat12_init:	push	fp, sp
	mv	fp, sp
	#bank data
L258DEV:
	#d8	"F"
	#d8	"A"
	#d8	"T"
	#d8	"1"
	#d8	"2"
	#d8	0
	#d8	0
	#d8	0
	#bank text
	la	a0, L258DEV
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
L257DEV:
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
	beqz	a0, L260DEV
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
L260DEV:
	beqz	a0, L261DEV
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
	j	L259DEV
L261DEV:
	li	a0, 0
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	beq	a1, a0, L263DEV
	j	L262DEV
L263DEV:
	li	a0, -44
	j	L259DEV
L262DEV:
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L265DEV
	j	L264DEV
L265DEV:
	li	a0, -42
	j	L259DEV
L264DEV:
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
	beq	a1, a0, L267DEV
	j	L266DEV
L267DEV:
	li	a0, -41
	j	L259DEV
L266DEV:
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
	beqz	a0, L268DEV
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
	j	L259DEV
L268DEV:
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
	beqz	a0, L269DEV
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -160
	lw	a0, 0(a0)
	j	L259DEV
L269DEV:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -52(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	blt	a1, a0, L271DEV
	j	L270DEV
L271DEV:
	llw	a0, Cfat12_dont_read
	bnez	a0, L272DEV
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
L272DEV:
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
	j	L259DEV
	j	L273DEV
L270DEV:
	llw	a0, Cfat12_dont_read
	bnez	a0, L274DEV
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
L274DEV:
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
L273DEV:
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
	beqz	a0, L275DEV
	lw	a0, -64(fp)
	push	a0, sp
	push	ra, sp
	call	Ckfree
	pop	ra, sp
	addi	sp, sp, 4
	addi	a0, fp, -160
	lw	a0, 0(a0)
	j	L259DEV
L275DEV:
	li	a0, 0
	sw	a0, -4(fp)
L276DEV:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -60(fp)
	pop	a1, sp
	blt	a1, a0, L280DEV
	j	L278DEV
L280DEV:
	j	L277DEV
L279DEV:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L276DEV
L277DEV:
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
	beqz	a0, L281DEV
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
	j	L259DEV
L281DEV:
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
	beqz	a0, L282DEV
	lw	a0, -40(fp)
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	j	L283DEV
L282DEV:
	li	a0, 4095
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	and	a0, a0, a1
L283DEV:
	sw	a0, -40(fp)
	lw	a0, -40(fp)
	push	a0, sp
	li	a0, 4088
	pop	a1, sp
	bge	a1, a0, L285DEV
	j	L284DEV
L285DEV:
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
	beq	a1, a0, L288DEV
	j	L286DEV
L288DEV:
	li	a0, -1
	j	L287DEV
L286DEV:
	li	a0, 0
L287DEV:
	j	L259DEV
L284DEV:
	li	a0, 0
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	beq	a1, a0, L290DEV
	j	L289DEV
L290DEV:
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
	j	L259DEV
L289DEV:
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
	beqz	a0, L291DEV
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
	j	L259DEV
L291DEV:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	slt	a0, a1, a0
	beqz	a0, L292DEV
	llw	a0, Cfat12_dont_read
	seqz	a0, a0
L292DEV:
	beqz	a0, L293DEV
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
	j	L278DEV
	j	L294DEV
L293DEV:
	llw	a0, Cfat12_dont_read
	bnez	a0, L295DEV
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
L295DEV:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -44(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, 16(fp)
L294DEV:
	j	L279DEV
L278DEV:
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
	j	L259DEV
L259DEV:
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
	beq	a1, a0, L298DEV
	j	L297DEV
L298DEV:
	addi	a0, fp, -84
	push	a0, sp
	li	a0, -41
	pop	a1, sp
	sw	a0, 0(a1)
	j	TLlfat12_open_end
L297DEV:
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
	beqz	a0, L299DEV
	j	TLlfat12_open_end
L299DEV:
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
	j	L296DEV
L296DEV:
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
L300DEV:
	pop	fp, sp
	ret
	;#globl	Cfat12_seek
	#align 32
Cfat12_seek:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	lw	a0, 16(fp)
	j	L303DEV
L304DEV:
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
	j	L302DEV
L305DEV:
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
	j	L302DEV
L306DEV:
	li	a0, -2
	sw	a0, -4(fp)
	j	L302DEV
	j	L302DEV
L303DEV:
	la	a1, L307DEV
	j	switch
L307DEV:
	#d32	2
	#d32	0, L304DEV
	#d32	1, L305DEV
	#d32	L306DEV
L302DEV:
	lw	a0, -4(fp)
	j	L301DEV
L301DEV:
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
	beq	a1, a0, L310DEV
	j	L309DEV
L310DEV:
	li	a0, -44
	j	L308DEV
L309DEV:
	li	a0, 76
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 26
	pop	a1, sp
	bge	a1, a0, L312DEV
	j	L311DEV
L312DEV:
	li	a0, -42
	j	L308DEV
L311DEV:
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
	beq	a1, a0, L314DEV
	j	L313DEV
L314DEV:
	li	a0, -41
	j	L308DEV
L313DEV:
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
	beqz	a0, L315DEV
	j	TLlfat12_write_cleanup
L315DEV:
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
L316DEV:
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
	la	a0, L316DEV
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
	beqz	a0, L317DEV
	j	TLlfat12_write_cleanup
L317DEV:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -32(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -40(fp)
	pop	a1, sp
	blt	a1, a0, L319DEV
	j	L318DEV
L319DEV:
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
	j	L320DEV
L318DEV:
	#bank data
L321DEV:
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
	la	a0, L321DEV
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
	beqz	a0, L322DEV
	li	a0, 1
	j	L323DEV
L322DEV:
	li	a0, 0
L323DEV:
	push	a0, sp
	lw	a0, -36(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -36(fp)
	#bank data
L324DEV:
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
	la	a0, L324DEV
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
	beqz	a0, L325DEV
	j	TLlfat12_write_cleanup
L325DEV:
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
L326DEV:
	lw	a0, -16(fp)
	push	a0, sp
	lw	a0, -36(fp)
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	pop	a1, sp
	blt	a1, a0, L330DEV
	j	L328DEV
L330DEV:
	j	L327DEV
L329DEV:
	lw	a0, -16(fp)
	lw	t0, -16(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -16(fp)
	j	L326DEV
L327DEV:
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
	blt	a1, a0, L332DEV
	j	L331DEV
L332DEV:
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	j	TLlfat12_write_cleanup
L331DEV:
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
	beqz	a0, L333DEV
	j	TLlfat12_write_cleanup
L333DEV:
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
	beqz	a0, L334DEV
	j	TLlfat12_write_cleanup
L334DEV:
	j	L329DEV
L328DEV:
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
	blt	a1, a0, L336DEV
	j	L335DEV
L336DEV:
	addi	a0, fp, -136
	push	a0, sp
	lw	a0, -24(fp)
	pop	a1, sp
	sw	a0, 0(a1)
	j	TLlfat12_write_cleanup
L335DEV:
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
	beqz	a0, L337DEV
	j	TLlfat12_write_cleanup
L337DEV:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	exch	a0, a1
	sub	a0, a0, a1
	sw	a0, -44(fp)
	#bank data
L338DEV:
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
	la	a0, L338DEV
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
	beqz	a0, L339DEV
	j	TLlfat12_write_cleanup
L339DEV:
	lw	a0, -24(fp)
	sw	a0, -28(fp)
L320DEV:
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
	beqz	a0, L340DEV
	lw	a0, 16(fp)
	j	L341DEV
L340DEV:
	li	a0, 0
L341DEV:
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
	j	L308DEV
L308DEV:
	addi	sp, sp, 136
	pop	fp, sp
	ret
	#bank text
	#bank data
	;#globl	Ckb_key_pressed
Ckb_key_pressed:	#d32	0
	#bank text
	;#globl	Ckb_get
	#align 32
Ckb_get:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	push	ra, sp
	call	Ckb_lwd
	pop	ra, sp
	sw	a0, -4(fp)
	lw	a0, 8(fp)
	push	a0, sp
	lw	a0, -4(fp)
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
	li	a0, 4
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shra	a0, a0, a1
	pop	a1, sp
	sb	a0, 0(a1)
	li	a0, 8
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 65535
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L342DEV:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#align 32
Cprintable:	push	fp, sp
	mv	fp, sp
	mv	a0, zero
	lbu	a0, 11(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	slt	a0, a1, a0
	seqz	a0, a0
	beqz	a0, L344DEV
	mv	a0, zero
	lbu	a0, 11(fp)
	push	a0, sp
	li	a0, 126
	pop	a1, sp
	sgt	a0, a1, a0
	seqz	a0, a0
L344DEV:
	snez	a0, a0
	bnez	a0, L345DEV
	mv	a0, zero
	lbu	a0, 11(fp)
	push	a0, sp
	li	a0, 161
	pop	a1, sp
	slt	a0, a1, a0
	seqz	a0, a0
L345DEV:
	beqz	a0, L346DEV
	mv	a0, zero
	lbu	a0, 11(fp)
	j	L343DEV
	j	L347DEV
L346DEV:
	li	a0, 63
	j	L343DEV
L347DEV:
L343DEV:
	pop	fp, sp
	ret
	#align 32
Ckb_callback:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	addi	a0, fp, -12
	push	a0, sp
	push	ra, sp
	call	Ckb_get
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, 1
	ssw	a0, Ckb_key_pressed, t0
	li	a0, 0
	j	L348DEV
L348DEV:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	;#globl	Ckb_init
	#align 32
Ckb_init:	push	fp, sp
	mv	fp, sp
	la	a0, Ckb_callback
	push	a0, sp
	li	a0, 11
	push	a0, sp
	push	ra, sp
	call	Cregister_interrupt_handler
	pop	ra, sp
	addi	sp, sp, 8
	la	a0, Ckb_callback
	push	a0, sp
	li	a0, 12
	push	a0, sp
	push	ra, sp
	call	Cregister_interrupt_handler
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ckb_setmode
	pop	ra, sp
	addi	sp, sp, 4
L349DEV:
	pop	fp, sp
	ret
	#bank text
	#bank data
Ctick:	#d32	0
	#bank text
	#align 32
Ctimer_callback:	push	fp, sp
	mv	fp, sp
	llw	a0, Ctick
	llw	t0, Ctick;cgincgw
	addi	t0, t0, 1
	ssw	t0, Ctick, t5
	li	a0, 0
	j	L350DEV
L350DEV:
	pop	fp, sp
	ret
	;#globl	Ctimer_init
	#align 32
Ctimer_init:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -8
	li	t0, 65535
	sw	t0, -4(fp)
	li	t0, 255
	sw	t0, -8(fp)
	la	a0, Ctimer_callback
	push	a0, sp
	li	a0, 16
	push	a0, sp
	push	ra, sp
	call	Cregister_interrupt_handler
	pop	ra, sp
	addi	sp, sp, 8
	mv	a0, zero
	lbu	a0, -5(fp)
	push	a0, sp
	lw	a0, -4(fp)
	push	a0, sp
	push	ra, sp
	call	Ctimer_interval_set
	pop	ra, sp
	addi	sp, sp, 8
L351DEV:
	addi	sp, sp, 8
	pop	fp, sp
	ret
