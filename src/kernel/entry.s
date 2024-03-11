.extern _Kernel_stack, _Kernel_end
.extern _timer_get_dev
.extern _kb_get_dev
.extern _disk_get_dev
.extern _ivt_init
.extern _ion_init
.extern ion_main

.text
.globl _start
_start:
    la  x2, _Kernel_stack
    sw  x2, _Kernel_end, x5
    call _timer_get_dev
    call _kb_get_dev
    call _disk_get_dev
    call _ivt_init

    # set priority to 2
    li x7, 2
    gsreg x5
    li x6,  0xe3ffffff
    and x5, x5, x6
    shlli x7, x7, 26
    or x5, x5, x7
    ssreg x5 

    call ion_init
    j _halt

.globl _enter
_enter:
    call ion_main
    j _halt


_halt:    j _halt
