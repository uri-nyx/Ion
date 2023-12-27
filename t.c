#include <stdio.h>

#define MAX(a, b) ((a)>(b)?(a):(b))

int main()
{
        printf("Hello\n");
        goto skip;
        printf("Hello 2\n");
skip:
        printf("Hello 3\n");
        return 0;
}
