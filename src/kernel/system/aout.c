#include "include/system/aout.h"
#include "include/system/error.h"
#include "include/system/fs.h"
#include "include/system/paging.h"

int aout_load(struct aout_exec *exec, ion_file *file, int page_text,
              int page_stack)
{
        int             i, err;
        struct ion_page pt, pd, ps;

        if (exec->a_midmag != AOUT_QMAGIC)
                return ION_EBADMAGIC;

        pt.page = page_text;
        pt.perm = 1;
        err = alloc_pages_contiguous(&pt, &pd, exec->a_text / ION_PAGE_SZ, 0, 1,
                                     paging_ctx);
        if (err)
                return err;

        pd.perm = 2;
        err = alloc_pages_contiguous(&pd, &ps, exec->a_data / ION_PAGE_SZ, 1, 0,
                                     paging_ctx);
        if (err)
                return err;

        ps.page = page_stack;
        ps.frame = 0;
        ps.perm = 2;
        err     = alloc_frame(&ps, 1, 0, paging_ctx);
        if (err)
                return err;

        err = fs_read_file(file, (void *)pt.page, exec->a_text);
        if (err)
                return err;

        err = fs_read_file(file, (void *)pd.page, exec->a_data);
        if (err && err != ION_EOF)
                return err;

        return exec->a_entry;
}