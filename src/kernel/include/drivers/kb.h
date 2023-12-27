#ifndef KB_H
#define KB_H

#define KB_CHARMODE 0
#define KB_SCANMODE 1

/**
 * @brief A key press
 *
 */
struct kb_press {
        char character, modifiers;
        int  scancode;
};

/**
 * @brief Initialize the keyboard
 *
 * @param mode
 */
void kb_init(int mode);

/**
 * @brief Read a keypress. It does not wait, but return the contents of the
 * internal register
 *
 * @param[out] out the keypress
 */
void kb_get(struct kb_press *out);

/**
 * @brief Set a keyboard mode
 *
 * @param mode the mode to sec (CHARMODE or SCANMODE)
 */
extern void kb_setmode(int mode);

#endif /* KB_H */