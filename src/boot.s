; Very simple bootloader for ION: loads ION at address 0x1200
#include "drivers/tps.s"
#include "drivers/video.s"
DRIVE =        0x110           ; we will store the found drive here in data
VIDEO =        0x114
STK   =        0x118

#bankdef boot {
    #addr 0x1000
    #size 512
    #outp 0
}

; The boot sector is loaded at address 0x1000 by the firmware
start:
; change video mode to combined text and graphics
lwd t0, VIDEO(zero)
li t1, 0x5              ; combined mode
sbd t1, V_DATAH(t0)
li t1, V_setmode
sbd t1, V_COMMAND(t0)

li  a1, 0x8f            ; white on black
la  a0, loading_msg
call puts

lwd s1, DRIVE(zero)
li t2, 0x2000
li t3, 256                      ; we'll load 255 sectors 
li t4, 1                        ; sector in which we'll start
loading:
    shrli t1, t2, 9                ; the point to load the sector
    shd t1, TPS_POINTH(s1)
    sbd t4, TPS_DATA(s1)           ; the sector to load
    li t1, TPS_load
    sbd t1, TPS_COMMAND(s1)        ; load sector
    addi t2, t2, 512               ; increment point by sector size
    addi t4, t4, 1                 ; next sector
blt  t4, t3, loading


li  a1, 0x0f            ; white on black
la  a0, loaded_msg
call puts

init:
    li a0, 80*2
    sw a0, cursor(zero)
    li a1, 0x0f            ; white on black
    la a0, greeting
    call puts
    li a0, 160*2
    li  a1, 0x8f            ; white on black blinking
    sw a0, cursor(zero)
    la a0, greeting2
    call puts


    ; setup paging
    ; The kernel will be mapped in the higher half of RAM: from 0xf8_00_00 to 0xff_ff_ff (512 K)
    ; The video memory will be (identity) mapped just below the kernel: from 0xe5_10_00 to 0x80_00_00 (1212 K)
    #include "map/video.s"
    #include "map/kernel.s"
    ; enable mmu
    li t0, 0xf8_00_00 ;kernel entry point (logical)
    mmu.toggle t0

puts:
    li  t1, V_CHARBUFFER       ; load charbuffer address
    lw  t2, cursor(zero)       ; load cursor position
    add t1, t2, t1             ; get position in charbuffer
    .loop:
    lbu  t0, 0(a0)             ; load char from string
    beqz t0, .end              ; if == 0, end printing
    sb   t0, 0(t1)             ; else send it to charbuffer
    sb   a1, 1(t1)             ; send the color and blink config
    addi t1, t1, 2             ; inc cursor
    addi a0, a0, 1             ; inc str address
    j .loop
    .end:
    li  t2, V_CHARBUFFER       ; update cursor new position
    sub t1, t1, t2
    sw  t1, cursor(zero)
    ret

cursor: #d32 0

loading_msg: #d "Loading ION kernel... \0"
loaded_msg:  #d "kernel loaded succesfully at 0x2000\0"
greeting: #d "In the name of His Highness, the Prince of Talandel, I present:\0"
greeting2: #d "           The ION System Executive Program\0"
#res (510 - ($ - start))
#d16 0x55AA                            ; boot signature