#ifndef LOADER_H
#define LOADER_H
#include "include/system/fs.h"

int loader_load(ion_file *file);
extern int loader_user_exec(void);

#endif /* LOADER_H */
