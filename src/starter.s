#include "drivers/video.s"
#include "map/sys.s"
; Here we start the kernel proper, this file sets up some
; interrupt stubs and jumps to Kernel.main, in jack.
; In the tps we have 128KB, we will reserve 64KB for code
; and 64Kb for static data, at least for now. This leaves 
; us with 384Kb for the kernel heap, the supervisor stack
; and loading system libraries & drivers.

; 64 Kb for the text section
#bankdef text {
    #addr 0xf8_00_00
    #addr_end 0xf9_00_00
    #outp 0
}

; 56 Kb for initialized data
#bankdef data {
    #addr 0xf9_00_00
    #addr_end 0xf9_e0_00
    #outp 0x1_00_00 * 8
}

; 8 Kb for uninitialized data
#bankdef bss {
    #addr 0xf9_e0_00
    #addr_end 0xfa_00_00
    #outp 0x1_e0_00 * 8
}

LIBS = 0xfa_00_00
HEAP = 0xfc_00_00
SSP  = 0xff_fb_ff

; 128 Kb are reserved for library and driver code
; The stack grows upwards from 0xff_fb_ff (1KB of padding)
; The heap grows downwards from 0xfc_00_00 (heap and stack
; are reserved a segment of 256Kb)

#bank text
; We start by setting up the stack and making a map of data
; memory to store global system variables. (in map/sys.s)
; devices:
;     .DRIVE =        0x110            
;     .VIDEO =        0x114
;     .STK   =        0x118
; memory:
;     .HEAP  =        0x11c
;     .SSP   =        0x120
;     .LIBS  =        0x124
; jack:
;     .SP    =        0x128
;     .CALLSTACK =    0x12c

li sp, SSP                  ; load supervisor stack pointer
li t0, HEAP                 ; load heap start
li t1, LIBS                 ; load libs segment
swd sp, memory.SSP(zero)    ; save ssp start in globals
swd t0, memory.HEAP(zero)   ; save heap in globals
swd t1, memory.LIBS(zero)   ; save libs in globals

; We now set up the interrupt table, and some interrupt stubs.
; The stubs clear the intterupt enable flag, pass their number
; in the stack top register (s9), following the convention of 
; the Jack programming languge, and jump to a common handler

call INITIALIZE_IVT    ; sets the isrs in a table in data mem

SP = 0xff_eb_ff

li sp, SP
int.set t5, t6
li t0, 2
priority t0, t5, t6
call Cmain

trace s9, zero, zero, t0
j $

#include "kernel/out/link.s"   ; Link the kernel in c (super crude)
#include "includes/interrupt.s"