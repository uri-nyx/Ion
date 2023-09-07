#bank text
Kernel:
; function Kernel.main 0
.main:
; push constant 0
push s9, s2
li s9, 0
; push constant 4
push s9, s2
li s9, 4
; call TextMode.setCursor 2
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 4
subi s3, s2, 4
call TextMode.setCursor
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; call TextMode.init 0
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call TextMode.init
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; call Kernel.testMem 0
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call Kernel.testMem
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; push constant 10
push s9, s2
li s9, 10
; return
restore s2, s7, s8
ret
; 
; function Kernel.testMem 6
.testMem:
push zero, s2
push zero, s2
push zero, s2
push zero, s2
push zero, s2
mv s9, zero
; push constant 16515072
push s9, s2
li s9, 16515072
; push constant 16763904
push s9, s2
li s9, 16763904
; call Memory.kinit 2
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 4
subi s3, s2, 4
call Memory.kinit
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; push constant 400
push s9, s2
li s9, 400
; push constant 4
push s9, s2
li s9, 4
; mul
pop s10, s2
mul zero, s9, s10, s9
; call Array.new 1
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Array.new
pop ra, s8
; pop local 2
sw s9, -8(s3)
pop s9, s2
; call Memory.traverse 0
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call Memory.traverse
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; push local 2
push s9, s2
lw s9, -8(s3)
; push constant 0
push s9, s2
li s9, 0
; eq
pop s10, s2
sub s9, s10, s9
seqz s9, s9
neg s9, s9
; not
not s9, s9
; if-goto .testMem_IF_FALSE_0
mv s10, s9
pop s9, s2
bnez s10, .testMem_IF_FALSE_0
; #cstring "Allocation of array A failed"
push s9, s2
la s9, DATA_Kernel.d0
; call TextMode.print 1
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.print
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; call TextMode.printLn 0
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call TextMode.printLn
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; label .testMem_IF_FALSE_0
.testMem_IF_FALSE_0:
; push constant 200
push s9, s2
li s9, 200
; push constant 4
push s9, s2
li s9, 4
; mul
pop s10, s2
mul zero, s9, s10, s9
; call Array.new 1
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Array.new
pop ra, s8
; pop local 3
sw s9, -12(s3)
pop s9, s2
; call Memory.traverse 0
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call Memory.traverse
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; push local 3
push s9, s2
lw s9, -12(s3)
; push constant 0
push s9, s2
li s9, 0
; eq
pop s10, s2
sub s9, s10, s9
seqz s9, s9
neg s9, s9
; not
not s9, s9
; if-goto .testMem_IF_FALSE_1
mv s10, s9
pop s9, s2
bnez s10, .testMem_IF_FALSE_1
; #cstring "Allocation of array B failed"
push s9, s2
la s9, DATA_Kernel.d1
; call TextMode.print 1
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.print
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; call TextMode.printLn 0
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call TextMode.printLn
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; label .testMem_IF_FALSE_1
.testMem_IF_FALSE_1:
; push constant 0
push s9, s2
li s9, 0
; pop local 5
sw s9, -20(s3)
pop s9, s2
; label .testMem_FOR_TEST_0
.testMem_FOR_TEST_0:
; push local 5
push s9, s2
lw s9, -20(s3)
; push constant 400
push s9, s2
li s9, 400
; lt
pop s10, s2
slt s9, s10, s9
neg s9, s9
; if-goto .testMem_FOR_BODY_0
mv s10, s9
pop s9, s2
bnez s10, .testMem_FOR_BODY_0
; goto .testMem_FOR_END_0
j .testMem_FOR_END_0
; label .testMem_FOR_INCR_0
.testMem_FOR_INCR_0:
; push local 5
push s9, s2
lw s9, -20(s3)
; push constant 1
push s9, s2
li s9, 1
; add
pop s10, s2
add s9, s10, s9
; pop local 5
sw s9, -20(s3)
pop s9, s2
; goto .testMem_FOR_TEST_0
j .testMem_FOR_TEST_0
; label .testMem_FOR_BODY_0
.testMem_FOR_BODY_0:
; push local 2
push s9, s2
lw s9, -8(s3)
; push local 5
push s9, s2
lw s9, -20(s3)
; push constant 2
push s9, s2
li s9, 2
; shll
pop s10, s2
shll s9, s10, s9
; add
pop s10, s2
add s9, s10, s9
; push local 5
push s9, s2
lw s9, -20(s3)
; pop temp 0
mv t0, s9
pop s9, s2
; pop pointer 1
mv s6, s9
pop s9, s2
; push temp 0
push s9, s2
mv s9, t0
; pop that 0
sw s9, 0*4(s6)
pop s9, s2
; goto .testMem_FOR_INCR_0
j .testMem_FOR_INCR_0
; label .testMem_FOR_END_0
.testMem_FOR_END_0:
; push constant 199
push s9, s2
li s9, 199
; pop local 5
sw s9, -20(s3)
pop s9, s2
; label .testMem_FOR_TEST_1
.testMem_FOR_TEST_1:
; push local 5
push s9, s2
lw s9, -20(s3)
; push constant 0
push s9, s2
li s9, 0
; gt
pop s10, s2
slt s9, s9, s10
neg s9, s9
; if-goto .testMem_FOR_BODY_1
mv s10, s9
pop s9, s2
bnez s10, .testMem_FOR_BODY_1
; goto .testMem_FOR_END_1
j .testMem_FOR_END_1
; label .testMem_FOR_INCR_1
.testMem_FOR_INCR_1:
; push local 5
push s9, s2
lw s9, -20(s3)
; push constant 1
push s9, s2
li s9, 1
; sub
pop s10, s2
sub s9, s10, s9
; pop local 5
sw s9, -20(s3)
pop s9, s2
; goto .testMem_FOR_TEST_1
j .testMem_FOR_TEST_1
; label .testMem_FOR_BODY_1
.testMem_FOR_BODY_1:
; push local 3
push s9, s2
lw s9, -12(s3)
; push local 5
push s9, s2
lw s9, -20(s3)
; push constant 2
push s9, s2
li s9, 2
; shll
pop s10, s2
shll s9, s10, s9
; add
pop s10, s2
add s9, s10, s9
; push local 2
push s9, s2
lw s9, -8(s3)
; push local 5
push s9, s2
lw s9, -20(s3)
; push constant 2
push s9, s2
li s9, 2
; shll
pop s10, s2
shll s9, s10, s9
; add
pop s10, s2
add s9, s10, s9
; pop pointer 1
mv s6, s9
pop s9, s2
; push that 0
push s9, s2
lw s9, 0*4(s6)
; pop temp 0
mv t0, s9
pop s9, s2
; pop pointer 1
mv s6, s9
pop s9, s2
; push temp 0
push s9, s2
mv s9, t0
; pop that 0
sw s9, 0*4(s6)
pop s9, s2
; goto .testMem_FOR_INCR_1
j .testMem_FOR_INCR_1
; label .testMem_FOR_END_1
.testMem_FOR_END_1:
; #cstring "> "
push s9, s2
la s9, DATA_Kernel.d2
; call TextMode.print 1
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.print
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; push local 2
push s9, s2
lw s9, -8(s3)
; call Array.dispose 1
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Array.dispose
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; call Memory.traverse 0
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call Memory.traverse
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; push constant 250
push s9, s2
li s9, 250
; push constant 4
push s9, s2
li s9, 4
; mul
pop s10, s2
mul zero, s9, s10, s9
; call Array.new 1
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Array.new
pop ra, s8
; pop local 4
sw s9, -16(s3)
pop s9, s2
; call Memory.traverse 0
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call Memory.traverse
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; push local 4
push s9, s2
lw s9, -16(s3)
; push constant 0
push s9, s2
li s9, 0
; eq
pop s10, s2
sub s9, s10, s9
seqz s9, s9
neg s9, s9
; not
not s9, s9
; if-goto .testMem_IF_FALSE_2
mv s10, s9
pop s9, s2
bnez s10, .testMem_IF_FALSE_2
; #cstring "Allocation of array C failed"
push s9, s2
la s9, DATA_Kernel.d3
; call TextMode.print 1
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.print
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; call TextMode.printLn 0
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call TextMode.printLn
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; label .testMem_IF_FALSE_2
.testMem_IF_FALSE_2:
; push local 3
push s9, s2
lw s9, -12(s3)
; call Array.dispose 1
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Array.dispose
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; call Memory.traverse 0
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call Memory.traverse
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; push local 4
push s9, s2
lw s9, -16(s3)
; call Array.dispose 1
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Array.dispose
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; call Memory.traverse 0
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call Memory.traverse
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
; function Kernel.interruptHandler 0
.interruptHandler:
; call TextMode.printLn 0
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call TextMode.printLn
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; #cstring "Interrupt raised. Signal "
push s9, s2
la s9, DATA_Kernel.d4
; call TextMode.print 1
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.print
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; push argument 0
push s9, s2
lw s9, -0(s4)
; call TextMode.printInt 1
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.printInt
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
#bank data
DATA_Kernel:
.d0:
	#d32 28
	#d "Allocation of array A failed"
	#align 32

.d1:
	#d32 28
	#d "Allocation of array B failed"
	#align 32

.d2:
	#d32 2
	#d "> "
	#align 32

.d3:
	#d32 28
	#d "Allocation of array C failed"
	#align 32

.d4:
	#d32 25
	#d "Interrupt raised. Signal "
	#align 32

#bank bss
STATIC_Kernel:
