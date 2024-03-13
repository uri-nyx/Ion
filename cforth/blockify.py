# A simple script to transform forth source text to block format:
# - replaces whitespace with spaces (only one space)
# - eliminates slash comments
# - separates into screens and transfers to disk

from sys import argv

def main(argv):
        if len(argv) != 4:
                print(f"Usage {argv[0]} <file-to-convert> <screen-no> <disk>")
                exit(1)
        
        to_convert = argv[1]
        screen = int(argv[2])
        disk_img = argv[3]

        t = b""
        with open(to_convert, "rb") as txt:
                t = txt.read()
                t = t.replace(b"\t", b" ")
                t = t.replace(b"\n", b" ")
                t = t.replace(b"\r", b" ")

        with open(disk_img, "rb+") as disk:
                disk.seek(screen * 1024)
                spaces =  (len(t) + 1024) & ~1023
                spaces = bytes([0x20 for i in range(0, spaces)])
                disk.write(spaces)
                disk.seek(screen * 1024)
                disk.write(t)

if __name__ == "__main__":
        main(argv)
