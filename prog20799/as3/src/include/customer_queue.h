#include "customer.h"
typedef CustomerRecord QueueData;
#include "queue.h"

#define add_record(queue, record) enqueue(queue, record)
#define remove_record(queue) dequeue(queue)
#define init_record_queue() initQueue()


