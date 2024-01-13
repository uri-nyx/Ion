#ifndef CLOCK_H
#define CLOCK_H

struct ion_time {
        int year, month, day, hour, minute, second, ms;
};

void clock_gettime(struct ion_time *now);
int  clock_unix_time(void);
int clock_read_counter(void);

#endif /* CLOCK_H */
