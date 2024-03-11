/*#include "include/system/loader.h"
#include "include/system/aout.h"
#include "include/system/error.h"
#include "include/system/fs.h"
#include "include/system/paging.h"

extern int KernelPhys;
int        program_entry, program_stack, ion_reentry;

int loader_load(ion_file *file)
{
        int         err, entry;
        static char header[32];

        err = fs_read_file(file, header, 32);
        if (err)
                return err;
        err = fs_rewind(file);
        if (err)
                return err;

        switch (*(int*)header) {
        case AOUT_QMAGIC:
                entry = aout_load((struct aout_exec *)header, file, 0x1000, 0xe50000);
                if (entry < 0)
                        return entry;
                program_entry = entry;
                program_stack = 0xe51000;
                return ION_EOK;
                break;
        default:
                return ION_EBADMAGIC;
                break;
        }
} */
