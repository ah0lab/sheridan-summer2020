#include <stdio.h>
#include <ctype.h>

/* Binary Tree Node Definition
 *  A binary tree node contains 
 *  the data stored at the node itself
 *  as well as pointers to nodes on the 
 *  left and right of the root node
 * 
 */
typedef struct treenode {
    NodeData data;
    struct treenode *left, *right;
} TreeNode, *TreeNodePtr;

/* Binary Tree Definition
 *  The root of a binary tree is simply
 *  a binary tree node.
 */
typedef struct {
    TreeNodePtr root;
} BinaryTree;

/* Visit Node
 *  a simple function that visits a node 
 *  in some way.
 */
void visit (TreeNodePtr node)
{
    print ("%s", node->data.word);
}

/* PRE-ORDER TRAVERSAL (Root -> Left -> Right)
 *  1. Visit the root
 *  2. Traverse the left subtree in pre-order
 *  3. Traverse the right subtree in pre-order
 */
void preOrder (TreeNodePtr node)
{
    if (node != NULL) {
        visit (node);
        preOrder (node->left);
        preOrder (node->right);
    }
}

/* IN-ORDER TRAVERSAL (Left -> Root -> Right)
 *  1. Traverse the left subtree in in-order
 *  2. Visit the root
 *  3. Traverse the right subtree in in-order
 */
void inOrder (TreeNodePtr node)
{
    if (node != NULL) {
        inOrder (node->left);
        visit (node);
        inOrder (node->right);
    }
}

/* POST-ORDER TRAVERSAL (Left -> Right -> Root)
 *  1. Traverse the left subtree in post-order
 *  3. Traverse the right subtree in post-order
 *  2. Visit the root
 */
void postOrder (TreeNodePtr node)
{
    if (node != NULL) {
        postOrder (node->left);
        postOrder (node->right);
        visit (node);
    }
}

/*
 *  COUNTING NODES
 */
int countNodes (TreeNode *root)
{
    if (root == NULL) return 0;

    return 1 + countNodes (root->left)
             + countNodes (root->right);
}

/*
 * COUNTING LEAVES
 */
int countLeaves (TreeNode *tree) 
{
    if (tree == NULL) return 0;

    if (tree->left  == NULL &
        tree->right == NULL)
    {
        return 1;
    }

    return 1 + countLeaves (root->left)
             + countLeaves (root->right);
}