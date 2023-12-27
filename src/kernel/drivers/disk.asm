#bank text
get_drive_dev:
    lwd     t0, DRIVE(zero) ; this is the device addr
    ssw     t0, Cdrive_addr, t6
    ret
Cdrive_addr: #d32 0
 
Ctps_load_driver:
    push    fp, sp
    mv      fp, sp
    lw      a0, 8(fp)
    lw      a1, 12(fp)
    lw      a2, 16(fp)
    llw     t0, Cdrive_addr
    sbd     a0, 1(t0)
    li      a0, 0x7
    sbd     a0, 0(t0)   ; set for the correct tps
    li      t1, __sector_buff >> 9
    shd     t1, 2(t0)   ; set to load the sector in the buffer
    sbd     a1, 1(t0)   ; set the sector to load
    li      a0, 0x2     ; the command for LOAD
    sbd     a0, 0(t0)   ; sector loaded!
    la      a0, __sector_buff
    li      a1, 512     ; the sector's lenght
    copy    a0, a2, a1  ; copy to the buffer asked in C
    li      a0, 0
    pop     fp, sp
    ret

Ctps_store_driver:
    push    fp, sp
    mv      fp, sp
    lw      a0, 8(fp)
    lw      a1, 12(fp)
    lw      a2, 16(fp)
    la      t0, __sector_buff
    li      t1, 512     ; the sector's lenght
    copy    a2, t0, t1  ; copy to the buffer asked in C
    llw     t0, Cdrive_addr
    sbd     a0, 1(t0)
    li      a0, 0x7
    sbd     a0, 0(t0)   ; set for the correct tps
    li      t1, __sector_buff >> 9
    shd     t1, 2(t0)   ; set to store the sector in the buffer
    sbd     a1, 1(t0)   ; set the sector to store
    li      a0, 0x1     ; the command for Store
    sbd     a0, 0(t0)   ; sector storeed!
    li      a0, 0
    pop     fp, sp
    ret

Cdisk_load_driver:
    push    fp, sp
    mv      fp, sp
    lw      a0, 8(fp)
    lw      a1, 12(fp)
    lw      a2, 16(fp)
    llw     t0, Cdrive_addr
    sbd     a0, 1(t0)
    li      t1, __sector_buff >> 9
    shd     t1, 4(t0)   ; set to load the sector in the buffer
    shd     a1, 2(t0)   ; set the sector to load
    li      a0, 0x2     ; the command for LOAD
    sbd     a0, 0(t0)   ; sector loaded!
    la      a0, __sector_buff
    li      a1, 512     ; the sector's lenght
    copy    a0, a2, a1  ; copy to the buffer asked in C
    li      a0, 0
    pop     fp, sp
    ret

Cdisk_store_driver:
    push    fp, sp
    mv      fp, sp
    lw      a0, 8(fp)
    lw      a1, 12(fp)
    lw      a2, 16(fp)
    la      t0, __sector_buff
    li      t1, 512     ; the sector's lenght
    copy    a2, t0, t1  ; copy to the buffer asked in C
    llw     t0, Cdrive_addr
    sbd     a0, 1(t0)
    li      t1, __sector_buff >> 9
    shd     t1, 4(t0)   ; set to store the sector in the buffer
    sbd     a1, 2(t0)   ; set the sector to store
    li      a0, 0x1     ; the command for Store
    sbd     a0, 0(t0)   ; sector storeed!
    li      a0, 0
    pop     fp, sp
    ret

#bank data
#align 512 * 8
__sector_buff: #res 512