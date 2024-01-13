	.text
	.globl	CF
CF:	pushq	%rbp
	movq	%rsp,%rbp
	movq	24(%rbp),%rax
	pushq	%rax
	movq	16(%rbp),%rax
	popq	%rcx
	addq	%rcx,%rax
	pushq	%rax
	movq	32(%rbp),%rax
	popq	%rcx
	addq	%rcx,%rax
	jmp	L1
L1:
	popq	%rbp
	ret
	.data
	.lcomm	L2,8
	.text
	.globl	Cmain
Cmain:	pushq	%rbp
	movq	%rsp,%rbp
	movq	$L2,%rax
	pushq	%rax
	movq	$CF,%rax
	popq	%rdx
	movq	%rax,(%rdx)
	movq	$L2,%rax
	pushq	%rax
	movq	$3,%rax
	pushq	%rax
	movq	$2,%rax
	pushq	%rax
	movq	$1,%rax
	pushq	%rax
	movq	(%rax),%rax
	call	*%rax
	addq	$24,%rsp
	jmp	L3
L3:
	popq	%rbp
	ret
