#include "include/drivers/disk.h"
#include "include/system/error.h"

static void *disk_read_drivers[256];
static void *disk_write_drivers[256];

void disk_istall_drivers(char type, int (*load_driver)(), int (*store_driver)())
{
        disk_read_drivers[(int)type]  = load_driver;
        disk_write_drivers[(int)type] = store_driver;
}

int disk_load_sector(struct disk *device, int sector, void *buff)
{
        int (*driver)();
        if (sector >= device->sectors)
                return ION_ENSECTOR;
        if ((driver = disk_read_drivers[device->type])) {
                driver(device->dev, sector, buff);
                return 0;
        } else
                return ION_ENODRIVER;
}

int disk_store_sector(struct disk *device, int sector, void *buff)
{
        int (*driver)();
        if (sector >= device->sectors)
                return ION_ENSECTOR;
        if ((driver = disk_write_drivers[(int)device->type])) {
                driver(device->dev, sector, buff);
                return 0;
        } else
                return ION_ENODRIVER;
}

int disk_load_sectors(struct disk *device, int start, int sectors, void *buff)
{
        int   i, err;
        char *b;
        b = buff;
        for (i = 0; i < sectors; i++) {
                if (err = disk_load_sector(device, start + i, (void *)b))
                        return err;
                b += device->sector_size;
        }
        return 0;
}

int disk_store_sectors(struct disk *device, int start, int sectors, void *buff)
{
        int   i, err;
        char *b;
        b = buff;
        for (i = 0; i < sectors; i++) {
                if (err = disk_store_sector(device, start + i, (void *)b))
                        return err;
                b += device->sector_size;
        }
        return 0;
}
