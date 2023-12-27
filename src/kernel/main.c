#include "include/drivers/disk.h"
#include "include/drivers/fat12.h"
#include "include/drivers/hw.h"
#include "include/drivers/kb.h"
#include "include/drivers/timer.h"
#include "include/ion/clock.h"
#include "include/ion/txtmod.h"
#include "include/system/error.h"
#include "include/system/kmalloc.h"
#include "include/system/paging.h"
#include <stdio.h>
#include <string.h>

struct txtmod_ctx              global_ctx;
static struct ion_kheap        hp;
static struct ion_frame_bitset bitset;
char                           str[101];

extern int kmalloc_err;

void kinit(void)
{
        bitset.nframes = 4096;
        paging_init(&bitset);
}

void kmain(void)
{
        int err, header[10], i, *p;
        int (*prg)();
        char           *s;
        struct disk     TpsA;
        struct ion_time now;
        ion_fs          fat12;
        ion_file        file, *txt;
        fat12_entry     entry;
        struct ion_page pg, pg_end;

        global_ctx.bgcolor      = 0x00;
        global_ctx.bpc          = 2;
        global_ctx.cbuff        = (char *)CHARBUFFER_ADDR;
        global_ctx.ccursor      = '|';
        global_ctx.cheight      = 16;
        global_ctx.col          = 0;
        global_ctx.color        = 0x0f;
        global_ctx.columns      = 80;
        global_ctx.cursoratt    = 0x8f;
        global_ctx.cwidth       = 8;
        global_ctx.erase_cursor = 0;
        global_ctx.hwfont       = 0;
        global_ctx.mode         = 5;
        global_ctx.prev_cursor  = 0;
        global_ctx.row          = 0;
        global_ctx.rows         = 25;
        global_ctx.tabsize      = 8;

        txtmod_clear(&global_ctx);

        TpsA.type        = DISK_TPS;
        TpsA.dev         = 1;
        TpsA.sector_size = 512;
        TpsA.sectors     = 256;

        hp.start_page.page = 0xE9E000;
        hp.here            = (void *)0xE9E000;

        kmalloc_init(&hp, &bitset);
        kb_init(KB_CHARMODE);
        disk_istall_drivers(DISK_TPS, tps_load_driver, tps_store_driver);

        fat12_init(&fat12);
        fat12_mount(&fat12, &TpsA);
        fs_register_fs(&fat12, 1);
        trace(0x100);

        trace(fat12_find(&fat12, &file, "HELLO.COM"));
        txtmod_printf(&global_ctx, "File found: %s, %d\n", file.name,
                      file.lenght);

        fat12_read(&file, header, 8 * sizeof(int));

        pg.page = header[1];
        /* map text section pages */
        alloc_pages_contiguous(&pg, &pg_end, header[2], 0, 1, &bitset);

        pg.page     = header[4];
        pg.frame    = 0;
        pg.perm     = 0;
        pg_end.perm = 0;
        /* map text section pages */
        alloc_pages_contiguous(&pg, &pg_end, header[5] + 1, 1, 0, &bitset);

        fat12_seek(&file, 0, 0);
        fat12_read(&file, (void *)header[1], 512);
        fat12_seek(&file, header[4], 0);
        fat12_read(&file, (void *)header[4], 256);

        trace(*(int *)header[0]);

        //__call(header[0]);

        txtmod_putc(&global_ctx, '\n');
        txtmod_printf(&global_ctx, "Next free cluster in device %d: %d\n",
                      fat12.device.dev, fat12_get_cluster(&fat12, 0));
        entry.creation_date = 0;
        entry.creation_ms   = 0;
        entry.creation_time = 0;
        entry.ext[0]        = 'T';
        entry.ext[1]        = 'X';
        entry.ext[2]        = 'T';
        entry.first_cluster = fat12_get_cluster(&fat12, 1);
        entry.flags         = 0x20;

        s = "HELLO   ";
        for (i = 0; i < 8; i++) {
                entry.fname[i] = s[i];
        }

        entry.last_access       = 0;
        entry.modification_time = 0;
        entry.modification_date = 0;
        entry.size              = 0;

        trace(0x4000);
        fat12_create_entry(&fat12, &entry, "DOCS/HELLO.TXT");
        s = "0\tLorem ipsum dolor sit amet, consectetur adipiscing elit."
            " Donec id nibh eu odio eleifend dictum ac at felis. Proin finibus nec purus quis finibus."
            " Nunc quam eros, tempor vel porttitor a, placerat sed ex. Vivamus non tempor lorem."
            " Ut aliquam lacus nulla, lacinia vulputate sem vulputate a."
            " Donec luctus maximus risus vel aliquet. Aenean sed lacinia augue."
            " Aliquam vitae rhoncus magna. Curabitur vel efficitur magna."
            " Maecenas convallis sit amet quam sed tincidunt."
            " In hac habitasse platea dictumst nisi.";

        trace(0x777);
        txt = kmalloc(sizeof(ion_file));
        trace(fat12_open(txt, &fat12.device, "DOCS/HELLO.TXT", 0));
        fat12_seek(txt, 0, FAT12_SEEK_END);
        for (i = 0; i < 10; i++) {
                trace(0xaf0 + i);
                s[0] = '0' + i;
                trace(fat12_write(txt, s, strlen(s)));
        }

        s = "\n\tVivia un hidalgo...";
        fat12_write(txt, s, strlen(s));
time:
        clock_gettime(&now);
        txtmod_printf(
                &global_ctx,
                "YEAR: %d, MONTH: %d, DAY: %d, HOUR: %d, MINUTE: %d, SECOND: %d, MS: %d\n",
                now.year, now.month, now.day, now.hour, now.minute, now.second,
                now.ms);
        for (;;)
                ;
}