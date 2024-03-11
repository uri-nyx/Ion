#include <ion.h>
#include <drivers/txtmod.h>
#include <drivers/hw.h>
#include <stdio.h>

/* updates the cursor in software (there is no hw cursor)*/
static void update_cursor(struct txtmod_ctx *ctx)
{
        int cursor;
        cursor = ctx->bpc * (ctx->row * ctx->columns + ctx->col);

        switch (ctx->mode) {
        case TXTMOD_COMBINED:
        case TXTMOD_RTEXT:
                if (ctx->erase_cursor)
                        ctx->cbuff[ctx->prev_cursor + 1] = ctx->color;
                ctx->cbuff[cursor + 1] = ctx->cursoratt;
        case TXTMOD_SIMPLE:
                if (ctx->erase_cursor)
                        ctx->cbuff[ctx->prev_cursor] = ' ';
                ctx->cbuff[cursor] = ctx->ccursor;
                break;
        default:
                break;
        }

        ctx->erase_cursor = 0;
        ctx->prev_cursor  = cursor;
}

/* TODO: In assembly (using fill) */
/* static void _txtmod_clear(char color, void *buff, int size) */

void txtmod_clear(const struct txtmod_ctx *ctx)
{
        usize i, size;
        size = ctx->rows * ctx->columns * ctx->bpc;
        for (i = 0; i < size; i += ctx->bpc) {
                ctx->cbuff[i] = ' ';
                if (ctx->mode > TXTMOD_SIMPLE)
                        ctx->cbuff[i + 1] = ctx->bgcolor;
        }
}

void txtmod_scroll(const struct txtmod_ctx *ctx)
{
        usize i;
        u8   *last_line;
        last_line = ctx->cbuff + ctx->columns * (ctx->rows - 1) * ctx->bpc;
        hw_copy(ctx->cbuff + ctx->columns * ctx->bpc, ctx->cbuff,
              ctx->columns * (ctx->rows - 1) * ctx->bpc);

        for (i = 0; i < ctx->columns * ctx->bpc; i += ctx->bpc) {
                last_line[i] = ' ';
                if (ctx->mode > TXTMOD_SIMPLE)
                        last_line[i + 1] = ctx->bgcolor;
        }
}

void txtmod_clear_update(struct txtmod_ctx *ctx)
{
        txtmod_clear(ctx);
        ctx->erase_cursor = 1;
        ctx->row          = 0;
        ctx->col          = 0;
        update_cursor(ctx);
}

void txtmod_putc(struct txtmod_ctx *ctx, char c)
{
        u32 position;
        position = (ctx->row * ctx->columns + ctx->col) * ctx->bpc;
        /* Handle a backspace, by moving the cursor back one space */
        if (c == 0x08) {
                ctx->erase_cursor = 1;
                if (0 == ctx->col && ctx->row != 0) {
                        ctx->row--;
                        ctx->col = ctx->columns;
                }
                ctx->col--;
        }

        /* Handle a tab by increasing the cursor's X, but only to a point
        // where it is divisible by 8. */
        if (c == 0x09) {
                ctx->erase_cursor = 1;
                ctx->col = (ctx->col + ctx->tabsize) & ~(ctx->tabsize - 1);
        }

        /*  // Handle carriage return */
        else if (c == '\r') {
                ctx->erase_cursor = 1;
                ctx->col          = 0;
        }

        /* // Handle newline by moving cursor back to left and increasing the
           row */
        else if (c == '\n') {
                ctx->erase_cursor = 1;
                ctx->col          = 0;
                ctx->row++;
        }
        /* // Handle any other printable character. */
        else if (c >= ' ') {
                switch (ctx->mode) {
                case TXTMOD_COMBINED:
                case TXTMOD_RTEXT:
                        ctx->cbuff[position + 1] = ctx->color;
                case TXTMOD_SIMPLE:
                        ctx->cbuff[position] = c;
                        break;
                default:
                        break;
                }
                ctx->col++;
        }

        /*  Check if we need to insert a new line because we have reached the
        end
        // of the screen. */
        if (ctx->col >= ctx->columns) {
                ctx->col = 0;
                ctx->row++;
        }

        /* // Scroll the screen if needed. */
        if (ctx->row >= ctx->rows) {
                txtmod_scroll(ctx);
                ctx->prev_cursor -= ctx->columns * ctx->bpc;
                ctx->erase_cursor = 1;
                ctx->row--;
        }
        /* // Move the hardware cursor. */
        update_cursor(ctx);
}

/* Output null terminated string to the screen */
void txtmod_puts(struct txtmod_ctx *ctx, const char *s)
{
        char c;
        while ((c = *s++)) {
                txtmod_putc(ctx, c);
        }
}

/* Output a formated string to the screen */
extern int _vformat(int mode, int max, void *dest, char *fmt, void **varg);
int        txtmod_printf(struct txtmod_ctx *ctx, char *fmt, ...)
{
        static char buff[TXTMOD_BUFFER_SZ];
        _vformat(0, 0, (void *)buff, fmt, (void **)&fmt + 1);
        txtmod_puts(ctx, buff);
        return 0;
}
