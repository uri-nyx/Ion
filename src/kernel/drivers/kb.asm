#bank text
; Functions to work with the keyboard

get_kb_dev:
    lwd     t0, STK(zero) ; this is the device addr
    addi    t0, t0, 12     ; kb is at offset 12
    ssw      t0, Ckb_addr, t6
    ret
Ckb_addr: #d32 0

Ckb_lwd:  
    push    fp, sp
    mv      fp, sp
    llw     a0, Ckb_addr
    lwd     a0, 0(a0)    ; return a raw word with the packed data
    pop     fp, sp
    ret

Ckb_swd:  
    push    fp, sp
    mv      fp, sp
    lw      a0, 8(fp)
    llw     a1, Ckb_addr
    swd     a0, 0(a1)    ; store the word
    pop     fp, sp
    ret

Ckb_setmode:
    push    fp, sp
    mv      fp, sp
    lw      a0, 8(fp)
    llw     t0, Ckb_addr
    sbd     a0, 0(t0)  
    pop     fp, sp
    ret