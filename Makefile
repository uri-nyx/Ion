AS = customasm utils/assembler/master.asm utils/assembler/sys.asm
FORMAT = -f binary
BIN    = bin/
TPS    = tps/
SRC    = src/

tps: %.bin
	echo $<
	
%.bin: *.s
	${AS} ${SRC}$*.s ${FORMAT} -o ${BIN}$@