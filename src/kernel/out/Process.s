#bank text
Process:
.init:
push s9, s2
li s9, 16515072
ssw s9, STATIC_Process.s0, s1
li s9, 0
ssw s9, STATIC_Process.s1, s1
li s9, 0
ssw s9, STATIC_Process.s2, s1
li s9, 0
restore s2, s7, s8
ret
.create:
push zero, s2
mv s9, zero
push s9, s2
lw s9, -4(s4)
addi s9, s9, 0
push s9, s2
llw s9, STATIC_Process.s2
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
lw s9, -4(s4)
addi s9, s9, 4
mv s6, s9
lw s9, 0*4(s6)
sw s9, -0(s3)
li s9, 0
sw s9, -4(s3)
pop s9, s2
.create_FOR_TEST_0:
push s9, s2
lw s9, -4(s3)
slti s9, s9, 30
neg s9, s9
mv s10, s9
pop s9, s2
bnez s10, .create_FOR_BODY_0
j .create_FOR_END_0
.create_FOR_INCR_0:
push s9, s2
lw s9, -4(s3)
addi s9, s9, 1
sw s9, -4(s3)
pop s9, s2
j .create_FOR_TEST_0
.create_FOR_BODY_0:
push s9, s2
lw s9, -0(s3)
push s9, s2
lw s9, -4(s3)
shlli s9, s9, 2
pop s10, s2
add s9, s10, s9
push s9, s2
li s9, 0
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
pop s9, s2
j .create_FOR_INCR_0
.create_FOR_END_0:
push s9, s2
lw s9, -0(s3)
addi s9, s9, 120
push s9, s2
lw s9, -0(s4)
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
lw s9, -4(s4)
addi s9, s9, 8
push s9, s2
li s9, 0
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
lw s9, -4(s4)
addi s9, s9, 12
push s9, s2
lw s9, -0(s4)
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
llw s9, STATIC_Process.s0
push s9, s2
llw s9, STATIC_Process.s2
shlli s9, s9, 2
pop s10, s2
add s9, s10, s9
push s9, s2
lw s9, -4(s4)
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
llw s9, STATIC_Process.s2
addi s9, s9, 1
ssw s9, STATIC_Process.s2, s1
llw s9, STATIC_Process.s1
addi s9, s9, 1
ssw s9, STATIC_Process.s1, s1
li s9, 0
restore s2, s7, s8
ret
;! syntax error: invalid instrutction in line 87
#bank data
DATA_Process:

#bank bss
STATIC_Process:
.s0: #d32 0
.s1: #d32 0
.s2: #d32 0