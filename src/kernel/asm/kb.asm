.text
.globl _kb_get_dev
_kb_get_dev:
    lwd     x5, 0x118(x0)
    addi    x5, x5, 12    
    sw     x5, Kb_addr, x31
    ret

.bss
.globl Kb_addr
Kb_addr: .space 4

.text
.globl kb_lwd
kb_lwd:  
    lw      x10, Ckb_addr
    lwd     x10, 0(x10)
    ret

Ckb_swd:  
    lw     x5, Ckb_addr
    swd     x12, 0(x5) 
    ret

.globl kb_setmode
kb_setmode:
    lw      x5, Kb_addr
    sbd     x12, 0(x5)  
    ret
