#bank text
Scheduler:
.init:
push s9, s2
li s9, 0
ssw s9, STATIC_Scheduler.s0, s1
li s9, 0
ssw s9, STATIC_Scheduler.s1, s1
li s9, 0
restore s2, s7, s8
ret
.getNextProc:
push s9, s2
li s9, 0
restore s2, s7, s8
ret
.scheduler:
push s9, s2
li s9, 0
restore s2, s7, s8
ret
.runNextProc:
push s9, s2
li s9, 0
restore s2, s7, s8
ret
;! syntax error: invalid instrutction in line 23
#bank data
DATA_Scheduler:

#bank bss
STATIC_Scheduler:
.s0: #d32 0
.s1: #d32 0