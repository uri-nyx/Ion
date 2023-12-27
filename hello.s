__SECTION_TEXT = 0
__SECTION_DATA = 4096
#bankdef text {
    #addr __SECTION_TEXT
    #size 4096
    #outp 0
}

#bankdef data {
    #addr __SECTION_DATA
    #size 4096
    #outp 4096 * 8
}
	#bank text

; HEADER
;  Entry, text Load addr,  n of pages, W | X
#d32 Cmain, __SECTION_TEXT, 1, 3
;  data load addr,  n of pages, W, END
#d32 __SECTION_DATA, 1, 2, 0xdeadbeef
	#bank text
	;#globl	Cmain
	#align 32
Cmain:	push	fp, sp
	mv	fp, sp
	#bank data
L2:
	#d8	"H"
	#d8	"e"
	#d8	"l"
	#d8	"l"
	#d8	"o"
	#d8	32
	#d8	"f"
	#d8	"r"
	#d8	"o"
	#d8	"m"
	#d8	32
	#d8	"a"
	#d8	"n"
	#d8	"o"
	#d8	"t"
	#d8	"h"
	#d8	"e"
	#d8	"r"
	#d8	32
	#d8	"f"
	#d8	"i"
	#d8	"l"
	#d8	"e"
	#d8	32
	#d8	40
	#d8	"b"
	#d8	"u"
	#d8	"t"
	#d8	32
	#d8	"s"
	#d8	"t"
	#d8	"i"
	#d8	"l"
	#d8	"l"
	#d8	32
	#d8	"f"
	#d8	"r"
	#d8	"o"
	#d8	"m"
	#d8	32
	#d8	"t"
	#d8	"h"
	#d8	"e"
	#d8	32
	#d8	"k"
	#d8	"e"
	#d8	"r"
	#d8	"n"
	#d8	"e"
	#d8	"l"
	#d8	41
	#d8	0
	#bank text
	la	a0, L2
	push	a0, sp
	la	a0, Cglobal_ctx
	push	a0, sp
	push	ra, sp
	trace   a0, sp, zero, zero
	call	Ctxtmod_puts
	trace	a0, a0, a0, a0
	pop	ra, sp
	addi	sp, sp, 8
	li	a0, -1
	j	L1
L1:
	pop	fp, sp
	ret
