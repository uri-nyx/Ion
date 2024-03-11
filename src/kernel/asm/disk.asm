.text

.globl _disk_get_dev
_disk_get_dev:
    lwd     x5, 0x110(x0) # this is the device addr
    sw      x5, Disk_addr, x31
    ret

.bss
.globl Disk_addr
Disk_addr: .space 4
.align 512
__sector_buff: .space 512
  
.text
.globl tps_load_driver
tps_load_driver:
    lw      x5, Disk_addr
    sbd     x12, 1(x5)
    li      x12, 0x7
    sbd     x12, 0(x5)   # set for the correct tps
    la      x6, __sector_buff
    shrli      x6, x6, 9
    shd     x6,  2(x5)   # set to load the sector in the buffer
    sbd     x13, 1(x5)   # set the sector to load
    li      x12, 0x2     # the command for LOAD
    sbd     x12, 0(x5)   # sector loaded!
    la      x12, __sector_buff
    li      x13, 512     # the sector's lenght
    copy    x12, x14, x13 # copy to the buffer asked in C
    ret

.globl tps_store_driver
tps_store_driver:
    la      x5, __sector_buff
    li      x6, 512     # the sector's lenght
    copy    x14, x5, x6 # copy to the buffer asked in C
    lw      x5, Cdrive_addr
    sbd     x12, 1(x5)
    li      x12, 0x7
    sbd     x12, 0(x5)  # set for the correct tps
    la      x6, __sector_buff
    shrli      x6, x6, 9
    shd     x6, 2(x5)   # set to store the sector in the buffer
    sbd     x13, 1(x5)  # set the sector to store
    li      x12, 0x1    # the command for Store
    sbd     x12, 0(x5)  # sector stored!
    ret

.globl hcs_load_driver
hcs_load_driver:
    lw     x5,  Disk_addr
    sbd     x12, 1(x5)
    la      x6, __sector_buff
    shrli      x6, x6, 9
    shd     x6, 4(x5)    # set to load the sector in the buffer
    shd     x13, 2(x5)   # set the sector to load
    li      x12, 0x2     # the command for LOAD
    sbd     x12, 0(x5)   # sector loaded!
    la      x12, __sector_buff
    li      x13, 512        # the sector's lenght
    copy    x12, x14, x13   # copy to the buffer asked in C
    ret

.globl hcs_store_driver
hcs_store_driver:
    la      x5, __sector_buff
    li      x6, 512      # the sector's lenght
    copy    x14, x5, x6  # copy to the buffer asked in C
    lw     x5, Disk_addr
    sbd     x12, 1(x5)
    la      x6, __sector_buff
    shrli      x6, x6, 9
    shd     x6, 4(x5)    # set to store the sector in the buffer
    sbd     x13, 2(x5)   # set the sector to store
    li      x12, 0x1     # the command for Store
    sbd     x12, 0(x5)   # sector stored!
    ret
