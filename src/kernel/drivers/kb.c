#include <drivers/kb.h>
#include <ion.h>
#include <ion/error.h>
#include <ion/heap.h>
#include <ion/int.h>
#include <ion/lock.h>
#include <ringbuff.h>
#include <string.h>

extern int Ion_priority_level;
extern u32 kb_lwd(void);

int                     kb_key_pressed = 0;
struct ringbuff         kpress_buff;
static struct kb_press *kpress_data;

enum { META = 1, ALT = 2, CTRL = 4, SHIFT = 8 };

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

ion_errcode kb_last(struct kb_press *out)
{
        ion_errcode err;
        if (kb_key_pressed) {
                kb_key_pressed--;
                err = ringbuff_pop(&kpress_buff, out);
                return err;

        } else
                return ION_ENKPRESS;
}

static void kb_char_handler(sirius_registers regs)
{
        ion_errcode     err;
        struct kb_press kpress;
        ion_lock_system();
        kb_get(&kpress);
        kb_key_pressed++;
        err = ringbuff_push(&kpress_buff, &kpress);
        if (err)
                PANIC(err);
        ion_unlock_system();
}

static void kb_scan_handler(sirius_registers regs)
{
        ion_errcode     err;
        struct kb_press kpress;
        ion_lock_system();
        kb_get(&kpress);
        kb_key_pressed++;
        err = ringbuff_push(&kpress_buff, &kpress);
        if (err)
                PANIC(err);
        ion_unlock_system();
}

void kb_init(u8 mode)
{
        kpress_data = ALLOC(100 * sizeof(struct kb_press));
        memset(kpress_data, 0, sizeof(struct kb_press) * 100);
        kpress_buff.buffer       = kpress_data;
        kpress_buff.tail         = 0;
        kpress_buff.head         = 0;
        kpress_buff.element_size = sizeof(struct kb_press);
        kpress_buff.maxlen       = 99 * sizeof(struct kb_press);
        ion_register_interrupt_handler(IRQ_KBD_CHARACTER, kb_char_handler);
        ion_register_interrupt_handler(IRQ_KBD_SCANCODE, kb_scan_handler);
        kb_setmode(mode);
}
