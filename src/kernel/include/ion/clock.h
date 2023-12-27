#ifndef CLOCK_H
#define CLOCK_H

struct ion_time { int year, month, day, hour, minute, second, ms; };

void clock_gettime(struct ion_time *now);

#endif /* CLOCK_H */
