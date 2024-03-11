#ifndef KB_H
#define KB_H

#include <ion.h>

#define KB_CHARMODE 0
#define KB_SCANMODE 1

extern int Kb_keypressed;

/**
 * @brief A key press
 *
 */
struct kb_press {
        u8 character;
        int  scancode;
        int  shift, ctrl, alt, meta;
};

/**
 * @brief Initialize the keyboard
 *
 * @param mode
 */
void kb_init(u8 mode);

/**
 * @brief Read a keypress. It does not wait, but return the contents of the
 * internal register
 *
 * @param[out] out the keypress
 */
void kb_get(struct kb_press *out);

ion_errcode kb_last(struct kb_press *out);


/**
 * @brief Set a keyboard mode
 *
 * @param mode the mode to sec (CHARMODE or SCANMODE)
 */
extern void kb_setmode(u8 mode);

#endif /* KB_H */
