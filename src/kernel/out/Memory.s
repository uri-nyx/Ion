#bank text
Memory:
; function Memory.kinit 0
.kinit:
; push argument 0
push s9, s2
lw s9, -0(s4)
; pop static 1
ssw s9, STATIC_Memory.s1, s1
pop s9, s2
; push argument 1
push s9, s2
lw s9, -4(s4)
; pop static 2
ssw s9, STATIC_Memory.s2, s1
pop s9, s2
; push static 1
push s9, s2
llw s9, STATIC_Memory.s1
; pop static 0
ssw s9, STATIC_Memory.s0, s1
pop s9, s2
; push constant 1
push s9, s2
li s9, 1
; neg
neg s9, s9
; pop static 6
ssw s9, STATIC_Memory.s6, s1
pop s9, s2
; push static 0
push s9, s2
llw s9, STATIC_Memory.s0
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
; push static 0
push s9, s2
llw s9, STATIC_Memory.s0
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
; push static 2
push s9, s2
llw s9, STATIC_Memory.s2
; push static 1
push s9, s2
llw s9, STATIC_Memory.s1
; sub
pop s10, s2
sub s9, s10, s9
; push constant 8
push s9, s2
li s9, 8
; sub
pop s10, s2
sub s9, s10, s9
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
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
; function Memory.kinitUser 0
.kinitUser:
; push argument 0
push s9, s2
lw s9, -0(s4)
; pop static 4
ssw s9, STATIC_Memory.s4, s1
pop s9, s2
; push argument 1
push s9, s2
lw s9, -4(s4)
; pop static 5
ssw s9, STATIC_Memory.s5, s1
pop s9, s2
; push constant 0
push s9, s2
li s9, 0
; pop static 6
ssw s9, STATIC_Memory.s6, s1
pop s9, s2
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
; function Memory.init 0
.init:
; push static 4
push s9, s2
llw s9, STATIC_Memory.s4
; pop static 3
ssw s9, STATIC_Memory.s3, s1
pop s9, s2
; push static 3
push s9, s2
llw s9, STATIC_Memory.s3
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
; push static 3
push s9, s2
llw s9, STATIC_Memory.s3
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
; push static 5
push s9, s2
llw s9, STATIC_Memory.s5
; push static 4
push s9, s2
llw s9, STATIC_Memory.s4
; sub
pop s10, s2
sub s9, s10, s9
; push constant 8
push s9, s2
li s9, 8
; sub
pop s10, s2
sub s9, s10, s9
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
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
; function Memory.peek 0
.peek:
; push argument 0
push s9, s2
lw s9, -0(s4)
; pop pointer 1
mv s6, s9
pop s9, s2
; push that 0
push s9, s2
lw s9, 0*4(s6)
; return
restore s2, s7, s8
ret
; 
; function Memory.poke 0
.poke:
; push argument 0
push s9, s2
lw s9, -0(s4)
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
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
; function Memory.peekChar 0
.peekChar:
; push argument 0
push s9, s2
lw s9, -0(s4)
; pop pointer 2
mv s7, s9
pop s9, s2
; push thatb 0
push s9, s2
lbu s9, 0(s7)
; return
restore s2, s7, s8
ret
; 
; function Memory.pokeChar 0
.pokeChar:
; push argument 0
push s9, s2
lw s9, -0(s4)
; push argument 1
push s9, s2
lw s9, -4(s4)
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
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
; function Memory.alloc 3
.alloc:
push zero, s2
push zero, s2
mv s9, zero
; push static 6
push s9, s2
llw s9, STATIC_Memory.s6
; not
not s9, s9
; if-goto .alloc_IF_FALSE_0
mv s10, s9
pop s9, s2
bnez s10, .alloc_IF_FALSE_0
; push static 0
push s9, s2
llw s9, STATIC_Memory.s0
; goto .allocIF_END_0
j .allocIF_END_0
; label .alloc_IF_FALSE_0
.alloc_IF_FALSE_0:
; push static 3
push s9, s2
llw s9, STATIC_Memory.s3
; label .allocIF_END_0
.allocIF_END_0:
; pop local 1
sw s9, -4(s3)
pop s9, s2
; push local 1
push s9, s2
lw s9, -4(s3)
; pop local 0
sw s9, -0(s3)
pop s9, s2
; push argument 0
push s9, s2
lw s9, -0(s4)
; push constant 8
push s9, s2
li s9, 8
; add
pop s10, s2
add s9, s10, s9
; pop local 2
sw s9, -8(s3)
pop s9, s2
; label .alloc_WHILE_EXP_0
.alloc_WHILE_EXP_0:
; push local 1
push s9, s2
lw s9, -4(s3)
; push constant 0
push s9, s2
li s9, 0
; neq
pop s10, s2
sub s9, s10, s9
snez s9, s9
neg s9, s9
; not
not s9, s9
; if-goto .allocWHILE_END_0
mv s10, s9
pop s9, s2
bnez s10, .allocWHILE_END_0
; #cstring " target -> "
push s9, s2
la s9, DATA_Memory.d0
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
; #cstring " best -> "
push s9, s2
la s9, DATA_Memory.d1
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
; push local 0
push s9, s2
lw s9, -0(s3)
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
; #cstring " ("
push s9, s2
la s9, DATA_Memory.d2
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
; #cstring ")"
push s9, s2
la s9, DATA_Memory.d3
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
; push local 1
push s9, s2
lw s9, -4(s3)
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
; push local 2
push s9, s2
lw s9, -8(s3)
; eq
pop s10, s2
sub s9, s10, s9
seqz s9, s9
neg s9, s9
; not
not s9, s9
; if-goto .alloc_IF_FALSE_1
mv s10, s9
pop s9, s2
bnez s10, .alloc_IF_FALSE_1
; push local 1
push s9, s2
lw s9, -4(s3)
; pop local 0
sw s9, -0(s3)
pop s9, s2
; goto .allocWHILE_END_0
j .allocWHILE_END_0
; label .alloc_IF_FALSE_1
.alloc_IF_FALSE_1:
; push local 1
push s9, s2
lw s9, -4(s3)
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
; push local 2
push s9, s2
lw s9, -8(s3)
; gt
pop s10, s2
slt s9, s9, s10
neg s9, s9
; not
not s9, s9
; if-goto .alloc_IF_FALSE_2
mv s10, s9
pop s9, s2
bnez s10, .alloc_IF_FALSE_2
; push local 1
push s9, s2
lw s9, -4(s3)
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
; push local 0
push s9, s2
lw s9, -0(s3)
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
; lt
pop s10, s2
slt s9, s10, s9
neg s9, s9
; goto .allocIF_END_2
j .allocIF_END_2
; label .alloc_IF_FALSE_2
.alloc_IF_FALSE_2:
; push constant 0
push s9, s2
li s9, 0
; label .allocIF_END_2
.allocIF_END_2:
; not
not s9, s9
; if-goto .alloc_IF_FALSE_3
mv s10, s9
pop s9, s2
bnez s10, .alloc_IF_FALSE_3
; push local 1
push s9, s2
lw s9, -4(s3)
; pop local 0
sw s9, -0(s3)
pop s9, s2
; #cstring " new -> "
push s9, s2
la s9, DATA_Memory.d4
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
; push local 0
push s9, s2
lw s9, -0(s3)
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
; label .alloc_IF_FALSE_3
.alloc_IF_FALSE_3:
; call TextMode.printLn 0
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call TextMode.printLn
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; push local 1
push s9, s2
lw s9, -4(s3)
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
; pop local 1
sw s9, -4(s3)
pop s9, s2
; goto .alloc_WHILE_EXP_0
j .alloc_WHILE_EXP_0
; label .allocWHILE_END_0
.allocWHILE_END_0:
; push local 0
push s9, s2
lw s9, -0(s3)
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
; if-goto .alloc_IF_FALSE_4
mv s10, s9
pop s9, s2
bnez s10, .alloc_IF_FALSE_4
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; label .alloc_IF_FALSE_4
.alloc_IF_FALSE_4:
; #cstring "Found Block at "
push s9, s2
la s9, DATA_Memory.d5
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
; push local 0
push s9, s2
lw s9, -0(s3)
; pop local 1
sw s9, -4(s3)
pop s9, s2
; push local 0
push s9, s2
lw s9, -0(s3)
; push argument 0
push s9, s2
lw s9, -0(s4)
; add
pop s10, s2
add s9, s10, s9
; push constant 8
push s9, s2
li s9, 8
; add
pop s10, s2
add s9, s10, s9
; pop local 0
sw s9, -0(s3)
pop s9, s2
; push local 0
push s9, s2
lw s9, -0(s3)
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
; push local 1
push s9, s2
lw s9, -4(s3)
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
; push local 0
push s9, s2
lw s9, -0(s3)
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
; push local 1
push s9, s2
lw s9, -4(s3)
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
; push local 2
push s9, s2
lw s9, -8(s3)
; sub
pop s10, s2
sub s9, s10, s9
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
; push local 1
push s9, s2
lw s9, -4(s3)
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
; push constant -2
push s9, s2
li s9, -2
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
; push local 1
push s9, s2
lw s9, -4(s3)
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
; push static 6
push s9, s2
llw s9, STATIC_Memory.s6
; not
not s9, s9
; if-goto .alloc_IF_FALSE_5
mv s10, s9
pop s9, s2
bnez s10, .alloc_IF_FALSE_5
; push local 0
push s9, s2
lw s9, -0(s3)
; pop static 0
ssw s9, STATIC_Memory.s0, s1
pop s9, s2
; goto .allocIF_END_5
j .allocIF_END_5
; label .alloc_IF_FALSE_5
.alloc_IF_FALSE_5:
; push local 0
push s9, s2
lw s9, -0(s3)
; pop static 3
ssw s9, STATIC_Memory.s3, s1
pop s9, s2
; label .allocIF_END_5
.allocIF_END_5:
; #cstring " ::"
push s9, s2
la s9, DATA_Memory.d6
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
; push local 1
push s9, s2
lw s9, -4(s3)
; push constant 8
push s9, s2
li s9, 8
; add
pop s10, s2
add s9, s10, s9
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
; #cstring " Kfree "
push s9, s2
la s9, DATA_Memory.d7
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
; push static 0
push s9, s2
llw s9, STATIC_Memory.s0
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
; call TextMode.printLn 0
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call TextMode.printLn
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; push local 1
push s9, s2
lw s9, -4(s3)
; push constant 8
push s9, s2
li s9, 8
; add
pop s10, s2
add s9, s10, s9
; return
restore s2, s7, s8
ret
; 
; function Memory.deAlloc 3
.deAlloc:
push zero, s2
push zero, s2
mv s9, zero
; push argument 0
push s9, s2
lw s9, -0(s4)
; push constant 8
push s9, s2
li s9, 8
; sub
pop s10, s2
sub s9, s10, s9
; pop local 0
sw s9, -0(s3)
pop s9, s2
; #cstring "Deallocating segment at "
push s9, s2
la s9, DATA_Memory.d8
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
; push local 0
push s9, s2
lw s9, -0(s3)
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
; push constant -2
push s9, s2
li s9, -2
; eq
pop s10, s2
sub s9, s10, s9
seqz s9, s9
neg s9, s9
; not
not s9, s9
; if-goto .deAlloc_IF_FALSE_0
mv s10, s9
pop s9, s2
bnez s10, .deAlloc_IF_FALSE_0
; push static 6
push s9, s2
llw s9, STATIC_Memory.s6
; not
not s9, s9
; if-goto .deAlloc_IF_FALSE_1
mv s10, s9
pop s9, s2
bnez s10, .deAlloc_IF_FALSE_1
; push static 0
push s9, s2
llw s9, STATIC_Memory.s0
; goto .deAllocIF_END_1
j .deAllocIF_END_1
; label .deAlloc_IF_FALSE_1
.deAlloc_IF_FALSE_1:
; push static 3
push s9, s2
llw s9, STATIC_Memory.s3
; label .deAllocIF_END_1
.deAllocIF_END_1:
; pop local 2
sw s9, -8(s3)
pop s9, s2
; push local 2
push s9, s2
lw s9, -8(s3)
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
; pop local 1
sw s9, -4(s3)
pop s9, s2
; label .deAlloc_WHILE_EXP_0
.deAlloc_WHILE_EXP_0:
; push local 1
push s9, s2
lw s9, -4(s3)
; push constant 0
push s9, s2
li s9, 0
; neq
pop s10, s2
sub s9, s10, s9
snez s9, s9
neg s9, s9
; not
not s9, s9
; if-goto .deAlloc_IF_FALSE_2
mv s10, s9
pop s9, s2
bnez s10, .deAlloc_IF_FALSE_2
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
; goto .deAllocIF_END_2
j .deAllocIF_END_2
; label .deAlloc_IF_FALSE_2
.deAlloc_IF_FALSE_2:
; push constant 0
push s9, s2
li s9, 0
; label .deAllocIF_END_2
.deAllocIF_END_2:
; not
not s9, s9
; if-goto .deAllocWHILE_END_0
mv s10, s9
pop s9, s2
bnez s10, .deAllocWHILE_END_0
; push local 1
push s9, s2
lw s9, -4(s3)
; pop local 2
sw s9, -8(s3)
pop s9, s2
; push local 2
push s9, s2
lw s9, -8(s3)
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
; pop local 1
sw s9, -4(s3)
pop s9, s2
; goto .deAlloc_WHILE_EXP_0
j .deAlloc_WHILE_EXP_0
; label .deAllocWHILE_END_0
.deAllocWHILE_END_0:
; push local 2
push s9, s2
lw s9, -8(s3)
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
; push local 0
push s9, s2
lw s9, -0(s3)
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
; push local 0
push s9, s2
lw s9, -0(s3)
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
; push local 1
push s9, s2
lw s9, -4(s3)
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
; #cstring " Prev -> "
push s9, s2
la s9, DATA_Memory.d9
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
; #cstring " Segment -> "
push s9, s2
la s9, DATA_Memory.d10
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
; #cstring " Next -> "
push s9, s2
la s9, DATA_Memory.d11
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
; push local 1
push s9, s2
lw s9, -4(s3)
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
; call TextMode.printLn 0
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call TextMode.printLn
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; push local 0
push s9, s2
lw s9, -0(s3)
; push local 0
push s9, s2
lw s9, -0(s3)
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
; add
pop s10, s2
add s9, s10, s9
; push constant 8
push s9, s2
li s9, 8
; add
pop s10, s2
add s9, s10, s9
; push local 1
push s9, s2
lw s9, -4(s3)
; eq
pop s10, s2
sub s9, s10, s9
seqz s9, s9
neg s9, s9
; not
not s9, s9
; if-goto .deAlloc_IF_FALSE_3
mv s10, s9
pop s9, s2
bnez s10, .deAlloc_IF_FALSE_3
; push local 0
push s9, s2
lw s9, -0(s3)
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
; push local 0
push s9, s2
lw s9, -0(s3)
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
; push local 1
push s9, s2
lw s9, -4(s3)
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
; add
pop s10, s2
add s9, s10, s9
; push constant 8
push s9, s2
li s9, 8
; add
pop s10, s2
add s9, s10, s9
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
; push local 0
push s9, s2
lw s9, -0(s3)
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
; push local 1
push s9, s2
lw s9, -4(s3)
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
; label .deAlloc_IF_FALSE_3
.deAlloc_IF_FALSE_3:
; push local 2
push s9, s2
lw s9, -8(s3)
; push local 2
push s9, s2
lw s9, -8(s3)
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
; add
pop s10, s2
add s9, s10, s9
; push constant 8
push s9, s2
li s9, 8
; add
pop s10, s2
add s9, s10, s9
; push local 0
push s9, s2
lw s9, -0(s3)
; eq
pop s10, s2
sub s9, s10, s9
seqz s9, s9
neg s9, s9
; not
not s9, s9
; if-goto .deAlloc_IF_FALSE_4
mv s10, s9
pop s9, s2
bnez s10, .deAlloc_IF_FALSE_4
; push local 2
push s9, s2
lw s9, -8(s3)
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
; push local 2
push s9, s2
lw s9, -8(s3)
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
; push local 0
push s9, s2
lw s9, -0(s3)
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
; add
pop s10, s2
add s9, s10, s9
; push constant 8
push s9, s2
li s9, 8
; add
pop s10, s2
add s9, s10, s9
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
; label .deAlloc_IF_FALSE_4
.deAlloc_IF_FALSE_4:
; push local 2
push s9, s2
lw s9, -8(s3)
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
; push local 0
push s9, s2
lw s9, -0(s3)
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
; label .deAlloc_IF_FALSE_0
.deAlloc_IF_FALSE_0:
; #cstring " Deallocation successful "
push s9, s2
la s9, DATA_Memory.d12
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
; push static 0
push s9, s2
llw s9, STATIC_Memory.s0
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
; call TextMode.printLn 0
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call TextMode.printLn
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
; function Memory.traverse 1
.traverse:
mv s9, zero
; push static 6
push s9, s2
llw s9, STATIC_Memory.s6
; not
not s9, s9
; if-goto .traverse_IF_FALSE_0
mv s10, s9
pop s9, s2
bnez s10, .traverse_IF_FALSE_0
; push static 0
push s9, s2
llw s9, STATIC_Memory.s0
; goto .traverseIF_END_0
j .traverseIF_END_0
; label .traverse_IF_FALSE_0
.traverse_IF_FALSE_0:
; push static 3
push s9, s2
llw s9, STATIC_Memory.s3
; label .traverseIF_END_0
.traverseIF_END_0:
; pop local 0
sw s9, -0(s3)
pop s9, s2
; label .traverse_WHILE_EXP_0
.traverse_WHILE_EXP_0:
; push local 0
push s9, s2
lw s9, -0(s3)
; push constant 0
push s9, s2
li s9, 0
; neq
pop s10, s2
sub s9, s10, s9
snez s9, s9
neg s9, s9
; not
not s9, s9
; if-goto .traverseWHILE_END_0
mv s10, s9
pop s9, s2
bnez s10, .traverseWHILE_END_0
; #cstring " curr -> "
push s9, s2
la s9, DATA_Memory.d13
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
; #cstring " size -> "
push s9, s2
la s9, DATA_Memory.d14
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
; push local 0
push s9, s2
lw s9, -0(s3)
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
; #cstring " next -> "
push s9, s2
la s9, DATA_Memory.d15
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
; push local 0
push s9, s2
lw s9, -0(s3)
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
; call TextMode.printLn 0
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call TextMode.printLn
pop ra, s8
; pop temp 0
mv t0, s9
pop s9, s2
; push local 0
push s9, s2
lw s9, -0(s3)
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
; pop local 0
sw s9, -0(s3)
pop s9, s2
; goto .traverse_WHILE_EXP_0
j .traverse_WHILE_EXP_0
; label .traverseWHILE_END_0
.traverseWHILE_END_0:
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
#bank data
DATA_Memory:
.d0:
	#d32 11
	#d " target -> "
	#align 32

.d1:
	#d32 9
	#d " best -> "
	#align 32

.d2:
	#d32 2
	#d " ("
	#align 32

.d3:
	#d32 1
	#d ")"
	#align 32

.d4:
	#d32 8
	#d " new -> "
	#align 32

.d5:
	#d32 15
	#d "Found Block at "
	#align 32

.d6:
	#d32 3
	#d " ::"
	#align 32

.d7:
	#d32 7
	#d " Kfree "
	#align 32

.d8:
	#d32 24
	#d "Deallocating segment at "
	#align 32

.d9:
	#d32 9
	#d " Prev -> "
	#align 32

.d10:
	#d32 12
	#d " Segment -> "
	#align 32

.d11:
	#d32 9
	#d " Next -> "
	#align 32

.d12:
	#d32 25
	#d " Deallocation successful "
	#align 32

.d13:
	#d32 9
	#d " curr -> "
	#align 32

.d14:
	#d32 9
	#d " size -> "
	#align 32

.d15:
	#d32 9
	#d " next -> "
	#align 32

#bank bss
STATIC_Memory:
.s1: #d32 0
.s2: #d32 0
.s0: #d32 0
.s6: #d32 0
.s4: #d32 0
.s5: #d32 0
.s3: #d32 0