#ifndef HW_H
#define HW_H

typedef char uint8_t;
typedef int  int32_t;

/* Map instructions from data memory */
extern void sbd(uint8_t byte, int32_t addr16);
extern void sbh(int32_t halfword, int32_t addr16);
extern void sbw(int32_t word, int32_t addr16);
extern uint8_t lbud(int32_t addr16);
extern int32_t lbd(int32_t addr16);
extern int32_t lhud(int32_t addr16);
extern int32_t lhd(int32_t addr16);
extern int32_t lwd(int32_t addr16);
extern void trace(int n);

extern void mmu_map(int phy, int log, int wx);
extern void mmu_unmap(int log);
extern void mmu_update(int log, int d, int p);
extern int  mmu_stat(int log);
extern void mmu_setpt(void* pt, int len);

#endif /* HW_H */