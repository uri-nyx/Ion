#ifndef DISK_H
#define DISK_H

#define DISK_TPS 0
#define DISK_DSK 1

extern void tps_load_driver(int dev, int sector, void *buff);
extern void tps_store_driver(int dev, int sector, void *buff);

extern void disk_load_driver(int dev, int sector, void *buff);
extern void disk_store_driver(int dev, int sector, void *buff);


struct disk {
        int type, dev;
        int  sectors, sector_size;
};

/**
 * @brief Installs a driver for a the type of device 
 * 
 * @param type the type ID of the device
 * @param load_driver implements loading a sector
 * @param store_driver implements storing a sector
 */
void disk_istall_drivers(char type, int (*load_driver)(), int (*store_driver)());

/**
 * @brief Loads a sector
 * 
 * @param device the disk to load from
 * @param sector the sector to load (in LBA notation)
 * @param buff a buffer to load the sector in
 * @return int 0 on success otherwise an error code
 */
int disk_load_sector(struct disk *device, int sector, void *buff);

/**
 * @brief Wrapper around disk_load_sector to load consecutive sectors
 * 
 * @param device the disk to load from
 * @param start the starting sector (in LBA notation)
 * @param sectors the number of sectors to load
 * @param buff a buffer to store the sectors in
 * @return int 0 on success otherwise an error code
 */
int disk_load_sectors(struct disk *device, int start, int sectors, void *buff);

/**
 * @brief Stores a sector
 * 
 * @param device the disk to store in
 * @param sector the sector to store in (in LBA notation)
 * @param buff a buffer to the data to store
 * @return int 0 on success otherwise an error code
 */
int disk_store_sector(struct disk *device, int sector, void *buff);

/**
 * @brief Wrapper around disk_store_sector to store consecutive sectors
 * 
 * @param device the disk to store int
 * @param start the starting sector to store in (in LBA notation)
 * @param sectors the number of sectors to store
 * @param buff a buffer of the data to store
 * @return int 0 on success otherwise an error code
 */
int disk_store_sectors(struct disk *device, int start, int sectors, void *buff);

#endif /* DISK_H */
