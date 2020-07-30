#include <stdio.h>
#include "binarytree.h"


TreeNode* newTreeNode (int number)
{
    TreeNode *node = (TreeNode *)malloc (sizeof (TreeNode));
    node->number = number;
    node->left = node->right = NULL;

    return node;
}

void insert (BinaryTree *tree, int number) 
{
    if (tree->root == NULL) return newTreeNode (number);

    TreeNode *curr = tree->root;

    while (curr->number != number) {
        if (curr->number > number) {
            if (curr->left == NULL) curr->left = newTreeNode (number);
            curr = curr->left;
        } else {
            if (curr->right == NULL) curr->right = newTreeNode (number);
            curr = curr->right;
        }
    }
}

int lookup_and_count (BinaryTree *tree, int number)
{
    int comparisons = 0;

    if (tree->root == NULL) return comparisons;

    TreeNode *current = tree->root;

    comparisons += 1; // One comparison is always made
    while (current != NULL && current->number != number) {
        comparisons++;
        if (current->number > number)
            if (current->left) 
                current = current->left;
            else { 
                printf ("%d was not found!", number);
                return comparisons;
            }
        else
            if (current->right)
                current = current->right;
            else {
                printf ("%d was not found!", number);
                return comparisons;
            }
    }
    return comparisons;
}