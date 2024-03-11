/**
 * @file lock.h
 * @author Uri Nyx (rserranof03@usal.es)
 * @brief Locks for ION
 * @version 0.1
 * @date 2024-02-15
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#ifndef LOCK_H
#define LOCK_H

extern void ion_lock_scheduler(void);
extern void ion_unlock_scheduler(void);

extern void ion_lock_system(void);
extern void ion_unlock_system(void);



#endif /* LOCK_H */
