# The assembler is not capable of guaranteeing the alignment of a block,
# so I'll use a high enough block below the charbuffer (CHARBUFFER - 1024)


.text
.globl tps_load_driver
tps_load_driver:
    push    x5, x2
    push    x6, x2

    li      x5, 0x20
    sbd     x12, 1(x5)
    li      x12, 0x7
    sbd     x12, 0(x5)   # set for the correct tps
    li      x6,  0xe51000 - 1024
    shrli      x6, x6, 9
    shd     x6,  2(x5)   # set to load the sector in the buffer
    sbd     x13, 1(x5)   # set the sector to load
    li      x12, 0x2     # the command for LOAD
    sbd     x12, 0(x5)   # sector loaded!
    li      x12,  0xe51000 - 1024
    li      x13, 512     # the sector's lenght
    copy    x12, x14, x13 # copy to the buffer asked in C
    pop    x5, x2
    pop    x6, x2
    ret

.globl tps_store_driver
tps_store_driver:
    push    x5, x2
    push    x6, x2
    li      x5,  0xe51000 - 1024
    li      x6, 512     # the sector's lenght
    copy    x14, x5, x6 # copy to the buffer asked in C
    li      x5, 0x20
    sbd     x12, 1(x5)
    li      x12, 0x7
    sbd     x12, 0(x5)  # set for the correct tps
    li      x6,  0xe51000 - 1024
    shrli      x6, x6, 9
    shd     x6, 2(x5)   # set to store the sector in the buffer
    sbd     x13, 1(x5)  # set the sector to store
    li      x12, 0x1    # the command for Store
    sbd     x12, 0(x5)  # sector stored!
    pop    x5, x2
    pop    x6, x2
    ret

.globl hcs_load_driver
hcs_load_driver:
    push    x5, x2
    push    x6, x2
    li     x5,  0x20
    sbd     x12, 1(x5)
    li      x6,  0xe51000 - 1024
    shrli      x6, x6, 9
    shd     x6, 4(x5)    # set to load the sector in the buffer
    shd     x13, 2(x5)   # set the sector to load
    li      x12, 0x2     # the command for LOAD
    sbd     x12, 0(x5)   # sector loaded!
    li      x12,  0xe51000 - 1024
    li      x13, 512        # the sector's lenght
    copy    x12, x14, x13   # copy to the buffer asked in C
    pop    x5, x2
    pop    x6, x2
    ret

.globl hcs_store_driver
hcs_store_driver:
    push    x5, x2
    push    x6, x2
    li      x5,  0xe51000 - 1024
    li      x6, 512      # the sector's lenght
    copy    x14, x5, x6  # copy to the buffer asked in C
    li     x5, 0x20
    sbd     x12, 1(x5)
    li      x6,  0xe51000 - 1024
    shrli      x6, x6, 9
    shd     x6, 4(x5)    # set to store the sector in the buffer
    sbd     x13, 2(x5)   # set the sector to store
    li      x12, 0x1     # the command for Store
    sbd     x12, 0(x5)   # sector stored!
    pop    x5, x2
    pop    x6, x2
    ret
