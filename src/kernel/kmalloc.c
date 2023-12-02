#include "include/kmalloc.h"
#include "include/error.h"
#include "include/txtmod.h"
#include <stdio.h>
#include <stdlib.h>

static kheap_t kheap;

#define THRESHOLD 128
#define OVERALLOC 10

int *_arena = 0;
int _asize;
static int *freep;

void
kmalloc_init (kheap_t *heap)
{
  kheap.start_page.page = heap->start_page.page;
  kheap.current_page.page = heap->start_page.page;
  kheap.here = heap->here;
  alloc_pages_contiguous (
      &kheap.start_page, 2, 0, 0,
      &heap->current_page); // only the kernel can write the kernel's heap
  _arena = (int *)kheap.here;
  _asize = 2 * 0x1000;
  _arena[0] = _asize;
  freep = _arena;
}

static void
defrag (void)
{
  int *p, *q, *end;

  end = _arena + _asize;
  for (p = _arena; p < end; p += abs (*p))
    {
      if (*p > 0)
        {
          for (q = p + *p; q < end && *q > 0; q += *q)
            ;
          *p = q - p;
        }
    }
}

void *
kmalloc (int size)
{
  int *p, *end;
  int k, n, tries, sz;
  page_t newpage;

  size = (size + sizeof (int) - 1) / sizeof (int);
  if (NULL == _arena)
    {
      if (size >= THRESHOLD)
        _asize = size + 1;
      else
        _asize = size * OVERALLOC;
      sz = _asize * sizeof (int);
      sz = ((sz + (0x1000 - 1)) & ~(0x1000 - 1)); // align
      alloc_pages_contiguous (&kheap.current_page, sz / 0x1000, 0, 0,
                              &newpage);
      kheap.current_page = newpage;
      _arena = (int *)newpage.page;
      _arena[0] = _asize;
      freep = _arena;
    }

  for (tries = 0; tries < 3; tries++)
    {
      end = _arena + _asize;
      p = freep;
      do
        {
          if (*p > size)
            {
              if (size + 1 == *p)
                {
                  *p = -*p;
                }
              else
                {
                  k = *p;
                  *p = -(size + 1);
                  p[size + 1] = k - size - 1;
                }
              freep = p;
              return p + 1;
            }
          p += abs (*p);
          if (p == end)
            p = _arena;
          if (p < _arena || p >= end || 0 == *p)
            {
              panic ("kmalloc(): corrupt arena\n");
            }
        }
      while (p != freep);
      if (0 == tries)
        {
          defrag ();
        }
      else
        {
          if (size >= THRESHOLD)
            n = size + 1;
          else
            n = size * OVERALLOC;
          sz = n * sizeof (int);
          sz = ((sz + (0x1000 - 1)) & ~(0x1000 - 1)); // align
          trace (sz);
          alloc_pages_contiguous (&kheap.current_page, sz / 0x1000, 0, 0,
                                  &newpage);
          kheap.current_page = newpage;
          k = _asize;
          _asize += n;
          *end = _asize - k;
        }
    }
  panic ("Out of memory");
}

void
kfree (void *p)
{
  int *pi;

  if (NULL == p)
    return;
  pi = p;
  if (pi < _arena || _arena + _asize < pi || pi[-1] >= 0)
    {
      panic ("bad pointer in free()\n");
    }
  --pi;
  *pi = -*pi;
}