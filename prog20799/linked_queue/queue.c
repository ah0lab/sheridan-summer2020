#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define isEmpty(queue) (queue->head) ? true : false

typedef struct {
    int number;
} QueueData;

typedef struct node {
    QueueData data;
    struct node *next;
} Node;

typedef struct {
    Node *head, *tail;
} Queue;

Queue* initQueue ()
{
    Queue *qp = (Queue *)malloc (sizeof (Queue));
    qp->head = NULL;
    qp->tail = NULL;

    return qp;
}

void enqueue (Queue *queue, QueueData data)
{
    Node *node = (Node *)malloc (sizeof (Node));
    node->data = data;
    node->next = NULL;

    if (isEmpty (queue)) {
        queue->head = node;
        queue->tail = node;
    } else {
        queue->tail->next = node;
        queue->tail = node;
    }
}

QueueData dequeue (Queue *queue) {
    if (isEmpty (queue)) {
        printf ("\nAttempt to remove from an empty queue\n");
        exit (1);
    }

    // 1. Add data to hold
    QueueData hold = queue->head->data;
    // 2. Add head to temp
    Node *temp = queue->head;
    // 3. "Remove" what was at head,
    //      replace what head is pointing to next
    queue->head = queue->head->next;

    if (queue->head == NULL) queue->tail = NULL;
    free (temp); //Throw old head away
    return hold; // Return data that was at head
}

int main () 
{
    int n;
    QueueData temp;
    Queue *queue = initQueue ();

    printf ("Enter a positive integer: ");
    scanf ("%d", &n);

    while (n > 0) {
        temp.number = n % 10;
        enqueue (queue, temp);
        n /= 10;
    }
    printf ("\nDigits in reverse order: ");

    while (!isEmpty(queue)) printf ("%d", dequeue(queue).number);
    printf ("\n");
}

