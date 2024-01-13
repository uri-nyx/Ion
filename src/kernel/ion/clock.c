#include "include/ion/clock.h"
#include "include/drivers/hw.h"

#define SYS_DEV 0XF0

enum { YEAR = 0xf4, MONTH, DAY, HOUR, MINUTE, SECOND, MILLIS };

/**
 * @brief Returns the current time
 *
 * @param[out] now a struct with the time filled in
 */

void clock_gettime(struct ion_time *now)
{
        now->year   = lbud(YEAR);
        now->month  = lbud(MONTH);
        now->day    = lbud(DAY);
        now->hour   = lbud(HOUR);
        now->minute = lbud(MINUTE);
        now->second = lbud(SECOND);
        now->ms     = lbud(MILLIS);
}

int clock_unix_time(void)
{
        int time;

        sbd(0, YEAR); // swicth to epoch mode
        time = lbud(YEAR) << 24;
        time |= lbud(MONTH) << 16;
        time |= lbud(DAY) << 8;
        time |= lbud(HOUR);
        sbd(0, YEAR); // swicth to date mode

        return time;
}

int clock_read_counter(void)
{
        int count;
        sbd(0, MINUTE);
        count = lbud(MINUTE) << 24;
        count |= lbud(SECOND) << 16;
        count |= lbud(MILLIS) << 8;
        count |= lbud(MILLIS + 1);
        return count;
}


