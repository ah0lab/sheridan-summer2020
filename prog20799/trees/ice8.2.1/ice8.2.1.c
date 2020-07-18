/* Counts frquency of words in a file
 *  1. Create empty binary search tree
 *  2. While there is another word in file
 *      a. Get word
 *      b. Search for word in bst
 *          if word exist in tree, increase frequency
 *          if word is not found, add it to tree and set freq to 1
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX_WORD_SIZE 20

typedef struct {
    char word[MAX_WORD_SIZE + 1];
    int freq;
} NodeData;

typedef struct treenode {
    NodeData data;
    struct treenode *left, *right;
} TreeNode, *TreeNodePtr;

typedef struct {
    TreeNodePtr root;
} BinaryTree;

int getWord (FILE *in, char str[])
{
    char ch;
    int n = 0;

    // read over non-letters
    while (!isalpha (ch = getc (in)) && ch != EOF) {
        if (ch == EOF) return 0;

        str[n++] = tolower (ch); // add letter to word stored in str

        while (isalpha (ch = getc(in)) && ch != EOF) 
            if (n < MAX_WORD_SIZE) str[n++] = tolower (ch);

        str[n] = '\0';
        return 1;
    }
}

TreeNodePtr findOrInsert (BinaryTree bt, NodeData d)
{
    TreeNodePtr newTreeNode (NodeData);

    if (bt.root == NULL) return newTreeNode (d);
    TreeNodePtr curr = bt.root;

    // Search
    int cmp;
    while ((cmp = strcmp (d.word, curr->data.word)) != 0) {
        if (cmp < 0) { // word comes before current (add to left)
            if (curr->left == NULL) return curr->left = newTreeNode (d);
            curr = curr->left;
        } else { // word comes after current (add to right)
            if (curr->right == NULL) return curr->right = newTreeNode (d);
            curr = curr->right;
        }
    }
    return curr;
}

// newNodeData
NodeData newNodeData (char str[], int freq)
{
    NodeData temp;
    strcpy (temp.word, str);

    temp.freq = freq;
    return temp;
}

TreeNodePtr newTreeNode (NodeData d)
{
    TreeNodePtr p = (TreeNodePtr)malloc (sizeof (TreeNode));

    p->data = d;
    p->left = p->right = NULL;

    return p;
}

void inOrder (FILE *out, TreeNodePtr node)
{
    if (node != NULL) {
        inOrder (out, node->left);
        fprintf (out, "%15s %2d\n", node->data.word, node->data.freq);
        inOrder (out, node->right);
    }
}

int main (void) 
{
    char word[MAX_WORD_SIZE + 1];

    // open file
    FILE *in = fopen ("wordfreq.in", "r");
    if (in == NULL) {
        printf ("Cannot open in file!"); 
        exit (1); 
    }

    FILE *out = fopen ("wordfreq.out", "w");
    if (out == NULL) {
        printf ("Cannot open out file!"); 
        exit (1);
    }

    // Define binary tree
    BinaryTree bst; 
    bst.root = NULL;
    while (getWord (in, word) != 0) {
        if (bst.root == NULL) {
            bst.root = newTreeNode (newNodeData (word, 1));
        } else {
            TreeNodePtr node = findOrInsert (bst, newNodeData (word, 0));
            node->data.freq++;
        }
    }

    fprintf (out, "\nWords\t\tFrequency \n\n");
    inOrder (out, bst.root);
    fprintf (out, "\n\n");
    fclose (in);
    fclose (out);
}