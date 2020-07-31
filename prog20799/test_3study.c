#include <stdio.h>
#include <stdlib.h>

/*
 * QUEUES
 */
typedef struct {
    int number;
} QueueData;

typedef QueueData NodeData;

// QUEUE NODE
typedef struct node {
    QueueData data;
    struct node *next;
} Node;

// QUEUE OBJECT
typedef struct {
    Node *head, *tail;
} Queue;

// QUEUE INITIALIZATION
Queue* initQueue ()
{
    Queue *qp = (Queue *)malloc (sizeof (Queue));
    qp->head = NULL;
    qp->tail = NULL;

    return qp;
}

// ENQUEUE
void enqueue (Queue *queue, QueueData data)
{
    // 1. Create new node using data
    Node *node = (Node *)malloc (sizeof (Node));
    node->data = data;
    node->next = NULL;

    // 2. Check if the queue is empty (queue->head == NULL)
    if (isEmpty (queue)) {
        // a. Add node to head & tail
        queue->head = node;
        queue->tail = node;
    } else {
        // b. Add node to tail
        queue->tail->next = node;
        queue->tail = node;
    }
}

/*
 * TREES
 */

// NODE DEFINITION
typedef struct treenode {
    NodeData data;
    struct treenode *left, *right;
} TreeNode;

// BINARY TREE DEFINITION 
typedef struct {
    TreeNode *root;
} BinaryTree;

// PRE-ORDER TRAVERSAL
void preOrder (TreeNode *node)
{
    if (node != NULL) {
        // 1. Visit root
        visit (node);
        // 2. Traverse left
        preOrder (node->left);
        // 3. Traverse Right
        preOrder (node->right);
    }
}

// IN-ORDER TRAVERSAL
void inOrder (TreeNode *node)
{
    if (node != NULL) {
        //1. Traverse left
        inOrder (node->left);
        //2. Visit root
        visit (node);
        //3. Traverse right
        inOrder (node->right);
    }
}

// POST-ORDER TRAVERSAL
void postOrder (TreeNode *node)
{

    if (node != NULL) {
        //1. Traverse left
        postOrder (node->left);
        // 2. Traverse right
        postOrder (node->right);
        // 3. Visit root
        visit (node);
    }
}

// COUNT LEAVES
int countLeaves (TreeNode *node)
{
    if (node == NULL) return 0;

    if (node->left == NULL && 
        node->right == NULL)
    {
        return 1;
    }

    return 1 + countLeaves (node->left)
             + countLeaves (node->right);
}

// COUNT NODES
int countNodes (TreeNode *node)
{
    if (node == NULL) return 0;

    return 1 + countNodes (node->left)
             + countNodes (node->right);
}

/*
 * SORTING, SEARCHING, & BST
 */
void insert (BinaryTree *tree, int number)
{
    // 1. If this tree is empty, initialize the root with the number we get
    if (tree->root == NULL) tree->root = newTreeNode (number);

    TreeNode *current = tree->root;

    // 2. While the current node doesn't match, traverse or assign
    while (current->data.number != number) {
        if (current->data.number > number) { // Left
            if (current->left == NULL) current->left = newTreeNode (number);
            current = current->left;
        } else { // right
            if (current->right == NULL) current->right = newTreeNode (number);
            current = current->right;
        }
    }
}
