#include <stdio.h>

static char *get_next(char *buff, char *next)
{
        char c;
        char *this;
        this = buff;

        while (c = *next++) {
                if (c == '/') {
                        *this = 0;
                        return next;
                }
                *this = c;
                this ++;
        }

        *this = 0;
        return NULL;
}

static int check_fname(char *fname)
{
        int i, j;

        for (i = 0; i < 9; i++) {
                if (fname[i] == '.')
                        break;
                if (fname[i] == '\0')
                        return 0;
        }

        for (j = i + 1; j < i + 5; j++) {
                if (fname[j] == '\0')
                        return 0;
        }
        return 1;
}

int main(void)
{
        char *path = "Files/folder/file.txt";
        char  buff[13];
        char *next;
        next = path;
        next = get_next(buff, next);
        printf("First chunk: %s, next: %s, 8.3: %d\n", buff, next,
               check_fname(buff));
        next = get_next(buff, next);
        printf("Second chunk: %s, next: %s, 8.3: %d\n", buff, next,
               check_fname(buff));
        next = get_next(buff, next);
        printf("Third chunk: %s, next: %s, 8.3: %d\n", buff, next,
               check_fname(buff));
        return 0;
}
