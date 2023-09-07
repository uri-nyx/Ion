#bank text
Array:
; function Array.new 0
.new:
; push argument 0
push s9, s2
lw s9, -0(s4)
; call Memory.alloc 1
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Memory.alloc
pop ra, s8
; return
restore s2, s7, s8
ret
; 
; function Array.dispose 0
.dispose:
; push argument 0
push s9, s2
lw s9, -0(s4)
; pop pointer 0
mv s5, s9
pop s9, s2
; push argument 0
push s9, s2
lw s9, -0(s4)
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
; if-goto .dispose_IF_FALSE_0
mv s10, s9
pop s9, s2
bnez s10, .dispose_IF_FALSE_0
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; label .dispose_IF_FALSE_0
.dispose_IF_FALSE_0:
; push argument 0
push s9, s2
lw s9, -0(s4)
; call Memory.deAlloc 1
push ra, s8
save s2, s7, s8
push s9, s2
addi s4, s2, 0
subi s3, s2, 4
call Memory.deAlloc
pop ra, s8
; return
restore s2, s7, s8
ret
; 
#bank data
DATA_Array:

#bank bss
STATIC_Array:
