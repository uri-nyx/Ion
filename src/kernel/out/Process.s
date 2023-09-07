#bank text
Process:
; function Process.init 0
.init:
; push constant 16515072
push s9, s2
li s9, 16515072
; pop static 0
ssw s9, STATIC_Process.s0, s1
pop s9, s2
; push constant 0
push s9, s2
li s9, 0
; pop static 1
ssw s9, STATIC_Process.s1, s1
pop s9, s2
; push constant 0
push s9, s2
li s9, 0
; pop static 2
ssw s9, STATIC_Process.s2, s1
pop s9, s2
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
; function Process.create 2
.create:
push zero, s2
mv s9, zero
; push argument 1
push s9, s2
lw s9, -4(s4)
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
; push static 2
push s9, s2
llw s9, STATIC_Process.s2
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
; push argument 1
push s9, s2
lw s9, -4(s4)
; push constant 1
push s9, s2
li s9, 1
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
; pop local 0
sw s9, -0(s3)
pop s9, s2
; push constant 0
push s9, s2
li s9, 0
; pop local 1
sw s9, -4(s3)
pop s9, s2
; label .create_FOR_TEST_0
.create_FOR_TEST_0:
; push local 1
push s9, s2
lw s9, -4(s3)
; push constant 30
push s9, s2
li s9, 30
; lt
pop s10, s2
slt s9, s10, s9
neg s9, s9
; if-goto .create_FOR_BODY_0
mv s10, s9
pop s9, s2
bnez s10, .create_FOR_BODY_0
; goto .create_FOR_END_0
j .create_FOR_END_0
; label .create_FOR_INCR_0
.create_FOR_INCR_0:
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
; goto .create_FOR_TEST_0
j .create_FOR_TEST_0
; label .create_FOR_BODY_0
.create_FOR_BODY_0:
; push local 0
push s9, s2
lw s9, -0(s3)
; push local 1
push s9, s2
lw s9, -4(s3)
; push constant 2
push s9, s2
li s9, 2
; shll
pop s10, s2
shll s9, s10, s9
; add
pop s10, s2
add s9, s10, s9
; push constant 0
push s9, s2
li s9, 0
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
; goto .create_FOR_INCR_0
j .create_FOR_INCR_0
; label .create_FOR_END_0
.create_FOR_END_0:
; push local 0
push s9, s2
lw s9, -0(s3)
; push constant 30
push s9, s2
li s9, 30
; push constant 2
push s9, s2
li s9, 2
; shll
pop s10, s2
shll s9, s10, s9
; add
pop s10, s2
add s9, s10, s9
; push argument 0
push s9, s2
lw s9, -0(s4)
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
; push argument 1
push s9, s2
lw s9, -4(s4)
; push constant 2
push s9, s2
li s9, 2
; push constant 2
push s9, s2
li s9, 2
; shll
pop s10, s2
shll s9, s10, s9
; add
pop s10, s2
add s9, s10, s9
; push constant 0
push s9, s2
li s9, 0
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
; push argument 1
push s9, s2
lw s9, -4(s4)
; push constant 3
push s9, s2
li s9, 3
; push constant 2
push s9, s2
li s9, 2
; shll
pop s10, s2
shll s9, s10, s9
; add
pop s10, s2
add s9, s10, s9
; push argument 0
push s9, s2
lw s9, -0(s4)
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
; push static 0
push s9, s2
llw s9, STATIC_Process.s0
; push static 2
push s9, s2
llw s9, STATIC_Process.s2
; push constant 2
push s9, s2
li s9, 2
; shll
pop s10, s2
shll s9, s10, s9
; add
pop s10, s2
add s9, s10, s9
; push argument 1
push s9, s2
lw s9, -4(s4)
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
; push static 2
push s9, s2
llw s9, STATIC_Process.s2
; push constant 1
push s9, s2
li s9, 1
; add
pop s10, s2
add s9, s10, s9
; pop static 2
ssw s9, STATIC_Process.s2, s1
pop s9, s2
; push static 1
push s9, s2
llw s9, STATIC_Process.s1
; push constant 1
push s9, s2
li s9, 1
; add
pop s10, s2
add s9, s10, s9
; pop static 1
ssw s9, STATIC_Process.s1, s1
pop s9, s2
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
#bank data
DATA_Process:

#bank bss
STATIC_Process:
.s0: #d32 0
.s1: #d32 0
.s2: #d32 0