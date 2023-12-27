/*
 * txtmod.h -- defines the interface for the hardware text mode of Sirius
 */
#ifndef TXTMOD_H
#define TXTMOD_H

#define CHARBUFFER_ADDR 0xe51000

#define TXTMOD_SIMPLE   0
#define TXTMOD_RTEXT    1
#define TXTMOD_COMBINED 5

#define TXTMOD_BUFFER_SZ 4096

struct txtmod_ctx {
        char  cwidth, cheight;
        char  columns, rows;
        char  col, row;
        char  color, bgcolor;
        char  ccursor, cursoratt;
        char  hwfont, mode, bpc;
        char  tabsize;
        char *cbuff;
        int   erase_cursor, prev_cursor;
};

/**
 * @brief Output a character to the screen
 *
 * @param ctx A context of the text mode
 * @param c the character to output
 */
void txtmod_putc(struct txtmod_ctx *ctx, char c);

/**
 * @brief Output a null-termianted string to the screen
 *
 * @param ctx A context of the text mode
 * @param s the string
 */
void txtmod_puts(struct txtmod_ctx *ctx, char *s);

/**
 * @brief Output a formatted string to the screen
 *
 * @param ctx A context of the text mode
 * @param fmt the format string
 * @param ... arguments to format
 * @return int 0 on success, otherwhise the error code
 */
int txtmod_printf(struct txtmod_ctx *ctx, char *fmt, ...);

/**
 * @brief Clear the screen
 *
 * @param ctx A context of the text mode
 */
void txtmod_clear(struct txtmod_ctx *ctx);

/**
 * @brief Clear the screen and reset the cursor
 *
 * @param ctx A context of the text mode
 */
void txtmod_clear_update(struct txtmod_ctx *ctx);

/**
 * @brief Scroll the screen by one line
 *
 */
void txtmod_scroll(struct txtmod_ctx *ctx);

#endif /* TXTMOD_H */
