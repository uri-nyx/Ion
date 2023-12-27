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
L1:
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
	bge	a1, a0, L4
	j	L3
L4:
	li	a0, -30
	j	L2
L3:
	la	a0, Cdisk_read_drivers
	push	a0, sp
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -4(fp)
	beqz	a0, L5
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
	j	L2
	j	L6
L5:
	li	a0, -31
	j	L2
L6:
L2:
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
	bge	a1, a0, L9
	j	L8
L9:
	li	a0, -30
	j	L7
L8:
	la	a0, Cdisk_write_drivers
	push	a0, sp
	lw	a0, 8(fp)
	lw	a0, 0(a0)
	shlli	a0, a0, 2
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, -4(fp)
	beqz	a0, L10
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
	j	L7
	j	L11
L10:
	li	a0, -31
	j	L7
L11:
L7:
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
L13:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	blt	a1, a0, L17
	j	L15
L17:
	j	L14
L16:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L13
L14:
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
	beqz	a0, L18
	lw	a0, -8(fp)
	j	L12
L18:
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
	j	L16
L15:
	li	a0, 0
	j	L12
L12:
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
L20:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	blt	a1, a0, L24
	j	L22
L24:
	j	L21
L23:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L20
L21:
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
	beqz	a0, L25
	lw	a0, -8(fp)
	j	L19
L25:
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
	j	L23
L22:
	li	a0, 0
	j	L19
L19:
	addi	sp, sp, 12
	pop	fp, sp
	ret
