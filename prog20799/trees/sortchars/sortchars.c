#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>

typedef struct {
    char letter;
    int freq;
} Character;

typedef Character NodeData;

typedef struct treenode {
    NodeData data;
    struct treenode *left, *right;
} TreeNode;

typedef struct {
    TreeNode *root;
} BinaryTree;

TreeNode* newTreeNode (char c)
{
    TreeNode *node = (TreeNode *)malloc (sizeof (Character));
    node->data.letter = c;
    node->data.freq = 1;
    node->right = node->left = NULL;

    return node;
}

TreeNode* findOrInsert (BinaryTree *tree, char letter)
{
    // Create a new root node if one doesn't exist
    if (tree->root == NULL) return newTreeNode (letter);

    TreeNode *curr = tree->root; // Use temp node

    // Traverse Tree until we find a match
    while (curr->data.letter != letter) { 
        if (curr->data.letter > letter) { // Left
            if (curr->left == NULL) return curr->left = newTreeNode (letter);
            curr = curr->left; // Traverse to left sub-tree
        } else { // Right
            if (curr->right == NULL) return curr->right = newTreeNode (letter);
            curr = curr->right; // Traverse to right sub-tree
        }
    }

    //curr->data.freq++; // We found a match, so increment freq
    return curr;
}

int countNodes (TreeNode *tree)
{
    if (tree == NULL) return 0;

    // 1 is used to include root node
    return 1 + countNodes (tree->left) 
             + countNodes (tree->right);
}

int countLeaves (TreeNode *tree)
{
    if (tree == NULL) return 0;

    if (tree->left  == NULL &&
        tree->right == NULL ) 
    {
        return 1;
    }

    return 1 + countLeaves (tree->left)
             + countLeaves (tree->right);
}

void inOrder (TreeNode *node) 
{
    if (node != NULL) {
        inOrder (node->left);
        printf ("%15c %2d\n", node->data.letter, node->data.freq);
        inOrder (node->right);
    }
}

int main (void)
{
    BinaryTree *tree = (BinaryTree *)malloc (sizeof (BinaryTree));
    tree->root = NULL;

    FILE *in = fopen ("chars.txt", "r");

    char c = fgetc (in);
    while (c != EOF) {
        if (tree->root == NULL)
            tree->root = newTreeNode (c);
        else {
            TreeNode *node = findOrInsert (tree, c);
            node->data.freq++;
        }
        c = fgetc (in);
    }

    // visit nodes
    printf ("\nLetter\t\tFrequency \n\n");
    inOrder (tree->root);
    printf ("\n\n");

    printf ("There are %d leaves\n", countLeaves(tree->root));
    printf ("There are %d nodes\n", countNodes(tree->root));

    return 1;
}