#include <stdio.h>
#include <string.h>
#include "include/hw.h"
#include "include/txtmod.h"
#include "include/timer.h"
#include "include/kb.h"
#include "include/error.h"
#include "include/paging.h"
#include "include/kmalloc.h"

static char tab = '\t';
static char backspace = '\b';
static kheap_t hp;

int k = 0x41;
void kinit(void) {
    txtmod_clear();
    initialise_paging();
}

void kmain(void)
{
    char *str, i;
    int a, b, c, d;
    hp.start_page.page = 0xE9E000;
    hp.here = (void*)0xE9E000;
    kmalloc_init(&hp);
    kb_init(0);
    //timer_init();
    txtmod_puts("Hello paging World!\nAnother line!!\b\tTabs even!\t:)\n");
    txtmod_printf("This is printf! %c, %d, %x\n", 0x41, tab, 0x50);
    str = (char*)kmalloc(100);
    for (i = 0; i < 99; i++) str[(int)i] = '$';
    str[99] = 0;
    txtmod_puts(str);
    a = (int)kmalloc(4);
    d = (int)kmalloc(4);
    b = (int)kmalloc(0x10000);
    txtmod_printf("a: %x, b: %x, str: %p\n", a, b, str);
    kfree(str);
    c = (int)kmalloc(400);
    kfree((void*)b);
    txtmod_printf("c: %x, d: %x\n", c, d);
}