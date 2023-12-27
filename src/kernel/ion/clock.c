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
