#ifndef HW_H
#define HW_H

#include <stdint.h>

/**
 * @brief Writes a byte to data memory
 * 
 * @param byte the byte to data memory
 * @param addr16 the address to write to (16 bits)
 */
extern void sbd(uint8_t byte, int32_t addr16);

/**
 * @brief Writes a halfword to data memory
 * 
 * @param halfword the halfword to write
 * @param addr16 the address to write to (16 bits)
 */
extern void shd(int32_t halfword, int32_t addr16);

/**
 * @brief Writes a word to data memory
 * 
 * @param word the word to write
 * @param addr16 the address to write to (16 bits)
 */
extern void swd(int32_t word, int32_t addr16);

/**
 * @brief Reads an unsigned byte from data memroy
 * 
 * @param addr16 the address to read from
 * @return uint8_t the byte read
 */
extern uint8_t lbud(int32_t addr16);

/**
 * @brief Reads a signed byte from data memroy
 * 
 * @param addr16 the address to read from
 * @return uint8_t the byte read
 */
extern int32_t lbd(int32_t addr16);

/**
 * @brief Reads an unsigned halfword from data memroy
 * 
 * @param addr16 the address to read from
 * @return int32_t the halfword read read
 */
extern int32_t lhud(int32_t addr16);

/**
 * @brief Reads a signed halfword from data memory
 * 
 * @param addr16 the address to read from
 * @return int32_t the halfword read
 */
extern int32_t lhd(int32_t addr16);

/**
 * @brief Reads a word from data memory
 * 
 * @param addr16 the address to read from
 * @return int32_t the word read
 */
extern int32_t lwd(int32_t addr16);

/**
 * @brief Copies a buffer up to size, to another
 * 
 * @param src the source buffer
 * @param dest the destination buffer
 * @param size the bytes to copy over
 */
extern void copy(void *src, void *dest, int size);

/**
 * @brief Traces a value (using the trace instruction)
 * 
 * @param n the valye to trace 
 */
extern void trace(int n);

/**
 * @brief Maps a frame to a page
 * 
 * @param phy frame to map
 * @param log page to map
 * @param wx flags (write and execute permissions)
 */
extern void mmu_map(int phy, int log, int wx, int pt);

/**
 * @brief Unmap a page
 * 
 * @param log the page to unmap
 */
extern void mmu_unmap(int log, int pt);

/**
 * @brief Update a mapping
 * 
 * @param log the page to update
 * @param d dirty bit
 * @param p present bit
 */
extern void mmu_update(int log, int d, int p, int pt);

/**
 * @brief get the status of a page
 * 
 * @param log the page
 * @return int32_t the status of the page 
 */
extern int32_t  mmu_stat(int log, int pt);

/**
 * @brief set a page table
 * 
 * @param pt a pointer to the page table
 * @param len the lenght of the page table
 */
extern void mmu_setpt(void* pt, int len);

/**
 * @brief sets the priority level
 * 
 * @param prio the priority level
 */
extern void set_priority(int prio);

/**
 * @brief Enables interrupts
 * 
 */
extern void _interrupt_enable(void);

/**
 * @brief disables all interrupts
 * 
 */
extern void _interrupt_disable(void);

extern void __call(int addr);

#endif /* HW_H */