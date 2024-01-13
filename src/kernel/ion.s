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
	;#globl	Cclock_unix_time
	#align 32
Cclock_unix_time:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 244
	push	a0, sp
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	Csbd
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 244
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 245
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 246
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
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
	li	a0, 247
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 244
	push	a0, sp
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	Csbd
	pop	ra, sp
	addi	sp, sp, 8
	lw	a0, -4(fp)
	j	L2ION
L2ION:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Cclock_read_counter
	#align 32
Cclock_read_counter:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
	li	a0, 248
	push	a0, sp
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	Csbd
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 248
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	li	a0, 24
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 249
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	li	a0, 16
	pop	a1, sp
	exch	a0, a1
	shll	a0, a0, a1
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -4(fp)
	li	a0, 250
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
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
	li	a0, 251
	push	a0, sp
	push	ra, sp
	call	Clbud
	pop	ra, sp
	addi	sp, sp, 4
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	or	a0, a0, a1
	sw	a0, -4(fp)
	lw	a0, -4(fp)
	j	L3ION
L3ION:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#bank text
	;#globl	Csyscall
	#align 32
Csyscall:	push	fp, sp
	mv	fp, sp
	lw	a0, 8(fp)
	j	L6ION
L7ION:
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_close
	pop	ra, sp
	addi	sp, sp, 4
	j	L4ION
	j	L5ION
L8ION:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_creat
	pop	ra, sp
	addi	sp, sp, 8
	j	L4ION
	j	L5ION
L9ION:
	lw	a0, 20(fp)
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_execve
	pop	ra, sp
	addi	sp, sp, 12
	j	L4ION
	j	L5ION
L10ION:
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_exit
	pop	ra, sp
	addi	sp, sp, 4
	j	L5ION
L11ION:
	push	ra, sp
	call	Csyscall_fork
	pop	ra, sp
	j	L4ION
	j	L5ION
L12ION:
	lw	a0, 20(fp)
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_lseek
	pop	ra, sp
	addi	sp, sp, 12
	j	L4ION
	j	L5ION
L13ION:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_open
	pop	ra, sp
	addi	sp, sp, 8
	j	L4ION
	j	L5ION
L14ION:
	lw	a0, 20(fp)
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_read
	pop	ra, sp
	addi	sp, sp, 12
	j	L4ION
	j	L5ION
L15ION:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_rename
	pop	ra, sp
	addi	sp, sp, 8
	j	L4ION
	j	L5ION
L16ION:
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_sbrk
	pop	ra, sp
	addi	sp, sp, 4
	j	L4ION
	j	L5ION
L17ION:
	push	ra, sp
	call	Csyscall_time
	pop	ra, sp
	j	L4ION
	j	L5ION
L18ION:
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_unlink
	pop	ra, sp
	addi	sp, sp, 4
	j	L4ION
	j	L5ION
L19ION:
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_wait
	pop	ra, sp
	addi	sp, sp, 4
	j	L4ION
	j	L5ION
L20ION:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_write
	pop	ra, sp
	addi	sp, sp, 12
	j	L4ION
	j	L5ION
L21ION:
	li	a0, -200
	j	L4ION
	j	L5ION
	j	L5ION
L6ION:
	la	a1, L22ION
	j	switch
L22ION:
	#d32	14
	#d32	0, L7ION
	#d32	1, L8ION
	#d32	2, L9ION
	#d32	3, L10ION
	#d32	4, L11ION
	#d32	5, L12ION
	#d32	6, L13ION
	#d32	7, L14ION
	#d32	8, L15ION
	#d32	9, L16ION
	#d32	10, L17ION
	#d32	11, L18ION
	#d32	12, L19ION
	#d32	13, L20ION
	#d32	L21ION
L5ION:
L4ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_close
	#align 32
Csyscall_close:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L23ION
L23ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_creat
	#align 32
Csyscall_creat:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L24ION
L24ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_execve
	#align 32
Csyscall_execve:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L25ION
L25ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_fork
	#align 32
Csyscall_fork:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L26ION
L26ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_lseek
	#align 32
Csyscall_lseek:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L27ION
L27ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_open
	#align 32
Csyscall_open:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L28ION
L28ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_read
	#align 32
Csyscall_read:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L29ION
L29ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_rename
	#align 32
Csyscall_rename:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L30ION
L30ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_sbrk
	#align 32
Csyscall_sbrk:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L31ION
L31ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_time
	#align 32
Csyscall_time:	push	fp, sp
	mv	fp, sp
	push	ra, sp
	call	Cclock_unix_time
	pop	ra, sp
	j	L32ION
L32ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_unlink
	#align 32
Csyscall_unlink:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L33ION
L33ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_wait
	#align 32
Csyscall_wait:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L34ION
L34ION:
	pop	fp, sp
	ret
	;#globl	Csyscall_write
	#align 32
Csyscall_write:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L35ION
L35ION:
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
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	j	L38ION
L39ION:
L40ION:
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	beqz	a0, L41ION
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
L41ION:
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
L42ION:
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lw	a0, 0(a0)
	beqz	a0, L43ION
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
L43ION:
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
	j	L37ION
L44ION:
	j	L37ION
	j	L37ION
