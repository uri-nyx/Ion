/**
 * @file heap.h
 * @author Uri Nyx (rserranof03@usal.es)
 * @brief A simple heap for ION
 * @version 0.1
 * @date 2024-02-16
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#ifndef HEAP_H
#define HEAP_H

#include <ion.h>
#include <ion/error.h>
#include <ion/paging.h>

/**
 * @brief Structure that specifies the kernel's heap
 *
 */
struct ion_kheap {
        struct ion_page start_page, current_page;
        void           *here;
};

/**
 * @brief Initializes the general purpose memory allocator
 *
 * @param heap the description of the heap to initialize the allocator
 * @param[out] err the possible error produced on the initialization
 * @return int 0 on success the error code on failure.
 */
int ion_heap_init(struct ion_kheap *heap, struct ion_frame_bitset *bitset);

/**
 * @brief Allocates memory dynamically in the kernel's heap
 *
 * @param size the size in bytes of the buffer to allocate
 * @return void* a pointer to the area of memory allocated (NULL on failure)
 */
void *ion_malloc(usize size);

/**
 * @brief Allocates memoy dinamically in the kernel's heap and reports an error
 * on failure
 *
 * @param size the size in bytes of the buffer to allocate
 * @param[out] err the error produced on failure
 * @return void* a pointer to the area of memory allocated (NULL on failure)
 */
void *ion_malloc_e(usize size, struct ion_error *err);

/**
 * @brief Releases an area of memory previously allocated
 *
 * @param p the pointer to the area to release
 * @return int 0 on success, the error code on failure
 */
ion_errcode ion_free(void *p);

/**
 * @brief Releases an area of memory previously allocated and reports an error
 * type
 *
 * @param p the pointer to the area to release
 * @param[out] err the error on failure
 */
void ion_free_e(void *p, struct ion_error *err);

#endif /* HEAP_H */
