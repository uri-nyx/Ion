; This is the most minimal and barebones firmware for the Taleä system.
; It initializes the text mode and tries to boot from TPS A. On failure,
; it powers off.

drive_device = 0x110
video_device = 0x114
stk_device   = 0x118

#addr 0

; disable interrups ;TODO: make a rule for this
; supervisor, intterupt disabled, mmu disabled priority 7, ivt at 0xf800
li  a0, 0b1_0_0_111_111110_11111111_000000000000
ssreg a0

li s1, "0" ; Error code

; get the video device address
lbud a0, SYS_DEVICES(zero)   ; number of devices installed
addi a0, a0, DEV_MAP
li t0, DEV_MAP               ; the devices are registered at DEV_MAP
li t1, "V"                   ; Video device ID is 'V'
search_v:
    blt a0, t0, error.e0       ; if ndevices < index, video was not found
    lbud t2, 0(t0)
    addi t0, t0, 1
bne t1, t2, search_v

addi t0, t0, (-DEV_MAP - 1) ; found video index in table
shlli t0, t0, 4             ; mapping index to installed device (index << 4)
swd t0, video_device(zero)   ; storing the device address for bookeeping

; initialize text mode      ; the text mode is 0, so no need to issue it
V_set_mode = 0x2            ; command to set mode
V_COMMAND  = 0              ; command register    
CHARBUFFER = 0xe5_10_00
li  t1,  V_set_mode
sbd t1, V_COMMAND(t0)

; get the STK device address
li t0, DEV_MAP               ; the devices are registered at DEV_MAP
li t1, "K"                   ; Disk drive device ID is 'D'
search_s:
    blt a0, t0, error.e1       ; if ndevices < index, drive was not found
    lbud t2, 0(t0)
    addi t0, t0, 1
bne t1, t2, search_s

addi t0, t0, (-DEV_MAP - 1) ; found drive index in table
shlli t0, t0, 4             ; mapping index to installed device (index << 4)
swd t0, stk_device(zero)    ; storing the device address for bookeeping

; get the drive device address
li t0, DEV_MAP               ; the devices are registered at DEV_MAP
li t1, "D"                   ; Disk drive device ID is 'D'
search_d:
    blt a0, t0, error.e2       ; if ndevices < index, drive was not found
    lbud t2, 0(t0)
    addi t0, t0, 1
bne t1, t2, search_d

addi t0, t0, (-DEV_MAP - 1) ; found drive index in table
shlli t0, t0, 4             ; mapping index to installed device (index << 4)
swd t0, drive_device(zero)   ; storing the device address for bookeeping

; Set up the bios routines
; utility functions to read from disk and print to screen
; a very barebones BIOS

PUTS            = 0x12 * 4
TOBIGENDIAN16   = 0x13 * 4
CHANGEVIDEOMODE = 0x15 * 4
TPSLOADSECTOR   = 0x16 * 4
TPSLOADSECTORS  = 0x17 * 4
MEMCMP          = 0x18 * 4

INITIALIZE_BIOS:
	la a1, _IVT
	la a0, puts
	swd a0, PUTS(a1)
	la a0, toBigEndian16
    swd a0, TOBIGENDIAN16(a1)
	la a0, changeVideoMode
    swd a0, CHANGEVIDEOMODE(a1)
	la a0, TpsALoadSector
    swd a0, TPSLOADSECTOR(a1)
	la a0, TpsALoadSectors
    swd a0, TPSLOADSECTORS(a1)
    la a0, memcmp
    swd a0, MEMCMP(a1)

; query for bootable tps A   
D_set_current = 0x7            ; command to set tps
D_is_bootable = 0x3            ; command to query bootability
D_is_present  = 0x4            ; command to check if tps is present
D_load_sector = 0x2            ; command to load sector
D_COMMAND     = 0              ; command register               
D_DATA        = 1              ; data register               
D_POINTH      = 2              ; point register               
D_POINTL      = 3              ; point register               
D_STATUSH     = 4              ; status register               
D_STATUSL     = 5              ; status register 

li  t1,  D_set_current
sbd t1, D_COMMAND(t0)          ; Set current 0 (A)

li t1, D_is_present            ; 
sbd t1, D_COMMAND(t0)          ; test if is present
lbud t1, D_STATUSL(t0)         ; result of present (1 true)
beq  t1, zero, error.e3        ; if not present, error

li t1, D_is_bootable           ; 
sbd t1, D_COMMAND(t0)          ; test for bootability
lbud t1, D_STATUSL(t0)         ; result of bootabilty (1 true)
beq  t1, zero, error.e4       ; if not bootable, error

