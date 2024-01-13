#ifndef PAGING_H
#define PAGING_H
#include "include/system/error.h"
#include <stdint.h>

#define ION_PAGE_SZ 0x1000

extern int paging_currpt;

/**
 * @brief Maps a logical page with a physical frame
 *
 */
struct ion_page {
        int32_t frame, page, perm;
};

/**
 * @brief Keeps track of the allocated physical frames
 *
 */
struct ion_frame_bitset {
        int32_t nframes, frames[512];
};

extern struct ion_frame_bitset *paging_ctx;

/**
 * @brief Initializes paging
 *
 */
void paging_init(struct ion_frame_bitset *bitset);

/**
 * @brief Allocates and maps a physical frame to a page
 *
 * @param[in,out] page the page to assign a frame to
 * @param w whether to map as writable
 * @param x whether to map as executable
 * @param[in,out] bitset the bitset used to allocate the frame
 * @return int 0 on success, the error code otherwise
 */
int alloc_frame(struct ion_page *page, int w, int x,
                struct ion_frame_bitset *bitset);

/**
 * @brief Deallocate and unmap a physical frame from a page
 *
 * @param page the page to unmap
 * @param bitset the bitset from wich to clear the page from
 */
void free_frame(struct ion_page *page, struct ion_frame_bitset *bitset);

/**
 * @brief Allocate contiguous pages to physical frames
 *
 * @param start page from which to start allocating
 * @param[out] end the last page to be allocated
 * @param pages number of pages to allocate
 * @param w whether to map as writable
 * @param x whether to map as executable
 * @param[in,out] bitset bitset the bitset used to allocate the frames
 * @return int 0 on success, the error code otherwise
 */
int alloc_pages_contiguous(struct ion_page *start, struct ion_page *end,
                           int pages, int w, int x,
                           struct ion_frame_bitset *bitset);

/**
 * @brief Release and unmap contiguous pages
 *
 * @param start the page to start unmapping from
 * @param pages the number of pages to release
 * @param bitset the bitset to use for allocation
 */
void release_pages_contiguous(struct ion_page *start, int pages,
                              struct ion_frame_bitset *bitset);

/**
 * @brief Handler for page faults
 *
 * @return int mandated by convention
 */
int page_fault_handler();

#endif /* PAGING_H */
