#include "include/system/kmalloc.h"
#include "include/system/error.h"
#include <stdio.h>
#include <stdlib.h>

static struct ion_kheap         kheap;
static struct ion_frame_bitset *kmalloc_bitset;
int                             kmalloc_err;

#define THRESHOLD 128
#define OVERALLOC 10

int        *_arena = 0;
int         _asize;
static int *freep;

int kmalloc_init(struct ion_kheap *heap, struct ion_frame_bitset *bitset)
{
        kheap.start_page.page   = heap->start_page.page;
        kheap.current_page.page = heap->start_page.page;
        kheap.here              = heap->here;
        kmalloc_err             = alloc_pages_contiguous(
                &kheap.start_page, &kheap.current_page, 2, 0, 0, bitset);
        kmalloc_bitset = bitset;
        _arena         = (int *)kheap.here;
        _asize         = (2 * 0x1000) / sizeof(int);
        _arena[0]      = _asize;
        freep          = _arena;
        return kmalloc_err;
}

static void defrag(void)
{
        int *p, *q, *end;

        end = _arena + _asize;
        for (p = _arena; p < end; p += abs(*p)) {
                if (*p > 0) {
                        for (q = p + *p; q < end && *q > 0; q += *q)
                                ;
                        *p = q - p;
                }
        }
}

void *kmalloc(int size)
{
        int            *p, *end;
        int             k, n, tries, sz;
        struct ion_page newpage;

        size = (size + sizeof(int) - 1) / sizeof(int);
        if (NULL == _arena) {
                if (size >= THRESHOLD)
                        _asize = size + 1;
                else
                        _asize = size * OVERALLOC;
                sz = _asize * sizeof(int);
                sz = ((sz + (0x1000 - 1)) & ~(0x1000 - 1));
                if (kmalloc_err = alloc_pages_contiguous(&kheap.current_page,
                                                         &newpage, sz / 0x1000,
                                                         0, 0, kmalloc_bitset))
                        return NULL;
                kheap.current_page.page  = newpage.page;
                kheap.current_page.frame = newpage.frame;
                kheap.current_page.perm  = newpage.perm;
                _arena                   = (int *)newpage.page;
                _arena[0]                = _asize;
                freep                    = _arena;
        }

        for (tries = 0; tries < 3; tries++) {
                end = _arena + _asize;
                p   = freep;
                do {
                        if (*p > size) {
                                if (size + 1 == *p) {
                                        *p = -*p;
                                } else {
                                        k  = *p; // block size
                                        *p = -(size + 1); // actualize block
                                                          // size

                                        p[size + 1] = k - size - 1;
                                }
                                freep = p;
                                return p + 1;
                        }
                        p += abs(*p);
                        if (p == end) {
                                p = _arena;
                        }
                        if (p < _arena || p >= end || 0 == *p) {
                                kmalloc_err = ION_ECORRUPT;
                                return NULL;
                        }
                } while (p != freep);
                if (0 == tries) {
                        defrag();
                } else {
                        if (size >= THRESHOLD) {
                                n = size + 1;
                        } else
                                n = size * OVERALLOC;
                        sz = n * sizeof(int);
                        sz = ((sz + (0x1000 - 1)) & ~(0x1000 - 1)); // align
                        if (kmalloc_err = alloc_pages_contiguous(
                                    &kheap.current_page, &newpage, sz / 0x1000,
                                    0, 0, kmalloc_bitset))
                                return NULL;
                        kheap.current_page.page  = newpage.page;
                        kheap.current_page.frame = newpage.frame;
                        kheap.current_page.perm  = newpage.perm;
                        k                        = _asize;
                        _asize += n;
                        *end = _asize - k;
                }
        }
        kmalloc_err = ION_ENOMEM;
        return NULL;
}

int kfree(void *p)
{
        int *pi;

        if (NULL == p)
                return 0;
        pi = p;
        if (pi < _arena || _arena + _asize < pi || pi[-1] >= 0) {
                kmalloc_err = ION_EBADFREE;
                return ION_EBADFREE;
        }
        --pi;
        *pi = -*pi;
        return 0;
}

void *kmalloc_e(int size, struct ion_error *err)
{
        void *p;
        p           = kmalloc(size);
        err->number = kmalloc_err;
        return p;
}

void kfree_e(void *p, struct ion_error *err)
{
        kfree(p);
        err->number = kmalloc_err;
}