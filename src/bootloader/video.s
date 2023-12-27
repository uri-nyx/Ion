; Registers
V_COMMAND =  0x0
V_DATAH   =  0x1
V_DATAM   =  0x2
V_DATAL   =  0x3
V_GPU0    =  0x4
V_GPU1    =  0x5
V_GPU2    =  0x6
V_GPU3    =  0x7
V_GPU4    =  0x8
V_GPU5    =  0x9
V_GPU6    =  0xa
V_GPU7    =  0xb
V_STATUS0 =  0xc
V_STATUS1 =  0xd
V_STATUS2 =  0xe
V_STATUS3 =  0xf

; Commands
V_nop           = 0x0
V_clear         = 0x1
V_setmode       = 0x2
V_setfont       = 0x4
V_blit          = 0x6
V_setfb         = 0x7
V_setvblank     = 0x8
V_loadfont      = 0x9
V_loadpalette   = 0xa
V_setbg         = 0xb
V_setfg         = 0xc
V_clearregs     = 0xd

V_CHARBUFFER    =  0xe5_10_00
V_FRAMEBUFFER   =  0xe5_30_00