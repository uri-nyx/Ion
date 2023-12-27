#include <txtmod.h>

extern struct txtmod_ctx global_ctx;

int main(void)
{
        txtmod_puts(&global_ctx, "Hello from another file (but still from the kernel)");
        return -1;
}