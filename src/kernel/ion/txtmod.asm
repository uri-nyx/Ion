#bank text
V_CHARBUFFER    =  0xe5_10_00
Ccopy:
    push    fp, sp
    mv      fp, sp
    lw      a0, 8(fp)
    lw      a1, 12(fp)
    lw      a2, 16(fp)
    copy    a0, a1, a2
    pop     fp, sp
    ret

Clbud:
    push    fp, sp
    mv      fp, sp
    lw      a0, 8(fp)
    lbud    a0, 0(a0)
    pop     fp, sp
    ret