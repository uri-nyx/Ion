#bank text
TextMode:
; function TextMode.init 0
.init:
; push constant 15011840
push s9, s2
li s9, 15011840
; pop static 0
ssw s9, STATIC_TextMode.s0, s1
pop s9, s2
; push constant 15
push s9, s2
li s9, 15
; pop static 3
ssw s9, STATIC_TextMode.s3, s1
pop s9, s2
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
; function TextMode.print 3
.print:
push zero, s2
push zero, s2
mv s9, zero
; push argument 0
push s9, s2
lw s9, -0(s4)
; push constant 0
push s9, s2
li s9, 0
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
; push constant 4
push s9, s2
li s9, 4
; add
pop s10, s2
add s9, s10, s9
; pop local 0
sw s9, -0(s3)
pop s9, s2
; push constant 4
push s9, s2
li s9, 4
; pop local 1
sw s9, -4(s3)
pop s9, s2
; label .print_FOR_TEST_0
.print_FOR_TEST_0:
; push local 1
push s9, s2
lw s9, -4(s3)
; push local 0
push s9, s2
lw s9, -0(s3)
; lt
pop s10, s2
slt s9, s10, s9
neg s9, s9
; if-goto .print_FOR_BODY_0
mv s10, s9
pop s9, s2
bnez s10, .print_FOR_BODY_0
; goto .print_FOR_END_0
j .print_FOR_END_0
; label .print_FOR_INCR_0
.print_FOR_INCR_0:
; push local 1
push s9, s2
lw s9, -4(s3)
; push constant 1
push s9, s2
li s9, 1
; add
pop s10, s2
add s9, s10, s9
; pop local 1
sw s9, -4(s3)
pop s9, s2
; push static 1
push s9, s2
llw s9, STATIC_TextMode.s1
; push constant 1
push s9, s2
li s9, 1
; add
pop s10, s2
add s9, s10, s9
; pop static 1
ssw s9, STATIC_TextMode.s1, s1
pop s9, s2
; goto .print_FOR_TEST_0
j .print_FOR_TEST_0
; label .print_FOR_BODY_0
.print_FOR_BODY_0:
; push constant 0
push s9, s2
li s9, 0
; push static 1
push s9, s2
llw s9, STATIC_TextMode.s1
; push constant 1
push s9, s2
li s9, 1
; shll
pop s10, s2
shll s9, s10, s9
; pop local 2
sw s9, -8(s3)
pop s9, s2
; push static 0
push s9, s2
llw s9, STATIC_TextMode.s0
; push local 2
push s9, s2
lw s9, -8(s3)
; add
pop s10, s2
add s9, s10, s9
; push argument 0
push s9, s2
lw s9, -0(s4)
; push local 1
push s9, s2
lw s9, -4(s3)
; add
pop s10, s2
add s9, s10, s9
; pop pointer 2
mv s7, s9
pop s9, s2
; push thatb 0
push s9, s2
lbu s9, 0(s7)
; pop temp 0
mv t0, s9
pop s9, s2
; pop pointer 2
mv s7, s9
pop s9, s2
; push temp 0
push s9, s2
mv s9, t0
; pop thatb 0
sb s9, 0(s7)
pop s9, s2
; push static 0
push s9, s2
llw s9, STATIC_TextMode.s0
; push local 2
push s9, s2
lw s9, -8(s3)
; push constant 1
push s9, s2
li s9, 1
; add
pop s10, s2
add s9, s10, s9
; add
pop s10, s2
add s9, s10, s9
; push static 3
push s9, s2
llw s9, STATIC_TextMode.s3
; pop temp 0
mv t0, s9
pop s9, s2
; pop pointer 2
mv s7, s9
pop s9, s2
; push temp 0
push s9, s2
mv s9, t0
; pop thatb 0
sb s9, 0(s7)
pop s9, s2
; goto .print_FOR_INCR_0
j .print_FOR_INCR_0
; label .print_FOR_END_0
.print_FOR_END_0:
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
; function TextMode.printLn 0
.printLn:
; push static 2
push s9, s2
llw s9, STATIC_TextMode.s2
; push constant 1
push s9, s2
li s9, 1
; add
pop s10, s2
add s9, s10, s9
; pop static 2
ssw s9, STATIC_TextMode.s2, s1
pop s9, s2
; push static 2
push s9, s2
llw s9, STATIC_TextMode.s2
; push constant 80
push s9, s2
li s9, 80
; mul
pop s10, s2
mul zero, s9, s10, s9
; pop static 1
ssw s9, STATIC_TextMode.s1, s1
pop s9, s2
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
; function TextMode.printInt 1
.printInt:
mv s9, zero
; push argument 0
push s9, s2
lw s9, -0(s4)
; push constant 0
push s9, s2
li s9, 0
; lt
pop s10, s2
slt s9, s10, s9
neg s9, s9
; not
not s9, s9
; if-goto .printInt_IF_FALSE_0
mv s10, s9
pop s9, s2
bnez s10, .printInt_IF_FALSE_0
; #cstring "-"
push s9, s2
la s9, DATA_TextMode.d0
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
; neg
neg s9, s9
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
; goto .printIntIF_END_0
j .printIntIF_END_0
; label .printInt_IF_FALSE_0
.printInt_IF_FALSE_0:
; push argument 0
push s9, s2
lw s9, -0(s4)
; push constant 0
push s9, s2
li s9, 0
; ge
pop s10, s2
slt s9, s10, s9
addi s9, s9, -1
; not
not s9, s9
; if-goto .printInt_IF_FALSE_1
mv s10, s9
pop s9, s2
bnez s10, .printInt_IF_FALSE_1
; push argument 0
push s9, s2
lw s9, -0(s4)
; push constant 9
push s9, s2
li s9, 9
; le
pop s10, s2
slt s9, s9, s10
addi s9, s9, -1
; goto .printIntIF_END_1
j .printIntIF_END_1
; label .printInt_IF_FALSE_1
.printInt_IF_FALSE_1:
; push constant 0
push s9, s2
li s9, 0
; label .printIntIF_END_1
.printIntIF_END_1:
; not
not s9, s9
; if-goto .printInt_IF_FALSE_2
mv s10, s9
pop s9, s2
bnez s10, .printInt_IF_FALSE_2
; push constant 0
push s9, s2
li s9, 0
; push static 1
push s9, s2
llw s9, STATIC_TextMode.s1
; push constant 1
push s9, s2
li s9, 1
; shll
pop s10, s2
shll s9, s10, s9
; pop local 0
sw s9, -0(s3)
pop s9, s2
; push static 0
push s9, s2
llw s9, STATIC_TextMode.s0
; push local 0
push s9, s2
lw s9, -0(s3)
; add
pop s10, s2
add s9, s10, s9
; push constant 48
push s9, s2
li s9, 48
; push argument 0
push s9, s2
lw s9, -0(s4)
; add
pop s10, s2
add s9, s10, s9
; pop temp 0
mv t0, s9
pop s9, s2
; pop pointer 2
mv s7, s9
pop s9, s2
; push temp 0
push s9, s2
mv s9, t0
; pop thatb 0
sb s9, 0(s7)
pop s9, s2
; push static 0
push s9, s2
llw s9, STATIC_TextMode.s0
; push local 0
push s9, s2
lw s9, -0(s3)
; push constant 1
push s9, s2
li s9, 1
; add
pop s10, s2
add s9, s10, s9
; add
pop s10, s2
add s9, s10, s9
; push static 3
push s9, s2
llw s9, STATIC_TextMode.s3
; pop temp 0
mv t0, s9
pop s9, s2
; pop pointer 2
mv s7, s9
pop s9, s2
; push temp 0
push s9, s2
mv s9, t0
; pop thatb 0
sb s9, 0(s7)
pop s9, s2
; push static 1
push s9, s2
llw s9, STATIC_TextMode.s1
; push constant 1
push s9, s2
li s9, 1
; add
pop s10, s2
add s9, s10, s9
; pop static 1
ssw s9, STATIC_TextMode.s1, s1
pop s9, s2
; goto .printIntIF_END_2
j .printIntIF_END_2
; label .printInt_IF_FALSE_2
.printInt_IF_FALSE_2:
; push constant 0
push s9, s2
li s9, 0
; push argument 0
push s9, s2
lw s9, -0(s4)
; push constant 10
push s9, s2
li s9, 10
; mod
pop s10, s2
idiv zero, s9, s10, s9
; pop local 0
sw s9, -0(s3)
pop s9, s2
; push argument 0
push s9, s2
lw s9, -0(s4)
; push constant 10
push s9, s2
li s9, 10
; div
pop s10, s2
idiv s9, zero, s10, s9
; pop argument 0
sw s9, -0(s4)
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
; push local 0
push s9, s2
lw s9, -0(s3)
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
; label .printIntIF_END_2
.printIntIF_END_2:
; label .printIntIF_END_0
.printIntIF_END_0:
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
; function TextMode.setAttribute 0
.setAttribute:
; push argument 0
push s9, s2
lw s9, -0(s4)
; pop static 3
ssw s9, STATIC_TextMode.s3, s1
pop s9, s2
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
; function TextMode.setCursor 0
.setCursor:
; push argument 0
push s9, s2
lw s9, -0(s4)
; push argument 1
push s9, s2
lw s9, -4(s4)
; push constant 80
push s9, s2
li s9, 80
; mul
pop s10, s2
mul zero, s9, s10, s9
; add
pop s10, s2
add s9, s10, s9
; pop static 1
ssw s9, STATIC_TextMode.s1, s1
pop s9, s2
; push argument 1
push s9, s2
lw s9, -4(s4)
; pop static 2
ssw s9, STATIC_TextMode.s2, s1
pop s9, s2
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
#bank data
DATA_TextMode:
.d0:
	#d32 1
	#d "-"
	#align 32

#bank bss
STATIC_TextMode:
.s0: #d32 0
.s3: #d32 0
.s1: #d32 0
.s2: #d32 0