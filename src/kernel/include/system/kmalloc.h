#ifndef KMALLOC_H
#define KMALLOC_H

#ifndef __LINT
#include "include/system/error.h"
#include "include/system/paging.h"
#else
#include "error.h"
#include "paging.h"
#endif

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
int kmalloc_init(struct ion_kheap *heap, struct ion_frame_bitset *bitset);

/**
 * @brief Allocates memory dynamically in the kernel's heap
 *
 * @param size the size in bytes of the buffer to allocate
 * @return void* a pointer to the area of memory allocated (NULL on failure)
 */
void *kmalloc(int size);

/**
 * @brief Allocates memoy dinamically in the kernel's heap and reports an error
 * on failure
 *
 * @param size the size in bytes of the buffer to allocate
 * @param[out] err the error produced on failure
 * @return void* a pointer to the area of memory allocated (NULL on failure)
 */
void *kmalloc_e(int size, struct ion_error *err);

/**
 * @brief Releases an area of memory previously allocated
 *
 * @param p the pointer to the area to release
 * @return int 0 on success, the error code on failure
 */
int kfree(void *p);

/**
 * @brief Releases an area of memory previously allocated and reports an error
 * type
 *
 * @param p the pointer to the area to release
 * @param[out] err the error on failure
 */
void kfree_e(void *p, struct ion_error *err);

#endif /* KMALLOC_H */