L38ION:
	la	a1, L45ION
	j	switch
L45ION:
	#d32	3
	#d32	5, L39ION
	#d32	1, L40ION
	#d32	0, L42ION
	#d32	L44ION
L37ION:
	li	a0, 60
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sw	a0, 0(a1)
	li	a0, 64
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	push	a0, sp
	lw	a0, -4(fp)
	pop	a1, sp
	sw	a0, 0(a1)
L36ION:
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
L47ION:
	lw	a0, -4(fp)
	push	a0, sp
	lw	a0, -12(fp)
	pop	a1, sp
	blt	a1, a0, L51ION
	j	L49ION
L51ION:
	j	L48ION
L50ION:
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
	j	L47ION
L48ION:
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
	blt	a0, a1, L53ION
	j	L52ION
L53ION:
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
L52ION:
	j	L50ION
L49ION:
L46ION:
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
L55ION:
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
	blt	a1, a0, L59ION
	j	L57ION
L59ION:
	j	L56ION
L58ION:
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
	j	L55ION
L56ION:
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
	blt	a0, a1, L61ION
	j	L60ION
L61ION:
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
L60ION:
	j	L58ION
L57ION:
L54ION:
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
L62ION:
	pop	fp, sp
	ret
	#bank data
L63ION:
	#d32	0
L64ION:
	#d32	0
	#bank text
	;#globl	Ctxtmod_putc
	#align 32
Ctxtmod_putc:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
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
	li	a0, 8
	push	a0, sp
	mv	a0, zero
	lbu	a0, 15(fp)
	pop	a1, sp
	beq	a1, a0, L67ION
	j	L66ION
L67ION:
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
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sub	a0, a1, a0
	seqz	a0, a0
	beqz	a0, L68ION
	li	a0, 20
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	push	a0, sp
	li	a0, 0
	pop	a1, sp
	sub	a0, a1, a0
	snez	a0, a0
L68ION:
	beqz	a0, L69ION
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
	li	a0, 16
	push	a0, sp
	lw	a0, 8(fp)
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
	sb	a0, 0(a1)
L69ION:
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
L66ION:
	li	a0, 9
	push	a0, sp
	mv	a0, zero
	lbu	a0, 15(fp)
	pop	a1, sp
	beq	a1, a0, L71ION
	j	L70ION
L71ION:
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
	j	L72ION
L70ION:
	li	a0, 13
	push	a0, sp
	mv	a0, zero
	lbu	a0, 15(fp)
	pop	a1, sp
	beq	a1, a0, L74ION
	j	L73ION
L74ION:
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
	j	L75ION
L73ION:
	li	a0, 10
	push	a0, sp
	mv	a0, zero
	lbu	a0, 15(fp)
	pop	a1, sp
	beq	a1, a0, L77ION
	j	L76ION
L77ION:
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
	j	L78ION
L76ION:
	mv	a0, zero
	lbu	a0, 15(fp)
	push	a0, sp
	li	a0, 32
	pop	a1, sp
	bge	a1, a0, L80ION
	j	L79ION
L80ION:
	li	a0, 44
	push	a0, sp
	lw	a0, 8(fp)
	pop	a1, sp
	add	a0, a1, a0
	lbu	a0, 0(a0);notaligned
	j	L82ION
L83ION:
L84ION:
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
L85ION:
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
	j	L81ION
L86ION:
	j	L81ION
	j	L81ION
L82ION:
	la	a1, L87ION
	j	switch
L87ION:
	#d32	3
	#d32	5, L83ION
	#d32	1, L84ION
	#d32	0, L85ION
	#d32	L86ION
L81ION:
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
L79ION:
L78ION:
L75ION:
L72ION:
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
	bge	a1, a0, L89ION
	j	L88ION
L89ION:
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
L88ION:
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
	bge	a1, a0, L91ION
	j	L90ION
L91ION:
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
L90ION:
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Cupdate_cursor
	pop	ra, sp
	addi	sp, sp, 4
L65ION:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	;#globl	Ctxtmod_puts
	#align 32
Ctxtmod_puts:	push	fp, sp
	mv	fp, sp
	addi	sp, sp, -4
L94ION:
	lw	a0, 12(fp)
	lw	t0, 12(fp)
	addi	t0, t0, 1; cginclw
	sw	t0, 12(fp)
	lbu	a0, 0(a0);notaligned
	sb	a0, -1(fp)
	beqz	a0, L93ION
	mv	a0, zero
	lbu	a0, -1(fp)
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_putc
	pop	ra, sp
	addi	sp, sp, 8
	j	L94ION
L93ION:
L92ION:
	addi	sp, sp, 4
	pop	fp, sp
	ret
	#bank data
	L95ION:	#res 4096
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
	la	a0, L95ION
	push	a0, sp
	li	a0, 0
	push	a0, sp
	li	a0, 0
	push	a0, sp
	push	ra, sp
	call	C_vformat
	pop	ra, sp
	addi	sp, sp, 20
	la	a0, L95ION
	push	a0, sp
	lw	a0, 8(fp)
	push	a0, sp
	push	ra, sp
	call	Ctxtmod_puts
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, 0
	j	L96ION
L96ION:
	pop	fp, sp
	ret
