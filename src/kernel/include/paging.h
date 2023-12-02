#ifndef PAGING_H
#define PAGING_H

#include "include/int.h"

typedef struct page
{
  int frame, page, perm;
} page_t;

typedef struct page_table
{
   page_t pages[4096];
} page_table_t;

/**
  Sets up the environment, page directories etc and
  enables paging.
**/
void initialise_paging();

/**
 * issues a mmu.setpt
**/
void switch_page_directory(page_table_t *new);
void alloc_frame(page_t *page, int writeable, int executable);
void alloc_pages_contiguous(page_t *start, int pages, int writeable, int executable, page_t *out);
void  release_pages_contiguous(page_t *start, int pages);
void free_frame(page_t *page);

/**
  Handler for page faults.
**/
int page_fault(); 

#endif /* PAGING_H */
