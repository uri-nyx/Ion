#include "include/system/ringbuff.h"
#include "include/drivers/hw.h"
#include "include/system/error.h"

int ringbuff_push(struct ringbuff *ring, void *data)
{
        int next;

        /* next is where head will point to after this write. */
        next = ring->head + ring->element_size;

        if (next >= ring->maxlen)
                next = 0;

        /* if the head + 1 == tail, circular buffer is full */
        if (next == ring->tail)
                return ION_ERINGFULL;

        copy(data, ring->buffer + ring->head, ring->element_size);
        ring->head = next;
        /* Load data and then move head to next data offset. */
        return ION_EOK;
}

int ringbuff_pop(struct ringbuff *ring, void *data)
{
        int next;

        /* if the head == tail, we don't have any data */
        if (ring->head == ring->tail)
                return ION_ERINEMPTY;

        next = ring->tail + ring->element_size; // next is where tail will point
                                                // to after this read.
        if (next >= ring->maxlen)
                next = 0;

        /* Read data and then move */
        copy(ring->buffer + ring->tail, data, ring->element_size);
        /* tail to next offset. */
        ring->tail = next; 
        return ION_EOK; 
}