li t1, (0x1000 >> 9)           ; the point to load the sector (0x1000)
sbd t1, D_POINTL(t0)
sbd zero, D_DATA(t0)
li t1, D_load_sector
sbd t1, D_COMMAND(t0)          ; load sector 0 (boot sector)
lw t0, 0x1000(zero)
j 0x1000                      ; jump to boot sector


error:
.e4:
    addi s1, s1, 1
.e3:
    addi s1, s1, 1
.e2:
    addi s1, s1, 1
.e1:
    addi s1, s1, 1
    li   t0, CHARBUFFER
    sb   s1, 0(t0)
.e0: 
    trace s1, zero, zero, zero

poweroff:
j $
sbd zero, SYS_POWER(zero)      ; power off the system

; prints rich text
; a0: *char (null terminated str)
; a1: char  (colors to use)
puts:
    COLS = 80
    li  t1, CHARBUFFER       ; load charbuffer address
    lw  t2, cursor(zero)       ; load cursor position
    add t1, t2, t1             ; get position in charbuffer
    .loop:
    lbu  t0, 0(a0)             ; load char from string
    beqz t0, .end              ; if == 0, end printing
    li   t2, "\n"              ; test for newline
    beq  t0, t2, .nl           ; print newline
    li   t2, "\r"              ; test for cr
    beq  t0, t2, .cr           ; print cr
    sb   t0, 0(t1)             ; else send it to charbuffer
    sb   a1, 1(t1)             ; send the color and blink config
    addi t1, t1, 2             ; inc cursor
    .continue:
    addi a0, a0, 1             ; inc str address
    j .loop
    .end:
    li  t2, CHARBUFFER       ; update cursor new position
    sub t1, t1, t2
    sw  t1, cursor(zero)
    sysret
    
    ; special characters
    .nl:                        ; add 80*2 to cursor (a row)
    addi t1, t1, COLS*2
    j .continue
    .cr:                        ; (cursor / (80*2))*80*2
    idivi t1, t1, COLS*2
    muli  t1, t1, COLS*2
    j .continue

cursor: #d32 0

; returns the big endian of a 16 bit number in a0
; a0: short (the destination)
; a1: short (the number to convert)
toBigEndian16:
    shlli a0, a1, 8
    shrli a1, a1, 8
    or a0, a0, a1
    li a1, 0xffff
    and a0, a0, a1
    sysret

; changes the video mode
; a0: char (new video mode)
changeVideoMode:
; change video mode to combined text and graphics
    lwd t0, video_device(zero)
    sbd a0, V_DATAH(t0)
    li a0, V_setmode
    sbd a0, V_COMMAND(t0)
    sysret

; loads a sector from tps
; a0: char  (sector)
; a1: short (point to load in)
TpsALoadSector:
    lwd t0, drive_device(zero)
    sbd a0, TPS_DATA(t0)
    shd a1, TPS_POINTH(t0)
    li a0, TPS_load
    sbd a0, TPS_COMMAND(t0)
    sysret

; loads a sectors from tps
; a0: char  (start sector)
; a1: char  (number of sectors)
; a2: void* (buffer to load in (aligned to 512 bytes))
TpsALoadSectors:
    beqz a1, .end
    lwd t0, drive_device(zero)
    shrli a2, a2, 9
    addi a1, a1, -1
    li t1, TPS_load

    .again:
    sbd a0, TPS_DATA(t0)
    shd a2, TPS_POINTH(t0)
    sbd t1, TPS_COMMAND(t0)
    beqz a1, .end
    addi a2, a2, 1
    addi a0, a0, 1
    addi a1, a1, -1
    j .again

    .end:
    sysret

; compare two buffers of equal length
; a0: void*  (buffer 1)
; a1: void*  (buffer 2)
; a2: int    (length)
; a0 -> return (0 on success, n of different bytes otherwhise)
memcmp:
    lbu t0, 0(a0)
    lbu t1, 0(a1)
    bne t0, t1, .end
    addi a2, a2, -1
    addi a0, a0, 1
    addi a1, a1, 1
    bnez a2, memcmp

    .end:
    mv a0, a2
    sysret



; Registers
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

; TPS Registers
TPS_COMMAND = 0x00
TPS_DATA    = 0x01
TPS_POINTH  = 0x02
TPS_POINTL  = 0x03
TPS_STATUSH = 0x04
TPS_STATUSL = 0x05
TPS_A = 0
TPS_B = 1

TPS_nop         = 0x00
TPS_store       = 0x01
TPS_load        = 0x02
TPS_isBootable  = 0x03
TPS_isPresent   = 0x04
TPS_open        = 0x05
TPS_close       = 0x06
TPS_setCurrent  = 0x07
TPS_Size        = 0x08