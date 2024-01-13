	#bank text
	;#globl	Csyscall
	#align 32
Csyscall:	push	fp, sp
	mv	fp, sp
	lw	a0, 8(fp)
	j	L6
L7:
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_close
	pop	ra, sp
	addi	sp, sp, 4
	j	L4
	j	L5
L8:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_creat
	pop	ra, sp
	addi	sp, sp, 8
	j	L4
	j	L5
L9:
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
	j	L4
	j	L5
L10:
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_exit
	pop	ra, sp
	addi	sp, sp, 4
	j	L5
L11:
	push	ra, sp
	call	Csyscall_fork
	pop	ra, sp
	j	L4
	j	L5
L12:
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
	j	L4
	j	L5
L13:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_open
	pop	ra, sp
	addi	sp, sp, 8
	j	L4
	j	L5
L14:
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
	j	L4
	j	L5
L15:
	lw	a0, 16(fp)
	push	a0, sp
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_rename
	pop	ra, sp
	addi	sp, sp, 8
	j	L4
	j	L5
L16:
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_sbrk
	pop	ra, sp
	addi	sp, sp, 4
	j	L4
	j	L5
L17:
	push	ra, sp
	call	Csyscall_time
	pop	ra, sp
	j	L4
	j	L5
L18:
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_unlink
	pop	ra, sp
	addi	sp, sp, 4
	j	L4
	j	L5
L19:
	lw	a0, 12(fp)
	push	a0, sp
	push	ra, sp
	call	Csyscall_wait
	pop	ra, sp
	addi	sp, sp, 4
	j	L4
	j	L5
L20:
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
	j	L4
	j	L5
L21:
	li	a0, -200
	j	L4
	j	L5
	j	L5
L6:
	la	a1, L22
	j	switch
L22:
	#d32	14
	#d32	0, L7
	#d32	1, L8
	#d32	2, L9
	#d32	3, L10
	#d32	4, L11
	#d32	5, L12
	#d32	6, L13
	#d32	7, L14
	#d32	8, L15
	#d32	9, L16
	#d32	10, L17
	#d32	11, L18
	#d32	12, L19
	#d32	13, L20
	#d32	L21
L5:
L4:
	pop	fp, sp
	ret
	;#globl	Csyscall_close
	#align 32
Csyscall_close:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L23
L23:
	pop	fp, sp
	ret
	;#globl	Csyscall_creat
	#align 32
Csyscall_creat:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L24
L24:
	pop	fp, sp
	ret
	;#globl	Csyscall_execve
	#align 32
Csyscall_execve:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L25
L25:
	pop	fp, sp
	ret
	;#globl	Csyscall_fork
	#align 32
Csyscall_fork:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L26
L26:
	pop	fp, sp
	ret
	;#globl	Csyscall_lseek
	#align 32
Csyscall_lseek:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L27
L27:
	pop	fp, sp
	ret
	;#globl	Csyscall_open
	#align 32
Csyscall_open:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L28
L28:
	pop	fp, sp
	ret
	;#globl	Csyscall_read
	#align 32
Csyscall_read:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L29
L29:
	pop	fp, sp
	ret
	;#globl	Csyscall_rename
	#align 32
Csyscall_rename:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L30
L30:
	pop	fp, sp
	ret
	;#globl	Csyscall_sbrk
	#align 32
Csyscall_sbrk:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L31
L31:
	pop	fp, sp
	ret
	;#globl	Csyscall_time
	#align 32
Csyscall_time:	push	fp, sp
	mv	fp, sp
	push	ra, sp
	call	Cclock_unix_time
	pop	ra, sp
	j	L32
L32:
	pop	fp, sp
	ret
	;#globl	Csyscall_unlink
	#align 32
Csyscall_unlink:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L33
L33:
	pop	fp, sp
	ret
	;#globl	Csyscall_wait
	#align 32
Csyscall_wait:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L34
L34:
	pop	fp, sp
	ret
	;#globl	Csyscall_write
	#align 32
Csyscall_write:	push	fp, sp
	mv	fp, sp
	li	a0, 0
	j	L35
L35:
	pop	fp, sp
	ret
