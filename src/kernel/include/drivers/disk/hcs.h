/**
 * @file hcs.h
 * @author Uri Nyx (rserranof03@usal.es)
 * @brief Interface to the assembly HCS driver
 * @version 0.1
 * @date 2024-02-15
 *
 * @copyright Copyright (c) 2024
 *
 */
#ifndef HCS_H
#define HCS_H

#include <ion.h>

#define HCS_SECTOR_SIZE 512
#define HCS_NSECTORS    65535

extern void hcs_load_driver(u8 dev, u32 sector, void *buff);
extern void hcs_store_driver(u8 dev, u32 sector, const void *buff);

#endif /* HCS_H */
