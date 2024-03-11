.text
.globl _timer_get_dev
_timer_get_dev:
    lwd     x5, 0x118(x0) # this is the device addr
    addi    x5, x5, 6       # timer is at offset 6
    sw      x5, Timer_addr, x31
    ret

.globl timer_interval_set
timer_interval_set:  
    addi    x2,x2,-32
    sw      x8,28(x2)
    addi    x8,x2,16
    # get timer device
    lw      x5, Timer_addr
    shd     x12, 2(x5)   # write interval and engage
    sbd     x13, 5(x5)   # write freq
    lw  x8,28(x2)
    addi  x2,x2,32
    jalr x0,0(x1)

.bss
.globl Timer_addr
.align 4
Timer_addr: .space 4
