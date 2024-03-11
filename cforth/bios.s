_start:
        li  x10, 3421499392
        ssreg x10                ; supervisor, intterupt enabled, mmu disabled
                                ; priority 2, ivt at 0xf800, pdt at 0xff00
        jal x1, INITIALIZE_IVT

        li x10, 0
        sbd x10, 0x11(x0)
        li x5, 2
        sbd x5, 0x10(x0)
        sbd x0, 12(x0)
        li x2, 0xf8f000                   ; Set the stack pointers to the values

;-----------------------------------------------------------------------------
; Jump to the location of the start of Itsy's initialization code.'
;-----------------------------------------------------------------------------
		call txtmod_init
		la x12, welcome_msg
		call tell
		call main
		la x12, exit_msg
		call tell
halt: 
		j halt
.data
welcome_msg: 
	.asciz "Loading lbForth for the Tale", 228," System.", 10
	.asciz "Source at https://gist.github.com/lbruder/10007431", 10, 9
	.asciz "Aiya E", 228
	.asciz "rendil El", 233
	.asciz "nion Anc", 225
	.asciz "lima", 10, 0
.align 4
exit_msg: 
	.asciz "Exiting FORTH system. F1 to restart. F2 to coredump. BYE!", 0
.align 4
.text
;------------------------------------------------------------------------------
; Utility BIOS routines in Assembly
;------------------------------------------------------------------------------

.extern hw_copy
hw_copy:
	copy x12, x13, x14
	ret

# unsigned short hw_lhud(unsigned short address);
.extern hw_lhud
hw_lhud:
	lhud x10, 0(x12)
	ret

# byte hw_lbud(unsigned short address);
.extern hw_lbud
hw_lbud:
	lbud x10, 0(x12)
	ret

# void hw_shd(unsigned short address, unsigned short value);
.extern hw_shd
hw_shd:
	shd x13, 0(x12)
	ret

# void hw_sbd(unsigned short address, byte value);
.extern hw_sbd
hw_sbd:
	sbd x13, 0(x12)
	ret

.extern hw_call
hw_call:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)

	jalr x1, 0(x12)

	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	ret

.extern _trace
_trace:
	trace x12, x0, x0, x0
	ret

.extern _trace_ra
_trace_ra:
	trace x1, x0, x0, x0
	ret

.extern _check
_check:
	lw x10, 0(x12)
	trace x12, x10, x0, x0
	ret

.extern _getchar
_getchar:                        ; This headerless routine polls the keyboard until input is available 
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)

        gc_wait:
                lbud    x10, 0x202(x0)     ; last chax1cter by interrupt (0 if none)
                beq x0,    x10, gc_wait
        sbd     x0, 0x202(x0)
        # addi    x5, x5, -1          ; update pointer
        # sbd     x5, 0x200(x0)


	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
        ret  

; A minimal bios implementing the most basic ISR's¡'
; and a simple disk and screen interface
# Exceptions
# IVT_RESET =  (             0x00 * 4) 
# IVT_BUS_ERROR          =  (0x02 * 4) 
# IVT_ADDRESS_ERROR =  (      0x03 * 4) 
# IVT_ILLEGAL_INSTRUCTION =  (0x04 * 4) 
# IVT_DIVISION_ZERO =  (      0x05 * 4) 
# IVT_PRIVILEGE_VIOLATION =  (0x06 * 4) 
# IVT_PAGE_FAULT =  (         0x07 * 4) 
# IVT_ACCESS_VIOLATION =  (   0x08 * 4) 

# # Interrupts
# IVT_TTY_TRANSMIT =  (       0x0a * 4) 
# IVT_KBD_CHARACTER =  (      0x0b * 4) 
# IVT_KBD_SCANCODE =  (       0x0c * 4) 
# IVT_TPS_LOAD_FINISHED =  (  0x0d * 4) 
# IVT_DISK_LOAD_FINISHED =  ( 0x0e * 4) 
# IVT_TIMER_TIMEOUT = 	( 0x0f * 4) 
# IVT_TIMER_INTERVAL =  (	 0x10 * 4) 
# IVT_VIDEO_REFRESH = 	( 0x11 * 4) 

