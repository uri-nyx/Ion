#include "include/drivers/kb.h"
#include "include/ion/txtmod.h"
#include "include/system/error.h"
#include "include/system/int.h"
#include "include/system/lock.h"
#include "include/system/kmalloc.h"
#include "include/system/ringbuff.h"
#include <string.h>

extern struct txtmod_ctx global_ctx;
extern int               Ion_priority_level;
extern int               kb_lwd(void);
extern void              kb_swd(int press);

int                     kb_key_pressed = 0;
struct ringbuff         kpress_buff;
static struct kb_press *kpress_data;

static enum {
        META  = 1,
        ALT   = 2,
        CTRL  = 4,
        SHIFT = 8,
};

void kb_get(struct kb_press *out)
{
        int raw;
        raw            = kb_lwd();
        out->character = (raw >> 16) & 0xff;
        out->scancode  = raw & 0xffff;
        out->shift     = (raw >> 24) & SHIFT;
        out->ctrl      = (raw >> 24) & CTRL;
        out->alt       = (raw >> 24) & ALT;
        out->meta      = (raw >> 24) & META;
}

int kb_last(struct kb_press *out)
{
        int err;
        if (kb_key_pressed) {
                kb_key_pressed--;
                err = ringbuff_pop(&kpress_buff, out);
                return err;

        } else
                return ION_ENKPRESS;
}

static int kb_char_handler()
{
        int             err;
        struct kb_press kpress;
        ion_lock_system();
        kb_get(&kpress);
        kb_key_pressed++;
        err = ringbuff_push(&kpress_buff, &kpress);
        ion_unlock_system();
        return err;
}

static int kb_scan_handler()
{
        int             err;
        struct kb_press kpress;
        ion_lock_system();
        kb_get(&kpress);
        kb_key_pressed++;
        err = ringbuff_push(&kpress_buff, &kpress);
        ion_unlock_system();
        return err;
}

void kb_init(int mode)
{
        kpress_data = kmalloc(100 * sizeof(struct kb_press));
        memset(kpress_data, 0, sizeof(struct kb_press) * 100);
        kpress_buff.buffer       = kpress_data;
        kpress_buff.tail         = 0;
        kpress_buff.head         = 0;
        kpress_buff.element_size = sizeof(struct kb_press);
        kpress_buff.maxlen       = 99 * sizeof(struct kb_press);
        register_interrupt_handler(IRQ_KBD_CHARACTER, kb_char_handler);
        register_interrupt_handler(IRQ_KBD_SCANCODE, kb_scan_handler);
        kb_setmode(mode);
}