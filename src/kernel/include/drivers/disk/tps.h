/**
 * @file tps.h
 * @author Uri Nyx (rserranof03@usal.es)
 * @brief Interface for the assembly TPS driver
 * @version 0.1
 * @date 2024-02-15
 *
 * @copyright Copyright (c) 2024
 *
 */

#ifndef TPS_H
#define TPS_H

#include <ion.h>

#define TPS_SECTOR_SIZE 512
#define TPS_NSECTORS    256

extern void tps_load_driver(u8 dev, u32 sector, void *buff);
extern void tps_store_driver(u8 dev, u32 sector, const void *buff);

#endif /* TPS_H */
