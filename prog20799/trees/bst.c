#include <stdlib.h>
#include <stdio.h>
// DEFINING A BINARY SEARCH TREE

/*
 * 1. Define a treenode struct 
 *      with left and right pointers
 */
typedef struct treenode {
    NodeData data;
    struct treenode *left, *right;
} TreeNode, *TreeNodePtr;

/*
 * 2. Define a BinaryTree containing 
 *      the root node
 */
typedef struct {
    TreeNodePtr root;
} *BinaryTree;

/*
 * 2. Define a BinaryTree containing 
 *      the root node
 */
TreeNodePtr findOrInsert (BinaryTree bt, NodeData d)
{
    if (bt->root == NULL) return newTreeNode (d);

    TreeNodePtr curr = bt.root;
    int cmp;

    while ((cmp = strcmp (d.word, curr->data.word)) != 0) {
        if (cmp < 0) { // if left
            if (curr->left == NULL) return curr->left = (TreeNodePtr)malloc (sizeof (TreeNode));

            curr = curr->left;
        } else { // else right
            if (curr->right == NULL) return curr->right = (TreeNodePtr)malloc (sizeof (TreeNode));
        }

    }
}