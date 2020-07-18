#include <stdlib.h>
#include <stdio.h>

typedef struct treenode {
    NodeData data;
    struct treenode *left, *right;
} TreeNode, *TreeNodePtr;

typedef struct {
    TreeNodePtr root;
} *BinaryTree;

TreeNodePtr findOrInsert (BinaryTree bt, NodeData d)
{
    if (bt->root == NULL) return new TreeNode (d);

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