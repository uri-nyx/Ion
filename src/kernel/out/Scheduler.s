#bank text
Scheduler:
; function Scheduler.init 0
.init:
; push constant 0
push s9, s2
li s9, 0
; pop static 0
ssw s9, STATIC_Scheduler.s0, s1
pop s9, s2
; push constant 0
push s9, s2
li s9, 0
; pop static 1
ssw s9, STATIC_Scheduler.s1, s1
pop s9, s2
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
; function Scheduler.getNextProc 0
.getNextProc:
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
; function Scheduler.scheduler 0
.scheduler:
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
; function Scheduler.runNextProc 0
.runNextProc:
; push constant 0
push s9, s2
li s9, 0
; return
restore s2, s7, s8
ret
; 
#bank data
DATA_Scheduler:

#bank bss
STATIC_Scheduler:
.s0: #d32 0
.s1: #d32 0