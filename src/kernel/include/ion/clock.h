/**
 * @file clock.h
 * @author Uri Nyx (rserranof03@usal.es)
 * @brief Talea clock driver
 * @version 0.1
 * @date 2024-02-15
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#ifndef CLOCK_H
#define CLOCK_H

#include <ion.h>

struct ion_time {
        u32 year, month, day, hour, minute, second, ms;
};

void clock_gettime(struct ion_time *now);
u32  clock_unix_time(void);
u32 clock_read_counter(void);

#endif /* CLOCK_H */
