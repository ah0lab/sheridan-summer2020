#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct node {
    QueueData data;
    struct node *next;
} Node, *NodePtr;

typedef struct {
    NodePtr head, tail;
} QType, *Queue;

Queue initQueue ();
bool isEmpty (Queue);
void enqueue (Queue, QueueData);
QueueData dequeue (Queue);