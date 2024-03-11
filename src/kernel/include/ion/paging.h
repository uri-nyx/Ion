/**
 * @file paging.h
 * @author Uri Nyx (rserranof03@usal.es)
 * @brief ION paging and virtual memory interface
 * @version 0.1
 * @date 2024-02-15
 *
 * @copyright Copyright (c) 2024
 *
 */
#ifndef PAGING_H
#define PAGING_H

#include <ion.h>
#include <ion/error.h>
#include <ion/int.h>

#define ION_PAGE_SZ 0x1000

/**
 * @brief Maps a logical page with a physical frame
 *
 */
struct ion_page {
        u32 frame, page, perm;
};

/**
 * @brief Keeps track of the allocated physical frames
 *
 */
struct ion_frame_bitset {
        u32 nframes, frames[512];
};

extern struct ion_frame_bitset Ion_paging_ctx;
extern u32                     Ion_currpt;
/**
 * @brief Initializes paging
 *
 */
void ion_init_paging(struct ion_frame_bitset *bitset);

/**
 * @brief Allocates and maps a physical frame to a page
 *
 * @param[in,out] page the page to assign a frame to
 * @param w whether to map as writable
 * @param x whether to map as executable
 * @param[in,out] bitset the bitset used to allocate the frame
 * @return int 0 on success, the error code otherwise
 */
ion_errcode ion_alloc_frame(struct ion_page *page, int w, int x,
                            struct ion_frame_bitset *bitset);

/**
 * @brief Deallocate and unmap a physical frame from a page
 *
 * @param page the page to unmap
 * @param bitset the bitset from wich to clear the page from
 */
void ion_free_frame(struct ion_page *page, struct ion_frame_bitset *bitset);

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
ion_errcode ion_alloc_pages_contiguous(struct ion_page *start,
                                       struct ion_page *end, usize pages, int w,
                                       int x, struct ion_frame_bitset *bitset);

/**
 * @brief Release and unmap contiguous pages
 *
 * @param start the page to start unmapping from
 * @param pages the number of pages to release
 * @param bitset the bitset to use for allocation
 */
void ion_release_pages_contiguous(struct ion_page *start, usize pages,
                                  struct ion_frame_bitset *bitset);

/**
 * @brief Handler for page faults
 *
 * @return int mandated by convention
 */
void ion_page_fault_handler(sirius_registers);

#endif /* PAGING_H */
