#bank text
Array:
.new:
push s9, s2
lw s9, -0(s4)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Memory.alloc
pop ra, s8
restore s2, s7, s8
ret
.dispose:
push s9, s2
lw s9, -0(s4)
mv s5, s9
lw s9, -0(s4)
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Memory.deAlloc
pop ra, s8
mv t0, s9
pop s9, s2
;! syntax error: invalid instrutction in line 25
#bank data
DATA_Array:

#bank bss
STATIC_Array:
