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
L237:
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
L238:
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
	j	L239
L239:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	#align 32
Cfirst_frame:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	li	a0, 0
	sw	a0, -4(fp)
L241:
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
	blt	a1, a0, L245
	j	L243
L245:
	j	L242
L244:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L241
L242:
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
	bne	a1, a0, L247
	j	L246
L247:
	li	a0, 0
	sw	a0, -8(fp)
L248:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	blt	a1, a0, L252
	j	L250
L252:
	j	L249
L251:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	j	L248
L249:
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
	bnez	a0, L253
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
	j	L240
L253:
	j	L251
L250:
L246:
	j	L244
L243:
L240:
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
L255:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	blt	a1, a0, L259
	j	L257
L259:
	j	L256
L258:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L255
L256:
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
	beqz	a0, L260
	lw	a0, -8(fp)
	j	L254
L260:
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
	j	L258
L257:
	li	a0, 0
	j	L254
L254:
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
L262:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	blt	a1, a0, L266
	j	L264
L266:
	j	L263
L265:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L262
L263:
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
	j	L265
L264:
L261:
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
	bne	a1, a0, L269
	j	L268
L269:
	li	a0, 0
	j	L267
	j	L270
L268:
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
	beq	a1, a0, L272
	j	L271
L272:
	li	a0, -10
	j	L267
L271:
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
	beqz	a0, L273
	li	a0, 2
	j	L274
L273:
	li	a0, 0
L274:
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
	beqz	a0, L275
	li	a0, 1
	j	L276
L275:
	li	a0, 0
L276:
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
L270:
	li	a0, 0
	j	L267
L267:
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
	beqz	a0, L278
	j	L277
	j	L279
L278:
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
L279:
L277:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cpage_fault_handler
	#align 32
Cpage_fault_handler:	push	fp, sp
	mv	fp, sp
	#bank data
L281:
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
	la	a0, L281
	push	a0, sp
	push	ra, sp
	call	Cpanic
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -2
	j	L280
L280:
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
L284:
	lw	a0, -4(fp)
	push	a0, sp
	llw	a0, CKernelEnd
	pop	a1, sp
	blt	a1, a0, L285
	j	L283
L285:
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
	j	L284
L283:
	li	a0, 15011840
	sw	a0, -4(fp)
L287:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 15327232
	pop	a1, sp
	blt	a1, a0, L288
	j	L286
L288:
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
	j	L287
L286:
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
L282:
	addi	sp, sp, 4
	pop	fp, sp
	ret
