#ifndef SYS_H
#define SYS_H

extern int           scroll_lock;
extern unsigned char terminal_ctx[4];

void           semicolon();
unsigned short hw_lhud(unsigned short address);
signed short   hw_lhd(unsigned short address);
unsigned char  hw_lbud(unsigned short address);
void           hw_shd(unsigned short address, unsigned short value);
void           hw_sbd(unsigned short address, unsigned char value);
void           hw_call(unsigned long address);

#define HCS_SECTOR_SIZE 512
#define HCS_NSECTORS    65535
#define TPS_SECTOR_SIZE 512
#define TPS_NSECTORS    256

extern void hcs_load_driver(unsigned short dev, unsigned short sector,
                            void *buff);
extern void hcs_store_driver(unsigned short dev, unsigned short sector,
                             void *buff);
extern void tps_load_driver(unsigned short dev, unsigned char sector,
                            void *buff);
extern void tps_store_driver(unsigned short dev, unsigned char sector,
                             void *buff);

/* CONFIG */
/* Allows access to all of the memory. Requires supervisor privilege */
#define TOTAL_MEMORY_ACCESS 1

/* Base cell data types. Use short/long on most systems for 16 bit cells. */
/* Experiment here if necessary. */
#define CELL_BASE_TYPE        short
#define DOUBLE_CELL_BASE_TYPE long
#define LN                    '\r'

/* Basic memory configuration */
#define MEM_SIZE        65536 /* main memory size in bytes */
#define STACK_SIZE      192 /* cells reserved for the stack */
#define RSTACK_SIZE     64 /* cells reserved for the return stack */
#define INPUT_LINE_SIZE 300 /* bytes reserved for the WORD buffer */
#define BLOCK_BUFF_SIZE 512
#define BLOCK_BUFFERS   8
#define BLOCK_BUFF_ADDR (MEM_SIZE - (BLOCK_BUFF_SIZE * BLOCK_BUFFERS))

#define BLOCK_TO_SECTOR(n) ((n) * 2)

/******************************************************************************/

/* Our basic data types */
typedef CELL_BASE_TYPE                 scell;
typedef DOUBLE_CELL_BASE_TYPE          dscell;
typedef unsigned CELL_BASE_TYPE        cell;
typedef unsigned DOUBLE_CELL_BASE_TYPE dcell;
typedef unsigned char                  byte;
#define CELL_SIZE  sizeof(cell)
#define DCELL_SIZE sizeof(dcell)

/* A few constants that describe the memory layout of this implementation */
#define LATEST_POSITION INPUT_LINE_SIZE
#define HERE_POSITION   (LATEST_POSITION + CELL_SIZE)
#define BASE_POSITION   (HERE_POSITION + CELL_SIZE)
#define STATE_POSITION  (BASE_POSITION + CELL_SIZE)
#define STACK_POSITION  (STATE_POSITION + CELL_SIZE)
#define RSTACK_POSITION (STACK_POSITION + STACK_SIZE * CELL_SIZE)
#define SBUF_POSITION   (RSTACK_POSITION + RSTACK_SIZE * CELL_SIZE)
#define HERE_START      (SBUF_POSITION + BLOCK_BUFFERS * CELL_SIZE * 2)
#define MAX_BUILTIN_ID  106

/* Flags and masks for the dictionary */
#define FLAG_IMMEDIATE  0x80
#define FLAG_HIDDEN     0x40
#define MASK_NAMELENGTH 0x1F

#define EOF (-1)

#endif /* SYS_H */
