#ifndef KB_H
#define KB_H

#define KB_CHARMODE 0
#define KB_SCANMODE 1

struct kb_press
{
    char character, modifiers;
    int scancode;
};

void kb_init(int mode);
void kb_get(struct kb_press *out);
extern void kb_setmode(int mode); 

#endif /* KB_H */
