#include "include/drivers/disk.h"
#include "include/drivers/fat12.h"
#include "include/drivers/hw.h"
#include "include/drivers/kb.h"
#include "include/drivers/timer.h"
#include "include/ion/clock.h"
#include "include/ion/syscall.h"
#include "include/ion/txtmod.h"
#include "include/system/error.h"
#include "include/system/int.h"
#include "include/system/kmalloc.h"
#include "include/system/loader.h"
#include "include/system/lock.h"
#include "include/system/paging.h"
#include "include/system/task.h"
#include <stdio.h>
#include <string.h>

int        Ion_priority_level = 7;
extern int SYSCALL_A0;

struct txtmod_ctx global_ctx;
/*struct ion_task_ctx            task_ready_ctx;*/
static struct ion_kheap        hp;
static struct ion_frame_bitset bitset;
extern int                     kmalloc_err;

char                      str[101];
static int                t[1000];
static struct ion_task_cb kernel_task, *subtask, *task3, *idle_task;

int         task_return;
extern void _kernel_reenter(void);

int another_task(void);
int yet_another(void);

void syscall_exit(int rc)
{
        txtmod_printf(&global_ctx, "Exit Syscall! [%d]\n", rc);
        task_return = rc;
        _kernel_reenter(); // NORETURN
        return;
}

int exception_privilege()
{
        trace(0xbeef);
        txtmod_printf(&global_ctx, "Privilege violation exception!\n");
        _kernel_reenter();
        return -1;
}

void kinit(void)
{
        bitset.nframes = 4096;
        paging_init(&bitset);
}

void kernel_idle_task(void)
{
        for (;;) {
        }
}

void kmain(void)
{
        int err, header[10], i, *p;
        int (*prg)();
        char           *s, c;
        struct disk     TpsA, TpsB;
        struct ion_time now;
        ion_fs          fat12, fat12B;
        ion_file        file, *txt;
        fat12_entry     entry;
        struct ion_page pg, pg_end;
        struct kb_press kpress;

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
        TpsA.dev         = 0;
        TpsA.sector_size = 512;
        TpsA.sectors     = 256;

        TpsB.type        = DISK_TPS;
        TpsB.dev         = 1;
        TpsB.sector_size = 512;
        TpsB.sectors     = 256;

        hp.start_page.page = 0xE9E000;
        hp.here            = (void *)0xE9E000;

        register_interrupt_handler(0x20, syscall);
        register_interrupt_handler(0x6, exception_privilege);

        timer_init();
        kmalloc_init(&hp, &bitset);
        kb_init(KB_CHARMODE);
        disk_istall_drivers(DISK_TPS, tps_load_driver, tps_store_driver);

        fat12_init(&fat12);
        fat12_init(&fat12B);
        fat12_mount(&fat12, &TpsA);
        fat12_mount(&fat12B, &TpsB);
        fs_register_fs(&fat12, 0);
        fs_register_fs(&fat12B, 1);

        multitasking_init(&kernel_task);
        subtask   = create_task("STASK", (void *)0xe50000, another_task);
        task3     = create_task("TASK3", (void *)0xe4d000, yet_another);
        //idle_task = create_task("TASK3", (void *)0xe4b000, kernel_idle_task);
        // subtask->next_task = &kernel_task;
        // ion_last_ready_task = &kernel_task;

        p_ready_tasks();
        _sti();
l:
        /*global_ctx.col = 0;
        global_ctx.row = 0;*/
        // ion_unlock_scheduler();
        /*txtmod_printf(&global_ctx,
                      "Reentered Main Kernel task, uptime: %d ms\n",
                      task_kuptime(&kernel_task) / 10);
*/
        ion_lock_scheduler();
        task_schedule();
        // task_unblock(subtask);
        ion_unlock_scheduler();

        //         err = fat12_create_dir(&fat12B, "NEWDIR");
        //         txtmod_printf(&global_ctx, "[%s\t%d] Creating a directory\n",
        //                       err ? "ERROR" : "OK", err);
        //         /*err = fat12_create_file(&fat12B, "NEWFILE.TXT",
        //         FAT12_O_DEFAULT); txtmod_printf(&global_ctx, "[%s\t%d]
        //         Creating a file\n",
        //                       err ? "ERROR" : "OK", err);*/

        //         err = fat12_rename(&fat12B, "NEWFILE.TXT",
        //         "NEWDIR/COOLFILE.TXT"); txtmod_printf(&global_ctx, "[%s\t%d]
        //         Renaming a file\n",
        //                       err ? "ERROR" : "OK", err);

        //         err = fat12_delete_file(&fat12B, "OLDFILE.TXT");
        //         txtmod_printf(&global_ctx, "[%s\t%d] Deleting a file\n",
        //                       err ? "ERROR" : "OK", err);

        //         //err = fat12_delete_dir(&fat12B, "NEWDIR");
        //        // txtmod_printf(&global_ctx, "[%s\t%d] Deleting a
        //        directory\n",
        //          //             err ? "ERROR" : "OK", err);

        //         err = fs_open_file(&file, "b:hello.out", ION_FS_O_RDONLY);
        //         txtmod_printf(&global_ctx, "[%s\t%d] Opening file in drive
        //         %c\n",
        //                       err ? "ERROR" : "OK", err, err ? '!' :
        //                       file.device + 'a');

        //         err = fs_write_file(&file, header, 10);
        //         txtmod_printf(&global_ctx, "[%s\t%d] Writing to a readonly
        //         file\n",
        //                       err ? "ERROR" : "OK", err);

        //         err = loader_load(&file);
        //         txtmod_printf(&global_ctx, "[%s\t%d] Loading executable\n",
        //                       err ? "ERROR" : "OK", err);
        //         err = fs_close_file(&file);
        //         txtmod_printf(&global_ctx, "[%s\t%d] Closing file\n",
        //                       err ? "ERROR" : "OK", err);

        //         if (!err) {
        //                 loader_user_exec(); // NORETURN

        //                 txtmod_printf(&global_ctx, "[%s\t%d] Task
        //                 finished\n",
        //                               task_return ? "ERROR" : "OK",
        //                               task_return);
        //                 txtmod_printf(&global_ctx, "\tTask said: %s at %p\n",
        //                               task_return, syscall_time());
        //         }
        goto l;
}

int another_task()
{
        static int t = 0;
        ion_unlock_scheduler();
l:
        // txtmod_printf(&global_ctx, "Task loop\n");
        //  global_ctx.col = 0;
        //  global_ctx.row = 1;
        //  txtmod_printf(&global_ctx, "Another Task! uptime: %d ms\n",
        //                task_kuptime(subtask) / 10);
        // p_ready_tasks();
        ion_lock_scheduler();
        task_schedule();
        ion_unlock_scheduler();
        // task_block(TASK_PAUSED);
        //  global_ctx.col = 0;
        //  global_ctx.row = 4;
        // txtmod_printf(&global_ctx, "Task unpaused %dth iteration\n", t++);
        // p_ready_tasks();
        // s: goto s;
        goto l;
        return 0;
}

int yet_another(void)
{
        ion_unlock_scheduler();
l:
        p_ready_tasks();
        txtmod_printf(&global_ctx, "Sleeping\n");
        task_sleep(1);
        txtmod_printf(&global_ctx, "Woke up\n");
        txtmod_printf(&global_ctx, "Time: %d\n", clock_read_counter());
        goto l;
        return 0;
}
