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
L113:
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
L114:
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
	j	L115
L115:
	addi	sp, sp, 12
	pop	fp, sp
	ret
	#align 32
Cfirst_frame:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -12
	li	a0, 0
	sw	a0, -4(fp)
L117:
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
	blt	a1, a0, L121
	j	L119
L121:
	j	L118
L120:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L117
L118:
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
	bne	a1, a0, L123
	j	L122
L123:
	li	a0, 0
	sw	a0, -8(fp)
L124:
	lw	a0, -8(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	blt	a1, a0, L128
	j	L126
L128:
	j	L125
L127:
	lw	a0, -8(fp)
	lw	t0, -8(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -8(fp)
	j	L124
L125:
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
	bnez	a0, L129
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
	j	L116
L129:
	j	L127
L126:
L122:
	j	L120
L119:
L116:
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
L131:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 16(fp)
	pop	a1, sp
	blt	a1, a0, L135
	j	L133
L135:
	j	L132
L134:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L131
L132:
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
	beqz	a0, L136
	lw	a0, -8(fp)
	j	L130
L136:
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
	j	L134
L133:
	li	a0, 0
	j	L130
L130:
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
L138:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, 12(fp)
	pop	a1, sp
	blt	a1, a0, L142
	j	L140
L142:
	j	L139
L141:
	lw	a0, -4(fp)
	lw	t0, -4(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, -4(fp)
	j	L138
L139:
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
	j	L141
L140:
L137:
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
	bne	a1, a0, L145
	j	L144
L145:
	li	a0, 0
	j	L143
	j	L146
L144:
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
	beq	a1, a0, L148
	j	L147
L148:
	li	a0, -10
	j	L143
L147:
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
	beqz	a0, L149
	li	a0, 2
	j	L150
L149:
	li	a0, 0
L150:
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
	beqz	a0, L151
	li	a0, 1
	j	L152
L151:
	li	a0, 0
L152:
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
L146:
	li	a0, 0
	j	L143
L143:
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
	beqz	a0, L154
	j	L153
	j	L155
L154:
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
L155:
L153:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cpage_fault_handler
	#align 32
Cpage_fault_handler:	push	fp, sp
	mv	fp, sp
	#bank data
L157:
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
	la	a0, L157
	push	a0, sp
	push	ra, sp
	call	Cpanic
	pop	ra, sp
	addi	sp, sp, 4
	li	a0, -2
	j	L156
L156:
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
L160:
	lw	a0, -4(fp)
	push	a0, sp
	llw	a0, CKernelEnd
	pop	a1, sp
	blt	a1, a0, L161
	j	L159
L161:
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
	j	L160
L159:
	li	a0, 15011840
	sw	a0, -4(fp)
L163:
	lw	a0, -4(fp)
	push	a0, sp
	li	a0, 15327232
	pop	a1, sp
	blt	a1, a0, L164
	j	L162
L164:
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
	j	L163
L162:
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
L158:
	addi	sp, sp, 4
	pop	fp, sp
	ret
