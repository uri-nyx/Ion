#bank text
TextMode:
.init:
push s9, s2
li s9, 15011840
ssw s9, STATIC_TextMode.s0, s1
li s9, 15
ssw s9, STATIC_TextMode.s3, s1
li s9, 0
restore s2, s7, s8
ret
.print:
push zero, s2
push zero, s2
mv s9, zero
push s9, s2
lw s9, -0(s4)
addi s9, s9, 0
mv s6, s9
lw s9, 0*4(s6)
addi s9, s9, 4
sw s9, -0(s3)
li s9, 4
sw s9, -4(s3)
pop s9, s2
.print_FOR_TEST_0:
push s9, s2
lw s9, -4(s3)
push s9, s2
lw s9, -0(s3)
pop s10, s2
slt s9, s10, s9
neg s9, s9
mv s10, s9
pop s9, s2
bnez s10, .print_FOR_BODY_0
j .print_FOR_END_0
.print_FOR_INCR_0:
push s9, s2
lw s9, -4(s3)
addi s9, s9, 1
sw s9, -4(s3)
llw s9, STATIC_TextMode.s1
addi s9, s9, 1
ssw s9, STATIC_TextMode.s1, s1
pop s9, s2
j .print_FOR_TEST_0
.print_FOR_BODY_0:
push s9, s2
li s9, 0
push s9, s2
llw s9, STATIC_TextMode.s1
shlli s9, s9, 1
sw s9, -8(s3)
llw s9, STATIC_TextMode.s0
push s9, s2
lw s9, -8(s3)
pop s10, s2
add s9, s10, s9
push s9, s2
lw s9, -0(s4)
push s9, s2
lw s9, -4(s3)
pop s10, s2
add s9, s10, s9
mv s7, s9
lbu s9, 0(s7)
mv t0, s9
pop s9, s2
mv s7, s9
mv s9, t0
sb s9, 0(s7)
llw s9, STATIC_TextMode.s0
push s9, s2
lw s9, -8(s3)
addi s9, s9, 1
pop s10, s2
add s9, s10, s9
push s9, s2
llw s9, STATIC_TextMode.s3
mv t0, s9
pop s9, s2
mv s7, s9
mv s9, t0
sb s9, 0(s7)
pop s9, s2
j .print_FOR_INCR_0
.print_FOR_END_0:
.println:
push s9, s2
llw s9, STATIC_TextMode.s2
addi s9, s9, 1
ssw s9, STATIC_TextMode.s2, s1
llw s9, STATIC_TextMode.s2
muli s9, s9, 80
ssw s9, STATIC_TextMode.s1, s1
li s9, 0
restore s2, s7, s8
ret
.printi:
mv s9, zero
push s9, s2
lw s9, -0(s4)
slti s9, s9, 0
addi s9, s9, -1
not s9, s9
mv s10, s9
pop s9, s2
bnez s10, .printi_IF_FALSE_0
push s9, s2
lw s9, -0(s4)
slti s9, s9, 10
neg s9, s9
j .printiIF_END_0
.printi_IF_FALSE_0:
push s9, s2
li s9, 0
.printiIF_END_0:
not s9, s9
mv s10, s9
pop s9, s2
bnez s10, .printi_IF_FALSE_1
push s9, s2
li s9, 0
push s9, s2
llw s9, STATIC_TextMode.s1
shlli s9, s9, 1
sw s9, -0(s3)
llw s9, STATIC_TextMode.s0
push s9, s2
lw s9, -0(s3)
pop s10, s2
add s9, s10, s9
push s9, s2
li s9, 48
push s9, s2
lw s9, -0(s4)
pop s10, s2
add s9, s10, s9
mv t0, s9
pop s9, s2
mv s7, s9
mv s9, t0
sb s9, 0(s7)
llw s9, STATIC_TextMode.s0
push s9, s2
lw s9, -0(s3)
addi s9, s9, 1
pop s10, s2
add s9, s10, s9
push s9, s2
llw s9, STATIC_TextMode.s3
mv t0, s9
pop s9, s2
mv s7, s9
mv s9, t0
sb s9, 0(s7)
pop s9, s2
j .printiIF_END_1
.printi_IF_FALSE_1:
push s9, s2
li s9, 0
push s9, s2
lw s9, -0(s4)
li s1, 10
idiv zero, s9, s9, s1
sw s9, -0(s3)
lw s9, -0(s4)
idivi s9, s9, 10
sw s9, -0(s4)
lw s9, -0(s4)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.printi
pop ra, s8
mv t0, s9
lw s9, -0(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.printi
pop ra, s8
mv t0, s9
pop s9, s2
.printiIF_END_1:
push s9, s2
li s9, 0
restore s2, s7, s8
ret
.setAttribute:
push s9, s2
lw s9, -0(s4)
ssw s9, STATIC_TextMode.s3, s1
li s9, 0
restore s2, s7, s8
ret
.setCursor:
push s9, s2
lw s9, -0(s4)
push s9, s2
lw s9, -4(s4)
muli s9, s9, 80
pop s10, s2
add s9, s10, s9
ssw s9, STATIC_TextMode.s1, s1
lw s9, -4(s4)
ssw s9, STATIC_TextMode.s2, s1
li s9, 0
restore s2, s7, s8
ret
;
#bank data
DATA_TextMode:

#bank bss
STATIC_TextMode:
.s0: #d32 0
.s3: #d32 0
.s1: #d32 0
.s2: #d32 0