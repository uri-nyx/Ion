#bank text
; the timer counts down by 1 every time FREQ cycles pass (the cpu frequency), and fires when the counter is 0
; assuming 10Mhz, to set the timer to h Hz, we shall calculate:
; INTERVAL = 65535; FREQ = 150 gives a 1Hz frequency 

get_timer_dev:
    lwd     t0, STK(zero) ; this is the device addr
    addi    t0, t0, 6     ; timer is at offset 6
    ssw      t0, Ctimer_addr, t6
    ret
Ctimer_addr: #d32 0

Ctimer_interval_set:  
    push    fp, sp
    mv      fp, sp
    lw      a0, 8(fp)   ; interval
    lw      a1, 12(fp)  ; freq
    ; get timer device
    llw     t0, Ctimer_addr
    shd     a0, 2(t0)   ; write interval and engage
    sbd     a1, 5(t0)   ; write freq
    pop     fp, sp
    ret
