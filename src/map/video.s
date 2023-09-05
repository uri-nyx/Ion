video_map:
    ; video memory is only accessible to the kernel, and identity mapped
    CB_physical   = 0xe5_10_00
    VIDEO_logical = 0xe5_10_00
    li t2, 303          ; pages to map
    li t0, CB_physical
    li t1, VIDEO_logical
    .loop:
        mmu.map t0, t1, zero, (0, 0)
        addi t0, t0, 4096
        addi t1, t1, 4096
        addi t2, t2, -1
    bnez t2, .loop
