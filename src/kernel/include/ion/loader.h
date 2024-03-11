/**
 * @file loader.h
 * @author Uri Nyx (rserranof03@usal.es)
 * @brief The static executable loader for ION
 * @version 0.1
 * @date 2024-02-15
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#ifndef LOADER_H
#define LOADER_H

#include <ion.h>
#include <ion/fs.h>

ion_errcode ion_load(ion_file *file);

#endif /* LOADER_H */
