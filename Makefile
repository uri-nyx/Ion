UTIL=utils
AS=customasm $(UTIL)/asm/master.asm $(UTIL)/asm/sys.asm CONFIG.asm
LD=python3 $(UTIL)/link.py
SCCDIR=$(UTIL)/scc
SCC=$(SCCDIR)/cc
SCCFLAGS= -Sv
LIBS= $(SCCDIR)/lib
SECTIONALIGN=4096
SRC=src
BUILD=build

all: clean tps_image load run

# Run
run: load
	cd emu && ./TaleaZ -f minimal.bin -z 1 --scale=2

# Load into tps
load: tps_image
	cp $(BUILD)/ion.img emu/dev/tps/A

# TPS image (FAT12)
tps_image: $(BUILD)/ion.img
$(BUILD)/ion.img: bootloader kernel
	dd if=/dev/zero of=$(BUILD)/ion.img bs=512 count=256
	mkfs.fat -F 12 -n "ION SYSTEM" $(BUILD)/ion.img
	dd if=$(BUILD)/bootloader.bin of=$(BUILD)/ion.img conv=notrunc
	mcopy -i $(BUILD)/ion.img $(BUILD)/kernel.bin "::kernel.bin"

# Bootloader
bootloader: $(BUILD)/bootloader.bin
$(BUILD)/bootloader.bin:
	$(AS) $(SRC)/bootloader/boot.s -f binary -o $(BUILD)/bootloader.bin

# Kernel
kernel: $(BUILD)/kernel.bin
$(BUILD)/kernel.bin: $(SRC)/kernel/kernel.asm $(SRC)/kernel/entry.asm
	$(LD) $(SECTIONALIGN) $(SRC)/kernel/entry.asm $(SRC)/kernel/int.asm $(SRC)/kernel/timer.asm \
	$(SRC)/kernel/kb.asm $(SRC)/kernel/kernel.asm $(SRC)/kernel/txtmod.asm $(SRC)/kernel/paging.asm $(LIBS)/libk.asm
	$(AS) linker.out -pf symbols | grep '^__text_size\|^__data_size\|^__data_start\|^__bss_size\|^__bss_start' | cat - $(SRC)/kernel/linker.ln > link.s
	sed -i -E '/__text_size|__data_size|__data_start|__bss_size|__bss_start/d' linker.out
	sed -i 's/;bank/#bank/g' linker.out
	sed -i '/#align $(SECTIONALIGN)/d' linker.out
	$(AS) link.s linker.out -f binary -o $(BUILD)/kernel.bin
	rm link.s
	rm linker.out

symbols: $(SRC)/kernel/kernel.asm $(SRC)/kernel/entry.asm
	$(LD) $(SECTIONALIGN) $(SRC)/kernel/entry.asm $(SRC)/kernel/int.asm $(SRC)/kernel/timer.asm $(SRC)/kernel/kernel.asm $(SRC)/kernel/txtmod.asm $(LIBS)/libk.asm
	$(AS) linker.out -pf symbols | grep '^__text_size\|^__data_size\|^__data_start\|^__bss_size\|^__bss_start' | cat - $(SRC)/kernel/linker.ln > link.s
	sed -i -E '/__text_size|__data_size|__data_start|__bss_size|__bss_start/d' linker.out
	sed -i 's/;bank/#bank/g' linker.out
	sed -i '/#align $(SECTIONALIGN)/d' linker.out
	$(AS) link.s linker.out -pf symbols -o $(BUILD)/kernel.bin
	rm link.s
	rm linker.out

KSRC=$(shell cd $(SRC)/kernel/ && ls *.c)
KOBJS=$(shell cd $(SRC)/kernel/ && ls *.c | sed 's/.c$$/.s/g' )
LKSRC=$(wildcard $(SRC)/kernel/*.c)
LKOBJS=$(shell ls $(SRC)/kernel/*.c | sed 's/.c$$/.s/g')

$(SRC)/kernel/kernel.asm: $(LKOBJS)
	rm -f $(SRC)/kernel/kernel.asm
	cat $(LKOBJS) > $(SRC)/kernel/kernel.asm

$(LKOBJS): $(LKSRC)
	cd $(SRC)/kernel && ../../$(SCC) $(SCCFLAGS) $(KSRC)

# lib
lib:
	cd $(SCCDIR) && make clean && make

clean:
	rm -rf $(BUILD)/*
	rm -rf $(SRC)/*/*.o
	rm -rf $(LKOBJS)
	rm -rf $(SRC)/kernel/kernel.asm