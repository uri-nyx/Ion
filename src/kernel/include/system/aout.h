#ifndef AOUT_H
#define AOUT_H

#include "include/system/fs.h"

#define AOUT_QMAGIC 0314

struct aout_exec {
        int a_midmag;
        int a_text;
        int a_data;
        int a_bss;
        int a_syms;
        int a_entry;
        int a_trsize;
        int a_drsize;
};

/**
 * @brief Returns the address of the entry point or a negative error code
 *
 * @param exec the exec header of the file
 * @param page_text the page where to start loading text
 * @param page_stack the page for the stack
 * @return int
 */
int aout_load(struct aout_exec *exec, ion_file *file, int page_text,
              int page_stack);

#endif /* AOUT_H */
