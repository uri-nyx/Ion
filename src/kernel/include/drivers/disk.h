/**
 * @file disk.h
 * @author Uri Nyx (rserranof03@usal.es)
 * @brief High level disk driver interface
 * @version 0.1
 * @date 2024-02-15
 *
 * @copyright Copyright (c) 2024
 *
 */

#ifndef DISK_H
#define DISK_H

#include <drivers/disk/hcs.h>
#include <drivers/disk/tps.h>
#include <ion.h>

#define DISK_TPS 0
#define DISK_HCS 1

typedef void (*load_driver_t)(u8 dev, u32 sector, void *buff);
typedef void (*store_driver_t)(u8 dev, u32 sector, const void *buff);

struct disk {
        u8  type, dev;
        u32 sectors, sector_size;
};

/**
 * @brief Installs a driver for a the type of device
 *
 * @param type the type ID of the device
 * @param load_driver implements loading a sector
 * @param store_driver implements storing a sector
 */
void disk_install_drivers(u8 type, load_driver_t load_driver,
                          store_driver_t store_driver);

/**
 * @brief Loads a sector
 *
 * @param device the disk to load from
 * @param sector the sector to load (in LBA notation)
 * @param buff a buffer to load the sector in
 * @return int 0 on success otherwise an error code
 */
ion_errcode disk_load_sector(struct disk *device, u32 sector, void *buff);

/**
 * @brief Wrapper around disk_load_sector to load consecutive sectors
 *
 * @param device the disk to load from
 * @param start the starting sector (in LBA notation)
 * @param sectors the number of sectors to load
 * @param buff a buffer to store the sectors in
 * @return int 0 on success otherwise an error code
 */
ion_errcode disk_load_sectors(struct disk *device, u32 start, usize sectors,
                              void *buff);

/**
 * @brief Stores a sector
 *
 * @param device the disk to store in
 * @param sector the sector to store in (in LBA notation)
 * @param buff a buffer to the data to store
 * @return int 0 on success otherwise an error code
 */
ion_errcode disk_store_sector(struct disk *device, u32 sector,
                              const void *buff);

/**
 * @brief Wrapper around disk_store_sector to store consecutive sectors
 *
 * @param device the disk to store int
 * @param start the starting sector to store in (in LBA notation)
 * @param sectors the number of sectors to store
 * @param buff a buffer of the data to store
 * @return int 0 on success otherwise an error code
 */
ion_errcode disk_store_sectors(struct disk *device, u32 start,
                               usize sectors, const void *buff);

#endif /* DISK_H */
