#include <ringbuff.h>
#include <string.h>

int ringbuff_push(struct ringbuff *ring, void *data)
{
        int next;

        /* next is where head will point to after this write. */
        next = ring->head + ring->element_size;

        if (next >= ring->maxlen)
                next = 0;

        /* if the head + 1 == tail, circular buffer is full */
        if (next == ring->tail)
                return -1;

        memcpy((char*)ring->buffer + ring->head, data, ring->element_size);
        ring->head = next;
        /* Load data and then move head to next data offset. */
        return 0;
}

int ringbuff_pop(struct ringbuff *ring, void *data)
{
        int next;

        /* if the head == tail, we don't have any data */
        if (ring->head == ring->tail)
                return -1;

        next = ring->tail + ring->element_size; /* // next is where tail will point */
                                                /* // to after this read. */
        if (next >= ring->maxlen)
                next = 0;

        /* Read data and then move */
        memcpy(data, (char*)ring->buffer + ring->tail, ring->element_size);
        /* tail to next offset. */
        ring->tail = next;
        return 0;
}
