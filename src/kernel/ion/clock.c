#include <drivers/hw.h>
#include <ion.h>
#include <ion/clock.h>

#define SYS_DEV 0XF0

enum { YEAR = 0xf4, MONTH, DAY, HOUR, MINUTE, SECOND, MILLIS };

/**
 * @brief Returns the current time
 *
 * @param[out] now a struct with the time filled in
 */

void clock_gettime(struct ion_time *now)
{
        now->year   = hw_lbud(YEAR);
        now->month  = hw_lbud(MONTH);
        now->day    = hw_lbud(DAY);
        now->hour   = hw_lbud(HOUR);
        now->minute = hw_lbud(MINUTE);
        now->second = hw_lbud(SECOND);
        now->ms     = hw_lbud(MILLIS);
}

u32 clock_unix_time(void)
{
        u32 time;

        hw_sbd(0, YEAR); /* swicth to epoch mode */
        time = hw_lbud(YEAR) << 24;
        time |= hw_lbud(MONTH) << 16;
        time |= hw_lbud(DAY) << 8;
        time |= hw_lbud(HOUR);
        hw_sbd(0, YEAR); /* swicth to date mode */

        return time;
}

u32 clock_read_counter(void)
{
        u32 count;
        hw_sbd(0, MINUTE);
        count = hw_lbud(MINUTE) << 24;
        count |= hw_lbud(SECOND) << 16;
        count |= hw_lbud(MILLIS) << 8;
        count |= hw_lbud(MILLIS + 1);
        return count;
}