; Interrupt Service Routines:
INITIALIZE_IVT:
    li x11, 0xf800
    la x10, ISR_TTY_TRANSMIT
    swd x10, 0xa*4(x11)
    la x10, ISR_KBD_CHARACTER
    swd x10, 0xb*4(x11)
    la x10, ISR_RESET
    swd x10, 0(x11)
    la x10, ISR_BUS_ERROR
    swd x10, 8(x11)
    la x10, ISR_ADDRESS_ERROR
    swd x10, 12(x11)
    la x10, ISR_ILLEGAL_INSTRUCTION
    swd x10, 16(x11)
    la x10, ISR_DIVISION_ZERO
    swd x10, 20(x11)
    la x10, ISR_PRIVILEGE_VIOLATION
    swd x10, 24(x11)
    la x10, ISR_PAGE_FAULT
    swd x10, 28(x11)
    la x10, ISR_ACCESS_VIOLATION
    swd x10, 32(x11)
    la x10, ISR_KBD_SCANCODE
    swd x10, 48(x11)
    la x10, ISR_TPS_LOAD_FINISHED
    swd x10, 52(x11)
    la x10, ISR_DISK_LOAD_FINISHED
    swd x10, 56(x11)
    la x10, ISR_TIMER_TIMEOUT
    swd x10, 60(x11)
    la x10, ISR_TIMER_INTERVAL
    swd x10, 64(x11)
    la x10, ISR_VIDEO_REFRESH
    swd x10, 68(x11)
    ret

ISR_TTY_TRANSMIT:               ; The tty interrupt will not be used, as the outer interpreter relies on polling
	sysret

ISR_RESET:                      ; The reset interrupt will jump to ABORT when fired
    sysret

ISR_BUS_ERROR:

	j ISR_RESET


ISR_ADDRESS_ERROR:

	j ISR_RESET

ISR_ILLEGAL_INSTRUCTION:

	j ISR_RESET

ISR_DIVISION_ZERO:
	j ISR_RESET


ISR_PRIVILEGE_VIOLATION:
	j ISR_RESET


ISR_PAGE_FAULT:
	j ISR_RESET


ISR_ACCESS_VIOLATION:
	j ISR_RESET


ISR_KBD_CHARACTER:
	cli
	swd x5, 0x400(x0)
	swd x6, 0x404(x0)
	swd x29, 0x408(x0)
	lbud x5, 0x200(x0) ; pointer to kbd buffer
	lbud x6, 13(x0)    ; chax1cter port?
	li x29, 128
	bge x6, x29, nostore # don't store keypresses not in ASCII, workaround
	li x29, 3
	beq x29, x6, nostore # don't store ALT keypress, workaround
	li x29, 9
	beq x29, x6, nostore # don't store TAB keypress, workaround
	sbd  x6, 0x202(x0) ; update also the last chax1cter var
	sbd  x6, 0x204(x5) ; the buffer is at offset 0x204
	addi x5, x5, 1
	sbd  x5, 0x200(x0)
	nostore:
	lwd x5, 0x400(x0)
	lwd x6, 0x404(x0)
	lwd x29, 0x408(x0)
	sti
	sysret

ISR_KBD_SCANCODE:
	sysret			; TODO: change this

ISR_TPS_LOAD_FINISHED:
	sysret			; TODO: change this

ISR_DISK_LOAD_FINISHED:
	sysret			; TODO: change this

ISR_TIMER_TIMEOUT:
	trace x0, x0, x0, x0
	sysret
	; this isr's shall be defined by the OS

ISR_TIMER_INTERVAL:
	trace x0, x0, x0, x0
	sysret
	; this isr's shall be defined by the OS

ISR_VIDEO_REFRESH:
	trace x0, x0, x0, x0
	sysret
	; this isr's shall be defined by the OS
