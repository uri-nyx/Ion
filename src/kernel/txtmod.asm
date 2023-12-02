#bank text
V_CHARBUFFER    =  0xe5_10_00
Ctxtmod_clear:
    push    fp, sp
    mv      fp, sp
    la      a0, Ctxtmod_color_clear
    lbu     a0, 0(a0)
    li      a1, 0x20
    shlli   a0, a0, 8
    or      a0, a0, a1
    li      t0, V_CHARBUFFER
    li      t1, (80*25)
;   fill    t0, t1, a1, a2  ;TODO: allow granularity of fill
.loop:
    beqz    t1, .end
    sh      a0, 0(t0)
    addi    t0, t0, 2
    subi    t1, t1, 1
    j       .loop
.end:
    pop     fp, sp
    ret

Ctxtmod_scroll:
    push    fp, sp
    mv      fp, sp
    li      a0, V_CHARBUFFER
    li      a1, V_CHARBUFFER + 80*2
    li      t0, 80*24*2
    copy    a1, a0, t0
    la      a0, Ctxtmod_color_clear
    lbu     a0, 0(a0)
    li      a1, 0x20
    shlli   a1, a1, 8
    or      a0, a0, a1
    li      t0, V_CHARBUFFER + 80*24*2
    li      t1, 80
;   fill    t0, t1, a1, a2  ;TODO: allow granularity of fill
.loop:
    beqz    t1, .end
    sh      a0, 0(t0)
    addi    t0, t0, 2
    subi    t1, t1, 1
    j       .loop
.end:
    llbu    a0, Crow
    li      a1, 24
    ssb     a1, Crow, a0
    pop     fp, sp
    ret
