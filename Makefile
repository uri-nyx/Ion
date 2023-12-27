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
	$(LD) $(SECTIONALIGN) $(SRC)/kernel/entry.asm $(SRC)/kernel/system/int.asm \
	$(SRC)/kernel/drivers/timer.asm $(SRC)/kernel/drivers/kb.asm \
	$(SRC)/kernel/kernel.asm $(SRC)/kernel/ion/txtmod.asm $(SRC)/kernel/system/paging.asm \
	$(SRC)/kernel/drivers/disk.asm $(LIBS)/libk.asm
	$(AS) linker.out -pf symbols | grep '^__text_size\|^__data_size\|^__data_start\|^__bss_size\|^__bss_start' | cat - $(SRC)/kernel/linker.ln > link.s
	sed -i -E '/__text_size|__data_size|__data_start|__bss_size|__bss_start/d' linker.out
	sed -i 's/;bank/#bank/g' linker.out
	sed -i '/#align $(SECTIONALIGN)/d' linker.out
	$(AS) link.s linker.out -f binary -o $(BUILD)/kernel.bin
	$(AS) link.s linker.out -f symbols -o $(BUILD)/kernel.sym
	grep -Ff public.sym $(BUILD)/kernel.sym > $(BUILD)/k.sym
	rm public.sym
	rm $(BUILD)/kernel.sym
	rm link.s
	rm linker.out

symbols: $(SRC)/kernel/kernel.asm $(SRC)/kernel/entry.asm
	$(LD) $(SECTIONALIGN) $(SRC)/kernel/entry.asm $(SRC)/kernel/system/int.asm \
	$(SRC)/kernel/drivers/timer.asm $(SRC)/kernel/drivers/kb.asm \
	$(SRC)/kernel/kernel.asm $(SRC)/kernel/ion/txtmod.asm $(SRC)/kernel/system/paging.asm \
	$(SRC)/kernel/drivers/disk.asm $(LIBS)/libk.asm
	$(AS) linker.out -pf symbols

ION=$(shell cd $(SRC)/kernel && ls ion/*.c)
SYS=$(shell cd $(SRC)/kernel && ls system/*.c)
DEV=$(shell cd $(SRC)/kernel && ls drivers/*.c)
IONSRC=$(wildcard $(SRC)/kernel/ion/*.c)
IONOBJ=$(shell ls $(SRC)/kernel/ion/*.c | sed 's/.c$$/.s/g')
SYSSRC=$(wildcard $(SRC)/kernel/system/*.c)
SYSOBJ=$(shell ls $(SRC)/kernel/system/*.c | sed 's/.c$$/.s/g')
DRIVSRC=$(wildcard $(SRC)/kernel/drivers/*.c)
DRIVOBJ=$(shell ls $(SRC)/kernel/drivers/*.c | sed 's/.c$$/.s/g')
LKOBJS=$(SRC)/kernel/main.s $(SRC)/kernel/ion.s $(SRC)/kernel/system.s \
	$(SRC)/kernel/drivers.s

$(SRC)/kernel/kernel.asm: $(LKOBJS)
	rm -f $(SRC)/kernel/kernel.asm
	cat $(LKOBJS) > $(SRC)/kernel/kernel.asm

$(SRC)/kernel/ion.s: $(IONOBJ)
	cat $(IONOBJ) | awk '{ gsub(/L[0-9]+/, "&ION") }1' > $(SRC)/kernel/ion.s

$(SRC)/kernel/system.s: $(SYSOBJ)
	cat $(SYSOBJ) | awk '{ gsub(/L[0-9]+/, "&SYS") }1' > $(SRC)/kernel/system.s

$(SRC)/kernel/drivers.s: $(DRIVOBJ)
	cat $(DRIVOBJ) | awk '{ gsub(/L[0-9]+/, "&DEV") }1' > $(SRC)/kernel/drivers.s

$(IONOBJ): $(IONSRC)
	cd $(SRC)/kernel && ../../$(SCC) $(SCCFLAGS) $(ION)

$(SYSOBJ): $(SYSSRC)
	cd $(SRC)/kernel && ../../$(SCC) $(SCCFLAGS) $(SYS)

$(DRIVOBJ): $(DRIVSRC)
	cd $(SRC)/kernel && ../../$(SCC) $(SCCFLAGS) $(DEV)

$(SRC)/kernel/main.s: $(SRC)/kernel/main.c
	cd $(SRC)/kernel/ && ../../$(SCC) $(SCCFLAGS) main.c
# lib
lib:
	cd $(SCCDIR) && make clean && make

clean:
	rm -rf $(BUILD)/*
	rm -rf $(SRC)/*/*.o
	rm -rf $(LKOBJS)
	rm -rf $(IONOBJ) $(SYSOBJ) $(DRIVOBJ)
	rm -rf $(SRC)/kernel/kernel.asm