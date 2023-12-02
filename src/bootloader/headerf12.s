; The FAT 12 header for the disk
#d8 0x40, 0, 0              ; Hack on the header: this and the first byte of oem encode a jump to _end
bdb:
    .oem:                   #d      0x10, "SIRIUS0"
    .bytes_per_sector:      #d16    le(512`16)
    .sectors_per_cluster:   #d8     1
    .reserved_sectors:      #d16    le(1`16)
    .fat_count:             #d8     2
    .dir_entries_count:     #d16    le(0xe0`16)
    .total_sectors:         #d16    le(256`16)
    .media_descriptor_type: #d8     0xf8
    .sectors_per_fat:       #d16    le(9`16)
    .sectors_per_track:     #d16    le(18`16)
    .heads:                 #d16    le(2`16)
    .hidden_sectors:        #d32    0
    .large_sector_count:    #d32    0

ebr:
    .drive_number:          #d8     0
    #res                            1
    .signature:             #d8     0x29
    .volume_id:             #d8     0x12,0x34,0x56,0x78
    .volume_label:          #d      "ION SYSTEM "
    .system_id:             #d      "FAT12   "

#align 32
__end:

