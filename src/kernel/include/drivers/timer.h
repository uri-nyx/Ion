/**
 * @file timer.h
 * @author Uri Nyx (rserranof03@usal.es)
 * @brief Talea timer driver
 * @version 0.1
 * @date 2024-02-15
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#ifndef TIMER_H
#define TIMER_H

#include <ion.h>

/**
 * @brief Initialize the timer
 * 
 */
void timer_init(void);

/**
 * @brief Set an interval for the timer. No exact rule applies
 * 
 * @param interval 
 * @param freq 
 */
extern void timer_interval_set(u32 interval, u8 freq);

#endif /* TIMER_H */
