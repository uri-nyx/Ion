#define TXMOD_IMPLEMENTATION

#include "include/txtmod.h"
#include "include/hw.h"

char txtmod_color       = 0x0f;         /* white on black color by default */
char txtmod_color_clear = 0x00;         /* the color for clearing the screen */
char txtmod_cursor_char = '|';    /* cursor is a blinking space character */
char txtmod_cursor_attr = 0x8f;

static char fbuff[TXTMOD_ROWS * TXTMOD_COLS + 1];
static int erase_prev = 0;
char row = 0;
char col = 0;
static int prev_cursor;

/* updates the cursor in software (there is no hw cursor)*/
static void update_cursor(void)
{
    int cursor;
    cursor = 2*(row*TXTMOD_COLS + col);
    if (erase_prev)
    {
        erase_prev = 0;
        *(TXTMOD_CHARBUFFER + prev_cursor) = ' ';
        *(TXTMOD_CHARBUFFER + prev_cursor + 1) = txtmod_color_clear;
    }
    *(TXTMOD_CHARBUFFER + cursor) = txtmod_cursor_char;
    *(TXTMOD_CHARBUFFER + cursor + 1) = txtmod_cursor_attr;
    prev_cursor = cursor;
}

void txtmod_putc(char c) { txtmod_color_putc(c, txtmod_color);} 

void txtmod_color_putc(char c, char attribute)
{
    char *cursor;

    /* Handle a backspace, by moving the cursor back one space */
    if (c == 0x08 && col)
    {
        erase_prev = 1;
        col--;
    }

    /* Handle a tab by increasing the cursor's X, but only to a point
    // where it is divisible by 8. */
    else if (c == 0x09)
    {
        erase_prev = 1;
        col = (col+TXRMOD_TABSZ) & ~(TXRMOD_TABSZ-1);
    }

   /*  // Handle carriage return */
    else if (c == '\r')
    {
        erase_prev = 1;
        col = 0;
    }

    /* // Handle newline by moving cursor back to left and increasing the row */
    else if (c == '\n')
    {
        erase_prev = 1;
        col = 0;
        row++;
    }
    /* // Handle any other printable character. */
    else if(c >= ' ')
    {
        cursor = (char*) (CHARBUFFER_ADDR + 2*(row*TXTMOD_COLS + col));
        *cursor = c;
        *(cursor + 1) = attribute;
        col++;
    }

    /*  Check if we need to insert a new line because we have reached the end
    // of the screen. */
    if (col >= 80)
    {
        col = 0;
        row ++;
    }

    /* // Scroll the screen if needed. */
    if (row >= TXTMOD_ROWS) 
    {
        txtmod_scroll();
        prev_cursor -= TXTMOD_COLS*2;
        erase_prev = 1;
    }
    /* // Move the hardware cursor. */
   update_cursor();
}

void txtmod_pos_putc(char c, char attribute, char x, char y)
{ 
    char x_tmp, y_tmp; 
    x_tmp = col, y_tmp = row;
    col = x, row = y;
    txtmod_color_putc(c, attribute);
    col = x_tmp, row = y_tmp;
}

/* Output null terminated string to the screen */
void txtmod_puts(char *s)
{
    char c;
    while (c = *s++)
    {
        txtmod_color_putc(c, txtmod_color);
    }
}

/* Output a colored null terminated string to the screen */
void txtmod_color_puts(char *s, char attribute) 
{
    char c;
    while (c = *s++)
    {
        txtmod_color_putc(c, attribute);
    }
}

/* Output a colored null terminated string to an arbitrary point*/
void txtmod_pos_puts(char *s, char attribute, char x, char y)
{
    char c, x_tmp, y_tmp; 
    x_tmp = col, y_tmp = row;
    col = x, row = y;
    while (c = *s++)
    {
        txtmod_color_putc(c, attribute);
    }
    col = x_tmp, row = y_tmp;
}

/* Output a formated string to the screen */
extern int _vformat(int mode, int max, void *dest, char *fmt, void **varg);
int txtmod_printf(char *fmt, ...) {
	_vformat(0, 0, (void *) fbuff, fmt, (void **) &fmt + 1);
    txtmod_puts(fbuff);
    return 0;
}