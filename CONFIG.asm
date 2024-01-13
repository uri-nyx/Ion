KB    =        1024
MB    =        KB*KB

; FIRMWARE INFO SHOULD MOVE TO A HEADER
DRIVE =        0x110           ; we will store the found drive here in data
VIDEO =        0x114
STK   =        0x118

PUTS            = 0x12 
TOBIGENDIAN16   = 0x13 
CHANGEVIDEOMODE = 0x15 
TPSLOADSECTOR   = 0x16 
TPSLOADSECTORS  = 0x17 
MEMCMP          = 0x18 

; MEMORY SECTION
MEM_AVAILABLE     = 16 * MB
KERNEL_ADDR       = MEM_AVAILABLE - 200*KB
KERNEL_STACK_SIZE = 4*KB