#include <drivers/disk.h>
#include <drivers/disk/tps.h>
#include <drivers/fs/fat12.h>
#include <drivers/hw.h>
#include <drivers/kb.h>
#include <drivers/timer.h>
#include <drivers/txtmod.h>
#include <ion.h>
#include <ion/clock.h>
#include <ion/error.h>
#include <ion/heap.h>
#include <ion/int.h>
#include <ion/loader.h>
#include <ion/lock.h>
#include <ion/paging.h>
#include <ion/syscall.h>
#include <ion/task.h>
#include <stdio.h>
#include <string.h>

struct txtmod_ctx tctx = {
        8,    16, 80,
        25,   0,  0,
        0x0f, 0,  '|',
        0x8f, 0,  TXTMOD_COMBINED,
        2,    8,  (u8 *)CHARBUFFER_ADDR,
        0,    0,
};

static struct txtmod_ctx *txt = &tctx;

static struct disk tps_a = { DISK_TPS, 0, TPS_SECTOR_SIZE, TPS_NSECTORS };

static struct disk tps_b = { DISK_TPS, 1, TPS_SECTOR_SIZE, TPS_NSECTORS };

static struct ion_task_cb kernel_task;

static struct ion_kheap heap;

static ion_fs fat12_a, fat12_b;

void ion_init(void)
{
        Ion_paging_ctx.nframes = 4096;

        txtmod_puts(txt, "Initializing paging... ");
        ion_init_paging(&Ion_paging_ctx);
}

void ion_main(void)
{
        heap.start_page.page = 0xE9E000; /* CHange for macro*/
        heap.here            = (void *)0xE9E000;

        txtmod_puts(txt, "[OK]\nInitializing timer... ");
        timer_init();

        txtmod_puts(txt, "[OK]\nInitializing heap... ");
        ion_heap_init(&heap, &Ion_paging_ctx);

        txtmod_puts(txt, "[OK]\nInitializing keyboard... ");
        kb_init(KB_CHARMODE);

        txtmod_puts(txt, "[OK]\nInstalling TPS drivers... ");
        disk_install_drivers(DISK_TPS, tps_load_driver, tps_store_driver);

        txtmod_puts(txt, "[OK]\nInitializing FAT12 for TPS A and B... ");
        fat12_init(&fat12_a);
        fat12_init(&fat12_b);

        txtmod_puts(txt, "[OK]\nMounting TPS A and B... ");
        fat12_mount(&fat12_a, &tps_a);
        fat12_mount(&fat12_b, &tps_b);

        txtmod_puts(txt, "[OK]\nInitializing filesystems for TPS A and B... ");
        ion_register_fs(&fat12_a, tps_a.dev);
        ion_register_fs(&fat12_b, tps_b.dev);

        txtmod_puts(txt, "[OK]\nInitializing multitasking... ");
        ion_init_multitasking(&kernel_task);

        txtmod_puts(txt, "[OK]\nInitialization Complete!");

l:
        goto l;
}
