/* 
* txtmod.h -- defines the interface for the hardware text mode of Sirius
*/
#ifndef TXTMOD_H
#define TXTMOD_H

#define CHARBUFFER_ADDR  0xe51000
#define FRAMEBUFFER_ADDR 0xe53000

#define VIDEO_MODE       5
#define MODE_COMBINED    5

#define TXTMOD_COLS      80 /* TODO: update this based on the font */
#define TXTMOD_ROWS      25
#define TXRMOD_TABSZ     8

#define TXTMOD_CHARBUFFER ((char*)CHARBUFFER_ADDR)

#ifndef TXMOD_IMPLEMENTATION
extern char txtmod_color;         
extern char txtmod_clear;         
extern char txtmod_cursor_char;   
extern char txtmod_cursor_attr;
#endif

/* Output an asccii character to the screen */
void txtmod_putc(char c);

/* Output a colored asccii character to the screen */
void txtmod_color_putc(char c, char attribute);

/* Output a colored asccii character to an arbitrary point*/
void txtmod_pos_putc(char c, char attribute, char x, char y);

/* Output null terminated string to the screen */
void txtmod_puts(char *s);

/* Output a colored null terminated string to the screen */
void txtmod_color_puts(char *s, char attribute);

/* Output a colored null terminated string to an arbitrary point*/
void txtmod_pos_puts(char *s, char attribute, char x, char y);

/* Output a formated string to the screen */
int txtmod_printf(char *fmt, ...);

/* Clear the screen (in assembly) */
extern void txtmod_clear(void);

/* scroll the screen (in assembly) */
extern void txtmod_scroll(void);

#endif /* TXTMOD_H */
