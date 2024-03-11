#include <ion.h>
#include <ion/error.h>
#include <string.h>

void panic(const char *fmt, ...)
{
        /* TODO: implement a good kernel panic */
        char *cbuff;
        int   i;

        cbuff = (char *)0xe51000;
        for (i = 0; i < 80 * 25 * 2; i += 2) {
                cbuff[i]     = '!';
                cbuff[i + 1] = 0xf8;
        }

        while (1)
                ;
}
