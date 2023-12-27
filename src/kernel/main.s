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
