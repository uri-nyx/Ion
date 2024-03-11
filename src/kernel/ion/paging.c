#include <drivers/hw.h>
#include <ion.h>
#include <ion/error.h>
#include <ion/int.h>
#include <ion/paging.h>
#include <string.h>

extern void *_enter;
extern char *_Kernel_end;

struct ion_frame_bitset Ion_paging_ctx;
u32                     Ion_currpt = 0;

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
        u32 i, j, toTest;
        for (i = 0; i < (bitset->nframes / (8 * 4)) /*INDEX_FROM_BIT*/; i++) {
                if (bitset->frames[i] != 0xFFFFFFFF) /* // nothing free, exit */
                /* // early. */
                {
                        /* // at least one bit is free here. */
                        for (j = 0; j < 32; j++) {
                                toTest = 0x1 << j;
                                if (!(bitset->frames[i] & toTest)) {
                                        return i * 4 * 8 + j;
                                }
                        }
                }
        }

        return -1;
}
int ion_alloc_pages_contiguous(struct ion_page *start, struct ion_page *end,
                               usize pages, int w, int x,
                               struct ion_frame_bitset *bitset)
{
        usize i;
        ion_errcode err;
        end->page = start->page;
        for (i = 0; i < pages; i++) {
                end->frame = 0;
                if ((err = ion_alloc_frame(end, w, x, bitset)))
                        return err;
                end->page += 0x1000;
        }
        return 0;
}

void ion_release_pages_contiguous(struct ion_page *start, usize pages,
                                  struct ion_frame_bitset *bitset)
{
        usize i;
        for (i = 0; i < pages; i++) {
                ion_free_frame(start, bitset);
                start->page -= 0x1000;
        }
}

/* // Function to allocate a frame. */
int ion_alloc_frame(struct ion_page *page, int writeable, int executable,
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
                hw_mmu_map(page->frame, page->page, page->perm, Ion_currpt);
        }

        return 0;
}

void ion_free_frame(struct ion_page *page, struct ion_frame_bitset *bitset)
{
        int frame;
        if ((frame = !page->frame)) {
                return;
        } else {
                clear_frame(frame, bitset);
                page->frame = 0x0;
                hw_mmu_unmap(frame, Ion_currpt);
        }
}

void page_fault_handler(sirius_registers regs)
{
        PANIC("Page Fault");
}

void ion_init_paging(struct ion_frame_bitset *bitset)
{
        u32 i;

        memcpy(&Ion_paging_ctx, bitset, sizeof(struct ion_frame_bitset));
        memset(bitset->frames, 0, (bitset->nframes / (8 * 4)));

        set_frame(0, bitset);
        hw_mmu_map(0, 0, 0x00, Ion_currpt); /* // THE NULL PAGE TO TRAP */

        i = ION_PHYS_START;
        while (i < (u32)_Kernel_end) {
                set_frame(i & 0xffffff, bitset);
                hw_mmu_map(i, i, 0x1, Ion_currpt);
                i += 0x1000;
        }

        /* Map the bss */

        /* Map the framebuffer */
        i = 0xe51000;
        while (i < 0xE9E000) {
                set_frame(i & 0xffffff, bitset);
                hw_mmu_map(i, i, 0x0, Ion_currpt);
                i += 0x1000;
        }

        ion_register_interrupt_handler(ISR_PAGE_FAULT, page_fault_handler);
        hw_mmu_enable((u32)_enter);
}
