	#bank text
	#bank data
	;#globl	Ckb_key_pressed
Ckb_key_pressed:	#d32	0
	;#globl	Ckpress_buff
	Ckpress_buff:	#res 20
	Ckpress_data:	#res 4
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
	li	a0, 65535
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 8
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
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 12
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
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 16
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
	push	a0, sp
	li	a0, 2
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 20
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
	push	a0, sp
	li	a0, 1
	pop	a1, sp
	and	a0, a0, a1
	pop	a1, sp
	sw	a0, 0(a1)
L403:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Ckb_last
	#align 32
Ckb_last:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	llw	a0, Ckb_key_pressed
	beqz	a0, L405
	llw	a0, Ckb_key_pressed
	llw	t0, Ckb_key_pressed
	subi	t0, t0, 1
	ssw	t0, Ckb_key_pressed, t5
	lw	a0, 8(fp)
	push	a0, sp
	la	a0, Ckpress_buff
	push	a0, sp
	push	ra, sp
	call	Cringbuff_pop
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	j	L404
	j	L406
L405:
	li	a0, -60
	j	L404
L406:
L404:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#align 32
Ckb_char_handler:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -28
	push	ra, sp
	call	Cion_lock_system
	pop	ra, sp
	addi	a0, fp, -28
	push	a0, sp
	push	ra, sp
	call	Ckb_get
	pop	ra, sp
	addi	sp, sp, 4
	llw	a0, Ckb_key_pressed
	llw	t0, Ckb_key_pressed;cgincgw
	addi	t0, t0, 1
	ssw	t0, Ckb_key_pressed, t5
	addi	a0, fp, -28
	push	a0, sp
	la	a0, Ckpress_buff
	push	a0, sp
	push	ra, sp
	call	Cringbuff_push
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	push	ra, sp
	call	Cion_unlock_system
	pop	ra, sp
	lw	a0, -4(fp)
	j	L407
L407:
	addi	sp, sp, 28
	pop	fp, sp
	ret
	#align 32
Ckb_scan_handler:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -28
	push	ra, sp
	call	Cion_lock_system
	pop	ra, sp
	addi	a0, fp, -28
	push	a0, sp
	push	ra, sp
	call	Ckb_get
	pop	ra, sp
	addi	sp, sp, 4
	llw	a0, Ckb_key_pressed
	llw	t0, Ckb_key_pressed;cgincgw
	addi	t0, t0, 1
	ssw	t0, Ckb_key_pressed, t5
	addi	a0, fp, -28
	push	a0, sp
	la	a0, Ckpress_buff
	push	a0, sp
	push	ra, sp
	call	Cringbuff_push
	pop	ra, sp
	addi	sp, sp, 8
	sw	a0, -4(fp)
	push	ra, sp
	call	Cion_unlock_system
	pop	ra, sp
	lw	a0, -4(fp)
	j	L408
L408:
	addi	sp, sp, 28
	pop	fp, sp
	ret
	;#globl	Ckb_init
	#align 32
Ckb_init:	push	fp, sp
	mv	fp, sp
	li	a0, 2400
	push	a0, sp
	push	ra, sp
	call	Ckmalloc
	pop	ra, sp
	addi	sp, sp, 4
	ssw	a0, Ckpress_data, t0
	li	a0, 2400
	push	a0, sp
	li	a0, 0
	push	a0, sp
	llw	a0, Ckpress_data
	push	a0, sp
	push	ra, sp
	call	Cmemset
	pop	ra, sp
	addi	sp, sp, 12
	la	a0, Ckpress_buff
	push	a0, sp
	llw	a0, Ckpress_data
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Ckpress_buff
	push	a0, sp
	li	a0, 4
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Ckpress_buff
	push	a0, sp
	li	a0, 8
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Ckpress_buff
	push	a0, sp
	li	a0, 12
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Ckpress_buff
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 2376
	pop	a1, sp
	sw	a0, 0(a1)
	la	a0, Ckb_char_handler
	push	a0, sp
	li	a0, 11
	push	a0, sp
	push	ra, sp
	call	Cregister_interrupt_handler
	pop	ra, sp
	addi	sp, sp, 8
	la	a0, Ckb_scan_handler
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
L409:
	pop	fp, sp
	ret
