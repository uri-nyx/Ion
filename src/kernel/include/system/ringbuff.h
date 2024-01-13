#ifndef RINGBUFF_H
#define RINGBUFF_H

struct ringbuff {
        void *buffer;
        int   tail, head;
        int   element_size, maxlen;
};

int ringbuff_push(struct ringbuff *ring, void *data);
int ringbuff_pop(struct ringbuff *ring, void *data);


#endif /* RINGBUFF_H */
