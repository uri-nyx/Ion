/**
 * @file ion.h
 * @author Uri Nyx (rserranof03@usal.es)
 * @brief Ideosincratic ION types (as u.h)
 * @version 0.1
 * @date 2024-02-15
 *
 * @copyright Copyright (c) 2024
 *
 */
#ifndef ION_H
#define ION_H

#include <stddef.h>
#include <stdint.h>

#define ION_PHYS_START 0xfe0000

#ifndef ION
#define ION (1)
#endif

/* Fixed width type aliases */

typedef int8_t   i8;
typedef int16_t  i16;
typedef int32_t  i32;
typedef uint8_t  u8;
typedef uint16_t u16;
typedef uint32_t u32;

typedef size_t usize;

/* Boolean type */

typedef int bool;
#define true  1
#define false 0

typedef int ion_errcode;

/* ALLOCATOR */

#define ALLOC(size) ion_malloc((size))
#define FREE(p)     ion_free((p))

/* PANIC */
#define PANIC(err) /* TODO: useful panic mechanism*/


#endif /* ION_H */
