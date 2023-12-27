#include "include/system/paging.h"
#include "include/drivers/hw.h"
#include "include/system/error.h"
#include "include/system/int.h"
#include <string.h>

extern _mmu_enable(int addr);
extern int protected_entry;
extern int KernelPhys;
extern int KernelEnd;

/* Set a bit in the bitset */
static void set_frame(int frame_addr, struct ion_frame_bitset *bitset)
{
        int frame, idx, off;
        frame = frame_addr / 0x1000;
        idx   = (frame / (8 * 4)) /*INDEX_FROM_BIT*/;
        off   = (frame % (8 * 4)) /*OFFSET_FROM_BIT*/;
        bitset->frames[idx] |= (0x1 << off);
}

/* clear a bit in the frames bitset */
static void clear_frame(int frame_addr, struct ion_frame_bitset *bitset)
{
        int frame, idx, off;
        frame = frame_addr / 0x1000;
        idx   = (frame / (8 * 4)) /*INDEX_FROM_BIT*/;
        off   = (frame % (8 * 4)) /*OFFSET_FROM_BIT*/;
        bitset->frames[idx] &= ~(0x1 << off);
}

/* to test if a bit is set. */
static int test_frame(int frame_addr, struct ion_frame_bitset *bitset)
{
        int frame, idx, off;
        frame = frame_addr / 0x1000;
        idx   = (frame / (8 * 4)) /*INDEX_FROM_BIT*/;
        off   = (frame % (8 * 4)) /*OFFSET_FROM_BIT*/;
        return (bitset->frames[idx] & (0x1 << off));
}

/* find the first free frame. */
static int first_frame(struct ion_frame_bitset *bitset)
{
        int i, j, toTest;
        for (i = 0; i < (bitset->nframes / (8 * 4)) /*INDEX_FROM_BIT*/; i++) {
                if (bitset->frames[i] != 0xFFFFFFFF) // nothing free, exit
                                                     // early.
                {
                        // at least one bit is free here.
                        for (j = 0; j < 32; j++) {
                                toTest = 0x1 << j;
                                if (!(bitset->frames[i] & toTest)) {
                                        return i * 4 * 8 + j;
                                }
                        }
                }
        }
}
int alloc_pages_contiguous(struct ion_page *start, struct ion_page *end,
                           int pages, int w, int x,
                           struct ion_frame_bitset *bitset)
{
        int i, err;
        end->page = start->page;
        for (i = 0; i < pages; i++) {
                end->frame = 0;
                if (err = alloc_frame(end, w, x, bitset))
                        return err;
                end->page += 0x1000;
        }
        return 0;
}

void release_pages_contiguous(struct ion_page *start, int pages,
                              struct ion_frame_bitset *bitset)
{
        int i;
        for (i = 0; i < pages; i++) {
                free_frame(start, bitset);
                start->page -= 0x1000;
        }
}

// Function to allocate a frame.
int alloc_frame(struct ion_page *page, int writeable, int executable,
                struct ion_frame_bitset *bitset)
{
        int idx;
        if (page->frame != 0) {
                return 0;
        } else {
                idx = first_frame(bitset);
                if (idx == (int)-1) {
                        return ION_ENOMEM;
                }
                set_frame(idx * 0x1000, bitset);
                page->perm |= (writeable) ? 0x2 : 0;
                page->perm |= (executable) ? 0x1 : 0;
                page->frame = idx * 0x1000;
                mmu_map(page->frame, page->page, page->perm);
        }
        
        return 0;
}

void free_frame(struct ion_page *page, struct ion_frame_bitset *bitset)
{
        int frame;
        if (frame = !page->frame) {
                return;
        } else {
                clear_frame(frame, bitset);
                page->frame = 0x0;
                mmu_unmap(frame);
        }
}

int page_fault_handler()
{
        panic("Page Fault");
        return ION_EDEFAULT;
}

void paging_init(struct ion_frame_bitset *bitset)
{
        int i;
        memset(bitset->frames, 0, (bitset->nframes / (8 * 4)));

        i = KernelPhys;
        while (i < KernelEnd) {
                set_frame(i, bitset);
                mmu_map(i, i, 0x1);
                i += 0x1000;
        }

        /* Map the bss */
        

        /* Map the framebuffer */
        i = 0xe51000;
        while (i < 0xE9E000) {
                set_frame(i, bitset);
                mmu_map(i, i, 0x0);
                i += 0x1000;
        }
       
        register_interrupt_handler(ISR_PAGE_FAULT, page_fault_handler);
        _mmu_enable(protected_entry);
}