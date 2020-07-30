#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "binarytree.h"

#define MAX_READ 100
#define IN_FILE_PATH "../assets/integers.txt"

int* read_integers (const char *path) {
    int *integers = (int *)calloc (MAX_READ, sizeof (int));

    FILE *in = fopen (path, "r");
    if (in == NULL) {
        printf ("Failed to open %s\n", path);
        exit(1);
    }

    char *buf = (char *)calloc (4, sizeof (char));
    for (int i = 0; i < MAX_READ - 1; i++) {
        fgets(buf, 4, in);
        integers[i] = strtol (buf, NULL, 10);
    }
    free (buf);

    return integers;
}

int lookup_and_count_array (int integers[], int integer) {

    int comparisons = 1;

    int i = 0;
    while (i < MAX_READ - 1 && integers[i++] != integer) comparisons++;

    return comparisons;
}

void cp_array_to_tree (int integers[], BinaryTree *tree)
{
    int i = 0;
    while (i < MAX_READ - 1) insert (tree, integers[i++]);
}

int main (void)
{
    BinaryTree *tree = (BinaryTree *)malloc (sizeof (BinaryTree));
    int* integers = read_integers (IN_FILE_PATH);

    if (integers == NULL) {
        printf ("Failed to read in Integers from file\n"); 
        return 1;
    }

    cp_array_to_tree (integers, tree);
        
    printf ("Enter an integer (between 1 - 100) to search for: ");

    char buf[4];
    fgets (buf, 4, stdin);
    int search_integer = (int)strtol (buf, NULL, 10);

    printf ("\n\t%d comparisons were made to find '%d' within tree.\n",
        lookup_and_count (tree, search_integer), search_integer);
    printf ("\n\t%d comparisons were made to find '%d' within array.\n", 
        lookup_and_count_array (integers, search_integer), search_integer);

    free (integers);
    free (tree);
    return 0;
}