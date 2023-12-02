#include "include/error.h"
#include "include/txtmod.h"

void panic(char *fmt, ...)
{
    char tmp;
    tmp = txtmod_color;
    txtmod_color = 0x8c;
    txtmod_puts("\nPANIC: ");
    txtmod_printf(fmt, &fmt+1);
    txtmod_putc('\n');
    txtmod_color = tmp;
    while (1);
}