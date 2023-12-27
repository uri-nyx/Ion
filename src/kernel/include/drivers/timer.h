#ifndef TIMER_H
#define TIMER_H

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
extern void timer_interval_set(int interval, char freq);

#endif /* TIMER_H */
