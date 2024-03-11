/*
 *	NMH's Simple C Compiler, 2011,2012
 *	string.h
 */
#include "common/_size_t.h"

extern char *sys_errlist[];
extern int   sys_nerr;

void *memchr(void *p, int c, size_t len);
int   memcmp(void *p1, void *p2, size_t len);
void *memcpy(void *dest, const void *src, size_t len);
void *memmove(void *dest, const void *src, size_t len);
void *memset(void *p, int c, size_t len);
char *strcat(char *s, const char *a);
char *strchr(char *s, int c);
int   strcmp(const char *s1, const char *s2);
char *strcpy(char *dest, const char *src);
int   strcspn(char *s, char *set);
char *strdup(char *s);
char *strerror(int err);
int   strlen(const char *s);
char *strncat(char *s, char *a, size_t len);
int   strncmp(char *s1, char *s2, size_t len);
char *strncpy(char *dest, char *src, size_t len);
char *strpbrk(char *s, char *set);
char *strrchr(char *s, int c);
int   strspn(char *s, char *set);
char *strtok(char *s, char *sep);
