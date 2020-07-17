#include <stdio.h>
#include <stdlib.h>

typedef struct node {
    QueueData data;
    struct node *next;
} Node, *NodePtr;

typedef struct {
    NodePtr head, tail;
} QType, *Queue;

Queue initQueue() 
{
    Queue qp = (Queue)malloc (sizeof (QType));

    qp->head = NULL;
    qp->tail = NULL;

    return qp;
}

int isEmpty (Queue Q) { return (Q->head == NULL); }

void enqueue (Queue Q, QueueData d)
{
    // 1. Create a node
    NodePtr np = (NodePtr)malloc (sizeof (Node));
    np->data = d;
    np->next = NULL;

    // 2. If Queue is empty, add to head
    if (isEmpty (Q)) {
        Q->head = np;
        Q->tail = np;
    // 3. If Queue is populated, add to tail
    } else {
        Q->tail->next = np;
        Q->tail = np;
    }
}

QueueData dequeue (Queue Q)
{
    // 1. Check if Queue is empty
    if (isEmpty (Q)) {
        printf ("Error: Attempt to remove node from empty queue!");
        exit (1);
    }

    // 2. Store the data of node at head into hold variable
    QueueData hold = Q->head->data;
    // 3. Declare temp node ptr to hold addr of head.
    //      This temp will be used to free memory pointed by it.
    NodePtr temp = Q->head;

    // 4. Make head point to head->next
    Q->head = Q->head->next;

    // 5. Have tail point to NULL if head is NULL
    if (Q->head == NULL) Q->tail = NULL;

    // 6. Free old head pointer
    free (temp);

    // 7. Return data at old head pointer
    return hold;
}