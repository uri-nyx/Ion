__SECTION_TEXT = 0x1000
__SECTION_DATA = 0x2000
#bankdef text {
    #addr __SECTION_TEXT
    #size 0x1000
    #outp 0
}

#bankdef data {
    #addr __SECTION_DATA
    #size 0x1000
    #outp 0x1000 * 8
}
	#bank text

; struct aout_exec {
;         int a_midmag;
;         int a_text;
;         int a_data;
;         int a_bss;
;         int a_syms;
;         int a_entry;
;         int a_trsize;
;         int a_drsize;
; };

_exec_header:
;	MAGIC  TEXTSZ  DATASZ  BSS_SZ
#d32	0o314, 0x1000, 0x1000, 0x0000
;	SYMS   ENTRY   TRSIZE  DRSIZE
#d32	0x000, Cmain,  0x0000, 0x0000

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
	li	a7, 3 ; exit syscall
	syscall zero, 0x20 ; invoke syscall handler
	
