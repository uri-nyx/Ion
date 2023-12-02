#include "include/kb.h"
#include "include/txtmod.h"
#include "include/int.h"

extern int kb_lwd(void);

void kb_get(struct kb_press *out) {
    int raw;
    raw = kb_lwd();
    out->character = (raw >> 16) & 0xff;
    out->modifiers = raw >> 24;
    out->scancode = raw & 0xffff;
}


static char printable(char c) {
    if ((c >= 0x20 && c <= 0x7e)
    ||  (c >= 0xa1 && c <= 0xff))
    return c;
    else return '?';
}

static int kb_callback()
{
    struct kb_press kpress;
    kb_get(&kpress);
    txtmod_printf("Keypress: '%c' (%#x) (mod: %#x)\n", printable(kpress.character), kpress.scancode, kpress.modifiers);
    return 0;
}

void kb_init(int mode)
{
    register_interrupt_handlers(IRQ_KBD_CHARACTER, kb_callback);
    register_interrupt_handlers(IRQ_KBD_SCANCODE, kb_callback);
    kb_setmode(mode);
} 