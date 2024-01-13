#bank text
Cmmu_map:
    push	fp, sp
	mv	    fp, sp
    lw      a0, 8(fp)
    lw      a1, 12(fp)
    lw      a2, 16(fp)
    lw      a3, 20(fp)
    mmu.map a0, a1, a2, a3, (0,0)
    pop fp, sp
    ret
Cmmu_unmap:
    push	fp, sp
	mv	    fp, sp
    lw      a0, 8(fp)
    lw      a1, 12(fp)
    mmu.unmap a0, a1
    pop fp, sp
    ret

C_mmu_enable:
    push	fp, sp
	mv	    fp, sp
    lw      a0, 8(fp)
    mmu.toggle a0
    ; this does not return
    pop fp, sp
    ret

C_mmu_switch:
    push	fp, sp
	mv	    fp, sp
    lw      a0, 8(fp)
    lw      a1, 12(fp)
    mmu.switch a0, a1, (0, 0)
    pop fp, sp
    ret

#bank data
Cprotected_entry: #d32 ENTER