/**
 * @file hw.h
 * @author Uri Nyx (rserranof03@usal.es)
 * @brief Bindings for hardware instructions 
 * @version 0.1
 * @date 2024-02-16
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#ifndef HW_H
#define HW_H

#include <ion.h>

/**
 * @brief Writes a byte to data memory
 * 
 * @param byte the byte to data memory
 * @param addr16 the address to write to (16 bits)
 */
extern void hw_sbd(u8 byte, u16 addr16);

/**
 * @brief Writes a halfword to data memory
 * 
 * @param halfword the halfword to write
 * @param addr16 the address to write to (16 bits)
 */
extern void hw_shd(i16 halfword, u16 addr16);

/**
 * @brief Writes a word to data memory
 * 
 * @param word the word to write
 * @param addr16 the address to write to (16 bits)
 */
extern void hw_swd(u32 word, u16 addr16);

/**
 * @brief Reads an unsigned byte from data memroy
 * 
 * @param addr16 the address to read from
 * @return uint8_t the byte read
 */
extern u8 hw_lbud(u16 addr16);

/**
 * @brief Reads a signed byte from data memroy
 * 
 * @param addr16 the address to read from
 * @return uint8_t the byte read
 */
extern i8 hw_lbd(u16 addr16);

/**
 * @brief Reads an unsigned halfword from data memroy
 * 
 * @param addr16 the address to read from
 * @return int32_t the halfword read read
 */
extern u16 hw_lhud(u16 addr16);

/**
 * @brief Reads a signed halfword from data memory
 * 
 * @param addr16 the address to read from
 * @return int32_t the halfword read
 */
extern i16 hw_lhd(u16 addr16);

/**
 * @brief Reads a word from data memory
 * 
 * @param addr16 the address to read from
 * @return int32_t the word read
 */
extern u32 hw_lwd(u16 addr16);

/**
 * @brief Copies a buffer up to size, to another
 * 
 * @param src the source buffer
 * @param dest the destination buffer
 * @param size the bytes to copy over
 */
extern void hw_copy(const void *src, const void *dest, usize size);

/**
 * @brief Traces a value (using the trace instruction)
 * 
 * @param n the valye to trace 
 */
extern void hw_trace(int n);

/**
 * @brief Maps a frame to a page
 * 
 * @param phy frame to map
 * @param log page to map
 * @param wx flags (write and execute permissions)
 */
extern void hw_mmu_map(u32 phy, u32 log, u32 wx, u32 pt);

/**
 * @brief Unmap a page
 * 
 * @param log the page to unmap
 */
extern void hw_mmu_unmap(u32 log, u32 pt);

/**
 * @brief Update a mapping
 * 
 * @param log the page to update
 * @param d dirty bit
 * @param p present bit
 */
extern void hw_mmu_update(u32 log, u32 d, u32 p, u32 pt);

/**
 * @brief get the status of a page
 * 
 * @param log the page
 * @return int32_t the status of the page 
 */
extern u32  hw_mmu_stat(u32 log, u32 pt);

/**
 * @brief set a page table
 * 
 * @param pt a pointer to the page table
 * @param len the lenght of the page table
 */
extern void hw_mmu_setpt(const void* pt, usize len);

extern void hw_mmu_enable(u32 addr);
extern void hw_mmu_switch(u32 pt);

/**
 * @brief sets the priority level
 * 
 * @param prio the priority level
 */
extern void hw_set_priority(u32 prio);

/**
 * @brief Enables interrupts
 * 
 */
extern void hw_interrupt_enable(void);

/**
 * @brief disables all interrupts
 * 
 */
extern void hw_interrupt_disable(void);

#endif /* HW_H */
