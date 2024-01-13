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
	j	L167
L167:
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
L169:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	bltu	a1, a0, L173
	j	L171
L173:
	j	L170
L172:
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
	j	L169
L170:
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	blt	a0, a1, L175
	j	L174
L175:
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	sw	a0, -8(fp)
L176:
	lw	a0, -8(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	sltu	a0, a1, a0
	beqz	a0, L180
	lw	a0, -8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sgt	a0, a1, a0
L180:
	beqz	a0, L178
	j	L177
L179:
	lw	a0, -8(fp)
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	sw	a0, -8(fp)
	j	L176
L177:
	j	L179
L178:
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
L174:
	j	L172
L171:
L168:
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
	beq	a1, a0, L183
	j	L182
L183:
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 128
	pop	a1, sp
	bge	a1, a0, L185
	j	L184
L185:
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	ssw	a0, C_asize, t0
	j	L186
L184:
	li	a0, 10
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	ssw	a0, C_asize, t0
L186:
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
	beqz	a0, L187
	li	a0, 0
	j	L181
L187:
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
L182:
	li	a0, 0
	sw	a0, -20(fp)
L188:
	lw	a0, -20(fp)
	push	a0, sp
	li	a0, 3
	pop	a1, sp
	blt	a1, a0, L192
	j	L190
L192:
	j	L189
L191:
	lw	a0, -20(fp)
	lw	t0, -20(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -20(fp)
	j	L188
L189:
	llw	a0, C_asize
	push	a0, sp
	llw	a0, C_arena
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	sw	a0, -8(fp)
	llw	a0, Cfreep
	sw	a0, -4(fp)
L193:
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	blt	a0, a1, L197
	j	L196
L197:
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	pop	a1, sp
	beq	a1, a0, L199
	j	L198
L199:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	neg	a0, a0
	pop	a1, sp
	sw	a0, 0(a1)
	j	L200
L198:
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
L200:
	lw	a0, -4(fp)
	ssw	a0, Cfreep, t0
	li	a0, 1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	shlli	a1, a1, 2
	add	a0, a1, a0
	j	L181
L196:
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
	beq	a1, a0, L202
	j	L201
L202:
	llw	a0, C_arena
	sw	a0, -4(fp)
L201:
	lw	a0, -4(fp)
	push	a0, sp
	llw	a0, C_arena
	pop	a1, sp
	sltu	a0, a1, a0
	bnez	a0, L203
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -8(fp)
	pop	a1, sp
	sltu	a0, a1, a0
	seqz	a0, a0
	bnez	a0, L203
	lw	a0, -4(fp)
	lw	a0, 0(a0)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
L203:
	beqz	a0, L204
	li	a0, -20
	ssw	a0, Ckmalloc_err, t0
	li	a0, 0
	j	L181
L204:
L195:
	llw	a0, Cfreep
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	beq	a1, a0, L205
	j	L193
L205:
L194:
	lw	a0, -20(fp)
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	beq	a1, a0, L207
	j	L206
L207:
	push	ra, sp
	call	Cdefrag
	pop	ra, sp
	j	L208
L206:
	lw	a0, 8(fp)
	push	a0, sp
	li	a0, 128
	pop	a1, sp
	bge	a1, a0, L210
	j	L209
L210:
	li	a0, 1
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	sw	a0, -16(fp)
	j	L211
L209:
	li	a0, 10
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	mul	zero, a0, a1, a0
	sw	a0, -16(fp)
L211:
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
	beqz	a0, L212
	li	a0, 0
	j	L181
L212:
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
L208:
	j	L191
L190:
	li	a0, -10
	ssw	a0, Ckmalloc_err, t0
	li	a0, 0
	j	L181
L181:
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
	beq	a1, a0, L215
	j	L214
L215:
	li	a0, 0
	j	L213
L214:
	lw	a0, 8(fp)
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	push	a0, sp
	llw	a0, C_arena
	pop	a1, sp
	sltu	a0, a1, a0
	bnez	a0, L216
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
	bnez	a0, L216
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
L216:
	beqz	a0, L217
	li	a0, -21
	ssw	a0, Ckmalloc_err, t0
	li	a0, -21
	j	L213
L217:
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
	j	L213
L213:
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
	j	L218
L218:
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
L219:
	pop	fp, sp
	ret
