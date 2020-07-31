#include "queue.h"

Queue initQueue ()
{
    Queue qp = (Queue)malloc (sizeof (QType));

    if (qp == NULL) {
        printf ("Failed to reserve memory for queue!\n");
        exit (1);
    }

    qp->head = NULL;
    qp->tail = NULL;

    return qp;
}

bool isEmpty (Queue Q) { return (Q->head == NULL); }

void enqueue (Queue Q, QueueData d)
{
    NodePtr np = (NodePtr)malloc (sizeof (Node));
    if (np == NULL) {
        printf ("Failed to reserve memory for queue node!\n");
        exit (1);
    }
    np->data = d;
    np->next = NULL;

    if (isEmpty (Q)) {
        Q->head = np;
        Q->tail = np;
    } else {
        Q->tail->next = np;
        Q->tail = np;
    }
}

QueueData dequeue (Queue Q)
{
    if (isEmpty (Q)) {
        printf ("Error: Attempt to remove node from empty queue!");
        exit (1);
    }

    QueueData hold = Q->head->data;
    NodePtr temp = Q->head;

    Q->head = Q->head->next;
    if (Q->head == NULL) Q->tail = NULL;

    free (temp);
    return hold;
}