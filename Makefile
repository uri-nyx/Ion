BINUTILS=lcc-sirius/binutils/bin

LD=$(BINUTILS)/ld
AS=$(BINUTILS)/as

LIBS= $(LCCDIR)/lib
LCCDIR=lcc-sirius/lcc/bin

CC=$(LCCDIR)/lcc
CPP=$(LCCDIR)/ucpp
CFLAGS=-A -A -N

TARGET_EXEC := kernel.bin

BUILD_DIR := ./build
SRC_DIRS := ./src/kernel

# Find all the C files we want to compile
# Note the single quotes around the * expressions. The shell will incorrectly 
# expand these otherwise, but we want to send the * directly to the find command.
SRCS := $(shell find $(SRC_DIRS) -name '*.c' -or -name '*.asm')
ENTRY := ./src/kernel/entry.s
LAST := ./src/kernel/kstack.s


# Prepends BUILD_DIR and appends .o to every src file
# As an example, ./your_dir/hello.c turns into ./build/./your_dir/hello.c.o
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)

# String substitution (suffix version without %).
# As an example, ./build/hello.c.o turns into ./build/hello.c.d
DEPS := $(OBJS:.o=.d)

# Every folder in ./src will need to be passed to LCC so that it can find header files
INC_DIRS := $(shell find $(SRC_DIRS) -type d)
# Add a prefix to INC_DIRS. So moduleA would become -ImoduleA. LCC understands this -I flag
INC_FLAGS := -I./src/libk/include $(addprefix -I,$(INC_DIRS))

# The -M and -Ma flags together generate Makefiles for us!
# These files will have .d instead of .o as the output.
CPPFLAGS := -zI $(INC_FLAGS) -M -Ma
LDFLAGS= -h -m map.txt -rc 16572416 -l src/libk/build/libk.a


all: clean tps_image load run

# Run
run: load
	cd emu && ./TaleaZ -f minimal.bin -z 7 --scale=2

# Load into tps
load: tps_image
	cp $(BUILD_DIR)/ion.img emu/dev/tps/A

# TPS image (FAT12)
tps_image: $(BUILD_DIR)/ion.img
$(BUILD_DIR)/ion.img: bootloader kernel
	dd if=/dev/zero of=$(BUILD_DIR)/ion.img bs=512 count=256
	mkfs.fat -F 12 -n "ION SYSTEM" $(BUILD_DIR)/ion.img
	dd if=$(BUILD_DIR)/bootloader.bin of=$(BUILD_DIR)/ion.img conv=notrunc
	mcopy -i $(BUILD_DIR)/ion.img $(BUILD_DIR)/kernel.bin "::kernel.bin"

# Bootloader TODO: C preprocessor on assembler?
bootloader: $(BUILD_DIR)/bootloader.bin
# TODO: write bootloader for AS
$(BUILD_DIR)/bootloader.bin:
	cp ./src/bootloader/bin/bootloader.bin $(BUILD_DIR)/bootloader.bin:

# The final build step.
kernel: $(BUILD_DIR)/$(TARGET_EXEC)
$(BUILD_DIR)/$(TARGET_EXEC): $(OBJS)
	$(AS) -o $(BUILD_DIR)/entry.o $(ENTRY) 
	$(AS) -o $(BUILD_DIR)/last.o $(LAST) 
	$(LD) $(LDFLAGS) -o $@ $(BUILD_DIR)/entry.o $(OBJS) $(BUILD_DIR)/last.o

run-forth: cforth
	cp $(BUILD_DIR)/forth.bin emu
	cd emu && ./TaleaZ -f forth.bin -z 15 --scale=4

cforth: $(BUILD_DIR)/forth.bin
$(BUILD_DIR)/forth.bin: cforth/forth.o cforth/terminal.o cforth/bios.o cforth/disk.o 
	$(LD) -h -m fort.txt -o $@  cforth/bios.o cforth/terminal.o cforth/forth.o cforth/disk.o 

cforth/forth.o: cforth/forth.c
	$(CC) -N -c $< -o $@

cforth/terminal.o: cforth/terminal.c
	$(CC) -N -c $< -o $@

cforth/bios.o: cforth/bios.s 
	$(AS) -o $@ $<

cforth/disk.o: cforth/disk.s
	$(AS) -o $@ $<

libk:
	cd src/libk && make 

# Build step for C source
$(BUILD_DIR)/%.c.o: %.c
	mkdir -p $(dir $@)
	$(CPP) $(CPPFLAGS) $< -o $<.d
	$(CC) $(INC_FLAGS) $(CFLAGS) -c $< -o $@

# Build step for assembly source
$(BUILD_DIR)/%.asm.o: %.asm
	mkdir -p $(dir $@)
	$(CC) $(INC_FLAGS) $(CFLAGS) -c $< -o $@


.PHONY: clean
clean:
	rm -r src/**/*.d
	rm -r $(BUILD_DIR)

# Include the .d makefiles. The - at the front suppresses the errors of missing
# Makefiles. Initially, all the .d files will be missing, and we don't want those
# errors to show up.
-include $(DEPS)
