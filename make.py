"""MAKE: A simple and provisional build script for ION.

Usage:
  make.py [-hcas] [-n=<name>]

Options:
  -h                Show this screen.
  -c                Only compile jack files.
  -a                Only assemble.
  -s                Only emit symbols.
  -n=<name>         name of image file [default: ion].
"""

from docopt import docopt
import os
from os.path import isfile, join, splitext

DEBUG = ""
AS = "customasm utils/assembler/master.asm utils/assembler/sys.asm"
TALLUM = "python3 utils/tallum/tallum.py sft -O --std=tal"
COMPILER = "node utils/JackCompiler/JackCompiler.js -x"
FORMAT = " -f binary"
BIN    = "bin/"
SYM    = "sym/"
TPS    = "tps/"
SRC    = "src/"
JACK   = SRC + "kernel/"
VM     = JACK + "vm/"
KERNEL = JACK + "out/"

def compile_():
    errorcode = os.system(f"{COMPILER} {JACK}")
    errorcode = os.system(f"mv {JACK}*.vm {VM}")
    if (errorcode != 0): exit(1)
    vm_files = [f for f in os.listdir(VM) if isfile(join(VM, f)) and splitext(join(VM, f))[1] == ".vm"]
    for f in vm_files:
        errorcode = os.system(f"{TALLUM} {VM}{f} -o {KERNEL + splitext(f)[0]}.s")
        if (errorcode != 0): exit(1)
    
    s_files = [f for f in os.listdir(KERNEL) if isfile(join(KERNEL, f)) and f != "Kernel.s" and splitext(join(KERNEL, f))[1] == ".s"]
    with open(KERNEL + "link.asm", "w") as l:
        l.write(f'#include "Kernel.s"\n')
        for f in s_files:
            print("Linking " + f)
            l.write(f'#include "{f}"\n')
        
def assemble():
    asm_files = [f for f in os.listdir(SRC) if isfile(join(SRC, f)) and splitext(join(SRC, f))[1] == ".s"]
    for f in asm_files:
        errorcode = os.system(f"{AS} {SRC}{f} {DEBUG} {FORMAT} -o {BIN + splitext(f)[0]}.bin")
        if (errorcode != 0): exit(1)

def symbols():
    asm_files = [f for f in os.listdir(SRC) if isfile(join(SRC, f)) and splitext(join(SRC, f))[1] == ".s"]
    for f in asm_files:
        errorcode = os.system(f"{AS} {SRC}{f} -f symbols -o {SYM + splitext(f)[0]}.sym")
        if (errorcode != 0): exit(1)

def image(name: str):
    image = open(f"{TPS}{name}.tps", "wb")
    with open(f"{BIN}boot.bin", "rb") as boot:
        blob = boot.read()
        
    bin_files = [f for f in os.listdir(BIN) if isfile(join(BIN, f)) and splitext(join(SRC, f))[1] == ".bin" and f != "boot.bin"]
    for file in bin_files:
        with open(f"{BIN}{file}", "rb") as b:
            blob += b.read()
            
    if len(blob) >= 128 * 1024:
        print("Warning, image too large to write in 1 tps, size: ", len(blob))
    else:
        pad = 128 * 1024 - len(blob)
        print(f"Written {len(blob)} bytes to tps, padding with {pad} zeroes")
        blob += b'\x00' * pad
        
    image.write(blob)
    image.close()
    
if __name__ == "__main__":
    arguments = docopt(__doc__)
    if arguments["-c"]:
        compile_()
    if arguments["-s"]:
        symbols()
    if arguments["-a"]:
        assemble()
    
    name = "ion" if arguments["-n"] == None else arguments["-n"] 
    image(name)