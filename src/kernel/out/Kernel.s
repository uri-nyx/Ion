#bank text
Kernel:
.main:
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
la s9, DATA_Kernel.d0
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
call TextMode.println
pop ra, s8
mv t0, s9
li s9, 55
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call TextMode.printi
pop ra, s8
mv t0, s9
li s9, 10
restore s2, s7, s8
ret
.interrupt_handler:
push s9, s2
li s9, 0
restore s2, s7, s8
ret
;
#bank data
DATA_Kernel:
.d0:
	#d32 12
	#d "Hello World!"
	#align 32

#bank bss
STATIC_Kernel:
