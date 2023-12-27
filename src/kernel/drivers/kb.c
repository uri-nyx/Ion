#include "include/drivers/kb.h"
#include "include/ion/txtmod.h"
#include "include/system/int.h"

extern int  kb_lwd(void);
extern void kb_swd(int press);

int kb_key_pressed = 0;

void kb_get(struct kb_press *out)
{
        int raw;
        raw            = kb_lwd();
        out->character = (raw >> 16) & 0xff;
        out->modifiers = raw >> 24;
        out->scancode  = raw & 0xffff;
}

static char printable(char c)
{
        if ((c >= 0x20 && c <= 0x7e) || (c >= 0xa1))
                return c;
        else
                return '?';
}

static int kb_callback()
{
        struct kb_press kpress;
        kb_get(&kpress);
        kb_key_pressed = 1;
        return 0;
}

void kb_init(int mode)
{
        register_interrupt_handler(IRQ_KBD_CHARACTER, kb_callback);
        register_interrupt_handler(IRQ_KBD_SCANCODE, kb_callback);
        kb_setmode(mode);
}