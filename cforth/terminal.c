/* Simple BIOS functions written in C as a primitive system */

typedef unsigned char u8;
typedef unsigned long usize;
typedef unsigned long u32;

#define CHARBUFFER_ADDR 0xe51000

#define TXTMOD_SIMPLE   0
#define TXTMOD_RTEXT    1
#define TXTMOD_COMBINED 5

#define TXTMOD_BUFFER_SZ 4096

/**
 * @brief Copies a buffer up to size, to another
 *
 * @param src the source buffer
 * @param dest the destination buffer
 * @param size the bytes to copy over
 */
extern void hw_copy(const void *src, const void *dest, usize size);

/* CONFIGURATION */
#define BPC      1
#define MODE     TXTMOD_SIMPLE
#define SCREEN   ((u8 *)CHARBUFFER_ADDR)
#define ROWS     25
#define COLS     80
#define TABSZ    8
#define CURSOR   '|'
#define BGCOLOR  0
#define CR_AS_LN 1 /* To interpret CR as a newline (useful for freestanding)*/

int        scroll_lock  = 0;
static int erase_cursor = 0;
static int prev_cursor  = 0;
static u8  row          = 0;
static u8  col          = 0;

/* updates the cursor in software (there is no hw cursor)*/
static void update_cursor()
{
        int cursor;
        cursor = BPC * (row * COLS + col);

#if (MODE == TXTMOD_COMBINED || MODE == TXTMOD_RTEXT)
        if (erase_cursor)
                SCREEN[prev_cursor + 1] = color;
        SCREEN[prev_cursor] = ' ';
        SCREEN[cursor + 1]  = cursoratt;
        SCREEN[cursor]      = CURSOR;

#elif (MODE == TXTMOD_SIMPLE)
        if (erase_cursor)
                SCREEN[prev_cursor] = ' ';
        SCREEN[cursor] = CURSOR;
#endif

        erase_cursor = 0;
        prev_cursor  = cursor;
}

/* TODO: In assembly (using fill) */
/* static void _txtmod_clear(char color, void *buff, int size) */

void txtmod_clear()
{
        usize i, size;
        size = ROWS * COLS * BPC;
        for (i = 0; i < size; i += BPC) {
                SCREEN[i] = ' ';
#if (MODE > TXTMOD_SIMPLE)
                SCREEN[i + 1] = BGCOLOR;
#endif
        }
}

void txtmod_init()
{
        txtmod_clear();
        erase_cursor = 0;
        prev_cursor  = 0;
        row          = 0;
        col          = 0;
}

void txtmod_scroll()
{
        usize i;
        u8   *last_line;
        last_line = SCREEN + COLS * (ROWS - 1) * BPC;
        if (scroll_lock) /* wait for a keypress to scroll */
                _getchar();
        hw_copy(SCREEN + COLS * BPC, SCREEN, COLS * (ROWS - 1) * BPC);

        for (i = 0; i < COLS * BPC; i += BPC) {
                last_line[i] = ' ';
#if (MODE > TXTMOD_SIMPLE)
                last_line[i + 1] = BGCOLOR;
#endif
        }
}

void txtmod_clear_update()
{
        txtmod_clear();
        erase_cursor = 1;
        row          = 0;
        col          = 0;
        update_cursor();
}

void txtmod_putc(char c)
{
        u32 position;
        position = (row * COLS + col) * BPC;

        /* Handle a backspace, by moving the cursor back one space */
        if (c == 0x08) {
                erase_cursor = 1;
                if (0 == col) {
                        col = 0;
                } else {
                        col--;
                }
        }

        /* Handle a tab by increasing the cursor's X, but only to a point
        // where it is divisible by 8. */
        if (c == 0x09) {
                erase_cursor = 1;
                col          = (col + TABSZ) & ~(TABSZ - 1);
                SCREEN[col] = '\t';
        }

        /*  // Handle carriage return */
        else if (c == '\r') {
                erase_cursor = 1;
                col          = 0;
#if (CR_AS_LN)
                row++;
#endif
        }

        /* // Handle newline by moving cursor back to left and increasing the
           row */
        else if (c == '\n') {
                erase_cursor = 1;
                col          = 0;
                row++;
        }
        /* // Handle any other printable character. */
        else if (c >= ' ') {
#if (MODE == TXTMOD_COMBINED || MODE == TXTMOD_RTEXT)
                SCREEN[position + 1] = color;
                SCREEN[position]     = c;
#elif (MODE == TXTMOD_SIMPLE)
                SCREEN[position] = c;
#endif
                col++;
        }

        /*  Check if we need to insert a new line because we have reached the
        end
        // of the screen. */
        if (col >= COLS) {
                col = 0;
                row++;
        }

        /* // Scroll the screen if needed. */
        if (row >= ROWS) {
                txtmod_scroll();
                prev_cursor -= COLS * BPC;
                erase_cursor = 1;
                row--;
        }
        /* // Move the hardware cursor. */
        update_cursor();
}

/* Outputs a counted string to the screen */
void _puts(const char *s, usize len)
{
        usize i;
        for (i = 0; i < len; i++) {
                txtmod_putc(*s++);
        }
}
