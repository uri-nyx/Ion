#bank text
Test:
.main:
mv s9, zero
push s9, s2
li s9, 0
add s9, s9, gp
lw s9, 0(s9)
sw s9, -0(s3)
la s9, TextMode.print
ssw s9, STATIC_Test.s0, s1
la s9, TextMode.printInt
ssw s9, STATIC_Test.s1, s1
la s9, TextMode.printLn
ssw s9, STATIC_Test.s2, s1
llw s9, STATIC_Test.s3
addi s9, s9, 0
push s9, s2
li s9, 57005
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
llw s9, STATIC_Test.s3
addi s9, s9, 4
push s9, s2
li s9, 10
mv t0, s9
pop s9, s2
mv s6, s9
mv s9, t0
sw s9, 0*4(s6)
li s9, 1
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Test.__private_yesno
pop ra, s8
mv t0, s9
li s9, 0
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Test.__private_yesno
pop ra, s8
mv t0, s9
llw s9, STATIC_Test.s3
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Test.__private_printPoint
pop ra, s8
mv t0, s9
llw s9, STATIC_Test.s1
push s9, s2
lw s9, -0(s3)
push ra, s8
save s2, s7, s8
push s9, s2
lw t0, 4(s2)
addi s4, s2, 0
subi s3, s2, 4
jalr ra, 0(t0)
pop ra, s8
mv t0, s9
li s9, 1
mv t1, s9
la s9, Test.exported
add s10, t1, gp
sw s9, 0(s10)
addi t1, t1, 4
push s9, s2
li s9, 0
restore s2, s7, s8
ret
.__private_yesno:
push s9, s2
lw s9, -0(s4)
subi s9, s9, 1
snez s9, s9
addi s9, s9, -1
not s9, s9
mv s10, s9
pop s9, s2
bnez s10, .__private_yesno_IF_FALSE_0
push s9, s2
la s9, DATA_Test.d1
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.print
pop ra, s8
mv t0, s9
pop s9, s2
j .__private_yesnoIF_END_0
.__private_yesno_IF_FALSE_0:
push s9, s2
la s9, DATA_Test.d2
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.print
pop ra, s8
mv t0, s9
pop s9, s2
.__private_yesnoIF_END_0:
push s9, s2
li s9, 0
restore s2, s7, s8
ret
.__private_printPoint:
push s9, s2
la s9, DATA_Test.d3
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.print
pop ra, s8
mv t0, s9
li s9, 49153
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Sys.trace
pop ra, s8
mv t0, s9
llw s9, STATIC_Test.s1
push s9, s2
lw s9, -0(s4)
addi s9, s9, 0
mv s6, s9
lw s9, 0*4(s6)
push ra, s8
save s2, s7, s8
push s9, s2
lw t0, 4(s2)
addi s4, s2, 0
subi s3, s2, 4
jalr ra, 0(t0)
pop ra, s8
mv t0, s9
llw s9, STATIC_Test.s0
push s9, s2
la s9, DATA_Test.d4
push ra, s8
save s2, s7, s8
push s9, s2
lw t0, 4(s2)
addi s4, s2, 0
subi s3, s2, 4
jalr ra, 0(t0)
pop ra, s8
mv t0, s9
llw s9, STATIC_Test.s1
push s9, s2
lw s9, -0(s4)
addi s9, s9, 4
mv s6, s9
lw s9, 0*4(s6)
push ra, s8
save s2, s7, s8
push s9, s2
lw t0, 4(s2)
addi s4, s2, 0
subi s3, s2, 4
jalr ra, 0(t0)
pop ra, s8
mv t0, s9
llw s9, STATIC_Test.s2
push ra, s8
save s2, s7, s8
subi s3, s2, 4
jalr ra, 0(s9)
pop ra, s8
mv t0, s9
li s9, 0
restore s2, s7, s8
ret
.exported:
push s9, s2
la s9, DATA_Test.d5
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.print
pop ra, s8
mv t0, s9
li s9, 0
restore s2, s7, s8
ret
;! syntax error: invalid instrutction in line 180
#bank data
DATA_Test:
.d0:
	#res 8
	#align 32

.d1:
	#d32 5
	#d "yes! "
	#align 32

.d2:
	#d32 4
	#d "no! "
	#align 32

.d3:
	#d32 3
	#d "X: "
	#align 32

.d4:
	#d32 4
	#d " Y: "
	#align 32

.d5:
	#d32 20
	#d "Exported from Test! "
	#align 32

#bank bss
STATIC_Test:
.s3: #d32 DATA_Test.d0
.s0: #d32 0
.s1: #d32 0
.s2: #d32 0