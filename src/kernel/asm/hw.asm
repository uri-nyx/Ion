.text

.globl hw_copy
hw_copy:
    addi x2,x2,-32
    sw  x8,28(x2)
    addi  x8,x2,16
    copy    x12, x13, x14
    lw  x8,28(x2)
    addi  x2,x2,32
    ret

.globl hw_trace
hw_trace:
    addi x2,x2,-32
    sw  x8,28(x2)
    addi  x8,x2,16
    trace    x12, x0, x0, x0
    lw  x8,28(x2)
    addi  x2,x2,32
    ret

.globl hw_mmu_map
hw_mmu_map:
    mmu.map x12, x12, x13, x14, 0, 0
    ret

.globl hw_mmu_unmap
hw_mmu_unmap:
    mmu.unmap x12, x13
    ret

.globl hw_mmu_enable
hw_mmu_enable:
    mmu.toggle x12
    # this does not return
    ret

.globl hw_mmw_switch
hw_mmu_switch:
    mmu.switch x12, x13, 0, 0
    ret

.globl hw_sbd
hw_sbd:
    sbd x12, 0(x13)
    ret

.globl hw_shd
hw_shd:
    shd x12, 0(x13)
    ret

.globl hw_swd
hw_swd:
    swd x12, 0(x13)
    ret

.globl hw_lbud
hw_lbud:
    lbud x10, 0(x12)
    ret

.globl hw_lbd
hw_lbd:
    lbd x10, 0(x12)
    ret

.globl hw_lhud
hw_lhud:
    lhud x10, 0(x12)
    ret

.globl hw_lhd
hw_lhd:
    lhd x10, 0(x12)
    ret

.globl hw_lwd
hw_lwd:
    lwd x10, 0(x12)
    ret

.globl hw_set_priority
hw_set_priority:
    gsreg x5
    li x6,  0xe3ffffff
    and x5, x5, x6
    shlli x12, x12, 26
    or x5, x5, x12
    ssreg x5 
    ret

.globl hw_interrupt_enable
hw_interrupt_enable:
    sti
    ret

.globl hw_interrupt_disable
hw_interrupt_disable:
    cli
    ret
