kernel_map:
    ; kernel memory is only accessible to the kernel
    KERNEL_physical = 0x2000
    KERNEL_logical = 0xf8_00_00
    li t2, 128          ; map 128 pages (512K)
    li t0, KERNEL_physical
    li t1, KERNEL_logical
    .loop:
        mmu.map t0, t1, zero, (0, 0)
        addi t0, t0, 4096
        addi t1, t1, 4096
        addi t2, t2, -1
    bnez t2, .loop