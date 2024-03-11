	.align 4
	.text
	.align 4
	.data
	.globl charsInLineBuffer
	.align	4
charsInLineBuffer:
	.word	0x0
	.globl positionInLineBuffer
	.align	4
positionInLineBuffer:
	.word	0x0
	.globl builtins
	.align	4
builtins:
	.word	0x0
	.space	328
	.globl initScript
	.align	4
initScript:
	.word	L.1
	.globl n2s
	.align 4
	.text
	.align	4
n2s:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	shlli x30,x12,8*(4-1)
	shrli x30,x30,8*(4-1)
	li x29,10
	bge x30,x29,L.3
	shlli x30,x12,8*(4-1)
	shrli x30,x30,8*(4-1)
	addi x30,x30,48
	sb x30,0(x13)
	li x30,1
	add x30,x13,x30
	sb x0,0(x30)
	j L.4
L.3:
	shlli x30,x12,8*(4-1)
	shrli x30,x30,8*(4-1)
	li x29,100
	bge x30,x29,L.5
	shlli x30,x12,8*(4-1)
	shrli x30,x30,8*(4-1)
	li x29,10
	idiv x30,x0,x30,x29
	addi x30,x30,48
	sb x30,0(x13)
	li x30,1
	add x30,x13,x30
	shlli x29,x12,8*(4-1)
	shrli x29,x29,8*(4-1)
	li x28,10
	idiv x0,x29,x29,x28
	addi x29,x29,48
	sb x29,0(x30)
	li x30,2
	add x30,x13,x30
	sb x0,0(x30)
	j L.6
L.5:
	shlli x30,x12,8*(4-1)
	shrli x30,x30,8*(4-1)
	li x29,100
	idiv x30,x0,x30,x29
	addi x30,x30,48
	sb x30,0(x13)
	li x30,1
	add x30,x13,x30
	shlli x29,x12,8*(4-1)
	shrli x29,x29,8*(4-1)
	li x28,100
	idiv x0,x29,x29,x28
	li x28,10
	idiv x29,x0,x29,x28
	addi x29,x29,48
	sb x29,0(x30)
	li x30,2
	add x30,x13,x30
	shlli x29,x12,8*(4-1)
	shrli x29,x29,8*(4-1)
	li x28,10
	idiv x0,x29,x29,x28
	addi x29,x29,48
	sb x29,0(x30)
	li x30,3
	add x30,x13,x30
	sb x0,0(x30)
L.6:
L.4:
L.2:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,0(x1)

	.globl llkey
	.align	4
llkey:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	la x30,initscript_pos
	lw x30,0(x30)
	lbu x30,0(x30)
	beq x30,x0,L.8
	la x30,initscript_pos
	lw x29,0(x30)
	li x28,1
	add x28,x29,x28
	sw x28,0(x30)
	lbu x10,0(x29)
	j L.7
L.8:
	call _getchar
	mv x27,x10 ; LOADI4
	mv x30,x27 ; LOADU4
	shlli x12,x30,8*(4-1)
	shrli x12,x12,8*(4-1)
	call txtmod_putc
	mv x10,x27 ; LOADI4
L.7:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.globl keyWaiting
	.align	4
keyWaiting:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	la x30,positionInLineBuffer
	lw x30,0(x30)
	la x29,charsInLineBuffer
	lw x29,0(x29)
	bge x30,x29,L.12
	li x27,-1
	j L.13
L.12:
	mv x27,x0 ; LOADI4
L.13:
	mv x10,x27 ; LOADI4
L.10:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,0(x1)

	.globl getkey
	.align	4
getkey:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	call keyWaiting
	beq x10,x0,L.15
	la x30,positionInLineBuffer
	lw x29,0(x30)
	addi x28,x29,1
	sw x28,0(x30)
	la x30,lineBuffer
	add x30,x29,x30
	lbu x10,0(x30)
	j L.14
L.15:
	la x30,charsInLineBuffer
	sw x0,0(x30)
	j L.18
L.17:
	li x30,8
	bne x27,x30,L.20
	la x30,charsInLineBuffer
	lw x30,0(x30)
	beq x30,x0,L.20
	la x30,charsInLineBuffer
	lw x29,0(x30)
	addi x29,x29,-1
	sw x29,0(x30)
	la x30,lineBuffer
	add x30,x29,x30
	sb x0,0(x30)
	j L.18
L.20:
	la x30,charsInLineBuffer
	lw x30,0(x30)
	li x29,128
	bne x30,x29,L.22
	j L.19
L.22:
	la x30,charsInLineBuffer
	lw x29,0(x30)
	addi x28,x29,1
	sw x28,0(x30)
	la x30,lineBuffer
	add x30,x29,x30
	mv x29,x27 ; LOADU4
	sb x29,0(x30)
	li x30,13
	bne x27,x30,L.24
	j L.19
L.24:
L.18:
	call llkey
	mv x27,x10 ; LOADI4
	li x29,-1
	bne x10,x29,L.17
L.19:
	la x30,positionInLineBuffer
	li x29,1
	sw x29,0(x30)
	la x30,lineBuffer
	lbu x10,0(x30)
L.14:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.globl tell
	.align	4
tell:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	mv x27,x12
	j L.28
L.27:
	mv x30,x27 ; LOADP4
	li x29,1
	add x27,x30,x29
	lbu x12,0(x30)
	call txtmod_putc
L.28:
	lbu x30,0(x27)
	bne x30,x0,L.27
L.26:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.globl pop
	.align	4
pop:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	la x30,sp
	lw x30,0(x30)
	lhu x30,0(x30)
	li x29,1
	bne x30,x29,L.31
	la x12,L.33
	call tell
	la x30,errorFlag
	li x29,1
	sw x29,0(x30)
	mv x10,x0 ; LOADI4
	j L.30
L.31:
	la x30,sp
	lw x30,0(x30)
	lhu x29,0(x30)
	addi x29,x29,-1
	sh x29,0(x30)
	shlli x30,x29,8*(4-2)
	shrli x30,x30,8*(4-2)
	li x29,1
	shll x30,x30,x29
	la x29,stack
	lw x29,0(x29)
	add x30,x30,x29
	lhu x10,0(x30)
L.30:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.globl tos
	.align	4
tos:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	la x30,sp
	lw x30,0(x30)
	lhu x30,0(x30)
	li x29,1
	bne x30,x29,L.35
	la x12,L.33
	call tell
	la x30,errorFlag
	li x29,1
	sw x29,0(x30)
	mv x10,x0 ; LOADI4
	j L.34
L.35:
	la x30,sp
	lw x30,0(x30)
	lhu x30,0(x30)
	li x29,1
	shll x30,x30,x29
	addi x30,x30,-2
	la x29,stack
	lw x29,0(x29)
	add x30,x30,x29
	lhu x10,0(x30)
L.34:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.globl push
	.align	4
push:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	sw x12,16(x8)
	lw x30,0+16(x8)
	sh x30,0+16(x8)
	la x30,sp
	lw x30,0(x30)
	lhu x30,0(x30)
	li x29,192
	blt x30,x29,L.38
	la x12,L.40
	call tell
	la x30,errorFlag
	li x29,1
	sw x29,0(x30)
	j L.37
L.38:
	la x30,sp
	lw x30,0(x30)
	lhu x29,0(x30)
	shlli x28,x29,8*(4-2)
	shrli x28,x28,8*(4-2)
	addi x28,x28,1
	sh x28,0(x30)
	shlli x30,x29,8*(4-2)
	shrli x30,x30,8*(4-2)
	li x29,1
	shll x30,x30,x29
	la x29,stack
	lw x29,0(x29)
	add x30,x30,x29
	lhu x29,0+16(x8)
	sh x29,0(x30)
L.37:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.globl dpop
	.align	4
dpop:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-8+16(x8)
	lw x10,-8+16(x8)
L.41:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.globl dpush
	.align	4
dpush:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	sw x12,16(x8)
	lw x30,0+16(x8)
	sw x30,-8+16(x8)
	lhu x12,-8+16(x8)
	call push
	lhu x12,-6+16(x8)
	call push
L.43:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.globl rpop
	.align	4
rpop:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	la x30,rsp
	lw x30,0(x30)
	lhu x30,0(x30)
	li x29,1
	bne x30,x29,L.46
	la x12,L.48
	call tell
	la x30,errorFlag
	li x29,1
	sw x29,0(x30)
	mv x10,x0 ; LOADI4
	j L.45
L.46:
	la x30,rsp
	lw x30,0(x30)
	lhu x29,0(x30)
	addi x29,x29,-1
	sh x29,0(x30)
	shlli x30,x29,8*(4-2)
	shrli x30,x30,8*(4-2)
	li x29,1
	shll x30,x30,x29
	la x29,rstack
	lw x29,0(x29)
	add x30,x30,x29
	lhu x10,0(x30)
L.45:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.globl rpush
	.align	4
rpush:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	sw x12,16(x8)
	lw x30,0+16(x8)
	sh x30,0+16(x8)
	la x30,rsp
	lw x30,0(x30)
	lhu x30,0(x30)
	li x29,64
	blt x30,x29,L.50
	la x12,L.52
	call tell
	la x30,errorFlag
	li x29,1
	sw x29,0(x30)
	j L.49
L.50:
	la x30,rsp
	lw x30,0(x30)
	lhu x29,0(x30)
	shlli x28,x29,8*(4-2)
	shrli x28,x28,8*(4-2)
	addi x28,x28,1
	sh x28,0(x30)
	shlli x30,x29,8*(4-2)
	shrli x30,x30,8*(4-2)
	li x29,1
	shll x30,x30,x29
	la x29,rstack
	lw x29,0(x29)
	add x30,x30,x29
	lhu x29,0+16(x8)
	sh x29,0(x30)
L.49:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.globl readMem
	.align	4
readMem:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	sw x12,16(x8)
	lw x30,0+16(x8)
	sh x30,0+16(x8)
	lhu x30,0+16(x8)
	li x29,65536
	ble x30,x29,L.54
	la x12,L.56
	call tell
	la x30,errorFlag
	li x29,1
	sw x29,0(x30)
	mv x10,x0 ; LOADI4
	j L.53
L.54:
	lhu x30,0+16(x8)
	la x29,memory
	add x30,x30,x29
	lhu x10,0(x30)
L.53:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.globl writeMem
	.align	4
writeMem:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	lw x30,0+16(x8)
	sh x30,0+16(x8)
	lw x30,4+16(x8)
	sh x30,4+16(x8)
	lhu x30,0+16(x8)
	li x29,65536
	ble x30,x29,L.58
	la x12,L.60
	call tell
	la x30,errorFlag
	li x29,1
	sw x29,0(x30)
	j L.57
L.58:
	lhu x30,0+16(x8)
	la x29,memory
	add x30,x30,x29
	lhu x29,4+16(x8)
	sh x29,0(x30)
L.57:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.globl readWord
	.align	4
readWord:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x25,28(x2)
	sw x26,32(x2)
	sw x27,36(x2)
	la x25,memory
	mv x26,x0 ; LOADU1
	j L.63
L.62:
	li x30,32
	bne x27,x30,L.65
	j L.63
L.65:
	li x30,13
	bne x27,x30,L.67
	j L.63
L.67:
	li x30,92
	beq x27,x30,L.72
	j L.77
L.71:
	li x30,13
	bne x27,x30,L.74
	j L.73
L.74:
L.72:
	call getkey
	mv x27,x10 ; LOADI4
	li x29,-1
	bne x10,x29,L.71
L.73:
L.63:
	call getkey
	mv x27,x10 ; LOADI4
	li x29,-1
	bne x10,x29,L.62
	j L.77
L.76:
	shlli x30,x26,8*(4-1)
	shrli x30,x30,8*(4-1)
	li x29,99
	blt x30,x29,L.79
	j L.78
L.79:
	shlli x30,x26,8*(4-1)
	shrli x30,x30,8*(4-1)
	addi x30,x30,1
	mv x26,x30 ; LOADU1
	shlli x30,x30,8*(4-1)
	shrli x30,x30,8*(4-1)
	add x30,x30,x25
	mv x29,x27 ; LOADU4
	sb x29,0(x30)
	call getkey
	mv x27,x10 ; LOADI4
L.77:
	li x30,32
	beq x27,x30,L.82
	li x30,13
	beq x27,x30,L.82
	li x30,-1
	bne x27,x30,L.76
L.82:
L.78:
	sb x26,0(x25)
	shlli x10,x26,8*(4-1)
	shrli x10,x10,8*(4-1)
L.61:
	lw x1,24(x2)
	lw x25,28(x2)
	lw x26,32(x2)
	lw x27,36(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.globl up
	.align	4
up:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	shlli x30,x12,8*(4-1)
	shrli x30,x30,8*(4-1)
	li x29,97
	blt x30,x29,L.85
	li x29,122
	bgt x30,x29,L.85
	shlli x30,x12,8*(4-1)
	shrli x30,x30,8*(4-1)
	addi x30,x30,-97
	addi x27,x30,65
	j L.86
L.85:
	shlli x27,x12,8*(4-1)
	shrli x27,x27,8*(4-1)
L.86:
	mv x30,x27 ; LOADU4
	shlli x10,x30,8*(4-1)
	shrli x10,x10,8*(4-1)
L.83:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,0(x1)

	.globl findWord
	.align	4
findWord:
	addi x2,x2,-80
	sw  x8,76(x2)
	addi  x8,x2,64
	sw x1,24(x2)
	sw x23,28(x2)
	sw x24,32(x2)
	sw x25,36(x2)
	sw x26,40(x2)
	sw x27,44(x2)
	sw x12,16(x8)
	mv x27,x13
	lw x30,0+16(x8)
	sh x30,0+16(x8)
	la x30,latest
	lw x30,0(x30)
	lhu x25,0(x30)
	lhu x30,0+16(x8)
	la x29,memory
	add x24,x30,x29
	la x30,latest
	lw x30,0(x30)
	lhu x25,0(x30)
	j L.91
L.88:
	shlli x30,x25,8*(4-2)
	shrli x30,x30,8*(4-2)
	li x29,2
	add x30,x30,x29
	la x29,memory
	add x30,x30,x29
	lbu x30,0(x30)
	andi x30,x30,31
	shlli x29,x27,8*(4-2)
	shrli x29,x29,8*(4-2)
	beq x30,x29,L.92
	j L.89
L.92:
	shlli x30,x25,8*(4-2)
	shrli x30,x30,8*(4-2)
	li x29,2
	add x30,x30,x29
	la x29,memory
	add x30,x30,x29
	lbu x30,0(x30)
	andi x30,x30,64
	beq x30,x0,L.94
	j L.89
L.94:
	li x23,1
	mv x26,x0 ; LOADU2
	j L.99
L.96:
	shlli x30,x25,8*(4-2)
	shrli x30,x30,8*(4-2)
	shlli x29,x26,8*(4-2)
	shrli x29,x29,8*(4-2)
	add x30,x30,x29
	addi x30,x30,1
	li x29,2
	add x30,x30,x29
	la x29,memory
	add x30,x30,x29
	lbu x12,0(x30)
	call up
	mv x30,x10 ; LOADI4
	sw x30,-8+16(x8)
	shlli x29,x26,8*(4-2)
	shrli x29,x29,8*(4-2)
	add x29,x29,x24
	lbu x12,0(x29)
	call up
	lw x29,-8+16(x8)
	shlli x29,x29,8*(4-1)
	shrli x29,x29,8*(4-1)
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-1)
	shrli x30,x30,8*(4-1)
	beq x29,x30,L.100
	mv x23,x0 ; LOADI4
	j L.98
L.100:
L.97:
	shlli x30,x26,8*(4-2)
	shrli x30,x30,8*(4-2)
	addi x30,x30,1
	mv x26,x30 ; LOADU2
L.99:
	shlli x30,x26,8*(4-2)
	shrli x30,x30,8*(4-2)
	shlli x29,x27,8*(4-2)
	shrli x29,x29,8*(4-2)
	blt x30,x29,L.96
L.98:
	beq x23,x0,L.102
	j L.90
L.102:
L.89:
	shlli x12,x25,8*(4-2)
	shrli x12,x12,8*(4-2)
	call readMem
	mv x30,x10 ; LOADU4
	mv x25,x30 ; LOADU2
L.91:
	shlli x30,x25,8*(4-2)
	shrli x30,x30,8*(4-2)
	bne x30,x0,L.88
L.90:
	shlli x10,x25,8*(4-2)
	shrli x10,x10,8*(4-2)
