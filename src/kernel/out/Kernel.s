#bank text
Kernel:
.main:
mv s9, zero
push s9, s2
li s9, 0
push s9, s2
li s9, 4
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 4
subi s3, s2, 4
call TextMode.setCursor
pop ra, s8
mv t0, s9
pop s9, s2
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call TextMode.init
pop ra, s8
mv t0, s9
pop s9, s2
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call Test.main
pop ra, s8
mv t0, s9
li s9, 1
add s9, s9, gp
lw s9, 0(s9)
sw s9, -0(s3)
lw s9, -0(s3)
push ra, s8
save s2, s7, s8
subi s3, s2, 4
jalr ra, 0(s9)
pop ra, s8
mv t0, s9
li s9, 10
restore s2, s7, s8
ret
.testMem:
push zero, s2
push zero, s2
push zero, s2
push zero, s2
push zero, s2
push zero, s2
mv s9, zero
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call Memory.minit
pop ra, s8
mv t0, s9
li s9, 0
sw s9, -0(s3)
li s9, 242000
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Memory.alloc
pop ra, s8
sw s9, -4(s3)
lw s9, -0(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Sys.trace
pop ra, s8
mv t0, s9
lw s9, -4(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Memory.deAlloc
pop ra, s8
mv t0, s9
lw s9, -0(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Sys.trace
pop ra, s8
mv t0, s9
li s9, 30000
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Memory.alloc
pop ra, s8
sw s9, -8(s3)
lw s9, -0(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Sys.trace
pop ra, s8
mv t0, s9
li s9, 20000
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Memory.alloc
pop ra, s8
sw s9, -12(s3)
lw s9, -0(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Sys.trace
pop ra, s8
mv t0, s9
li s9, 20000
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Memory.alloc
pop ra, s8
sw s9, -16(s3)
lw s9, -0(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Sys.trace
pop ra, s8
mv t0, s9
li s9, 50000
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Memory.alloc
pop ra, s8
sw s9, -20(s3)
lw s9, -0(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Sys.trace
pop ra, s8
mv t0, s9
li s9, 20000
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Memory.alloc
pop ra, s8
sw s9, -24(s3)
lw s9, -0(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Sys.trace
pop ra, s8
mv t0, s9
lw s9, -16(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Memory.deAlloc
pop ra, s8
mv t0, s9
lw s9, -0(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Sys.trace
pop ra, s8
mv t0, s9
lw s9, -24(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Memory.deAlloc
pop ra, s8
mv t0, s9
lw s9, -0(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Sys.trace
pop ra, s8
mv t0, s9
lw s9, -12(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Memory.deAlloc
pop ra, s8
mv t0, s9
lw s9, -0(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Sys.trace
pop ra, s8
mv t0, s9
lw s9, -8(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Memory.deAlloc
pop ra, s8
mv t0, s9
lw s9, -0(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Sys.trace
pop ra, s8
mv t0, s9
lw s9, -20(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Memory.deAlloc
pop ra, s8
mv t0, s9
lw s9, -0(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Sys.trace
pop ra, s8
mv t0, s9
li s9, 242000
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Memory.alloc
pop ra, s8
sw s9, -4(s3)
lw s9, -0(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Sys.trace
pop ra, s8
mv t0, s9
lw s9, -4(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Memory.deAlloc
pop ra, s8
mv t0, s9
lw s9, -0(s3)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Sys.trace
pop ra, s8
mv t0, s9
li s9, 0
restore s2, s7, s8
ret
.interruptHandler:
push ra, s8
save s2, s7, s8
subi s3, s2, 4
call TextMode.printLn
pop ra, s8
mv t0, s9
la s9, DATA_Kernel.d0
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
li s9, 0
restore s2, s7, s8
ret
;! syntax error: invalid instrutction in line 336
#bank data
DATA_Kernel:
.d0:
	#d32 25
	#d "Interrupt raised. Signal "
	#align 32

#bank bss
STATIC_Kernel:
