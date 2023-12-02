#include <string.h>
#include "include/paging.h"
#include "include/hw.h"
#include "include/int.h"
#include "include/error.h"

extern _mmu_enable(int addr);
extern int protected_entry;
extern int KernelPhys;
extern int KernelEnd;

// A bitset of frames - used or free.
int frames[512];
int nframes = 4096;

// Macros used in the bitset algorithms.
/*#define INDEX_FROM_BIT (a/(8*4))
#define OFFSET_FROM_BIT(a) (a%(8*4))*/

// Static function to set a bit in the frames bitset
static void set_frame(int frame_addr)
{
    int frame, idx, off;
    frame = frame_addr/0x1000;
    idx = (frame/(8*4))/*INDEX_FROM_BIT*/;
    off = (frame%(8*4))/*OFFSET_FROM_BIT*/;
    frames[idx] |= (0x1 << off);
}

// Static function to clear a bit in the frames bitset
static void clear_frame(int frame_addr)
{
    int frame, idx, off;
    frame = frame_addr/0x1000;
    idx = (frame/(8*4))/*INDEX_FROM_BIT*/;
    off = (frame%(8*4))/*OFFSET_FROM_BIT*/;
    frames[idx] &= ~(0x1 << off);
}

// Static function to test if a bit is set.
static int test_frame(int frame_addr)
{
    int frame, idx, off;
    frame = frame_addr/0x1000;
    idx = (frame/(8*4))/*INDEX_FROM_BIT*/;
    off = (frame%(8*4))/*OFFSET_FROM_BIT*/;
    return (frames[idx] & (0x1 << off));
}

// Static function to find the first free frame.
static int first_frame()
{
   int i, j, toTest;
   for (i = 0; i < (nframes/(8*4))/*INDEX_FROM_BIT*/; i++)
   {
       if (frames[i] != 0xFFFFFFFF) // nothing free, exit early.
       {
           // at least one bit is free here.
           for (j = 0; j < 32; j++)
           {
               toTest = 0x1 << j;
               if ( !(frames[i]&toTest) )
               {
                   return i*4*8+j;
               }
           }
       }
   }
} 

void alloc_pages_contiguous(page_t *start, int pages, int writeable, int executable, page_t *out) 
{
    int i;
    page_t end;
    end.page = start->page;
    for (i = 0; i < pages; i++)
    {
        end.frame = 0;
        alloc_frame(&end, writeable, executable);
        end.page += 0x1000;
    }
    out->page = end.page;
    out->frame = end.frame;
    out->perm = end.perm;
}

void  release_pages_contiguous(page_t *start, int pages)
{
    int i;
    for (i = 0; i < pages; i++)
    {
        free_frame(start);
        start->page -= 0x1000;
    }
}



// Function to allocate a frame.
void alloc_frame(page_t *page, int writeable, int executable)
{
    int idx;
   if (page->frame != 0)
   {
       return; // Frame was already allocated, return straight away.
   }
   else
   {
       idx = first_frame(); // idx is now the index of the first free frame.
       if (idx == (int)-1)
       {
           // PANIC is just a macro that prints a message to the screen then hits an infinite loop.
           panic("No free frames!");
       }
       set_frame(idx*0x1000); // this frame is now ours!
       page->perm |= (writeable)?0x8:0; // Should the page be writeable?
       page->perm |= (executable)?0x4:0; // Should the page be user-mode?
       page->frame = idx;
       mmu_map(page->frame, page->page, page->perm);
    }
}

// Function to deallocate a frame.
void free_frame(page_t *page)
{
   int frame;
   if (frame=!page->frame)
   {
       return; // The given page didn't actually have an allocated frame!
   }
   else
   {
       clear_frame(frame); // Frame is now free again.
       page->frame = 0x0; // Page now doesn't have a frame.
       mmu_unmap(frame);
   }
} 

static int page_fault_handler()
{
    panic("Page Fault");
    return -1;
}

void initialise_paging()
{
   int i;
   memset(frames, 0, (nframes/(8*4)));

   i = KernelPhys;
   while (i < KernelEnd)
   {
       // Kernel code is readable but not writeable from userspace.
       set_frame(i);
       mmu_map(i, i, 0x1);
       i += 0x1000;
   }

    /* Map the framebuffer */
    i = 0xe51000;
    while (i < 0xE9E000)
   {
       // Framebuffer code is readable but not writeable from userspace.
       set_frame(i);
       mmu_map(i, i, 0x0);
       i += 0x1000;
   }
   // Before we enable paging, we must register our page fault handler.
   register_interrupt_handlers(ISR_PAGE_FAULT, page_fault_handler);

   // Now, enable paging!
   _mmu_enable(protected_entry);
}