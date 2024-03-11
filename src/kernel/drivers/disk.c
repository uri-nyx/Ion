/**
 * @file disk.c
 * @author Uri Nyx (rserranof03@usal.es)
 * @brief Disk driver wrapper
 * @version 0.1
 * @date 2024-02-17
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#include <ion.h>
#include <drivers/disk.h>
#include <ion/error.h>

static load_driver_t disk_load_drivers[256];
static store_driver_t disk_store_drivers[256];

void disk_istall_drivers(u8 type, load_driver_t load_driver, store_driver_t store_driver)
{
        disk_load_drivers[(int)type]  = load_driver;
        disk_store_drivers[(int)type] = store_driver;
}

ion_errcode disk_load_sector(struct disk *device, u32 sector, void *buff)
{
        load_driver_t driver;
        if (sector >= device->sectors)
                return ION_ENSECTOR;
        if ((driver = disk_load_drivers[device->type])) {
                driver(device->dev, sector, buff);
                return 0;
        } else
                return ION_ENODRIVER;
}

ion_errcode disk_store_sector(struct disk *device, u32 sector, const void *buff)
{
        store_driver_t driver;
        if (sector >= device->sectors)
                return ION_ENSECTOR;
        if ((driver = disk_store_drivers[(int)device->type])) {
                driver(device->dev, sector, buff);
                return 0;
        } else
                return ION_ENODRIVER;
}

ion_errcode disk_load_sectors(struct disk *device, u32 start, usize sectors, void *buff)
{
        ion_errcode err;
        char *b;
        usize i;

        b = buff;
        for (i = 0; i < sectors; i++) {
                if ((err = disk_load_sector(device, start + i, (void *)b)))
                        return err;
                b += device->sector_size;
        }
        return 0;
}

ion_errcode disk_store_sectors(struct disk *device, u32 start, usize sectors, const void *buff)
{
        ion_errcode err;
        const char *b;
        usize i;
        
        b = buff;
        for (i = 0; i < sectors; i++) {
                if ((err = disk_store_sector(device, start + i, (void *)b)))
                        return err;
                b += device->sector_size;
        }
        return 0;
}
