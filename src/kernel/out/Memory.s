#bank text
Memory:
.minit:
mv s9, zero
push s9, s2
li s9, 16515072
ssw s9, STATIC_Memory.s8, s1
li s9, 16763904
push s9, s2
llw s9, STATIC_Memory.s8
pop s10, s2
sub s9, s10, s9
ssw s9, STATIC_Memory.s9, s1
llw s9, STATIC_Memory.s8
ssw s9, STATIC_Memory.s10, s1
li s9, 16763904
ssw s9, STATIC_Memory.s11, s1
llw s9, STATIC_Memory.s8
addi s9, s9, 8
sw s9, -0(s3)
lw s9, -0(s3)
addi s9, s9, 0
push s9, s2
llw s9, STATIC_Memory.s9
subi s9, s9, 16
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
lw s9, -0(s3)
addi s9, s9, 4
push s9, s2
llw s9, STATIC_Memory.s11
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
llw s9, STATIC_Memory.s10
addi s9, s9, 0
push s9, s2
li s9, 8
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
llw s9, STATIC_Memory.s10
addi s9, s9, 4
push s9, s2
lw s9, -0(s3)
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
llw s9, STATIC_Memory.s11
addi s9, s9, 0
push s9, s2
li s9, 8
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
llw s9, STATIC_Memory.s11
addi s9, s9, 4
push s9, s2
li s9, 0
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
li s9, 0
restore s2, s7, s8
ret
.kinit:
push s9, s2
lw s9, -0(s4)
ssw s9, STATIC_Memory.s1, s1
lw s9, -4(s4)
ssw s9, STATIC_Memory.s2, s1
llw s9, STATIC_Memory.s1
ssw s9, STATIC_Memory.s0, s1
li s9, -1
ssw s9, STATIC_Memory.s6, s1
llw s9, STATIC_Memory.s0
addi s9, s9, 0
push s9, s2
li s9, 0
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
llw s9, STATIC_Memory.s0
addi s9, s9, 4
push s9, s2
llw s9, STATIC_Memory.s2
push s9, s2
llw s9, STATIC_Memory.s1
pop s10, s2
sub s9, s10, s9
subi s9, s9, 8
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
li s9, 0
restore s2, s7, s8
ret
.kinitUser:
push s9, s2
lw s9, -0(s4)
ssw s9, STATIC_Memory.s4, s1
lw s9, -4(s4)
ssw s9, STATIC_Memory.s5, s1
li s9, 0
ssw s9, STATIC_Memory.s6, s1
li s9, 0
restore s2, s7, s8
ret
.init:
push s9, s2
llw s9, STATIC_Memory.s4
ssw s9, STATIC_Memory.s3, s1
llw s9, STATIC_Memory.s3
addi s9, s9, 0
push s9, s2
li s9, 0
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
llw s9, STATIC_Memory.s3
addi s9, s9, 4
push s9, s2
llw s9, STATIC_Memory.s5
push s9, s2
llw s9, STATIC_Memory.s4
pop s10, s2
sub s9, s10, s9
subi s9, s9, 8
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
li s9, 0
restore s2, s7, s8
ret
.peek:
push s9, s2
lw s9, -0(s4)
mv s6, s9
lw s9, 0*4(s6)
restore s2, s7, s8
ret
.poke:
push s9, s2
lw s9, -0(s4)
push s9, s2
lw s9, -4(s4)
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
li s9, 0
restore s2, s7, s8
ret
.peekChar:
push s9, s2
lw s9, -0(s4)
mv s7, s9
lbu s9, 0(s7)
restore s2, s7, s8
ret
.pokeChar:
push s9, s2
lw s9, -0(s4)
push s9, s2
lw s9, -4(s4)
mv t0, s9
pop s9, s2
mv s7, s9
mv s9, t0
sb s9, 0(s7)
li s9, 0
restore s2, s7, s8
ret
.alloc:
push zero, s2
push zero, s2
mv s9, zero
push s9, s2
lw s9, -0(s4)
slti s9, s9, 1
neg s9, s9
not s9, s9
mv s10, s9
pop s9, s2
bnez s10, .alloc_IF_FALSE_0
push s9, s2
la s9, DATA_Memory.d0
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.print
pop ra, s8
mv t0, s9
pop s9, s2
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call TextMode.printLn
pop ra, s8
mv t0, s9
li s9, 0
restore s2, s7, s8
ret
.alloc_IF_FALSE_0:
push s9, s2
lw s9, -0(s4)
addi s9, s9, 8
push s9, s2
llw s9, STATIC_Memory.s9
pop s10, s2
slt s9, s9, s10
neg s9, s9
not s9, s9
mv s10, s9
pop s9, s2
bnez s10, .alloc_IF_FALSE_1
push s9, s2
la s9, DATA_Memory.d1
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.print
pop ra, s8
mv t0, s9
pop s9, s2
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call TextMode.printLn
pop ra, s8
mv t0, s9
li s9, 0
restore s2, s7, s8
ret
.alloc_IF_FALSE_1:
push s9, s2
llw s9, STATIC_Memory.s10
addi s9, s9, 4
mv s6, s9
lw s9, 0*4(s6)
sw s9, -0(s3)
pop s9, s2
.alloc_WHILE_EXP_0:
push s9, s2
li s9, 0
mv s10, s9
pop s9, s2
bnez s10, .allocWHILE_END_0
push s9, s2
lw s9, -0(s3)
push s9, s2
llw s9, STATIC_Memory.s11
pop s10, s2
sub s9, s10, s9
seqz s9, s9
neg s9, s9
not s9, s9
mv s10, s9
pop s9, s2
bnez s10, .alloc_IF_FALSE_2
push s9, s2
la s9, DATA_Memory.d2
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.print
pop ra, s8
mv t0, s9
pop s9, s2
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call TextMode.printLn
pop ra, s8
mv t0, s9
li s9, 0
restore s2, s7, s8
ret
.alloc_IF_FALSE_2:
push s9, s2
lw s9, -0(s3)
addi s9, s9, 0
mv s6, s9
lw s9, 0*4(s6)
push s9, s2
lw s9, -0(s4)
addi s9, s9, 8
pop s10, s2
slt s9, s9, s10
neg s9, s9
not s9, s9
mv s10, s9
pop s9, s2
bnez s10, .alloc_IF_FALSE_3
push s9, s2
lw s9, -0(s3)
addi s9, s9, 0
mv s6, s9
lw s9, 0*4(s6)
push s9, s2
lw s9, -0(s4)
addi s9, s9, 4
pop s10, s2
sub s9, s10, s9
push s9, s2
lw s9, -0(s3)
pop s10, s2
add s9, s10, s9
sw s9, -8(s3)
lw s9, -8(s3)
addi s9, s9, 0
push s9, s2
lw s9, -0(s4)
addi s9, s9, 4
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
lw s9, -8(s3)
addi s9, s9, 4
sw s9, -4(s3)
lw s9, -0(s3)
addi s9, s9, 0
push s9, s2
lw s9, -0(s3)
addi s9, s9, 0
mv s6, s9
lw s9, 0*4(s6)
push s9, s2
lw s9, -0(s4)
addi s9, s9, 4
pop s10, s2
sub s9, s10, s9
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
la s9, DATA_Memory.d3
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.print
pop ra, s8
mv t0, s9
lw s9, -4(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.printInt
pop ra, s8
mv t0, s9
pop s9, s2
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call TextMode.printLn
pop ra, s8
mv t0, s9
lw s9, -4(s3)
restore s2, s7, s8
ret
.alloc_IF_FALSE_3:
push s9, s2
lw s9, -0(s3)
addi s9, s9, 4
mv s6, s9
lw s9, 0*4(s6)
sw s9, -0(s3)
pop s9, s2
j .alloc_WHILE_EXP_0
.allocWHILE_END_0:
.deAlloc:
push zero, s2
push zero, s2
mv s9, zero
push s9, s2
lw s9, -0(s4)
subi s9, s9, 4
sw s9, -0(s3)
llw s9, STATIC_Memory.s10
sw s9, -4(s3)
lw s9, -4(s3)
addi s9, s9, 4
mv s6, s9
lw s9, 0*4(s6)
sw s9, -8(s3)
pop s9, s2
.deAlloc_WHILE_EXP_0:
push s9, s2
li s9, 0
mv s10, s9
pop s9, s2
bnez s10, .deAllocWHILE_END_0
push s9, s2
lw s9, -8(s3)
push s9, s2
lw s9, -0(s3)
pop s10, s2
slt s9, s9, s10
neg s9, s9
not s9, s9
mv s10, s9
pop s9, s2
bnez s10, .deAlloc_IF_FALSE_0
push s9, s2
lw s9, -0(s3)
addi s9, s9, 4
push s9, s2
lw s9, -8(s3)
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
lw s9, -4(s3)
addi s9, s9, 4
push s9, s2
lw s9, -0(s3)
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
lw s9, -0(s3)
push s9, s2
lw s9, -8(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 4
subi s3, s2, 4
call Memory.mergeBlocks
pop ra, s8
mv t0, s9
lw s9, -4(s3)
push s9, s2
lw s9, -0(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 4
subi s3, s2, 4
call Memory.mergeBlocks
pop ra, s8
mv t0, s9
la s9, DATA_Memory.d4
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.print
pop ra, s8
mv t0, s9
lw s9, -0(s4)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.printInt
pop ra, s8
mv t0, s9
pop s9, s2
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call TextMode.printLn
pop ra, s8
mv t0, s9
li s9, 0
restore s2, s7, s8
ret
.deAlloc_IF_FALSE_0:
push s9, s2
lw s9, -4(s3)
addi s9, s9, 4
mv s6, s9
lw s9, 0*4(s6)
sw s9, -4(s3)
lw s9, -8(s3)
addi s9, s9, 4
mv s6, s9
lw s9, 0*4(s6)
sw s9, -8(s3)
pop s9, s2
j .deAlloc_WHILE_EXP_0
.deAllocWHILE_END_0:
.mergeBlocks:
push s9, s2
lw s9, -0(s4)
push s9, s2
llw s9, STATIC_Memory.s10
pop s10, s2
sub s9, s10, s9
seqz s9, s9
neg s9, s9
not s9, s9
mv s10, s9
pop s9, s2
bnez s10, .mergeBlocks_IF_FALSE_0
push s9, s2
li s9, 0
restore s2, s7, s8
ret
.mergeBlocks_IF_FALSE_0:
push s9, s2
lw s9, -4(s4)
push s9, s2
llw s9, STATIC_Memory.s11
pop s10, s2
sub s9, s10, s9
seqz s9, s9
neg s9, s9
not s9, s9
mv s10, s9
pop s9, s2
bnez s10, .mergeBlocks_IF_FALSE_1
push s9, s2
li s9, 0
restore s2, s7, s8
ret
.mergeBlocks_IF_FALSE_1:
push s9, s2
lw s9, -0(s4)
push s9, s2
lw s9, -0(s4)
addi s9, s9, 0
mv s6, s9
lw s9, 0*4(s6)
pop s10, s2
add s9, s10, s9
push s9, s2
lw s9, -4(s4)
pop s10, s2
sub s9, s10, s9
seqz s9, s9
neg s9, s9
not s9, s9
mv s10, s9
pop s9, s2
bnez s10, .mergeBlocks_IF_FALSE_2
push s9, s2
lw s9, -0(s4)
addi s9, s9, 0
push s9, s2
lw s9, -0(s4)
addi s9, s9, 0
mv s6, s9
lw s9, 0*4(s6)
push s9, s2
lw s9, -4(s4)
addi s9, s9, 0
mv s6, s9
lw s9, 0*4(s6)
pop s10, s2
add s9, s10, s9
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
lw s9, -0(s4)
addi s9, s9, 4
push s9, s2
lw s9, -4(s4)
addi s9, s9, 4
mv s6, s9
lw s9, 0*4(s6)
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
la s9, DATA_Memory.d5
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.print
pop ra, s8
mv t0, s9
lw s9, -0(s4)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.printInt
pop ra, s8
mv t0, s9
la s9, DATA_Memory.d6
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.print
pop ra, s8
mv t0, s9
lw s9, -4(s4)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.printInt
pop ra, s8
mv t0, s9
pop s9, s2
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call TextMode.printLn
pop ra, s8
mv t0, s9
pop s9, s2
.mergeBlocks_IF_FALSE_2:
push s9, s2
li s9, 0
restore s2, s7, s8
ret
.traverse:
mv s9, zero
push s9, s2
llw s9, STATIC_Memory.s6
not s9, s9
mv s10, s9
pop s9, s2
bnez s10, .traverse_IF_FALSE_0
push s9, s2
llw s9, STATIC_Memory.s0
j .traverseIF_END_0
.traverse_IF_FALSE_0:
push s9, s2
llw s9, STATIC_Memory.s3
.traverseIF_END_0:
sw s9, -0(s3)
pop s9, s2
.traverse_WHILE_EXP_0:
push s9, s2
lw s9, -0(s3)
subi s9, s9, 0
seqz s9, s9
addi s9, s9, -1
not s9, s9
mv s10, s9
pop s9, s2
bnez s10, .traverseWHILE_END_0
push s9, s2
la s9, DATA_Memory.d7
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.print
pop ra, s8
mv t0, s9
lw s9, -0(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.printInt
pop ra, s8
mv t0, s9
la s9, DATA_Memory.d8
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.print
pop ra, s8
mv t0, s9
lw s9, -0(s3)
addi s9, s9, 4
mv s6, s9
lw s9, 0*4(s6)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.printInt
pop ra, s8
mv t0, s9
la s9, DATA_Memory.d9
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.print
pop ra, s8
mv t0, s9
lw s9, -0(s3)
addi s9, s9, 0
mv s6, s9
lw s9, 0*4(s6)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.printInt
pop ra, s8
mv t0, s9
pop s9, s2
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call TextMode.printLn
pop ra, s8
mv t0, s9
lw s9, -0(s3)
addi s9, s9, 0
mv s6, s9
lw s9, 0*4(s6)
sw s9, -0(s3)
pop s9, s2
j .traverse_WHILE_EXP_0
.traverseWHILE_END_0:
push s9, s2
li s9, 0
restore s2, s7, s8
ret
;! syntax error: invalid instrutction in line 612
#bank data
DATA_Memory:
.d0:
	#d32 31
	#d "Size must be a positive integer"
	#align 32

.d1:
	#d32 35
	#d "Cannot alloc more than 248000 bytes"
	#align 32

.d2:
	#d32 22
	#d "No allocation possible"
	#align 32

.d3:
	#d32 19
	#d "Allocated block at "
	#align 32

.d4:
	#d32 21
	#d "Deallocated block at "
	#align 32

.d5:
	#d32 7
	#d "Merged "
	#align 32

.d6:
	#d32 6
	#d " with "
	#align 32

.d7:
	#d32 9
	#d " curr -> "
	#align 32

.d8:
	#d32 9
	#d " size -> "
	#align 32

.d9:
	#d32 9
	#d " next -> "
	#align 32

#bank bss
STATIC_Memory:
.s8: #d32 0
.s9: #d32 0
.s10: #d32 0
.s11: #d32 0
.s1: #d32 0
.s2: #d32 0
.s0: #d32 0
.s6: #d32 0
.s4: #d32 0
.s5: #d32 0
.s3: #d32 0