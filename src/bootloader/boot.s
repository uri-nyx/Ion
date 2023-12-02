; miscellaneous
#ruledef {
    to_big_endian16 {rd: reg}, {rs: reg} => asm {
        ; rd = rs << 8 | rs >> 8
        shlli {rd}, {rs}, 8
        shrli {rs}, {rs}, 8
        or {rd}, {rd}, {rs}
        li {rs}, 0xffff
        and {rd}, {rd}, {rs}
    }

    halt => asm { j $ }
}

; Very simple bootloader for ION: loads ION at address 0x1200
#include "../drivers/tps.s"
#include "../drivers/video.s"
#bankdef boot {
    #addr 0x1000
    #size 512
    #outp 0
}

_header:
; The boot sector is loaded at address 0x1000 by the firmware
; include the FAT 12 header
#include "headerf12.s"

start:
; set up a stack frame for making syscalls
li sp, 0xff_ff_00 ; PAD with 256 bytes
li a0, 5
syscall zero, CHANGEVIDEOMODE

li a1, 0x07
la a0, ebr.volume_label
syscall zero, PUTS


; Initialization: 
; Load the kernel file, and set up paging

; reserved segment: 1 sector
; File alocation tables: 9 * 2 sectors
; Root directory: sector 19
; Data

llhu a1, bdb.sectors_per_fat
syscall zero, TOBIGENDIAN16
ssh a0, cache.sectors_per_fat, a1
llbu a1, bdb.fat_count
mul zero, a2, a0, a1   
llhu a1, bdb.reserved_sectors
syscall zero, TOBIGENDIAN16 
ssh a0, cache.reserved_sectors, a1
add a2, a0, a2 
; a2 -> LBA of root dir

; 32*number of entries
llhu a1, bdb.dir_entries_count
syscall zero, TOBIGENDIAN16
shlli t0, a0, 5

; / bytes per sector
llhu a1, bdb.bytes_per_sector
syscall zero, TOBIGENDIAN16
idiv a1, t0, t0, a0

; ceil
beqz t0, readRootDir
addi a1, a1, 1
; a1 -> sectors to read

readRootDir:
; read root directory data
; a0: LBA of root directory
; a1: number of sectors to read
; a2 <- buffer
beqz a1, .exit
mv a0, a2
la a2, buffer
syscall zero, TPSLOADSECTORS
.exit:

searchKernel:
; search for the kernel's file (KERNEL.BIN)

llhu a1, bdb.dir_entries_count
syscall zero, TOBIGENDIAN16
mv s1, a0       ; entry count
mv s2, zero     ; entries checked
la s3, buffer-32; buffer
.cmp:
la a0, Kernel.fname
addi s3, s3, 32
mv a1, s3
li a2, 11
syscall zero, MEMCMP
beqz a0, .foundKernel
addi s2, s2, 1
bltu s2, s1, .cmp ; if (checked < entry_count) loop
j .kernelNotFound ; else kernelNotFound
    
    .foundKernel:
    li  a1, 0x8f            ; white on black
    la  a0, Kernel.loading
    syscall zero, PUTS

    ; s3+26 is the first logical cluster field
    lhu a1, 26(s3)
    syscall zero, TOBIGENDIAN16
    ssh a0, Kernel.cluster, a1

    ; Load File alocation table in buffer
    llhu a0, cache.reserved_sectors
    llhu a1, cache.sectors_per_fat
    la a2, buffer
    syscall zero, TPSLOADSECTORS

    ; Load Kernel at Kernel.addr
    li s1, Kernel.addr
    .loadKernel:
        mv a2, s1
        llhu a0, Kernel.cluster
        addi a0, a0, 31
        li a1, 1
        syscall zero, TPSLOADSECTORS
        
        addi s1, s1, 512 ; bdb.bytes_per_sector

        ; get next cluster
        llhu s2, Kernel.cluster ; next cluster -> (cluster * 3)/2
        muli t0, s2, 3
        idivi t0, t0, 2

        ; load FAT+next cluster
        la t1, FAT
        add t1, t0, t1
        lhu a1, 0(t1)
        syscall zero, TOBIGENDIAN16

        andi t0, s2, 0x1
        beqz t0, ..even
        ..odd:
        shrli a0, a0, 4
        j ..nextCluster

        ..even:
        andi a0, a0, 0x0fff

        ..nextCluster:
        li t0, 0xff8
        bgeu a0, t0, ..readFinish

        ssh a0, Kernel.cluster, t0
        j .loadKernel

        ..readFinish:
        li t0, Kernel.addr
        jr t0
        halt
        
    .kernelNotFound:
    li  a1, 0x8f            ; white on black
    la  a0, Kernel.error
    syscall zero, PUTS
    halt

Kernel:
    .fname: #d "KERNEL  BIN"
    .error: #d "E"
    .loading: #d "L\0"
    .cluster: #d16 0
    .addr = KERNEL_ADDR             ; From CONFIG.asm

cache:
    .sectors_per_fat: #res 2
    .reserved_sectors: #res 2

#res (510 - ($ - _header))
#d16 0x55AA                           ; boot signature
buffer:
FAT:
