#ifndef KMALLOC_H
#define KMALLOC_H
#include "include/paging.h"


typedef struct kheap
{
    page_t start_page, current_page;
    void   *here;
} kheap_t;


void    *kmalloc(int size);
void    kfree(void *p);
void    kmalloc_init(kheap_t *heap);

#endif /* KMALLOC_H */