L.87:
	lw x1,24(x2)
	lw x23,28(x2)
	lw x24,32(x2)
	lw x25,36(x2)
	lw x26,40(x2)
	lw x27,44(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,0(x1)

	.globl parseNumber
	.align	4
parseNumber:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x25,0(x2)
	sw x26,4(x2)
	sw x27,8(x2)
	sw x0,-8+16(x8)
	sw x0,0(x14)
	sb x0,0(x16)
	shlli x30,x13,8*(4-2)
	shrli x30,x30,8*(4-2)
	bne x30,x0,L.105
	sh x0,0(x15)
	j L.104
L.105:
	lbu x30,0(x12)
	li x29,45
	bne x30,x29,L.107
	li x30,1
	sw x30,-8+16(x8)
	shlli x29,x13,8*(4-2)
	shrli x29,x29,8*(4-2)
	sub x29,x29,x30
	mv x13,x29 ; LOADU2
	add x12,x12,x30
	j L.108
L.107:
	lbu x30,0(x12)
	li x29,43
	bne x30,x29,L.109
	li x30,1
	shlli x29,x13,8*(4-2)
	shrli x29,x29,8*(4-2)
	sub x29,x29,x30
	mv x13,x29 ; LOADU2
	add x12,x12,x30
L.109:
L.108:
	mv x25,x0 ; LOADU2
	j L.114
L.111:
	lbu x27,0(x12)
	li x30,1
	add x12,x12,x30
	shlli x30,x27,8*(4-1)
	shrli x30,x30,8*(4-1)
	li x29,46
	bne x30,x29,L.115
	li x30,1
	sb x30,0(x16)
	j L.112
L.115:
	shlli x30,x27,8*(4-1)
	shrli x30,x30,8*(4-1)
	li x29,48
	blt x30,x29,L.117
	li x29,57
	bgt x30,x29,L.117
	shlli x30,x27,8*(4-1)
	shrli x30,x30,8*(4-1)
	addi x30,x30,-48
	mv x26,x30 ; LOADU2
	j L.118
L.117:
	shlli x30,x27,8*(4-1)
	shrli x30,x30,8*(4-1)
	li x29,65
	blt x30,x29,L.119
	li x29,90
	bgt x30,x29,L.119
	shlli x30,x27,8*(4-1)
	shrli x30,x30,8*(4-1)
	addi x30,x30,10
	addi x30,x30,-65
	mv x26,x30 ; LOADU2
	j L.120
L.119:
	shlli x30,x27,8*(4-1)
	shrli x30,x30,8*(4-1)
	li x29,97
	blt x30,x29,L.113
	li x29,122
	bgt x30,x29,L.113
	shlli x30,x27,8*(4-1)
	shrli x30,x30,8*(4-1)
	addi x30,x30,10
	addi x30,x30,-97
	mv x26,x30 ; LOADU2
L.122:
L.120:
L.118:
	shlli x30,x26,8*(4-2)
	shrli x30,x30,8*(4-2)
	la x29,base
	lw x29,0(x29)
	lhu x29,0(x29)
	blt x30,x29,L.123
	j L.113
L.123:
	lw x30,0(x14)
	la x29,base
	lw x29,0(x29)
	lhu x29,0(x29)
	imul x0,x30,x30,x29
	shlli x29,x26,8*(4-2)
	shrli x29,x29,8*(4-2)
	add x30,x30,x29
	sw x30,0(x14)
L.112:
	shlli x30,x25,8*(4-2)
	shrli x30,x30,8*(4-2)
	addi x30,x30,1
	mv x25,x30 ; LOADU2
L.114:
	shlli x30,x25,8*(4-2)
	shrli x30,x30,8*(4-2)
	shlli x29,x13,8*(4-2)
	shrli x29,x29,8*(4-2)
	blt x30,x29,L.111
L.113:
	shlli x30,x13,8*(4-2)
	shrli x30,x30,8*(4-2)
	shlli x29,x25,8*(4-2)
	shrli x29,x29,8*(4-2)
	sub x30,x30,x29
	sh x30,0(x15)
	lw x30,-8+16(x8)
	beq x30,x0,L.125
	lw x30,0(x14)
	shlli x30,x30,8*(4-2)
	shrai x30,x30,8*(4-2)
	sub x30,x0,x30
	sw x30,0(x14)
L.125:
L.104:
	lw x25,0(x2)
	lw x26,4(x2)
	lw x27,8(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,0(x1)

	.align 4
	.data
	.globl docol_id
	.align	4
docol_id:
	.word	0x0
	.globl docol_name
	.align	4
docol_name:
	.word	L.127
	.globl docol_flags
	.align	1
docol_flags:
	.byte	0x0
	.globl docol
	.align 4
	.text
	.align	4
docol:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	la x30,lastIp
	lhu x12,0(x30)
	call rpush
	la x30,next
	la x29,commandAddress
	lhu x29,0(x29)
	li x28,2
	add x29,x29,x28
	sh x29,0(x30)
L.128:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl doCellSize_id
	.align	4
doCellSize_id:
	.word	0x1
	.globl doCellSize_name
	.align	4
doCellSize_name:
	.word	L.129
	.globl doCellSize_flags
	.align	1
doCellSize_flags:
	.byte	0x0
	.globl doCellSize
	.align 4
	.text
	.align	4
doCellSize:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	li x12,2
	call push
L.130:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl memRead_id
	.align	4
memRead_id:
	.word	0x2
	.globl memRead_name
	.align	4
memRead_name:
	.word	L.131
	.globl memRead_flags
	.align	1
memRead_flags:
	.byte	0x0
	.globl memRead
	.align 4
	.text
	.align	4
memRead:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call readMem
	mv x30,x10 ; LOADU4
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.132:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl memReadByte_id
	.align	4
memReadByte_id:
	.word	0x3
	.globl memReadByte_name
	.align	4
memReadByte_name:
	.word	L.133
	.globl memReadByte_flags
	.align	1
memReadByte_flags:
	.byte	0x0
	.globl memReadByte
	.align 4
	.text
	.align	4
memReadByte:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	la x29,memory
	add x30,x30,x29
	lbu x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.134:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl key_id
	.align	4
key_id:
	.word	0x4
	.globl key_name
	.align	4
key_name:
	.word	L.135
	.globl key_flags
	.align	1
key_flags:
	.byte	0x0
	.globl key
	.align 4
	.text
	.align	4
key:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call getkey
	mv x30,x10 ; LOADU4
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.136:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl emit_id
	.align	4
emit_id:
	.word	0x5
	.globl emit_name
	.align	4
emit_name:
	.word	L.137
	.globl emit_flags
	.align	1
emit_flags:
	.byte	0x0
	.globl emit
	.align 4
	.text
	.align	4
emit:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	andi x30,x30,255
	shlli x12,x30,8*(4-1)
	shrli x12,x12,8*(4-1)
	call txtmod_putc
L.138:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl drop_id
	.align	4
drop_id:
	.word	0x6
	.globl drop_name
	.align	4
drop_name:
	.word	L.139
	.globl drop_flags
	.align	1
drop_flags:
	.byte	0x0
	.globl drop
	.align 4
	.text
	.align	4
drop:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
L.140:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl doExit_id
	.align	4
doExit_id:
	.word	0x7
	.globl doExit_name
	.align	4
doExit_name:
	.word	L.141
	.globl doExit_flags
	.align	1
doExit_flags:
	.byte	0x0
	.globl doExit
	.align 4
	.text
	.align	4
doExit:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call rpop
	la x29,next
	mv x30,x10 ; LOADU4
	sh x30,0(x29)
L.142:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl bye_id
	.align	4
bye_id:
	.word	0x8
	.globl bye_name
	.align	4
bye_name:
	.word	L.143
	.globl bye_flags
	.align	1
bye_flags:
	.byte	0x0
	.globl bye
	.align 4
	.text
	.align	4
bye:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	la x30,exitReq
	li x29,1
	sw x29,0(x30)
L.144:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,0(x1)

	.align 4
	.data
	.globl doLatest_id
	.align	4
doLatest_id:
	.word	0x9
	.globl doLatest_name
	.align	4
doLatest_name:
	.word	L.145
	.globl doLatest_flags
	.align	1
doLatest_flags:
	.byte	0x0
	.globl doLatest
	.align 4
	.text
	.align	4
doLatest:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	li x12,100
	call push
L.146:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl doHere_id
	.align	4
doHere_id:
	.word	0xa
	.globl doHere_name
	.align	4
doHere_name:
	.word	L.147
	.globl doHere_flags
	.align	1
doHere_flags:
	.byte	0x0
	.globl doHere
	.align 4
	.text
	.align	4
doHere:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	li x12,102
	call push
L.148:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl doBase_id
	.align	4
doBase_id:
	.word	0xb
	.globl doBase_name
	.align	4
doBase_name:
	.word	L.149
	.globl doBase_flags
	.align	1
doBase_flags:
	.byte	0x0
	.globl doBase
	.align 4
	.text
	.align	4
doBase:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	li x12,104
	call push
L.150:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl doState_id
	.align	4
doState_id:
	.word	0xc
	.globl doState_name
	.align	4
doState_name:
	.word	L.151
	.globl doState_flags
	.align	1
doState_flags:
	.byte	0x0
	.globl doState
	.align 4
	.text
	.align	4
doState:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	li x12,106
	call push
L.152:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl gotoInterpreter_id
	.align	4
gotoInterpreter_id:
	.word	0xd
	.globl gotoInterpreter_name
	.align	4
gotoInterpreter_name:
	.word	L.153
	.globl gotoInterpreter_flags
	.align	1
gotoInterpreter_flags:
	.byte	0x80
	.globl gotoInterpreter
	.align 4
	.text
	.align	4
gotoInterpreter:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	la x30,state
	lw x30,0(x30)
	sh x0,0(x30)
L.154:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,0(x1)

	.align 4
	.data
	.globl gotoCompiler_id
	.align	4
gotoCompiler_id:
	.word	0xe
	.globl gotoCompiler_name
	.align	4
gotoCompiler_name:
	.word	L.155
	.globl gotoCompiler_flags
	.align	1
gotoCompiler_flags:
	.byte	0x0
	.globl gotoCompiler
	.align 4
	.text
	.align	4
gotoCompiler:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	la x30,state
	lw x30,0(x30)
	li x29,1
	sh x29,0(x30)
L.156:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,0(x1)

	.align 4
	.data
	.globl hide_id
	.align	4
hide_id:
	.word	0xf
	.globl hide_name
	.align	4
hide_name:
	.word	L.157
	.globl hide_flags
	.align	1
hide_flags:
	.byte	0x0
	.globl hide
	.align 4
	.text
	.align	4
hide:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	la x30,latest
	lw x30,0(x30)
	lhu x30,0(x30)
	li x29,2
	add x30,x30,x29
	la x29,memory
	add x30,x30,x29
	lbu x29,0(x30)
	xori x29,x29,64
	sb x29,0(x30)
L.158:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,0(x1)

	.align 4
	.data
	.globl rtos_id
	.align	4
rtos_id:
	.word	0x10
	.globl rtos_name
	.align	4
rtos_name:
	.word	L.159
	.globl rtos_flags
	.align	1
rtos_flags:
	.byte	0x0
	.globl rtos
	.align 4
	.text
	.align	4
rtos:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call rpop
	mv x30,x10 ; LOADU4
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.160:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl stor_id
	.align	4
stor_id:
	.word	0x11
	.globl stor_name
	.align	4
stor_name:
	.word	L.161
	.globl stor_flags
	.align	1
stor_flags:
	.byte	0x0
	.globl stor
	.align 4
	.text
	.align	4
stor:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call rpush
L.162:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl key_p_id
	.align	4
key_p_id:
	.word	0x12
	.globl key_p_name
	.align	4
key_p_name:
	.word	L.163
	.globl key_p_flags
	.align	1
key_p_flags:
	.byte	0x0
	.globl key_p
	.align 4
	.text
	.align	4
key_p:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call keyWaiting
	mv x30,x10 ; LOADU4
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.164:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl branch_id
	.align	4
branch_id:
	.word	0x13
	.globl branch_name
	.align	4
branch_name:
	.word	L.165
	.globl branch_flags
	.align	1
branch_flags:
	.byte	0x0
	.globl branch
	.align 4
	.text
	.align	4
branch:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	la x30,next
	sw x30,-12+16(x8)
	lhu x29,0(x30)
	sw x29,-8+16(x8)
	mv x12,x29 ; LOADI4
	call readMem
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	lw x29,-8+16(x8)
	add x30,x29,x30
	lw x29,-12+16(x8)
	sh x30,0(x29)
L.166:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl zbranch_id
	.align	4
zbranch_id:
	.word	0x14
	.globl zbranch_name
	.align	4
zbranch_name:
	.word	L.167
	.globl zbranch_flags
	.align	1
zbranch_flags:
	.byte	0x0
	.globl zbranch
	.align 4
	.text
	.align	4
zbranch:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	beq x30,x0,L.170
	li x27,2
	j L.171
L.170:
	la x30,next
	lhu x12,0(x30)
	call readMem
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	mv x27,x30 ; LOADU4
L.171:
	la x30,next
	lhu x29,0(x30)
	add x29,x29,x27
	sh x29,0(x30)
L.168:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.align 4
	.data
	.globl toggleImmediate_id
	.align	4
toggleImmediate_id:
	.word	0x15
	.globl toggleImmediate_name
	.align	4
toggleImmediate_name:
	.word	L.172
	.globl toggleImmediate_flags
	.align	1
toggleImmediate_flags:
	.byte	0x80
	.globl toggleImmediate
	.align 4
	.text
	.align	4
toggleImmediate:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	la x30,latest
	lw x30,0(x30)
	lhu x30,0(x30)
	li x29,2
	add x30,x30,x29
	la x29,memory
	add x30,x30,x29
	lbu x29,0(x30)
	xori x29,x29,128
	sb x29,0(x30)
L.173:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,0(x1)

	.align 4
	.data
	.globl doFree_id
	.align	4
doFree_id:
	.word	0x16
	.globl doFree_name
	.align	4
doFree_name:
	.word	L.174
	.globl doFree_flags
	.align	1
doFree_flags:
	.byte	0x0
	.globl doFree
	.align 4
	.text
	.align	4
doFree:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	li x30,65536
	la x29,here
	lw x29,0(x29)
	lhu x29,0(x29)
	sub x30,x30,x29
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.175:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl s0_r_id
	.align	4
s0_r_id:
	.word	0x17
	.globl s0_r_name
	.align	4
s0_r_name:
	.word	L.176
	.globl s0_r_flags
	.align	1
s0_r_flags:
	.byte	0x0
	.globl s0_r
	.align 4
	.text
	.align	4
s0_r:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	li x12,110
	call push
L.177:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl dsp_r_id
	.align	4
dsp_r_id:
	.word	0x18
	.globl dsp_r_name
	.align	4
dsp_r_name:
	.word	L.178
	.globl dsp_r_flags
	.align	1
dsp_r_flags:
	.byte	0x0
	.globl dsp_r
	.align 4
	.text
	.align	4
dsp_r:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	la x30,sp
	lw x30,0(x30)
	lhu x30,0(x30)
	li x29,1
	shll x30,x30,x29
	li x29,108
	add x30,x30,x29
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.179:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl not_id
	.align	4
not_id:
	.word	0x19
	.globl not_name
	.align	4
not_name:
	.word	L.180
	.globl not_flags
	.align	1
not_flags:
	.byte	0x0
	.globl not
	.align 4
	.text
	.align	4
not:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	xori x30,x30,-1
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.181:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl dup_id
	.align	4
dup_id:
	.word	0x1a
	.globl dup_name
	.align	4
dup_name:
	.word	L.182
	.globl dup_flags
	.align	1
dup_flags:
	.byte	0x0
	.globl dup
	.align 4
	.text
	.align	4
dup:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call tos
	mv x30,x10 ; LOADU4
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.183:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl memWrite_id
	.align	4
memWrite_id:
	.word	0x1b
	.globl memWrite_name
	.align	4
memWrite_name:
	.word	L.184
	.globl memWrite_flags
	.align	1
memWrite_flags:
	.byte	0x0
	.globl memWrite
	.align 4
	.text
	.align	4
memWrite:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-8+16(x8)
	lhu x12,-6+16(x8)
	lhu x13,-8+16(x8)
	call writeMem
L.185:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl memWriteByte_id
	.align	4
memWriteByte_id:
	.word	0x1c
	.globl memWriteByte_name
	.align	4
memWriteByte_name:
	.word	L.186
	.globl memWriteByte_flags
	.align	1
memWriteByte_flags:
	.byte	0x0
	.globl memWriteByte
	.align 4
	.text
	.align	4
memWriteByte:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-8+16(x8)
	lhu x30,-6+16(x8)
	la x29,memory
	add x30,x30,x29
	lhu x29,-8+16(x8)
	andi x29,x29,255
	sb x29,0(x30)
L.187:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl swap_id
	.align	4
swap_id:
	.word	0x1d
	.globl swap_name
	.align	4
swap_name:
	.word	L.188
	.globl swap_flags
	.align	1
swap_flags:
	.byte	0x0
	.globl swap
	.align 4
	.text
	.align	4
swap:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-8+16(x8)
	lhu x12,-6+16(x8)
	call push
	lhu x12,-8+16(x8)
	call push
L.189:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl over_id
	.align	4
over_id:
	.word	0x1e
	.globl over_name
	.align	4
over_name:
	.word	L.190
	.globl over_flags
	.align	1
over_flags:
	.byte	0x0
	.globl over
	.align 4
	.text
	.align	4
over:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	call tos
	mv x30,x10 ; LOADU4
	sh x30,-8+16(x8)
	lhu x12,-6+16(x8)
	call push
	lhu x12,-8+16(x8)
	call push
L.191:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl comma_id
	.align	4
comma_id:
	.word	0x1f
	.globl comma_name
	.align	4
comma_name:
	.word	L.192
	.globl comma_flags
	.align	1
comma_flags:
	.byte	0x0
	.globl comma
	.align 4
	.text
	.align	4
comma:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	la x30,here
	lw x30,0(x30)
	lhu x12,0(x30)
	call push
	call memWrite
	la x30,here
	lw x30,0(x30)
	lhu x29,0(x30)
	li x28,2
	add x29,x29,x28
	sh x29,0(x30)
L.193:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl commaByte_id
	.align	4
commaByte_id:
	.word	0x20
	.globl commaByte_name
	.align	4
commaByte_name:
	.word	L.194
	.globl commaByte_flags
	.align	1
commaByte_flags:
	.byte	0x0
	.globl commaByte
	.align 4
	.text
	.align	4
commaByte:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	la x30,here
	lw x30,0(x30)
	lhu x12,0(x30)
	call push
	call memWriteByte
	la x30,here
	lw x30,0(x30)
	lhu x29,0(x30)
	li x28,1
	add x29,x29,x28
	sh x29,0(x30)
L.195:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl word_id
	.align	4
word_id:
	.word	0x21
	.globl word_name
	.align	4
word_name:
	.word	L.196
	.globl word_flags
	.align	1
word_flags:
	.byte	0x0
	.globl word
	.align 4
	.text
	.align	4
word:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call readWord
	mv x30,x10 ; LOADU4
	sb x30,-5+16(x8)
	li x12,1
	call push
	lbu x30,-5+16(x8)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.197:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl find_id
	.align	4
find_id:
	.word	0x22
	.globl find_name
	.align	4
find_name:
	.word	L.198
	.globl find_flags
	.align	1
find_flags:
	.byte	0x0
	.globl find
	.align 4
	.text
	.align	4
find:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-8+16(x8)
	lhu x12,-8+16(x8)
	lhu x13,-6+16(x8)
	call findWord
	mv x30,x10 ; LOADU4
	sh x30,-10+16(x8)
	lhu x12,-10+16(x8)
	call push
L.199:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.globl getCfa
	.align	4
getCfa:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	shlli x30,x12,8*(4-2)
	shrli x30,x30,8*(4-2)
	li x29,2
	add x30,x30,x29
	la x29,memory
	add x30,x30,x29
	lbu x30,0(x30)
	andi x30,x30,31
	addi x30,x30,1
	mv x27,x30 ; LOADU1
	j L.202
L.201:
	shlli x30,x27,8*(4-1)
	shrli x30,x30,8*(4-1)
	addi x30,x30,1
	mv x27,x30 ; LOADU1
L.202:
	shlli x30,x27,8*(4-1)
	shrli x30,x30,8*(4-1)
	li x29,1
	and x30,x30,x29
	bne x30,x0,L.201
	shlli x30,x12,8*(4-2)
	shrli x30,x30,8*(4-2)
	li x29,2
	add x30,x30,x29
	shlli x29,x27,8*(4-1)
	shrli x29,x29,8*(4-1)
	add x30,x30,x29
	shlli x10,x30,8*(4-2)
	shrli x10,x10,8*(4-2)
L.200:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,0(x1)

	.align 4
	.data
	.globl cfa_id
	.align	4
cfa_id:
	.word	0x23
	.globl cfa_name
	.align	4
cfa_name:
	.word	L.204
	.globl cfa_flags
	.align	1
cfa_flags:
	.byte	0x0
	.globl cfa
	.align 4
	.text
	.align	4
cfa:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	lhu x12,-6+16(x8)
	call getCfa
	mv x30,x10 ; LOADU4
	mv x27,x30 ; LOADU2
	shlli x30,x27,8*(4-2)
	shrli x30,x30,8*(4-2)
	la x29,maxBuiltinAddress
	lhu x29,0(x29)
	bge x30,x29,L.206
	shlli x12,x27,8*(4-2)
	shrli x12,x12,8*(4-2)
	call readMem
	mv x30,x10 ; LOADU4
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	j L.207
L.206:
	shlli x12,x27,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.207:
L.205:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.align 4
	.data
	.globl number_id
	.align	4
number_id:
	.word	0x24
	.globl number_name
	.align	4
number_name:
	.word	L.208
	.globl number_flags
	.align	1
number_flags:
	.byte	0x0
	.globl number
	.align 4
	.text
	.align	4
number:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-14+32(x8)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	la x29,memory
	add x30,x30,x29
	sw x30,-20+32(x8)
	lw x12,-20+32(x8)
	lhu x13,-14+32(x8)
	addi x14,x8,-8+32
	addi x15,x8,-10+32
	addi x16,x8,-11+32
	call parseNumber
	lbu x30,-11+32(x8)
	beq x30,x0,L.210
	lw x12,-8+32(x8)
	call dpush
	j L.211
L.210:
	lw x30,-8+32(x8)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.211:
	lhu x12,-10+32(x8)
	call push
L.209:
	lw x1,24(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.align 4
	.data
	.globl lit_id
	.align	4
lit_id:
	.word	0x25
	.globl lit_name
	.align	4
lit_name:
	.word	L.212
	.globl lit_flags
	.align	1
lit_flags:
	.byte	0x0
	.globl lit
	.align 4
	.text
	.align	4
lit:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	la x30,next
	lhu x12,0(x30)
	call readMem
	mv x30,x10 ; LOADU4
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	la x30,next
	lhu x29,0(x30)
	li x28,2
	add x29,x29,x28
	sh x29,0(x30)
L.213:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl quit_id
	.align	4
quit_id:
	.word	0x26
	.globl quit_name
	.align	4
quit_name:
	.word	L.214
	.globl quit_flags
	.align	1
quit_flags:
	.byte	0x0
	.globl quit
	.align 4
	.text
	.align	4
quit:
	addi x2,x2,-80
	sw  x8,76(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x24,28(x2)
	sw x25,32(x2)
	sw x26,36(x2)
	sw x27,40(x2)
	la x30,exitReq
	sw x0,0(x30)
L.216:
	la x30,quit_address
	lhu x30,0(x30)
	la x29,next
	sh x30,0(x29)
	la x29,lastIp
	sh x30,0(x29)
	la x30,errorFlag
	sw x0,0(x30)
	call word
	call find
	call pop
	mv x30,x10 ; LOADU4
	mv x25,x30 ; LOADU2
	shlli x30,x25,8*(4-2)
	shrli x30,x30,8*(4-2)
	beq x30,x0,L.220
	shlli x30,x25,8*(4-2)
	shrli x30,x30,8*(4-2)
	mv x29,x30 ; LOADU4
	li x28,2
	add x29,x29,x28
	la x28,memory
	add x29,x29,x28
	lbu x29,0(x29)
	andi x24,x29,128
	mv x12,x30 ; LOADI4
	call getCfa
	la x29,commandAddress
	mv x30,x10 ; LOADU4
	sh x30,0(x29)
	la x30,commandAddress
	lhu x12,0(x30)
	call readMem
	mv x30,x10 ; LOADU4
	mv x27,x30 ; LOADU2
	la x29,state
	lw x29,0(x29)
	lhu x29,0(x29)
	beq x29,x0,L.227
	bne x24,x0,L.227
	shlli x30,x27,8*(4-2)
	shrli x30,x30,8*(4-2)
	li x29,83
	bge x30,x29,L.224
	la x29,docol_id
	lw x29,0(x29)
	beq x30,x29,L.224
	shlli x12,x27,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	j L.225
L.224:
	la x30,commandAddress
	lhu x12,0(x30)
	call push
L.225:
	call comma
	j L.221
L.226:
	shlli x30,x27,8*(4-2)
	shrli x30,x30,8*(4-2)
	la x29,quit_id
	lw x29,0(x29)
	bne x30,x29,L.229
	j L.221
L.229:
	shlli x30,x27,8*(4-2)
	shrli x30,x30,8*(4-2)
	li x29,83
	bge x30,x29,L.231
	shlli x30,x27,8*(4-2)
	shrli x30,x30,8*(4-2)
	li x29,2
	shll x30,x30,x29
	la x29,builtins
	add x30,x30,x29
	lw x31,0(x30)
	jalr x1, 0(x31)
	j L.232
L.231:
	la x30,next
	la x29,lastIp
	lhu x28,0(x30)
	sh x28,0(x29)
	sh x27,0(x30)
L.232:
	la x30,commandAddress
	la x29,next
	lhu x29,0(x29)
	sh x29,0(x30)
	lhu x12,0(x30)
	call readMem
	mv x30,x10 ; LOADU4
	mv x27,x30 ; LOADU2
	la x30,next
	lhu x29,0(x30)
	li x28,2
	add x29,x29,x28
	sh x29,0(x30)
L.227:
	la x29,errorFlag
	lw x29,0(x29)
	bne x29,x0,L.233
	la x29,exitReq
	lw x29,0(x29)
	beq x29,x0,L.226
L.233:
	j L.221
L.220:
	la x12,memory+1
	la x30,memory
	lbu x30,0(x30)
	shlli x13,x30,8*(4-2)
	shrli x13,x13,8*(4-2)
	addi x14,x8,-12+32
	addi x15,x8,-6+32
	addi x16,x8,-13+32
	call parseNumber
	lhu x30,-6+32(x8)
	beq x30,x0,L.235
	la x12,L.237
	call tell
	mv x26,x0 ; LOADI4
	j L.241
L.238:
	la x30,memory+1
	add x30,x26,x30
	lbu x12,0(x30)
	call txtmod_putc
L.239:
	addi x26,x26,1
L.241:
	la x30,memory
	lbu x30,0(x30)
	blt x26,x30,L.238
	li x12,13
	call txtmod_putc
	li x30,1
	la x29,rsp
	lw x29,0(x29)
	sh x30,0(x29)
	la x29,sp
	lw x29,0(x29)
	sh x30,0(x29)
	j L.217
L.235:
	la x30,state
	lw x30,0(x30)
	lhu x30,0(x30)
	beq x30,x0,L.243
	lw x30,-12+32(x8)
	sw x30,-18+32(x8)
	la x30,lit_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	call comma
	lbu x30,-13+32(x8)
	beq x30,x0,L.245
	lhu x12,-18+32(x8)
	call push
	call comma
	la x30,lit_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	call comma
	lhu x12,-16+32(x8)
	call push
	call comma
	j L.244
L.245:
	lw x30,-12+32(x8)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	call comma
	j L.244
L.243:
	lbu x30,-13+32(x8)
	beq x30,x0,L.248
	lw x12,-12+32(x8)
	call dpush
	j L.249
L.248:
	lw x30,-12+32(x8)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.249:
L.244:
L.221:
	la x30,errorFlag
	lw x30,0(x30)
	beq x30,x0,L.250
	li x30,1
	la x29,rsp
	lw x29,0(x29)
	sh x30,0(x29)
	la x29,sp
	lw x29,0(x29)
	sh x30,0(x29)
	j L.251
L.250:
	call keyWaiting
	bne x10,x0,L.252
	la x30,initscript_pos
	lw x30,0(x30)
	lbu x30,0(x30)
	bne x30,x0,L.252
	la x12,L.254
	call tell
L.252:
L.251:
L.217:
	la x30,exitReq
	lw x30,0(x30)
	beq x30,x0,L.216
L.215:
	lw x1,24(x2)
	lw x24,28(x2)
	lw x25,32(x2)
	lw x26,36(x2)
	lw x27,40(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,0(x1)

	.align 4
	.data
	.globl plus_id
	.align	4
plus_id:
	.word	0x27
	.globl plus_name
	.align	4
plus_name:
	.word	L.255
	.globl plus_flags
	.align	1
plus_flags:
	.byte	0x0
	.globl plus
	.align 4
	.text
	.align	4
plus:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	sh x30,-8+16(x8)
	lh x30,-6+16(x8)
	lh x29,-8+16(x8)
	add x30,x30,x29
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.256:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl minus_id
	.align	4
minus_id:
	.word	0x28
	.globl minus_name
	.align	4
minus_name:
	.word	L.257
	.globl minus_flags
	.align	1
minus_flags:
	.byte	0x0
	.globl minus
	.align 4
	.text
	.align	4
minus:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	sh x30,-8+16(x8)
	lh x30,-8+16(x8)
	lh x29,-6+16(x8)
	sub x30,x30,x29
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.258:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl mul_id
	.align	4
mul_id:
	.word	0x29
	.globl mul_name
	.align	4
mul_name:
	.word	L.259
	.globl mul_flags
	.align	1
mul_flags:
	.byte	0x0
	.globl mul
	.align 4
	.text
	.align	4
mul:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	sh x30,-8+16(x8)
	lh x30,-6+16(x8)
	lh x29,-8+16(x8)
	imul x0,x30,x30,x29
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.260:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl divmod_id
	.align	4
divmod_id:
	.word	0x2a
	.globl divmod_name
	.align	4
divmod_name:
	.word	L.261
	.globl divmod_flags
	.align	1
divmod_flags:
	.byte	0x0
	.globl divmod
	.align 4
	.text
	.align	4
divmod:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x26,28(x2)
	sw x27,32(x2)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	mv x27,x30 ; LOADI2
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	mv x26,x30 ; LOADI2
	shlli x30,x26,8*(4-2)
	shrai x30,x30,8*(4-2)
	shlli x29,x27,8*(4-2)
	shrai x29,x29,8*(4-2)
	idiv x0,x30,x30,x29
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	shlli x30,x26,8*(4-2)
	shrai x30,x30,8*(4-2)
	shlli x29,x27,8*(4-2)
	shrai x29,x29,8*(4-2)
	idiv x30,x0,x30,x29
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.262:
	lw x1,24(x2)
	lw x26,28(x2)
	lw x27,32(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.align 4
	.data
	.globl rot_id
	.align	4
rot_id:
	.word	0x2b
	.globl rot_name
	.align	4
rot_name:
	.word	L.263
	.globl rot_flags
	.align	1
rot_flags:
	.byte	0x0
	.globl rot
	.align 4
	.text
	.align	4
rot:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-8+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-10+16(x8)
	lhu x12,-8+16(x8)
	call push
	lhu x12,-6+16(x8)
	call push
	lhu x12,-10+16(x8)
	call push
L.264:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl doCreate_id
	.align	4
doCreate_id:
	.word	0x2c
	.globl doCreate_name
	.align	4
doCreate_name:
	.word	L.265
	.globl doCreate_flags
	.align	1
doCreate_flags:
	.byte	0x0
	.globl doCreate
	.align 4
	.text
	.align	4
doCreate:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call word
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	andi x30,x30,255
	sb x30,-5+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-8+16(x8)
	lhu x30,-8+16(x8)
	la x29,memory
	add x12,x30,x29
	lbu x13,-5+16(x8)
	mv x14,x0 ; LOADI4
	call createWord
L.266:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl colon_id
	.align	4
colon_id:
	.word	0x2d
	.globl colon_name
	.align	4
colon_name:
	.word	L.267
	.globl colon_flags
	.align	1
colon_flags:
	.byte	0x0
	.globl colon
	.align 4
	.text
	.align	4
colon:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call doCreate
	la x30,docol_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	call comma
	call hide
	la x30,state
	lw x30,0(x30)
	li x29,1
	sh x29,0(x30)
L.268:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl semicolon_id
	.align	4
semicolon_id:
	.word	0x2e
	.globl semicolon_name
	.align	4
semicolon_name:
	.word	L.269
	.globl semicolon_flags
	.align	1
semicolon_flags:
	.byte	0x80
	.globl semicolon
	.align 4
	.text
	.align	4
semicolon:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	la x30,doExit_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	call comma
	call hide
	la x30,state
	lw x30,0(x30)
	sh x0,0(x30)
L.270:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl rget_id
	.align	4
rget_id:
	.word	0x2f
	.globl rget_name
	.align	4
rget_name:
	.word	L.271
	.globl rget_flags
	.align	1
rget_flags:
	.byte	0x0
	.globl rget
	.align 4
	.text
	.align	4
rget:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	call rpop
	mv x30,x10 ; LOADU4
	mv x27,x30 ; LOADU2
	shlli x12,x27,8*(4-2)
	shrli x12,x12,8*(4-2)
	call rpush
	shlli x12,x27,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.272:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.align 4
	.data
	.globl doJ_id
	.align	4
doJ_id:
	.word	0x30
	.globl doJ_name
	.align	4
doJ_name:
	.word	L.273
	.globl doJ_flags
	.align	1
doJ_flags:
	.byte	0x0
	.globl doJ
	.align 4
	.text
	.align	4
doJ:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	call rpop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	call rpop
	mv x30,x10 ; LOADU4
	sh x30,-8+16(x8)
	call rpop
	mv x30,x10 ; LOADU4
	mv x27,x30 ; LOADU2
	shlli x12,x27,8*(4-2)
	shrli x12,x12,8*(4-2)
	call rpush
	lhu x12,-8+16(x8)
	call rpush
	lhu x12,-6+16(x8)
	call rpush
	shlli x12,x27,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.274:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.align 4
	.data
	.globl tick_id
	.align	4
tick_id:
	.word	0x31
	.globl tick_name
	.align	4
tick_name:
	.word	L.275
	.globl tick_flags
	.align	1
tick_flags:
	.byte	0x80
	.globl tick
	.align 4
	.text
	.align	4
tick:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call word
	call find
	call cfa
	la x30,state
	lw x30,0(x30)
	lhu x30,0(x30)
	beq x30,x0,L.277
	la x30,lit_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	call comma
	call comma
L.277:
L.276:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl equals_id
	.align	4
equals_id:
	.word	0x32
	.globl equals_name
	.align	4
equals_name:
	.word	L.279
	.globl equals_flags
	.align	1
equals_flags:
	.byte	0x0
	.globl equals
	.align 4
	.text
	.align	4
equals:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-8+16(x8)
	lhu x30,-8+16(x8)
	lhu x29,-6+16(x8)
	bne x30,x29,L.282
	li x27,-1
	j L.283
L.282:
	mv x27,x0 ; LOADI4
L.283:
	mv x30,x27 ; LOADU4
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.280:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.align 4
	.data
	.globl smaller_id
	.align	4
smaller_id:
	.word	0x33
	.globl smaller_name
	.align	4
smaller_name:
	.word	L.284
	.globl smaller_flags
	.align	1
smaller_flags:
	.byte	0x0
	.globl smaller
	.align 4
	.text
	.align	4
smaller:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	sh x30,-8+16(x8)
	lh x30,-8+16(x8)
	lh x29,-6+16(x8)
	bge x30,x29,L.287
	li x27,-1
	j L.288
L.287:
	mv x27,x0 ; LOADI4
L.288:
	mv x30,x27 ; LOADU4
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.285:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.align 4
	.data
	.globl larger_id
	.align	4
larger_id:
	.word	0x34
	.globl larger_name
	.align	4
larger_name:
	.word	L.289
	.globl larger_flags
	.align	1
larger_flags:
	.byte	0x0
	.globl larger
	.align 4
	.text
	.align	4
larger:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	sh x30,-8+16(x8)
	lh x30,-8+16(x8)
	lh x29,-6+16(x8)
	ble x30,x29,L.292
	li x27,-1
	j L.293
L.292:
	mv x27,x0 ; LOADI4
L.293:
	mv x30,x27 ; LOADU4
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.290:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.align 4
	.data
	.globl doAnd_id
	.align	4
doAnd_id:
	.word	0x35
	.globl doAnd_name
	.align	4
doAnd_name:
	.word	L.294
	.globl doAnd_flags
	.align	1
doAnd_flags:
	.byte	0x0
	.globl doAnd
	.align 4
	.text
	.align	4
doAnd:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-8+16(x8)
	lhu x30,-8+16(x8)
	lhu x29,-6+16(x8)
	and x30,x30,x29
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.295:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl doOr_id
	.align	4
doOr_id:
	.word	0x36
	.globl doOr_name
	.align	4
doOr_name:
	.word	L.296
	.globl doOr_flags
	.align	1
doOr_flags:
	.byte	0x0
	.globl doOr
	.align 4
	.text
	.align	4
doOr:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-8+16(x8)
	lhu x30,-8+16(x8)
	lhu x29,-6+16(x8)
	or x30,x30,x29
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.297:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl p_dup_id
	.align	4
p_dup_id:
	.word	0x37
	.globl p_dup_name
	.align	4
p_dup_name:
	.word	L.298
	.globl p_dup_flags
	.align	1
p_dup_flags:
	.byte	0x0
	.globl p_dup
	.align 4
	.text
	.align	4
p_dup:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call tos
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	lhu x30,-6+16(x8)
	beq x30,x0,L.300
	lhu x12,-6+16(x8)
	call push
L.300:
L.299:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl litstring_id
	.align	4
litstring_id:
	.word	0x38
	.globl litstring_name
	.align	4
litstring_name:
	.word	L.302
	.globl litstring_flags
	.align	1
litstring_flags:
	.byte	0x0
	.globl litstring
	.align 4
	.text
	.align	4
litstring:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	la x30,next
	lhu x12,0(x30)
	call readMem
	mv x30,x10 ; LOADU4
	mv x27,x30 ; LOADU2
	la x30,next
	lhu x29,0(x30)
	li x28,2
	add x29,x29,x28
	sh x29,0(x30)
	lhu x12,0(x30)
	call push
	shlli x12,x27,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	la x30,next
	lhu x29,0(x30)
	shlli x28,x27,8*(4-2)
	shrli x28,x28,8*(4-2)
	add x29,x29,x28
	sh x29,0(x30)
	j L.305
L.304:
	la x30,next
	lhu x29,0(x30)
	addi x29,x29,1
	sh x29,0(x30)
L.305:
	la x30,next
	lhu x30,0(x30)
	li x29,1
	and x30,x30,x29
	bne x30,x0,L.304
L.303:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.align 4
	.data
	.globl xor_id
	.align	4
xor_id:
	.word	0x39
	.globl xor_name
	.align	4
xor_name:
	.word	L.307
	.globl xor_flags
	.align	1
xor_flags:
	.byte	0x0
	.globl xor
	.align 4
	.text
	.align	4
xor:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-8+16(x8)
	lhu x30,-6+16(x8)
	lhu x29,-8+16(x8)
	xor x30,x30,x29
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.308:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl timesDivide_id
	.align	4
timesDivide_id:
	.word	0x3a
	.globl timesDivide_name
	.align	4
timesDivide_name:
	.word	L.309
	.globl timesDivide_flags
	.align	1
timesDivide_flags:
	.byte	0x0
	.globl timesDivide
	.align 4
	.text
	.align	4
timesDivide:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	sw x30,-12+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	sw x30,-16+16(x8)
	lw x30,-16+16(x8)
	lw x29,-12+16(x8)
	imul x0,x30,x30,x29
	lhu x29,-6+16(x8)
	udiv x27,x0,x30,x29
	mv x30,x27 ; LOADU2
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	mv x30,x27 ; LOADU2
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	beq x30,x27,L.311
	la x12,L.313
	call tell
	la x30,errorFlag
	li x29,1
	sw x29,0(x30)
L.311:
L.310:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.align 4
	.data
	.globl timesDivideMod_id
	.align	4
timesDivideMod_id:
	.word	0x3b
	.globl timesDivideMod_name
	.align	4
timesDivideMod_name:
	.word	L.314
	.globl timesDivideMod_flags
	.align	1
timesDivideMod_flags:
	.byte	0x0
	.globl timesDivideMod
	.align 4
	.text
	.align	4
timesDivideMod:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x24,28(x2)
	sw x25,32(x2)
	sw x26,36(x2)
	sw x27,40(x2)
	call pop
	mv x30,x10 ; LOADU4
	mv x26,x30 ; LOADU2
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	mv x25,x30 ; LOADU4
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	mv x24,x30 ; LOADU4
	imul x0,x30,x24,x25
	shlli x29,x26,8*(4-2)
	shrli x29,x29,8*(4-2)
	udiv x27,x0,x30,x29
	imul x0,x30,x24,x25
	shlli x29,x26,8*(4-2)
	shrli x29,x29,8*(4-2)
	udiv x0,x30,x30,x29
	sw x30,-8+16(x8)
	lw x30,-8+16(x8)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	mv x30,x27 ; LOADU2
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	mv x30,x27 ; LOADU2
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	beq x30,x27,L.316
	la x12,L.313
	call tell
	la x30,errorFlag
	li x29,1
	sw x29,0(x30)
L.316:
L.315:
	lw x1,24(x2)
	lw x24,28(x2)
	lw x25,32(x2)
	lw x26,36(x2)
	lw x27,40(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.align 4
	.data
	.globl dequals_id
	.align	4
dequals_id:
	.word	0x3c
	.globl dequals_name
	.align	4
dequals_name:
	.word	L.318
	.globl dequals_flags
	.align	1
dequals_flags:
	.byte	0x0
	.globl dequals
	.align 4
	.text
	.align	4
dequals:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	call dpop
	sw x10,-8+16(x8)
	call dpop
	sw x10,-12+16(x8)
	lw x30,-12+16(x8)
	lw x29,-8+16(x8)
	bne x30,x29,L.321
	li x27,-1
	j L.322
L.321:
	mv x27,x0 ; LOADI4
L.322:
	mv x30,x27 ; LOADU4
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.319:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.align 4
	.data
	.globl dsmaller_id
	.align	4
dsmaller_id:
	.word	0x3d
	.globl dsmaller_name
	.align	4
dsmaller_name:
	.word	L.323
	.globl dsmaller_flags
	.align	1
dsmaller_flags:
	.byte	0x0
	.globl dsmaller
	.align 4
	.text
	.align	4
dsmaller:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	call dpop
	mv x30,x10 ; LOADI4
	sw x30,-8+16(x8)
	call dpop
	mv x30,x10 ; LOADI4
	sw x30,-12+16(x8)
	lw x30,-12+16(x8)
	lw x29,-8+16(x8)
	bge x30,x29,L.326
	li x27,-1
	j L.327
L.326:
	mv x27,x0 ; LOADI4
L.327:
	mv x30,x27 ; LOADU4
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.324:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.align 4
	.data
	.globl dlarger_id
	.align	4
dlarger_id:
	.word	0x3e
	.globl dlarger_name
	.align	4
dlarger_name:
	.word	L.328
	.globl dlarger_flags
	.align	1
dlarger_flags:
	.byte	0x0
	.globl dlarger
	.align 4
	.text
	.align	4
dlarger:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	call dpop
	mv x30,x10 ; LOADI4
	sw x30,-8+16(x8)
	call dpop
	mv x30,x10 ; LOADI4
	sw x30,-12+16(x8)
	lw x30,-12+16(x8)
	lw x29,-8+16(x8)
	ble x30,x29,L.331
	li x27,-1
	j L.332
L.331:
	mv x27,x0 ; LOADI4
L.332:
	mv x30,x27 ; LOADU4
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.329:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.align 4
	.data
	.globl dusmaller_id
	.align	4
dusmaller_id:
	.word	0x3f
	.globl dusmaller_name
	.align	4
dusmaller_name:
	.word	L.333
	.globl dusmaller_flags
	.align	1
dusmaller_flags:
	.byte	0x0
	.globl dusmaller
	.align 4
	.text
	.align	4
dusmaller:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	call dpop
	sw x10,-8+16(x8)
	call dpop
	sw x10,-12+16(x8)
	lw x30,-12+16(x8)
	lw x29,-8+16(x8)
	bgeu x30,x29,L.336
	li x27,-1
	j L.337
L.336:
	mv x27,x0 ; LOADI4
L.337:
	mv x30,x27 ; LOADU4
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.334:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.align 4
	.data
	.globl dplus_id
	.align	4
dplus_id:
	.word	0x40
	.globl dplus_name
	.align	4
dplus_name:
	.word	L.338
	.globl dplus_flags
	.align	1
dplus_flags:
	.byte	0x0
	.globl dplus
	.align 4
	.text
	.align	4
dplus:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call dpop
	mv x30,x10 ; LOADI4
	sw x30,-8+16(x8)
	call dpop
	mv x30,x10 ; LOADI4
	sw x30,-12+16(x8)
	lw x30,-8+16(x8)
	lw x29,-12+16(x8)
	add x30,x30,x29
	mv x12,x30 ; LOADU4
	call dpush
L.339:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl dminus_id
	.align	4
dminus_id:
	.word	0x41
	.globl dminus_name
	.align	4
dminus_name:
	.word	L.340
	.globl dminus_flags
	.align	1
dminus_flags:
	.byte	0x0
	.globl dminus
	.align 4
	.text
	.align	4
dminus:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call dpop
	mv x30,x10 ; LOADI4
	sw x30,-8+16(x8)
	call dpop
	mv x30,x10 ; LOADI4
	sw x30,-12+16(x8)
	lw x30,-12+16(x8)
	lw x29,-8+16(x8)
	sub x30,x30,x29
	mv x12,x30 ; LOADU4
	call dpush
L.341:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl dmul_id
	.align	4
dmul_id:
	.word	0x42
	.globl dmul_name
	.align	4
dmul_name:
	.word	L.342
	.globl dmul_flags
	.align	1
dmul_flags:
	.byte	0x0
	.globl dmul
	.align 4
	.text
	.align	4
dmul:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call dpop
	mv x30,x10 ; LOADI4
	sw x30,-8+16(x8)
	call dpop
	mv x30,x10 ; LOADI4
	sw x30,-12+16(x8)
	lw x30,-8+16(x8)
	lw x29,-12+16(x8)
	imul x0,x30,x30,x29
	mv x12,x30 ; LOADU4
	call dpush
L.343:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl ddiv_id
	.align	4
ddiv_id:
	.word	0x43
	.globl ddiv_name
	.align	4
ddiv_name:
	.word	L.344
	.globl ddiv_flags
	.align	1
ddiv_flags:
	.byte	0x0
	.globl ddiv
	.align 4
	.text
	.align	4
ddiv:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call dpop
	mv x30,x10 ; LOADI4
	sw x30,-8+16(x8)
	call dpop
	mv x30,x10 ; LOADI4
	sw x30,-12+16(x8)
	lw x30,-12+16(x8)
	lw x29,-8+16(x8)
	idiv x30,x0,x30,x29
	mv x12,x30 ; LOADU4
	call dpush
L.345:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl dswap_id
	.align	4
dswap_id:
	.word	0x44
	.globl dswap_name
	.align	4
dswap_name:
	.word	L.346
	.globl dswap_flags
	.align	1
dswap_flags:
	.byte	0x0
	.globl dswap
	.align 4
	.text
	.align	4
dswap:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call dpop
	sw x10,-8+16(x8)
	call dpop
	sw x10,-12+16(x8)
	lw x12,-8+16(x8)
	call dpush
	lw x12,-12+16(x8)
	call dpush
L.347:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl dover_id
	.align	4
dover_id:
	.word	0x45
	.globl dover_name
	.align	4
dover_name:
	.word	L.348
	.globl dover_flags
	.align	1
dover_flags:
	.byte	0x0
	.globl dover
	.align 4
	.text
	.align	4
dover:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	call dpop
	sw x10,-8+16(x8)
	call dpop
	mv x27,x10 ; LOADU4
	mv x12,x27 ; LOADU4
	call dpush
	lw x12,-8+16(x8)
	call dpush
	mv x12,x27 ; LOADU4
	call dpush
L.349:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.align 4
	.data
	.globl drot_id
	.align	4
drot_id:
	.word	0x46
	.globl drot_name
	.align	4
drot_name:
	.word	L.350
	.globl drot_flags
	.align	1
drot_flags:
	.byte	0x0
	.globl drot
	.align 4
	.text
	.align	4
drot:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call dpop
	sw x10,-8+16(x8)
	call dpop
	sw x10,-12+16(x8)
	call dpop
	sw x10,-16+16(x8)
	lw x12,-12+16(x8)
	call dpush
	lw x12,-8+16(x8)
	call dpush
	lw x12,-16+16(x8)
	call dpush
L.351:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl portWrite_id
	.align	4
portWrite_id:
	.word	0x47
	.globl portWrite_name
	.align	4
portWrite_name:
	.word	L.352
	.globl portWrite_flags
	.align	1
portWrite_flags:
	.byte	0x0
	.globl portWrite
	.align 4
	.text
	.align	4
portWrite:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-8+16(x8)
	lhu x12,-6+16(x8)
	lhu x13,-8+16(x8)
	call hw_shd
L.353:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl portWriteByte_id
	.align	4
portWriteByte_id:
	.word	0x48
	.globl portWriteByte_name
	.align	4
portWriteByte_name:
	.word	L.354
	.globl portWriteByte_flags
	.align	1
portWriteByte_flags:
	.byte	0x0
	.globl portWriteByte
	.align 4
	.text
	.align	4
portWriteByte:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-8+16(x8)
	lhu x12,-6+16(x8)
	lhu x30,-8+16(x8)
	shlli x13,x30,8*(4-1)
	shrli x13,x13,8*(4-1)
	call hw_sbd
L.355:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl portRead_id
	.align	4
portRead_id:
	.word	0x49
	.globl portRead_name
	.align	4
portRead_name:
	.word	L.356
	.globl portRead_flags
	.align	1
portRead_flags:
	.byte	0x0
	.globl portRead
	.align 4
	.text
	.align	4
portRead:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call hw_lhud
	mv x30,x10 ; LOADU4
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.357:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl portreadByte_id
	.align	4
portreadByte_id:
	.word	0x4a
	.globl portreadByte_name
	.align	4
portreadByte_name:
	.word	L.358
	.globl portreadByte_flags
	.align	1
portreadByte_flags:
	.byte	0x0
	.globl portreadByte
	.align 4
	.text
	.align	4
portreadByte:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call hw_lbud
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-1)
	shrli x30,x30,8*(4-1)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.359:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl doRun_id
	.align	4
doRun_id:
	.word	0x4b
	.globl doRun_name
	.align	4
doRun_name:
	.word	L.360
	.globl doRun_flags
	.align	1
doRun_flags:
	.byte	0x0
	.globl doRun
	.align 4
	.text
	.align	4
doRun:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call dpop
	mv x30,x10 ; LOADU4
	mv x12,x30 ; LOADU4
	call hw_call
L.361:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl clearScreen_id
	.align	4
clearScreen_id:
	.word	0x4c
	.globl clearScreen_name
	.align	4
clearScreen_name:
	.word	L.362
	.globl clearScreen_flags
	.align	1
clearScreen_flags:
	.byte	0x0
	.globl clearScreen
	.align 4
	.text
	.align	4
clearScreen:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call txtmod_clear_update
L.363:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl tpsLoad_id
	.align	4
tpsLoad_id:
	.word	0x4d
	.globl tpsLoad_name
	.align	4
tpsLoad_name:
	.word	L.364
	.globl tpsLoad_flags
	.align	1
tpsLoad_flags:
	.byte	0x0
	.globl tpsLoad
	.align 4
	.text
	.align	4
tpsLoad:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	andi x30,x30,255
	sh x30,-8+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-10+16(x8)
	lhu x12,-10+16(x8)
	lhu x30,-8+16(x8)
	shlli x13,x30,8*(4-1)
	shrli x13,x13,8*(4-1)
	lhu x30,-6+16(x8)
	la x29,memory
	add x14,x30,x29
	call tps_load_driver
L.365:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl tpsStore_id
	.align	4
tpsStore_id:
	.word	0x4e
	.globl tpsStore_name
	.align	4
tpsStore_name:
	.word	L.366
	.globl tpsStore_flags
	.align	1
tpsStore_flags:
	.byte	0x0
	.globl tpsStore
	.align 4
	.text
	.align	4
tpsStore:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	andi x30,x30,255
	sh x30,-8+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-10+16(x8)
	lhu x12,-10+16(x8)
	lhu x30,-8+16(x8)
	shlli x13,x30,8*(4-1)
	shrli x13,x13,8*(4-1)
	lhu x30,-6+16(x8)
	la x29,memory
	add x14,x30,x29
	call tps_store_driver
L.367:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl hcsLoad_id
	.align	4
hcsLoad_id:
	.word	0x4f
	.globl hcsLoad_name
	.align	4
hcsLoad_name:
	.word	L.368
	.globl hcsLoad_flags
	.align	1
hcsLoad_flags:
	.byte	0x0
	.globl hcsLoad
	.align 4
	.text
	.align	4
hcsLoad:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-8+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-10+16(x8)
	lhu x12,-10+16(x8)
	lhu x13,-8+16(x8)
	lhu x30,-6+16(x8)
	la x29,memory
	add x14,x30,x29
	call hcs_load_driver
L.369:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl hcsStore_id
	.align	4
hcsStore_id:
	.word	0x50
	.globl hcsStore_name
	.align	4
hcsStore_name:
	.word	L.370
	.globl hcsStore_flags
	.align	1
hcsStore_flags:
	.byte	0x0
	.globl hcsStore
	.align 4
	.text
	.align	4
hcsStore:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-6+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-8+16(x8)
	call pop
	mv x30,x10 ; LOADU4
	sh x30,-10+16(x8)
	lhu x12,-10+16(x8)
	lhu x30,-8+16(x8)
	shlli x30,x30,8*(4-1)
	shrli x30,x30,8*(4-1)
	shlli x13,x30,8*(4-2)
	shrli x13,x13,8*(4-2)
	lhu x30,-6+16(x8)
	la x29,memory
	add x14,x30,x29
	call hcs_store_driver
L.371:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.align 4
	.data
	.globl udivmod_id
	.align	4
udivmod_id:
	.word	0x51
	.globl udivmod_name
	.align	4
udivmod_name:
	.word	L.372
	.globl udivmod_flags
	.align	1
udivmod_flags:
	.byte	0x0
	.globl udivmod
	.align 4
	.text
	.align	4
udivmod:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x26,28(x2)
	sw x27,32(x2)
	call pop
	mv x30,x10 ; LOADU4
	mv x27,x30 ; LOADU2
	call pop
	mv x30,x10 ; LOADU4
	mv x26,x30 ; LOADU2
	shlli x30,x26,8*(4-2)
	shrli x30,x30,8*(4-2)
	shlli x29,x27,8*(4-2)
	shrli x29,x29,8*(4-2)
	idiv x0,x30,x30,x29
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	shlli x30,x26,8*(4-2)
	shrli x30,x30,8*(4-2)
	shlli x29,x27,8*(4-2)
	shrli x29,x29,8*(4-2)
	idiv x30,x0,x30,x29
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.373:
	lw x1,24(x2)
	lw x26,28(x2)
	lw x27,32(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.align 4
	.data
	.globl umdivmod_id
	.align	4
umdivmod_id:
	.word	0x52
	.globl umdivmod_name
	.align	4
umdivmod_name:
	.word	L.374
	.globl umdivmod_flags
	.align	1
umdivmod_flags:
	.byte	0x0
	.globl umdivmod
	.align 4
	.text
	.align	4
umdivmod:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x26,28(x2)
	sw x27,32(x2)
	call pop
	mv x30,x10 ; LOADU4
	mv x27,x30 ; LOADU2
	call pop
	mv x30,x10 ; LOADU4
	shlli x30,x30,8*(4-2)
	shrli x30,x30,8*(4-2)
	mv x26,x30 ; LOADU4
	shlli x30,x27,8*(4-2)
	shrli x30,x30,8*(4-2)
	udiv x0,x30,x26,x30
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	shlli x30,x27,8*(4-2)
	shrli x30,x30,8*(4-2)
	udiv x30,x0,x26,x30
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
L.375:
	lw x1,24(x2)
	lw x26,28(x2)
	lw x27,32(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.globl createWord
	.align	4
createWord:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x26,28(x2)
	sw x27,32(x2)
	mv x27,x12
	mv x26,x13
	sw x14,24(x8)
	lw x30,8+16(x8)
	sb x30,8+16(x8)
	la x30,here
	lw x30,0(x30)
	lhu x30,0(x30)
	sh x30,-6+16(x8)
	la x30,latest
	lw x30,0(x30)
	lhu x12,0(x30)
	call push
	call comma
	shlli x30,x26,8*(4-1)
	shrli x30,x30,8*(4-1)
	lbu x29,8+16(x8)
	or x30,x30,x29
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	call commaByte
	j L.378
L.377:
	lbu x30,0(x27)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	call commaByte
	li x30,1
	add x27,x27,x30
L.378:
	shlli x30,x26,8*(4-1)
	shrli x30,x30,8*(4-1)
	addi x29,x30,-1
	mv x26,x29 ; LOADU1
	bne x30,x0,L.377
	j L.381
L.380:
	mv x12,x0 ; LOADI4
	call push
	call commaByte
L.381:
	la x30,here
	lw x30,0(x30)
	lhu x30,0(x30)
	li x29,1
	and x30,x30,x29
	bne x30,x0,L.380
	la x30,latest
	lw x30,0(x30)
	lhu x29,-6+16(x8)
	sh x29,0(x30)
L.376:
	lw x1,24(x2)
	lw x26,28(x2)
	lw x27,32(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.globl slen
	.align	4
slen:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	mv x27,x0 ; LOADU1
	j L.385
L.384:
	shlli x30,x27,8*(4-1)
	shrli x30,x30,8*(4-1)
	addi x30,x30,1
	mv x27,x30 ; LOADU1
L.385:
	mv x30,x12 ; LOADP4
	li x29,1
	add x12,x30,x29
	lbu x30,0(x30)
	bne x30,x0,L.384
	shlli x10,x27,8*(4-1)
	shrli x10,x10,8*(4-1)
L.383:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,0(x1)

	.globl addBuiltin
	.align	4
addBuiltin:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x26,28(x2)
	sw x27,32(x2)
	mv x27,x12
	mv x26,x13
	sw x14,24(x8)
	sw x15,28(x8)
	lw x30,8+16(x8)
	sb x30,8+16(x8)
	la x30,errorFlag
	lw x30,0(x30)
	beq x30,x0,L.388
	j L.387
L.388:
	shlli x30,x27,8*(4-2)
	shrli x30,x30,8*(4-2)
	li x29,83
	blt x30,x29,L.390
	la x12,L.392
	call tell
	mv x12,x26 ; LOADP4
	call tell
	la x12,L.393
	call tell
	la x30,errorFlag
	li x29,1
	sw x29,0(x30)
	j L.387
L.390:
	shlli x30,x27,8*(4-2)
	shrli x30,x30,8*(4-2)
	li x29,2
	shll x30,x30,x29
	la x29,builtins
	add x30,x30,x29
	lw x30,0(x30)
	beq x30,x0,L.394
	la x12,L.392
	call tell
	mv x12,x26 ; LOADP4
	call tell
	la x12,L.396
	call tell
	la x30,errorFlag
	li x29,1
	sw x29,0(x30)
	j L.387
L.394:
	shlli x30,x27,8*(4-2)
	shrli x30,x30,8*(4-2)
	li x29,2
	shll x30,x30,x29
	la x29,builtins
	add x30,x30,x29
	lw x29,12+16(x8)
	sw x29,0(x30)
	mv x12,x26 ; LOADP4
	call slen
	mv x12,x26 ; LOADP4
	mv x30,x10 ; LOADU4
	shlli x13,x30,8*(4-1)
	shrli x13,x13,8*(4-1)
	lbu x14,8+16(x8)
	call createWord
	shlli x12,x27,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	call comma
	la x30,doExit_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	call comma
L.387:
	lw x1,24(x2)
	lw x26,28(x2)
	lw x27,32(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.globl main
	.align	4
main:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	la x30,errorFlag
	sw x0,0(x30)
	j L.398
	la x12,L.400
	call tell
	li x10,1
	j L.397
L.398:
	la x30,state
	la x29,memory+106
	sw x29,0(x30)
	la x30,base
	la x29,memory+104
	sw x29,0(x30)
	la x30,latest
	la x29,memory+100
	sw x29,0(x30)
	la x30,here
	la x29,memory+102
	sw x29,0(x30)
	la x30,sp
	la x29,memory+108
	sw x29,0(x30)
	la x29,stack
	la x28,memory+110
	sw x28,0(x29)
	la x29,rsp
	la x28,memory+492
	sw x28,0(x29)
	la x28,rstack
	la x7,memory+494
	sw x7,0(x28)
	li x28,1
	lw x29,0(x29)
	sh x28,0(x29)
	lw x30,0(x30)
	sh x28,0(x30)
	la x30,state
	lw x30,0(x30)
	sh x0,0(x30)
	la x30,base
	lw x30,0(x30)
	li x29,10
	sh x29,0(x30)
	la x30,latest
	lw x30,0(x30)
	sh x0,0(x30)
	la x30,here
	lw x30,0(x30)
	li x29,620
	sh x29,0(x30)
	la x30,docol_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,docol_name
	lw x13,0(x30)
	la x30,docol_flags
	lbu x14,0(x30)
	la x15,docol
	call addBuiltin
	la x30,doCellSize_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,doCellSize_name
	lw x13,0(x30)
	la x30,doCellSize_flags
	lbu x14,0(x30)
	la x15,doCellSize
	call addBuiltin
	la x30,memRead_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,memRead_name
	lw x13,0(x30)
	la x30,memRead_flags
	lbu x14,0(x30)
	la x15,memRead
	call addBuiltin
	la x30,memWrite_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,memWrite_name
	lw x13,0(x30)
	la x30,memWrite_flags
	lbu x14,0(x30)
	la x15,memWrite
	call addBuiltin
	la x30,memReadByte_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,memReadByte_name
	lw x13,0(x30)
	la x30,memReadByte_flags
	lbu x14,0(x30)
	la x15,memReadByte
	call addBuiltin
	la x30,memWriteByte_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,memWriteByte_name
	lw x13,0(x30)
	la x30,memWriteByte_flags
	lbu x14,0(x30)
	la x15,memWriteByte
	call addBuiltin
	la x30,key_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,key_name
	lw x13,0(x30)
	la x30,key_flags
	lbu x14,0(x30)
	la x15,key
	call addBuiltin
	la x30,emit_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,emit_name
	lw x13,0(x30)
	la x30,emit_flags
	lbu x14,0(x30)
	la x15,emit
	call addBuiltin
	la x30,swap_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,swap_name
	lw x13,0(x30)
	la x30,swap_flags
	lbu x14,0(x30)
	la x15,swap
	call addBuiltin
	la x30,dup_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,dup_name
	lw x13,0(x30)
	la x30,dup_flags
	lbu x14,0(x30)
	la x15,dup
	call addBuiltin
	la x30,drop_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,drop_name
	lw x13,0(x30)
	la x30,drop_flags
	lbu x14,0(x30)
	la x15,drop
	call addBuiltin
	la x30,over_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,over_name
	lw x13,0(x30)
	la x30,over_flags
	lbu x14,0(x30)
	la x15,over
	call addBuiltin
	la x30,comma_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,comma_name
	lw x13,0(x30)
	la x30,comma_flags
	lbu x14,0(x30)
	la x15,comma
	call addBuiltin
	la x30,commaByte_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,commaByte_name
	lw x13,0(x30)
	la x30,commaByte_flags
	lbu x14,0(x30)
	la x15,commaByte
	call addBuiltin
	la x30,word_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,word_name
	lw x13,0(x30)
	la x30,word_flags
	lbu x14,0(x30)
	la x15,word
	call addBuiltin
	la x30,find_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,find_name
	lw x13,0(x30)
	la x30,find_flags
	lbu x14,0(x30)
	la x15,find
	call addBuiltin
	la x30,cfa_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,cfa_name
	lw x13,0(x30)
	la x30,cfa_flags
	lbu x14,0(x30)
	la x15,cfa
	call addBuiltin
	la x30,doExit_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,doExit_name
	lw x13,0(x30)
	la x30,doExit_flags
	lbu x14,0(x30)
	la x15,doExit
	call addBuiltin
	la x30,quit_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,quit_name
	lw x13,0(x30)
	la x30,quit_flags
	lbu x14,0(x30)
	la x15,quit
	call addBuiltin
	la x30,latest
	lw x30,0(x30)
	lhu x12,0(x30)
	call getCfa
	la x29,quit_address
	mv x30,x10 ; LOADU4
	sh x30,0(x29)
	la x30,number_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,number_name
	lw x13,0(x30)
	la x30,number_flags
	lbu x14,0(x30)
	la x15,number
	call addBuiltin
	la x30,bye_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,bye_name
	lw x13,0(x30)
	la x30,bye_flags
	lbu x14,0(x30)
	la x15,bye
	call addBuiltin
	la x30,doLatest_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,doLatest_name
	lw x13,0(x30)
	la x30,doLatest_flags
	lbu x14,0(x30)
	la x15,doLatest
	call addBuiltin
	la x30,doHere_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,doHere_name
	lw x13,0(x30)
	la x30,doHere_flags
	lbu x14,0(x30)
	la x15,doHere
	call addBuiltin
	la x30,doBase_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,doBase_name
	lw x13,0(x30)
	la x30,doBase_flags
	lbu x14,0(x30)
	la x15,doBase
	call addBuiltin
	la x30,doState_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,doState_name
	lw x13,0(x30)
	la x30,doState_flags
	lbu x14,0(x30)
	la x15,doState
	call addBuiltin
	la x30,plus_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,plus_name
	lw x13,0(x30)
	la x30,plus_flags
	lbu x14,0(x30)
	la x15,plus
	call addBuiltin
	la x30,minus_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,minus_name
	lw x13,0(x30)
	la x30,minus_flags
	lbu x14,0(x30)
	la x15,minus
	call addBuiltin
	la x30,mul_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,mul_name
	lw x13,0(x30)
	la x30,mul_flags
	lbu x14,0(x30)
	la x15,mul
	call addBuiltin
	la x30,divmod_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,divmod_name
	lw x13,0(x30)
	la x30,divmod_flags
	lbu x14,0(x30)
	la x15,divmod
	call addBuiltin
	la x30,rot_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,rot_name
	lw x13,0(x30)
	la x30,rot_flags
	lbu x14,0(x30)
	la x15,rot
	call addBuiltin
	la x30,gotoInterpreter_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,gotoInterpreter_name
	lw x13,0(x30)
	la x30,gotoInterpreter_flags
	lbu x14,0(x30)
	la x15,gotoInterpreter
	call addBuiltin
	la x30,gotoCompiler_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,gotoCompiler_name
	lw x13,0(x30)
	la x30,gotoCompiler_flags
	lbu x14,0(x30)
	la x15,gotoCompiler
	call addBuiltin
	la x30,doCreate_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,doCreate_name
	lw x13,0(x30)
	la x30,doCreate_flags
	lbu x14,0(x30)
	la x15,doCreate
	call addBuiltin
	la x30,hide_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,hide_name
	lw x13,0(x30)
	la x30,hide_flags
	lbu x14,0(x30)
	la x15,hide
	call addBuiltin
	la x30,lit_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,lit_name
	lw x13,0(x30)
	la x30,lit_flags
	lbu x14,0(x30)
	la x15,lit
	call addBuiltin
	la x30,colon_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,colon_name
	lw x13,0(x30)
	la x30,colon_flags
	lbu x14,0(x30)
	la x15,colon
	call addBuiltin
	la x30,semicolon_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,semicolon_name
	lw x13,0(x30)
	la x30,semicolon_flags
	lbu x14,0(x30)
	la x15,semicolon
	call addBuiltin
	la x30,rtos_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,rtos_name
	lw x13,0(x30)
	la x30,rtos_flags
	lbu x14,0(x30)
	la x15,rtos
	call addBuiltin
	la x30,stor_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,stor_name
	lw x13,0(x30)
	la x30,stor_flags
	lbu x14,0(x30)
	la x15,stor
	call addBuiltin
	la x30,rget_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,rget_name
	lw x13,0(x30)
	la x30,rget_flags
	lbu x14,0(x30)
	la x15,rget
	call addBuiltin
	la x30,doJ_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,doJ_name
	lw x13,0(x30)
	la x30,doJ_flags
	lbu x14,0(x30)
	la x15,doJ
	call addBuiltin
	la x30,tick_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,tick_name
	lw x13,0(x30)
	la x30,tick_flags
	lbu x14,0(x30)
	la x15,tick
	call addBuiltin
	la x30,key_p_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,key_p_name
	lw x13,0(x30)
	la x30,key_p_flags
	lbu x14,0(x30)
	la x15,key_p
	call addBuiltin
	la x30,equals_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,equals_name
	lw x13,0(x30)
	la x30,equals_flags
	lbu x14,0(x30)
	la x15,equals
	call addBuiltin
	la x30,smaller_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,smaller_name
	lw x13,0(x30)
	la x30,smaller_flags
	lbu x14,0(x30)
	la x15,smaller
	call addBuiltin
	la x30,larger_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,larger_name
	lw x13,0(x30)
	la x30,larger_flags
	lbu x14,0(x30)
	la x15,larger
	call addBuiltin
	la x30,doAnd_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,doAnd_name
	lw x13,0(x30)
	la x30,doAnd_flags
	lbu x14,0(x30)
	la x15,doAnd
	call addBuiltin
	la x30,doOr_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,doOr_name
	lw x13,0(x30)
	la x30,doOr_flags
	lbu x14,0(x30)
	la x15,doOr
	call addBuiltin
	la x30,branch_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,branch_name
	lw x13,0(x30)
	la x30,branch_flags
	lbu x14,0(x30)
	la x15,branch
	call addBuiltin
	la x30,zbranch_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,zbranch_name
	lw x13,0(x30)
	la x30,zbranch_flags
	lbu x14,0(x30)
	la x15,zbranch
	call addBuiltin
	la x30,toggleImmediate_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,toggleImmediate_name
	lw x13,0(x30)
	la x30,toggleImmediate_flags
	lbu x14,0(x30)
	la x15,toggleImmediate
	call addBuiltin
	la x30,doFree_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,doFree_name
	lw x13,0(x30)
	la x30,doFree_flags
	lbu x14,0(x30)
	la x15,doFree
	call addBuiltin
	la x30,p_dup_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,p_dup_name
	lw x13,0(x30)
	la x30,p_dup_flags
	lbu x14,0(x30)
	la x15,p_dup
	call addBuiltin
	la x30,s0_r_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,s0_r_name
	lw x13,0(x30)
	la x30,s0_r_flags
	lbu x14,0(x30)
	la x15,s0_r
	call addBuiltin
	la x30,dsp_r_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,dsp_r_name
	lw x13,0(x30)
	la x30,dsp_r_flags
	lbu x14,0(x30)
	la x15,dsp_r
	call addBuiltin
	la x30,litstring_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,litstring_name
	lw x13,0(x30)
	la x30,litstring_flags
	lbu x14,0(x30)
	la x15,litstring
	call addBuiltin
	la x30,not_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,not_name
	lw x13,0(x30)
	la x30,not_flags
	lbu x14,0(x30)
	la x15,not
	call addBuiltin
	la x30,xor_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,xor_name
	lw x13,0(x30)
	la x30,xor_flags
	lbu x14,0(x30)
	la x15,xor
	call addBuiltin
	la x30,timesDivide_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,timesDivide_name
	lw x13,0(x30)
	la x30,timesDivide_flags
	lbu x14,0(x30)
	la x15,timesDivide
	call addBuiltin
	la x30,timesDivideMod_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,timesDivideMod_name
	lw x13,0(x30)
	la x30,timesDivideMod_flags
	lbu x14,0(x30)
	la x15,timesDivideMod
	call addBuiltin
	la x30,dequals_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,dequals_name
	lw x13,0(x30)
	la x30,dequals_flags
	lbu x14,0(x30)
	la x15,dequals
	call addBuiltin
	la x30,dsmaller_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,dsmaller_name
	lw x13,0(x30)
	la x30,dsmaller_flags
	lbu x14,0(x30)
	la x15,dsmaller
	call addBuiltin
	la x30,dlarger_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,dlarger_name
	lw x13,0(x30)
	la x30,dlarger_flags
	lbu x14,0(x30)
	la x15,dlarger
	call addBuiltin
	la x30,dusmaller_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,dusmaller_name
	lw x13,0(x30)
	la x30,dusmaller_flags
	lbu x14,0(x30)
	la x15,dusmaller
	call addBuiltin
	la x30,dplus_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,dplus_name
	lw x13,0(x30)
	la x30,dplus_flags
	lbu x14,0(x30)
	la x15,dplus
	call addBuiltin
	la x30,dminus_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,dminus_name
	lw x13,0(x30)
	la x30,dminus_flags
	lbu x14,0(x30)
	la x15,dminus
	call addBuiltin
	la x30,dmul_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,dmul_name
	lw x13,0(x30)
	la x30,dmul_flags
	lbu x14,0(x30)
	la x15,dmul
	call addBuiltin
	la x30,ddiv_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,ddiv_name
	lw x13,0(x30)
	la x30,ddiv_flags
	lbu x14,0(x30)
	la x15,ddiv
	call addBuiltin
	la x30,dswap_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,dswap_name
	lw x13,0(x30)
	la x30,dswap_flags
	lbu x14,0(x30)
	la x15,dswap
	call addBuiltin
	la x30,dover_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,dover_name
	lw x13,0(x30)
	la x30,dover_flags
	lbu x14,0(x30)
	la x15,dover
	call addBuiltin
	la x30,drot_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,drot_name
	lw x13,0(x30)
	la x30,drot_flags
	lbu x14,0(x30)
	la x15,drot
	call addBuiltin
	la x30,portRead_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,portRead_name
	lw x13,0(x30)
	la x30,portRead_flags
	lbu x14,0(x30)
	la x15,portRead
	call addBuiltin
	la x30,portreadByte_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,portreadByte_name
	lw x13,0(x30)
	la x30,portreadByte_flags
	lbu x14,0(x30)
	la x15,portreadByte
	call addBuiltin
	la x30,portWrite_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,portWrite_name
	lw x13,0(x30)
	la x30,portWrite_flags
	lbu x14,0(x30)
	la x15,portWrite
	call addBuiltin
	la x30,portWriteByte_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,portWriteByte_name
	lw x13,0(x30)
	la x30,portWriteByte_flags
	lbu x14,0(x30)
	la x15,portWriteByte
	call addBuiltin
	la x30,doRun_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,doRun_name
	lw x13,0(x30)
	la x30,doRun_flags
	lbu x14,0(x30)
	la x15,doRun
	call addBuiltin
	la x30,clearScreen_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,clearScreen_name
	lw x13,0(x30)
	la x30,clearScreen_flags
	lbu x14,0(x30)
	la x15,clearScreen
	call addBuiltin
	la x30,tpsLoad_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,tpsLoad_name
	lw x13,0(x30)
	la x30,tpsLoad_flags
	lbu x14,0(x30)
	la x15,tpsLoad
	call addBuiltin
	la x30,tpsStore_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,tpsStore_name
	lw x13,0(x30)
	la x30,tpsStore_flags
	lbu x14,0(x30)
	la x15,tpsStore
	call addBuiltin
	la x30,hcsLoad_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,hcsLoad_name
	lw x13,0(x30)
	la x30,hcsLoad_flags
	lbu x14,0(x30)
	la x15,hcsLoad
	call addBuiltin
	la x30,hcsStore_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,hcsStore_name
	lw x13,0(x30)
	la x30,hcsStore_flags
	lbu x14,0(x30)
	la x15,hcsStore
	call addBuiltin
	la x30,udivmod_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,udivmod_name
	lw x13,0(x30)
	la x30,udivmod_flags
	lbu x14,0(x30)
	la x15,udivmod
	call addBuiltin
	la x30,umdivmod_id
	lw x30,0(x30)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	la x30,umdivmod_name
	lw x13,0(x30)
	la x30,umdivmod_flags
	lbu x14,0(x30)
	la x15,umdivmod
	call addBuiltin
	la x30,maxBuiltinAddress
	la x29,here
	lw x29,0(x29)
	lhu x29,0(x29)
	addi x29,x29,-1
	sh x29,0(x30)
	la x30,errorFlag
	lw x30,0(x30)
	beq x30,x0,L.409
	li x10,1
	j L.397
L.409:
	la x30,initscript_pos
	la x29,initScript
	lw x29,0(x29)
	sw x29,0(x30)
	la x12,L.411
	call tell
	call quit
	mv x10,x0 ; LOADI4
L.397:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,0(x1)

	.globl charset
	.align	4
charset:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	la x12,L.413
	call tell
	mv x27,x0 ; LOADU1
	j L.417
L.414:
	shlli x12,x27,8*(4-1)
	shrli x12,x12,8*(4-1)
	addi x13,x8,-8+16
	call n2s
	shlli x30,x27,8*(4-1)
	shrli x30,x30,8*(4-1)
	shlli x12,x30,8*(4-2)
	shrli x12,x12,8*(4-2)
	call push
	call emit
	li x12,32
	call push
	call emit
	addi x12,x8,-8+16
	call tell
	li x12,32
	call push
	call emit
L.415:
	shlli x30,x27,8*(4-1)
	shrli x30,x30,8*(4-1)
	addi x30,x30,1
	mv x27,x30 ; LOADU1
L.417:
	shlli x30,x27,8*(4-1)
	shrli x30,x30,8*(4-1)
	li x29,255
	blt x30,x29,L.414
L.412:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,0(x1)

	.align 4
	.bss
	.globl initscript_pos
	.align	4
initscript_pos:
	.space	4
	.globl lineBuffer
	.align	1
lineBuffer:
	.space	128
	.globl maxBuiltinAddress
	.align	2
maxBuiltinAddress:
	.space	2
	.globl commandAddress
	.align	2
commandAddress:
	.space	2
	.globl quit_address
	.align	2
quit_address:
	.space	2
	.globl lastIp
	.align	2
lastIp:
	.space	2
	.globl next
	.align	2
next:
	.space	2
	.globl errorFlag
	.align	4
errorFlag:
	.space	4
	.globl exitReq
	.align	4
exitReq:
	.space	4
	.globl rstack
	.align	4
rstack:
	.space	4
	.globl rsp
	.align	4
rsp:
	.space	4
	.globl stack
	.align	4
stack:
	.space	4
	.globl sp
	.align	4
sp:
	.space	4
	.globl state
	.align	4
state:
	.space	4
	.globl base
	.align	4
base:
	.space	4
	.globl here
	.align	4
here:
	.space	4
	.globl latest
	.align	4
latest:
	.space	4
	.globl memory
	.align	1
memory:
	.space	65536
	.align 4
	.data
	.align	1
L.413:
	.byte	0x43
	.byte	0x68
	.byte	0x61
	.byte	0x72
	.byte	0x61
	.byte	0x63
	.byte	0x74
	.byte	0x65
	.byte	0x72
	.byte	0x20
	.byte	0x73
	.byte	0x65
	.byte	0x74
	.byte	0x3a
	.byte	0xa
	.byte	0x0
	.align	1
L.411:
	.byte	0xa
	.byte	0x4c
	.byte	0x6f
	.byte	0x61
	.byte	0x64
	.byte	0x69
	.byte	0x6e
	.byte	0x67
	.byte	0x20
	.byte	0x69
	.byte	0x6e
	.byte	0x69
	.byte	0x74
	.byte	0x20
	.byte	0x73
	.byte	0x63
	.byte	0x72
	.byte	0x69
	.byte	0x70
	.byte	0x74
	.byte	0x2e
	.byte	0x2e
	.byte	0x2e
	.byte	0x0
	.align	1
L.400:
	.byte	0x43
	.byte	0x6f
	.byte	0x6e
	.byte	0x66
	.byte	0x69
	.byte	0x67
	.byte	0x75
	.byte	0x72
	.byte	0x61
	.byte	0x74
	.byte	0x69
	.byte	0x6f
	.byte	0x6e
	.byte	0x20
	.byte	0x65
	.byte	0x72
	.byte	0x72
	.byte	0x6f
	.byte	0x72
	.byte	0x3a
	.byte	0x20
	.byte	0x44
	.byte	0x43
	.byte	0x45
	.byte	0x4c
	.byte	0x4c
	.byte	0x5f
	.byte	0x53
	.byte	0x49
	.byte	0x5a
	.byte	0x45
	.byte	0x20
	.byte	0x21
	.byte	0x3d
	.byte	0x20
	.byte	0x32
	.byte	0x2a
	.byte	0x43
	.byte	0x45
	.byte	0x4c
	.byte	0x4c
	.byte	0x5f
	.byte	0x53
	.byte	0x49
	.byte	0x5a
	.byte	0x45
	.byte	0xa
	.byte	0x0
	.align	1
L.396:
	.byte	0x3a
	.byte	0x20
	.byte	0x49
	.byte	0x44
	.byte	0x20
	.byte	0x67
	.byte	0x69
	.byte	0x76
	.byte	0x65
	.byte	0x6e
	.byte	0x20
	.byte	0x74
	.byte	0x77
	.byte	0x69
	.byte	0x63
	.byte	0x65
	.byte	0xa
	.byte	0x0
	.align	1
L.393:
	.byte	0x3a
	.byte	0x20
	.byte	0x4f
	.byte	0x75
	.byte	0x74
	.byte	0x20
	.byte	0x6f
	.byte	0x66
	.byte	0x20
	.byte	0x62
	.byte	0x75
	.byte	0x69
	.byte	0x6c
	.byte	0x74
	.byte	0x69
	.byte	0x6e
	.byte	0x20
	.byte	0x49
	.byte	0x44
	.byte	0x73
	.byte	0xa
	.byte	0x0
	.align	1
L.392:
	.byte	0x45
	.byte	0x72
	.byte	0x72
	.byte	0x6f
	.byte	0x72
	.byte	0x20
	.byte	0x61
	.byte	0x64
	.byte	0x64
	.byte	0x69
	.byte	0x6e
	.byte	0x67
	.byte	0x20
	.byte	0x62
	.byte	0x75
	.byte	0x69
	.byte	0x6c
	.byte	0x74
	.byte	0x69
	.byte	0x6e
	.byte	0x20
	.byte	0x0
	.align	1
L.374:
	.byte	0x55
	.byte	0x4d
	.byte	0x2f
	.byte	0x4d
	.byte	0x4f
	.byte	0x44
	.byte	0x0
	.align	1
L.372:
	.byte	0x55
	.byte	0x2f
	.byte	0x4d
	.byte	0x4f
	.byte	0x44
	.byte	0x0
	.align	1
L.370:
	.byte	0x48
	.byte	0x43
	.byte	0x53
	.byte	0x2f
	.byte	0x53
	.byte	0x54
	.byte	0x4f
	.byte	0x52
	.byte	0x45
	.byte	0x0
	.align	1
L.368:
	.byte	0x48
	.byte	0x43
	.byte	0x53
	.byte	0x2f
	.byte	0x4c
	.byte	0x4f
	.byte	0x41
	.byte	0x44
	.byte	0x0
	.align	1
L.366:
	.byte	0x54
	.byte	0x50
	.byte	0x53
	.byte	0x2f
	.byte	0x53
	.byte	0x54
	.byte	0x4f
	.byte	0x52
	.byte	0x45
	.byte	0x0
	.align	1
L.364:
	.byte	0x54
	.byte	0x50
	.byte	0x53
	.byte	0x2f
	.byte	0x4c
	.byte	0x4f
	.byte	0x41
	.byte	0x44
	.byte	0x0
	.align	1
L.362:
	.byte	0x43
	.byte	0x4c
	.byte	0x45
	.byte	0x41
	.byte	0x52
	.byte	0x0
	.align	1
L.360:
	.byte	0x52
	.byte	0x55
	.byte	0x4e
	.byte	0x0
	.align	1
L.358:
	.byte	0x50
	.byte	0x43
	.byte	0x40
	.byte	0x0
	.align	1
L.356:
	.byte	0x50
	.byte	0x40
	.byte	0x0
	.align	1
L.354:
	.byte	0x50
	.byte	0x43
	.byte	0x21
	.byte	0x0
	.align	1
L.352:
	.byte	0x50
	.byte	0x21
	.byte	0x0
	.align	1
L.350:
	.byte	0x32
	.byte	0x52
	.byte	0x4f
	.byte	0x54
	.byte	0x0
	.align	1
L.348:
	.byte	0x32
	.byte	0x4f
	.byte	0x56
	.byte	0x45
	.byte	0x52
	.byte	0x0
	.align	1
L.346:
	.byte	0x32
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x0
	.align	1
L.344:
	.byte	0x44
	.byte	0x2f
	.byte	0x0
	.align	1
L.342:
	.byte	0x44
	.byte	0x2a
	.byte	0x0
	.align	1
L.340:
	.byte	0x44
	.byte	0x2d
	.byte	0x0
	.align	1
L.338:
	.byte	0x44
	.byte	0x2b
	.byte	0x0
	.align	1
L.333:
	.byte	0x44
	.byte	0x55
	.byte	0x3c
	.byte	0x0
	.align	1
L.328:
	.byte	0x44
	.byte	0x3e
	.byte	0x0
	.align	1
L.323:
	.byte	0x44
	.byte	0x3c
	.byte	0x0
	.align	1
L.318:
	.byte	0x44
	.byte	0x3d
	.byte	0x0
	.align	1
L.314:
	.byte	0x2a
	.byte	0x2f
	.byte	0x4d
	.byte	0x4f
	.byte	0x44
	.byte	0x0
	.align	1
L.313:
	.byte	0x41
	.byte	0x72
	.byte	0x69
	.byte	0x74
	.byte	0x68
	.byte	0x6d
	.byte	0x65
	.byte	0x74
	.byte	0x69
	.byte	0x63
	.byte	0x20
	.byte	0x6f
	.byte	0x76
	.byte	0x65
	.byte	0x72
	.byte	0x66
	.byte	0x6c
	.byte	0x6f
	.byte	0x77
	.byte	0xa
	.byte	0x0
	.align	1
L.309:
	.byte	0x2a
	.byte	0x2f
	.byte	0x0
	.align	1
L.307:
	.byte	0x58
	.byte	0x4f
	.byte	0x52
	.byte	0x0
	.align	1
L.302:
	.byte	0x4c
	.byte	0x49
	.byte	0x54
	.byte	0x53
	.byte	0x54
	.byte	0x52
	.byte	0x49
	.byte	0x4e
	.byte	0x47
	.byte	0x0
	.align	1
L.298:
	.byte	0x3f
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x0
	.align	1
L.296:
	.byte	0x4f
	.byte	0x52
	.byte	0x0
	.align	1
L.294:
	.byte	0x41
	.byte	0x4e
	.byte	0x44
	.byte	0x0
	.align	1
L.289:
	.byte	0x3e
	.byte	0x0
	.align	1
L.284:
	.byte	0x3c
	.byte	0x0
	.align	1
L.279:
	.byte	0x3d
	.byte	0x0
	.align	1
L.275:
	.byte	0x27
	.byte	0x0
	.align	1
L.273:
	.byte	0x4a
	.byte	0x0
	.align	1
L.271:
	.byte	0x52
	.byte	0x40
	.byte	0x0
	.align	1
L.269:
	.byte	0x3b
	.byte	0x0
	.align	1
L.267:
	.byte	0x3a
	.byte	0x0
	.align	1
L.265:
	.byte	0x43
	.byte	0x52
	.byte	0x45
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0x0
	.align	1
L.263:
	.byte	0x52
	.byte	0x4f
	.byte	0x54
	.byte	0x0
	.align	1
L.261:
	.byte	0x2f
	.byte	0x4d
	.byte	0x4f
	.byte	0x44
	.byte	0x0
	.align	1
L.259:
	.byte	0x2a
	.byte	0x0
	.align	1
L.257:
	.byte	0x2d
	.byte	0x0
	.align	1
L.255:
	.byte	0x2b
	.byte	0x0
	.align	1
L.254:
	.byte	0x20
	.byte	0x6f
	.byte	0x6b
	.byte	0xa
	.byte	0x0
	.align	1
L.237:
	.byte	0x55
	.byte	0x6e
	.byte	0x6b
	.byte	0x6e
	.byte	0x6f
	.byte	0x77
	.byte	0x6e
	.byte	0x20
	.byte	0x77
	.byte	0x6f
	.byte	0x72
	.byte	0x64
	.byte	0x3a
	.byte	0x20
	.byte	0x0
	.align	1
L.214:
	.byte	0x51
	.byte	0x55
	.byte	0x49
	.byte	0x54
	.byte	0x0
	.align	1
L.212:
	.byte	0x4c
	.byte	0x49
	.byte	0x54
	.byte	0x0
	.align	1
L.208:
	.byte	0x4e
	.byte	0x55
	.byte	0x4d
	.byte	0x42
	.byte	0x45
	.byte	0x52
	.byte	0x0
	.align	1
L.204:
	.byte	0x3e
	.byte	0x43
	.byte	0x46
	.byte	0x41
	.byte	0x0
	.align	1
L.198:
	.byte	0x46
	.byte	0x49
	.byte	0x4e
	.byte	0x44
	.byte	0x0
	.align	1
L.196:
	.byte	0x57
	.byte	0x4f
	.byte	0x52
	.byte	0x44
	.byte	0x0
	.align	1
L.194:
	.byte	0x43
	.byte	0x2c
	.byte	0x0
	.align	1
L.192:
	.byte	0x2c
	.byte	0x0
	.align	1
L.190:
	.byte	0x4f
	.byte	0x56
	.byte	0x45
	.byte	0x52
	.byte	0x0
	.align	1
L.188:
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x0
	.align	1
L.186:
	.byte	0x43
	.byte	0x21
	.byte	0x0
	.align	1
L.184:
	.byte	0x21
	.byte	0x0
	.align	1
L.182:
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x0
	.align	1
L.180:
	.byte	0x4e
	.byte	0x4f
	.byte	0x54
	.byte	0x0
	.align	1
L.178:
	.byte	0x44
	.byte	0x53
	.byte	0x50
	.byte	0x40
	.byte	0x0
	.align	1
L.176:
	.byte	0x53
	.byte	0x30
	.byte	0x40
	.byte	0x0
	.align	1
L.174:
	.byte	0x46
	.byte	0x52
	.byte	0x45
	.byte	0x45
	.byte	0x0
	.align	1
L.172:
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0x0
	.align	1
L.167:
	.byte	0x30
	.byte	0x42
	.byte	0x52
	.byte	0x41
	.byte	0x4e
	.byte	0x43
	.byte	0x48
	.byte	0x0
	.align	1
L.165:
	.byte	0x42
	.byte	0x52
	.byte	0x41
	.byte	0x4e
	.byte	0x43
	.byte	0x48
	.byte	0x0
	.align	1
L.163:
	.byte	0x4b
	.byte	0x45
	.byte	0x59
	.byte	0x3f
	.byte	0x0
	.align	1
L.161:
	.byte	0x3e
	.byte	0x52
	.byte	0x0
	.align	1
L.159:
	.byte	0x52
	.byte	0x3e
	.byte	0x0
	.align	1
L.157:
	.byte	0x48
	.byte	0x49
	.byte	0x44
	.byte	0x45
	.byte	0x0
	.align	1
L.155:
	.byte	0x5d
	.byte	0x0
	.align	1
L.153:
	.byte	0x5b
	.byte	0x0
	.align	1
L.151:
	.byte	0x53
	.byte	0x54
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0x0
	.align	1
L.149:
	.byte	0x42
	.byte	0x41
	.byte	0x53
	.byte	0x45
	.byte	0x0
	.align	1
L.147:
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x0
	.align	1
L.145:
	.byte	0x4c
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0x53
	.byte	0x54
	.byte	0x0
	.align	1
L.143:
	.byte	0x42
	.byte	0x59
	.byte	0x45
	.byte	0x0
	.align	1
L.141:
	.byte	0x45
	.byte	0x58
	.byte	0x49
	.byte	0x54
	.byte	0x0
	.align	1
L.139:
	.byte	0x44
	.byte	0x52
	.byte	0x4f
	.byte	0x50
	.byte	0x0
	.align	1
L.137:
	.byte	0x45
	.byte	0x4d
	.byte	0x49
	.byte	0x54
	.byte	0x0
	.align	1
L.135:
	.byte	0x4b
	.byte	0x45
	.byte	0x59
	.byte	0x0
	.align	1
L.133:
	.byte	0x43
	.byte	0x40
	.byte	0x0
	.align	1
L.131:
	.byte	0x40
	.byte	0x0
	.align	1
L.129:
	.byte	0x43
	.byte	0x45
	.byte	0x4c
	.byte	0x4c
	.byte	0x0
	.align	1
L.127:
	.byte	0x52
	.byte	0x55
	.byte	0x4e
	.byte	0x44
	.byte	0x4f
	.byte	0x43
	.byte	0x4f
	.byte	0x4c
	.byte	0x0
	.align	1
L.60:
	.byte	0x49
	.byte	0x6e
	.byte	0x74
	.byte	0x65
	.byte	0x72
	.byte	0x6e
	.byte	0x61
	.byte	0x6c
	.byte	0x20
	.byte	0x65
	.byte	0x72
	.byte	0x72
	.byte	0x6f
	.byte	0x72
	.byte	0x20
	.byte	0x69
	.byte	0x6e
	.byte	0x20
	.byte	0x77
	.byte	0x72
	.byte	0x69
	.byte	0x74
	.byte	0x65
	.byte	0x4d
	.byte	0x65
	.byte	0x6d
	.byte	0x3a
	.byte	0x20
	.byte	0x49
	.byte	0x6e
	.byte	0x76
	.byte	0x61
	.byte	0x6c
	.byte	0x69
	.byte	0x64
	.byte	0x20
	.byte	0x61
	.byte	0x64
	.byte	0x64
	.byte	0x72
	.byte	0x65
	.byte	0x73
	.byte	0x73
	.byte	0xa
	.byte	0x0
	.align	1
L.56:
	.byte	0x49
	.byte	0x6e
	.byte	0x74
	.byte	0x65
	.byte	0x72
	.byte	0x6e
	.byte	0x61
	.byte	0x6c
	.byte	0x20
	.byte	0x65
	.byte	0x72
	.byte	0x72
	.byte	0x6f
	.byte	0x72
	.byte	0x20
	.byte	0x69
	.byte	0x6e
	.byte	0x20
	.byte	0x72
	.byte	0x65
	.byte	0x61
	.byte	0x64
	.byte	0x4d
	.byte	0x65
	.byte	0x6d
	.byte	0x3a
	.byte	0x20
	.byte	0x49
	.byte	0x6e
	.byte	0x76
	.byte	0x61
	.byte	0x6c
	.byte	0x69
	.byte	0x64
	.byte	0x20
	.byte	0x61
	.byte	0x64
	.byte	0x64
	.byte	0x72
	.byte	0x65
	.byte	0x73
	.byte	0xa
	.byte	0x0
	.align	1
L.52:
	.byte	0x3f
	.byte	0x20
	.byte	0x52
	.byte	0x53
	.byte	0x74
	.byte	0x61
	.byte	0x63
	.byte	0x6b
	.byte	0x20
	.byte	0x6f
	.byte	0x76
	.byte	0x65
	.byte	0x72
	.byte	0x66
	.byte	0x6c
	.byte	0x6f
	.byte	0x77
	.byte	0xa
	.byte	0x0
	.align	1
L.48:
	.byte	0x3f
	.byte	0x20
	.byte	0x52
	.byte	0x53
	.byte	0x74
	.byte	0x61
	.byte	0x63
	.byte	0x6b
	.byte	0x20
	.byte	0x75
	.byte	0x6e
	.byte	0x64
	.byte	0x65
	.byte	0x72
	.byte	0x66
	.byte	0x6c
	.byte	0x6f
	.byte	0x77
	.byte	0xa
	.byte	0x0
	.align	1
L.40:
	.byte	0x3f
	.byte	0x20
	.byte	0x53
	.byte	0x74
	.byte	0x61
	.byte	0x63
	.byte	0x6b
	.byte	0x20
	.byte	0x6f
	.byte	0x76
	.byte	0x65
	.byte	0x72
	.byte	0x66
	.byte	0x6c
	.byte	0x6f
	.byte	0x77
	.byte	0xa
	.byte	0x0
	.align	1
L.33:
	.byte	0x3f
	.byte	0x20
	.byte	0x53
	.byte	0x74
	.byte	0x61
	.byte	0x63
	.byte	0x6b
	.byte	0x20
	.byte	0x75
	.byte	0x6e
	.byte	0x64
	.byte	0x65
	.byte	0x72
	.byte	0x66
	.byte	0x6c
	.byte	0x6f
	.byte	0x77
	.byte	0xa
	.byte	0x0
	.align	1
L.1:
	.byte	0x3a
	.byte	0x20
	.byte	0x44
	.byte	0x45
	.byte	0x43
	.byte	0x49
	.byte	0x4d
	.byte	0x41
	.byte	0x4c
	.byte	0x20
	.byte	0x31
	.byte	0x30
	.byte	0x20
	.byte	0x42
	.byte	0x41
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x21
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x58
	.byte	0x20
	.byte	0x31
	.byte	0x36
	.byte	0x20
	.byte	0x42
	.byte	0x41
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x21
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x4f
	.byte	0x43
	.byte	0x54
	.byte	0x41
	.byte	0x4c
	.byte	0x20
	.byte	0x38
	.byte	0x20
	.byte	0x42
	.byte	0x41
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x21
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x32
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x4f
	.byte	0x56
	.byte	0x45
	.byte	0x52
	.byte	0x20
	.byte	0x4f
	.byte	0x56
	.byte	0x45
	.byte	0x52
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x32
	.byte	0x44
	.byte	0x52
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x44
	.byte	0x52
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x44
	.byte	0x52
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x4e
	.byte	0x49
	.byte	0x50
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x44
	.byte	0x52
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x32
	.byte	0x4e
	.byte	0x49
	.byte	0x50
	.byte	0x20
	.byte	0x32
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x32
	.byte	0x44
	.byte	0x52
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x54
	.byte	0x55
	.byte	0x43
	.byte	0x4b
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x4f
	.byte	0x56
	.byte	0x45
	.byte	0x52
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x2f
	.byte	0x20
	.byte	0x2f
	.byte	0x4d
	.byte	0x4f
	.byte	0x44
	.byte	0x20
	.byte	0x4e
	.byte	0x49
	.byte	0x50
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x4d
	.byte	0x4f
	.byte	0x44
	.byte	0x20
	.byte	0x2f
	.byte	0x4d
	.byte	0x4f
	.byte	0x44
	.byte	0x20
	.byte	0x44
	.byte	0x52
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x42
	.byte	0x4c
	.byte	0x20
	.byte	0x33
	.byte	0x32
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x43
	.byte	0x52
	.byte	0x20
	.byte	0x31
	.byte	0x30
	.byte	0x20
	.byte	0x45
	.byte	0x4d
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x53
	.byte	0x50
	.byte	0x41
	.byte	0x43
	.byte	0x45
	.byte	0x20
	.byte	0x42
	.byte	0x4c
	.byte	0x20
	.byte	0x45
	.byte	0x4d
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x4e
	.byte	0x45
	.byte	0x47
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0x20
	.byte	0x30
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x2d
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x44
	.byte	0x4e
	.byte	0x45
	.byte	0x47
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0x20
	.byte	0x30
	.byte	0x2e
	.byte	0x20
	.byte	0x32
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x44
	.byte	0x2d
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x43
	.byte	0x45
	.byte	0x4c
	.byte	0x4c
	.byte	0x53
	.byte	0x20
	.byte	0x43
	.byte	0x45
	.byte	0x4c
	.byte	0x4c
	.byte	0x20
	.byte	0x2a
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x41
	.byte	0x4c
	.byte	0x4c
	.byte	0x4f
	.byte	0x54
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x2b
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x21
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x54
	.byte	0x52
	.byte	0x55
	.byte	0x45
	.byte	0x20
	.byte	0x2d
	.byte	0x31
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x46
	.byte	0x41
	.byte	0x4c
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x30
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x30
	.byte	0x3d
	.byte	0x20
	.byte	0x30
	.byte	0x20
	.byte	0x3d
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x30
	.byte	0x3c
	.byte	0x20
	.byte	0x30
	.byte	0x20
	.byte	0x3c
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x30
	.byte	0x3e
	.byte	0x20
	.byte	0x30
	.byte	0x20
	.byte	0x3e
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x3c
	.byte	0x3e
	.byte	0x20
	.byte	0x3d
	.byte	0x20
	.byte	0x30
	.byte	0x3d
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x3c
	.byte	0x3d
	.byte	0x20
	.byte	0x3e
	.byte	0x20
	.byte	0x30
	.byte	0x3d
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x3e
	.byte	0x3d
	.byte	0x20
	.byte	0x3c
	.byte	0x20
	.byte	0x30
	.byte	0x3d
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x30
	.byte	0x3c
	.byte	0x3d
	.byte	0x20
	.byte	0x30
	.byte	0x20
	.byte	0x3c
	.byte	0x3d
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x30
	.byte	0x3e
	.byte	0x3d
	.byte	0x20
	.byte	0x30
	.byte	0x20
	.byte	0x3e
	.byte	0x3d
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x31
	.byte	0x2b
	.byte	0x20
	.byte	0x31
	.byte	0x20
	.byte	0x2b
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x31
	.byte	0x2d
	.byte	0x20
	.byte	0x31
	.byte	0x20
	.byte	0x2d
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x32
	.byte	0x2b
	.byte	0x20
	.byte	0x32
	.byte	0x20
	.byte	0x2b
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x32
	.byte	0x2d
	.byte	0x20
	.byte	0x32
	.byte	0x20
	.byte	0x2d
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x32
	.byte	0x2f
	.byte	0x20
	.byte	0x32
	.byte	0x20
	.byte	0x2f
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x32
	.byte	0x2a
	.byte	0x20
	.byte	0x32
	.byte	0x20
	.byte	0x2a
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x44
	.byte	0x32
	.byte	0x2f
	.byte	0x20
	.byte	0x32
	.byte	0x2e
	.byte	0x20
	.byte	0x44
	.byte	0x2f
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x2b
	.byte	0x21
	.byte	0x20
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x52
	.byte	0x4f
	.byte	0x54
	.byte	0x20
	.byte	0x2b
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x21
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x5b
	.byte	0x43
	.byte	0x4f
	.byte	0x4d
	.byte	0x50
	.byte	0x49
	.byte	0x4c
	.byte	0x45
	.byte	0x5d
	.byte	0x20
	.byte	0x57
	.byte	0x4f
	.byte	0x52
	.byte	0x44
	.byte	0x20
	.byte	0x46
	.byte	0x49
	.byte	0x4e
	.byte	0x44
	.byte	0x20
	.byte	0x3e
	.byte	0x43
	.byte	0x46
	.byte	0x41
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x3b
	.byte	0x20
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x5b
	.byte	0x43
	.byte	0x48
	.byte	0x41
	.byte	0x52
	.byte	0x5d
	.byte	0x20
	.byte	0x6b
	.byte	0x65
	.byte	0x79
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x4c
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x3b
	.byte	0x20
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x52
	.byte	0x45
	.byte	0x43
	.byte	0x55
	.byte	0x52
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x4c
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0x53
	.byte	0x54
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x3e
	.byte	0x43
	.byte	0x46
	.byte	0x41
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x3b
	.byte	0x20
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x44
	.byte	0x4f
	.byte	0x43
	.byte	0x4f
	.byte	0x4c
	.byte	0x20
	.byte	0x30
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x43
	.byte	0x4f
	.byte	0x4e
	.byte	0x53
	.byte	0x54
	.byte	0x41
	.byte	0x4e
	.byte	0x54
	.byte	0x20
	.byte	0x43
	.byte	0x52
	.byte	0x45
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0x20
	.byte	0x44
	.byte	0x4f
	.byte	0x43
	.byte	0x4f
	.byte	0x4c
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x4c
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x45
	.byte	0x58
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x32
	.byte	0x43
	.byte	0x4f
	.byte	0x4e
	.byte	0x53
	.byte	0x54
	.byte	0x41
	.byte	0x4e
	.byte	0x54
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x43
	.byte	0x52
	.byte	0x45
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0x20
	.byte	0x44
	.byte	0x4f
	.byte	0x43
	.byte	0x4f
	.byte	0x4c
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x4c
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x4c
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x45
	.byte	0x58
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x56
	.byte	0x41
	.byte	0x52
	.byte	0x49
	.byte	0x41
	.byte	0x42
	.byte	0x4c
	.byte	0x45
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x43
	.byte	0x45
	.byte	0x4c
	.byte	0x4c
	.byte	0x20
	.byte	0x41
	.byte	0x4c
	.byte	0x4c
	.byte	0x4f
	.byte	0x54
	.byte	0x20
	.byte	0x43
	.byte	0x52
	.byte	0x45
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0x20
	.byte	0x44
	.byte	0x4f
	.byte	0x43
	.byte	0x4f
	.byte	0x4c
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x4c
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x45
	.byte	0x58
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x32
	.byte	0x56
	.byte	0x41
	.byte	0x52
	.byte	0x49
	.byte	0x41
	.byte	0x42
	.byte	0x4c
	.byte	0x45
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x32
	.byte	0x20
	.byte	0x43
	.byte	0x45
	.byte	0x4c
	.byte	0x4c
	.byte	0x53
	.byte	0x20
	.byte	0x41
	.byte	0x4c
	.byte	0x4c
	.byte	0x4f
	.byte	0x54
	.byte	0x20
	.byte	0x43
	.byte	0x52
	.byte	0x45
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0x20
	.byte	0x44
	.byte	0x4f
	.byte	0x43
	.byte	0x4f
	.byte	0x4c
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x4c
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x45
	.byte	0x58
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x49
	.byte	0x46
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x30
	.byte	0x42
	.byte	0x52
	.byte	0x41
	.byte	0x4e
	.byte	0x43
	.byte	0x48
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x30
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x3b
	.byte	0x20
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x54
	.byte	0x48
	.byte	0x45
	.byte	0x4e
	.byte	0x20
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x2d
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x21
	.byte	0x20
	.byte	0x3b
	.byte	0x20
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x45
	.byte	0x4c
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x42
	.byte	0x52
	.byte	0x41
	.byte	0x4e
	.byte	0x43
	.byte	0x48
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x30
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x2d
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x21
	.byte	0x20
	.byte	0x3b
	.byte	0x20
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x42
	.byte	0x45
	.byte	0x47
	.byte	0x49
	.byte	0x4e
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x3b
	.byte	0x20
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x55
	.byte	0x4e
	.byte	0x54
	.byte	0x49
	.byte	0x4c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x30
	.byte	0x42
	.byte	0x52
	.byte	0x41
	.byte	0x4e
	.byte	0x43
	.byte	0x48
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x2d
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x3b
	.byte	0x20
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x41
	.byte	0x47
	.byte	0x41
	.byte	0x49
	.byte	0x4e
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x42
	.byte	0x52
	.byte	0x41
	.byte	0x4e
	.byte	0x43
	.byte	0x48
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x2d
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x3b
	.byte	0x20
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x57
	.byte	0x48
	.byte	0x49
	.byte	0x4c
	.byte	0x45
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x30
	.byte	0x42
	.byte	0x52
	.byte	0x41
	.byte	0x4e
	.byte	0x43
	.byte	0x48
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x30
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x3b
	.byte	0x20
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x52
	.byte	0x45
	.byte	0x50
	.byte	0x45
	.byte	0x41
	.byte	0x54
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x42
	.byte	0x52
	.byte	0x41
	.byte	0x4e
	.byte	0x43
	.byte	0x48
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x2d
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x2d
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x21
	.byte	0x20
	.byte	0x3b
	.byte	0x20
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x55
	.byte	0x4e
	.byte	0x4c
	.byte	0x45
	.byte	0x53
	.byte	0x53
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x30
	.byte	0x3d
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x5b
	.byte	0x43
	.byte	0x4f
	.byte	0x4d
	.byte	0x50
	.byte	0x49
	.byte	0x4c
	.byte	0x45
	.byte	0x5d
	.byte	0x20
	.byte	0x49
	.byte	0x46
	.byte	0x20
	.byte	0x3b
	.byte	0x20
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x44
	.byte	0x4f
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x3e
	.byte	0x52
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x3e
	.byte	0x52
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x3b
	.byte	0x20
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x4c
	.byte	0x4f
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x52
	.byte	0x3e
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x52
	.byte	0x3e
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x31
	.byte	0x2b
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x32
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x3d
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x30
	.byte	0x42
	.byte	0x52
	.byte	0x41
	.byte	0x4e
	.byte	0x43
	.byte	0x48
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x2d
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x32
	.byte	0x44
	.byte	0x52
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x3b
	.byte	0x20
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x2b
	.byte	0x4c
	.byte	0x4f
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x52
	.byte	0x3e
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x52
	.byte	0x3e
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x52
	.byte	0x4f
	.byte	0x54
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x2b
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x32
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x3c
	.byte	0x3d
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x30
	.byte	0x42
	.byte	0x52
	.byte	0x41
	.byte	0x4e
	.byte	0x43
	.byte	0x48
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x2d
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x32
	.byte	0x44
	.byte	0x52
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x3b
	.byte	0x20
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x49
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x52
	.byte	0x40
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x3b
	.byte	0x20
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x53
	.byte	0x50
	.byte	0x41
	.byte	0x43
	.byte	0x45
	.byte	0x53
	.byte	0x20
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x30
	.byte	0x3e
	.byte	0x20
	.byte	0x49
	.byte	0x46
	.byte	0x20
	.byte	0x30
	.byte	0x20
	.byte	0x44
	.byte	0x4f
	.byte	0x20
	.byte	0x53
	.byte	0x50
	.byte	0x41
	.byte	0x43
	.byte	0x45
	.byte	0x20
	.byte	0x4c
	.byte	0x4f
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x45
	.byte	0x4c
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x44
	.byte	0x52
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x54
	.byte	0x48
	.byte	0x45
	.byte	0x4e
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x41
	.byte	0x42
	.byte	0x53
	.byte	0x20
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x30
	.byte	0x3c
	.byte	0x20
	.byte	0x49
	.byte	0x46
	.byte	0x20
	.byte	0x4e
	.byte	0x45
	.byte	0x47
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0x20
	.byte	0x54
	.byte	0x48
	.byte	0x45
	.byte	0x4e
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x44
	.byte	0x41
	.byte	0x42
	.byte	0x53
	.byte	0x20
	.byte	0x32
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x30
	.byte	0x2e
	.byte	0x20
	.byte	0x44
	.byte	0x3c
	.byte	0x20
	.byte	0x49
	.byte	0x46
	.byte	0x20
	.byte	0x44
	.byte	0x4e
	.byte	0x45
	.byte	0x47
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0x20
	.byte	0x54
	.byte	0x48
	.byte	0x45
	.byte	0x4e
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x2e
	.byte	0x44
	.byte	0x49
	.byte	0x47
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x39
	.byte	0x20
	.byte	0x3e
	.byte	0x20
	.byte	0x49
	.byte	0x46
	.byte	0x20
	.byte	0x35
	.byte	0x35
	.byte	0x20
	.byte	0x45
	.byte	0x4c
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x34
	.byte	0x38
	.byte	0x20
	.byte	0x54
	.byte	0x48
	.byte	0x45
	.byte	0x4e
	.byte	0x20
	.byte	0x2b
	.byte	0x20
	.byte	0x45
	.byte	0x4d
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x2e
	.byte	0x53
	.byte	0x49
	.byte	0x47
	.byte	0x4e
	.byte	0x20
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x30
	.byte	0x3c
	.byte	0x20
	.byte	0x49
	.byte	0x46
	.byte	0x20
	.byte	0x34
	.byte	0x35
	.byte	0x20
	.byte	0x45
	.byte	0x4d
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x4e
	.byte	0x45
	.byte	0x47
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0x20
	.byte	0x54
	.byte	0x48
	.byte	0x45
	.byte	0x4e
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x2e
	.byte	0x50
	.byte	0x4f
	.byte	0x53
	.byte	0x20
	.byte	0x42
	.byte	0x41
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x2f
	.byte	0x4d
	.byte	0x4f
	.byte	0x44
	.byte	0x20
	.byte	0x3f
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x49
	.byte	0x46
	.byte	0x20
	.byte	0x52
	.byte	0x45
	.byte	0x43
	.byte	0x55
	.byte	0x52
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x54
	.byte	0x48
	.byte	0x45
	.byte	0x4e
	.byte	0x20
	.byte	0x2e
	.byte	0x44
	.byte	0x49
	.byte	0x47
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x2e
	.byte	0x20
	.byte	0x2e
	.byte	0x53
	.byte	0x49
	.byte	0x47
	.byte	0x4e
	.byte	0x20
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x49
	.byte	0x46
	.byte	0x20
	.byte	0x2e
	.byte	0x50
	.byte	0x4f
	.byte	0x53
	.byte	0x20
	.byte	0x45
	.byte	0x4c
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x2e
	.byte	0x44
	.byte	0x49
	.byte	0x47
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x54
	.byte	0x48
	.byte	0x45
	.byte	0x4e
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x55
	.byte	0x2e
	.byte	0x20
	.byte	0x42
	.byte	0x41
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x55
	.byte	0x2f
	.byte	0x4d
	.byte	0x4f
	.byte	0x44
	.byte	0x20
	.byte	0x3f
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x49
	.byte	0x46
	.byte	0x20
	.byte	0x52
	.byte	0x45
	.byte	0x43
	.byte	0x55
	.byte	0x52
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x54
	.byte	0x48
	.byte	0x45
	.byte	0x4e
	.byte	0x20
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x31
	.byte	0x30
	.byte	0x20
	.byte	0x3c
	.byte	0x20
	.byte	0x49
	.byte	0x46
	.byte	0x20
	.byte	0x34
	.byte	0x38
	.byte	0x20
	.byte	0x45
	.byte	0x4c
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x31
	.byte	0x30
	.byte	0x20
	.byte	0x2d
	.byte	0x20
	.byte	0x36
	.byte	0x35
	.byte	0x20
	.byte	0x54
	.byte	0x48
	.byte	0x45
	.byte	0x4e
	.byte	0x20
	.byte	0x2b
	.byte	0x20
	.byte	0x45
	.byte	0x4d
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x43
	.byte	0x4f
	.byte	0x55
	.byte	0x4e
	.byte	0x54
	.byte	0x50
	.byte	0x4f
	.byte	0x53
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x31
	.byte	0x20
	.byte	0x2b
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x42
	.byte	0x41
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x2f
	.byte	0x20
	.byte	0x3f
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x49
	.byte	0x46
	.byte	0x20
	.byte	0x52
	.byte	0x45
	.byte	0x43
	.byte	0x55
	.byte	0x52
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x54
	.byte	0x48
	.byte	0x45
	.byte	0x4e
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x44
	.byte	0x49
	.byte	0x47
	.byte	0x49
	.byte	0x54
	.byte	0x53
	.byte	0x20
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x30
	.byte	0x3c
	.byte	0x20
	.byte	0x49
	.byte	0x46
	.byte	0x20
	.byte	0x31
	.byte	0x20
	.byte	0x45
	.byte	0x4c
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x30
	.byte	0x20
	.byte	0x54
	.byte	0x48
	.byte	0x45
	.byte	0x4e
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x43
	.byte	0x4f
	.byte	0x55
	.byte	0x4e
	.byte	0x54
	.byte	0x50
	.byte	0x4f
	.byte	0x53
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x2e
	.byte	0x52
	.byte	0x20
	.byte	0x4f
	.byte	0x56
	.byte	0x45
	.byte	0x52
	.byte	0x20
	.byte	0x44
	.byte	0x49
	.byte	0x47
	.byte	0x49
	.byte	0x54
	.byte	0x53
	.byte	0x20
	.byte	0x2d
	.byte	0x20
	.byte	0x53
	.byte	0x50
	.byte	0x41
	.byte	0x43
	.byte	0x45
	.byte	0x53
	.byte	0x20
	.byte	0x2e
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x2e
	.byte	0x20
	.byte	0x2e
	.byte	0x20
	.byte	0x53
	.byte	0x50
	.byte	0x41
	.byte	0x43
	.byte	0x45
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x3f
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x2e
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x2e
	.byte	0x53
	.byte	0x20
	.byte	0x44
	.byte	0x53
	.byte	0x50
	.byte	0x40
	.byte	0x20
	.byte	0x42
	.byte	0x45
	.byte	0x47
	.byte	0x49
	.byte	0x4e
	.byte	0x20
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x53
	.byte	0x30
	.byte	0x40
	.byte	0x20
	.byte	0x3e
	.byte	0x20
	.byte	0x57
	.byte	0x48
	.byte	0x49
	.byte	0x4c
	.byte	0x45
	.byte	0x20
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x3f
	.byte	0x20
	.byte	0x43
	.byte	0x45
	.byte	0x4c
	.byte	0x4c
	.byte	0x20
	.byte	0x2d
	.byte	0x20
	.byte	0x52
	.byte	0x45
	.byte	0x50
	.byte	0x45
	.byte	0x41
	.byte	0x54
	.byte	0x20
	.byte	0x44
	.byte	0x52
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x54
	.byte	0x59
	.byte	0x50
	.byte	0x45
	.byte	0x20
	.byte	0x30
	.byte	0x20
	.byte	0x44
	.byte	0x4f
	.byte	0x20
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x43
	.byte	0x40
	.byte	0x20
	.byte	0x45
	.byte	0x4d
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x31
	.byte	0x20
	.byte	0x2b
	.byte	0x20
	.byte	0x4c
	.byte	0x4f
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x44
	.byte	0x52
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x41
	.byte	0x4c
	.byte	0x49
	.byte	0x47
	.byte	0x4e
	.byte	0x20
	.byte	0x42
	.byte	0x45
	.byte	0x47
	.byte	0x49
	.byte	0x4e
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x43
	.byte	0x45
	.byte	0x4c
	.byte	0x4c
	.byte	0x20
	.byte	0x4d
	.byte	0x4f
	.byte	0x44
	.byte	0x20
	.byte	0x57
	.byte	0x48
	.byte	0x49
	.byte	0x4c
	.byte	0x45
	.byte	0x20
	.byte	0x30
	.byte	0x20
	.byte	0x43
	.byte	0x2c
	.byte	0x20
	.byte	0x52
	.byte	0x45
	.byte	0x50
	.byte	0x45
	.byte	0x41
	.byte	0x54
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x73
	.byte	0x22
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x4c
	.byte	0x49
	.byte	0x54
	.byte	0x53
	.byte	0x54
	.byte	0x52
	.byte	0x49
	.byte	0x4e
	.byte	0x47
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x30
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x42
	.byte	0x45
	.byte	0x47
	.byte	0x49
	.byte	0x4e
	.byte	0x20
	.byte	0x4b
	.byte	0x45
	.byte	0x59
	.byte	0x20
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x33
	.byte	0x34
	.byte	0x20
	.byte	0x3c
	.byte	0x3e
	.byte	0x20
	.byte	0x57
	.byte	0x48
	.byte	0x49
	.byte	0x4c
	.byte	0x45
	.byte	0x20
	.byte	0x43
	.byte	0x2c
	.byte	0x20
	.byte	0x52
	.byte	0x45
	.byte	0x50
	.byte	0x45
	.byte	0x41
	.byte	0x54
	.byte	0x20
	.byte	0x44
	.byte	0x52
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x52
	.byte	0x45
	.byte	0x20
	.byte	0x40
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x2d
	.byte	0x20
	.byte	0x43
	.byte	0x45
	.byte	0x4c
	.byte	0x4c
	.byte	0x20
	.byte	0x2d
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x21
	.byte	0x20
	.byte	0x41
	.byte	0x4c
	.byte	0x49
	.byte	0x47
	.byte	0x4e
	.byte	0x20
	.byte	0x3b
	.byte	0x20
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x2e
	.byte	0x22
	.byte	0x20
	.byte	0x5b
	.byte	0x43
	.byte	0x4f
	.byte	0x4d
	.byte	0x50
	.byte	0x49
	.byte	0x4c
	.byte	0x45
	.byte	0x5d
	.byte	0x20
	.byte	0x73
	.byte	0x22
	.byte	0x20
	.byte	0x27
	.byte	0x20
	.byte	0x54
	.byte	0x59
	.byte	0x50
	.byte	0x45
	.byte	0x20
	.byte	0x2c
	.byte	0x20
	.byte	0x3b
	.byte	0x20
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x28
	.byte	0x20
	.byte	0x42
	.byte	0x45
	.byte	0x47
	.byte	0x49
	.byte	0x4e
	.byte	0x20
	.byte	0x4b
	.byte	0x45
	.byte	0x59
	.byte	0x20
	.byte	0x5b
	.byte	0x43
	.byte	0x48
	.byte	0x41
	.byte	0x52
	.byte	0x5d
	.byte	0x20
	.byte	0x29
	.byte	0x20
	.byte	0x3d
	.byte	0x20
	.byte	0x55
	.byte	0x4e
	.byte	0x54
	.byte	0x49
	.byte	0x4c
	.byte	0x20
	.byte	0x3b
	.byte	0x20
	.byte	0x49
	.byte	0x4d
	.byte	0x4d
	.byte	0x45
	.byte	0x44
	.byte	0x49
	.byte	0x41
	.byte	0x54
	.byte	0x45
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x43
	.byte	0x4f
	.byte	0x55
	.byte	0x4e
	.byte	0x54
	.byte	0x20
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x31
	.byte	0x2b
	.byte	0x20
	.byte	0x53
	.byte	0x57
	.byte	0x41
	.byte	0x50
	.byte	0x20
	.byte	0x43
	.byte	0x40
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x4d
	.byte	0x49
	.byte	0x4e
	.byte	0x20
	.byte	0x32
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x3c
	.byte	0x20
	.byte	0x49
	.byte	0x46
	.byte	0x20
	.byte	0x44
	.byte	0x52
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x45
	.byte	0x4c
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x4e
	.byte	0x49
	.byte	0x50
	.byte	0x20
	.byte	0x54
	.byte	0x48
	.byte	0x45
	.byte	0x4e
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x4d
	.byte	0x41
	.byte	0x58
	.byte	0x20
	.byte	0x32
	.byte	0x44
	.byte	0x55
	.byte	0x50
	.byte	0x20
	.byte	0x3e
	.byte	0x20
	.byte	0x49
	.byte	0x46
	.byte	0x20
	.byte	0x44
	.byte	0x52
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x45
	.byte	0x4c
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x4e
	.byte	0x49
	.byte	0x50
	.byte	0x20
	.byte	0x54
	.byte	0x48
	.byte	0x45
	.byte	0x4e
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x44
	.byte	0x30
	.byte	0x3d
	.byte	0x20
	.byte	0x4f
	.byte	0x52
	.byte	0x20
	.byte	0x30
	.byte	0x3d
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x44
	.byte	0x4d
	.byte	0x49
	.byte	0x4e
	.byte	0x20
	.byte	0x32
	.byte	0x4f
	.byte	0x56
	.byte	0x45
	.byte	0x52
	.byte	0x20
	.byte	0x32
	.byte	0x4f
	.byte	0x56
	.byte	0x45
	.byte	0x52
	.byte	0x20
	.byte	0x44
	.byte	0x3c
	.byte	0x20
	.byte	0x49
	.byte	0x46
	.byte	0x20
	.byte	0x32
	.byte	0x44
	.byte	0x52
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x45
	.byte	0x4c
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x32
	.byte	0x4e
	.byte	0x49
	.byte	0x50
	.byte	0x20
	.byte	0x54
	.byte	0x48
	.byte	0x45
	.byte	0x4e
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x44
	.byte	0x4d
	.byte	0x41
	.byte	0x58
	.byte	0x20
	.byte	0x32
	.byte	0x4f
	.byte	0x56
	.byte	0x45
	.byte	0x52
	.byte	0x20
	.byte	0x32
	.byte	0x4f
	.byte	0x56
	.byte	0x45
	.byte	0x52
	.byte	0x20
	.byte	0x44
	.byte	0x3e
	.byte	0x20
	.byte	0x49
	.byte	0x46
	.byte	0x20
	.byte	0x32
	.byte	0x44
	.byte	0x52
	.byte	0x4f
	.byte	0x50
	.byte	0x20
	.byte	0x45
	.byte	0x4c
	.byte	0x53
	.byte	0x45
	.byte	0x20
	.byte	0x32
	.byte	0x4e
	.byte	0x49
	.byte	0x50
	.byte	0x20
	.byte	0x54
	.byte	0x48
	.byte	0x45
	.byte	0x4e
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x3a
	.byte	0x20
	.byte	0x53
	.byte	0x48
	.byte	0x55
	.byte	0x54
	.byte	0x44
	.byte	0x4f
	.byte	0x57
	.byte	0x4e
	.byte	0x20
	.byte	0x4c
	.byte	0x49
	.byte	0x54
	.byte	0x20
	.byte	0x31
	.byte	0x20
	.byte	0x32
	.byte	0x34
	.byte	0x33
	.byte	0x20
	.byte	0x50
	.byte	0x43
	.byte	0x21
	.byte	0x20
	.byte	0x3b
	.byte	0xd
	.byte	0x20
	.byte	0x48
	.byte	0x45
	.byte	0x58
	.byte	0x20
	.byte	0x30
	.byte	0x20
	.byte	0x43
	.byte	0x4f
	.byte	0x4e
	.byte	0x53
	.byte	0x54
	.byte	0x41
	.byte	0x4e
	.byte	0x54
	.byte	0x20
	.byte	0x54
	.byte	0x54
	.byte	0x59
	.byte	0x20
	.byte	0x36
	.byte	0x20
	.byte	0x43
	.byte	0x4f
	.byte	0x4e
	.byte	0x53
	.byte	0x54
	.byte	0x41
	.byte	0x4e
	.byte	0x54
	.byte	0x20
	.byte	0x54
	.byte	0x49
	.byte	0x4d
	.byte	0x45
	.byte	0x52
	.byte	0x20
	.byte	0x43
	.byte	0x20
	.byte	0x43
	.byte	0x4f
	.byte	0x4e
	.byte	0x53
	.byte	0x54
	.byte	0x41
	.byte	0x4e
	.byte	0x54
	.byte	0x20
	.byte	0x4b
	.byte	0x42
	.byte	0x20
	.byte	0x31
	.byte	0x30
	.byte	0x20
	.byte	0x43
	.byte	0x4f
	.byte	0x4e
	.byte	0x53
	.byte	0x54
	.byte	0x41
	.byte	0x4e
	.byte	0x54
	.byte	0x20
	.byte	0x56
	.byte	0x49
	.byte	0x44
	.byte	0x45
	.byte	0x4f
	.byte	0x20
	.byte	0x32
	.byte	0x30
	.byte	0x20
	.byte	0x43
	.byte	0x4f
	.byte	0x4e
	.byte	0x53
	.byte	0x54
	.byte	0x41
	.byte	0x4e
	.byte	0x54
	.byte	0x20
	.byte	0x54
	.byte	0x50
	.byte	0x53
	.byte	0x20
	.byte	0x32
	.byte	0x36
	.byte	0x20
	.byte	0x43
	.byte	0x4f
	.byte	0x4e
	.byte	0x53
	.byte	0x54
	.byte	0x41
	.byte	0x4e
	.byte	0x54
	.byte	0x20
	.byte	0x48
	.byte	0x43
	.byte	0x53
	.byte	0x20
	.byte	0x44
	.byte	0x45
	.byte	0x43
	.byte	0x49
	.byte	0x4d
	.byte	0x41
	.byte	0x4c
	.byte	0xd
	.byte	0x0
	.align 4
