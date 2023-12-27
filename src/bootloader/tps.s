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

#ruledef {
	; DISK
	__asm_inline_disk_nop => asm {
		sbd zero, DISK_COMMAND(r __DEV_BASE_REG)
	}
	__asm_inline_disk_store => asm {
		; byte a0 is drive, 
		; half a1 is sector, 
		; half a2 is point
		sbd a0, DISK_DATA(r __DEV_BASE_REG)
		shd a1, DISK_SECTORH(r __DEV_BASE_REG)
		shd a2, DISK_POINTH(r __DEV_BASE_REG)
		li a0, DT_store
		sbd a0, DISK_COMMAND(r __DEV_BASE_REG)
	}
	__asm_inline_disk_load => asm {
		; byte a0 is drive, 
		; half a1 is sector, 
		; half a2 is point
		sbd a0, DISK_DATA(r __DEV_BASE_REG)
		shd a1, DISK_SECTORH(r __DEV_BASE_REG)
		shd a2, DISK_POINTH(r __DEV_BASE_REG)
		li a0, DT_load
		sbd a0, DISK_COMMAND(r __DEV_BASE_REG)
	}
	__asm_inline_disk_bootable => asm {
		li t0, DT_isBootable
		sbd t0, DISK_COMMAND(r __DEV_BASE_REG)
		lbd a1, DISK_STATUSL(r __DEV_BASE_REG)
		andi a0, a1, 1
	}

	; TPS
	__asm_inline_tps_nop => asm {
		sbd zero, TPS_COMMAND(r __DEV_BASE_REG)
	}
	__asm_inline_tps_store => asm {
		; byte a0 is sector, 
		; half a1 is point, 
		sbd a0, TPS_DATA(r __DEV_BASE_REG)
		shd a1, TPS_POINTH(r __DEV_BASE_REG)
		li a0, DT_store
		sbd a0, TPS_COMMAND(r __DEV_BASE_REG)
	}
	__asm_inline_tps_load => asm {
		; byte a0 is sector, 
		; half a1 is point, 
		sbd a0, TPS_DATA(r __DEV_BASE_REG)
		shd a1, TPS_POINTH(r __DEV_BASE_REG)
		li a0, DT_load
		sbd a0, TPS_COMMAND(r __DEV_BASE_REG)
	}
	__asm_inline_tps_bootable => asm {
		li t0, DT_isBootable
		sbd t0, TPS_COMMAND(r __DEV_BASE_REG)
		lbd a1, TPS_STATUSL(r __DEV_BASE_REG)
		andi a0, a1, 1
	}	
	__asm_inline_tps_open => asm {
		li t0, TPS_open
		sbd t0, TPS_COMMAND(r __DEV_BASE_REG)
	}	
	__asm_inline_tps_close => asm {
		li t0, TPS_close
		sbd t0, TPS_COMMAND(r __DEV_BASE_REG)
	}
	__asm_inline_tps_set_a => asm {
		li t0, TPS_A
		sbd t0, TPS_DATA(r __DEV_BASE_REG)
		li t0, TPS_setCurrent
		sbd t0, TPS_COMMAND(r __DEV_BASE_REG)
	}
	__asm_inline_tps_set_b => asm {
		li t0, TPS_B
		sbd t0, TPS_DATA(r __DEV_BASE_REG)
		li t0, TPS_setCurrent
		sbd t0, TPS_COMMAND(r __DEV_BASE_REG)
	}

}