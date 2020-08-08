#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_ITEMS 12
#define DIVISOR MAX_ITEMS
#define getSlot(number) (number % DIVISOR)

typedef struct node {
    int number;
    int freq;
    struct node *next;
}Node, *NodePtr;

NodePtr* initHash ();
void addElement (int number, NodePtr *hash);
NodePtr newElement (int number);
void chain (int number, NodePtr node);
void printChain (NodePtr node);
void printHash (NodePtr hash[]);
int countDistinct (NodePtr node);
int countUniqueEntries (NodePtr hash[]);


NodePtr newElement (int number)
{
    NodePtr p = (NodePtr)malloc (sizeof(Node));
    p->number   = number;
    p->freq     = 1;
    p->next     = NULL;

    return p;
}

NodePtr* initHash ()
{
    NodePtr *hash = (NodePtr *)calloc (MAX_ITEMS, sizeof(NodePtr));

    for (int j = 0; j < MAX_ITEMS; j++) {
        hash[j] = (NodePtr)malloc (sizeof (Node));
        hash[j] = NULL;
    }

    return hash;
}

void addElement (int number, NodePtr *hash)
{
    int slot = getSlot (number);

    if (hash[slot] == NULL) {
        hash[slot] = newElement (number);
        return;
    }

    chain (number, hash[slot]);
}

void chain (int number, NodePtr node)
{
    if (number == node->number) {
        node->freq += 1;
        return;
    }

    if (node->next == NULL) {
        node->next = newElement (number);
        return;
    }

    chain (number, node->next);
}

int countUniqueEntries (NodePtr hash[])
{
    int total = 0;

    for (int i = 0; i < MAX_ITEMS; i++) {
        total += countDistinct (hash[i]);
        //printf ("Index: %d = %d\n", i, countDistinct(hash[i]));
    }

    return total;
}

int countDistinct (NodePtr node) 
{
    if (node == NULL) return 0;

    if (node->freq == 1) return 1 + countDistinct (node->next);
}

void printChain (NodePtr node) 
{
    if (node == NULL) return;

    printf ("(%d , %d)->", node->number, node->freq);

    printChain (node->next);
}

void printHash (NodePtr hash[])
{
    for (int i = 0; i < MAX_ITEMS; i++) { 
        printf ("hash[%d] : ", i);
        printChain (hash[i]); 
        printf ("\n");
    }
}

int main (void)
{
    NodePtr *hash = initHash();
    FILE *in = fopen ("input.txt", "r");

    char buf[4];
    while (fgets (buf, 4, in) != NULL) {
        addElement ((int)strtol(buf, NULL, 10), hash);
    }

    printf ("There are %d distinct numbers."
            "The hash table including all the numbers\n", 
            countUniqueEntries (hash));

    printHash (hash);

    free(hash);
    fclose(in);
}