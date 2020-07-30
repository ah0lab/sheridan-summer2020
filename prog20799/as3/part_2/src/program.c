#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "binarytree.h"

#define MAX_READ 100
#define IN_FILE_PATH "../assets/integers.txt"

int* read_integers (const char *path) {
    int integers[MAX_READ];
    FILE *in = fopen (path, "r");
    char buf[4];

    for (int i = 0; i < MAX_READ - 1; i++) {
        fgets(buf, 4, in);
        integers[i] = strtol (buf, NULL, 10);
    }

    return integers;
}

void cp_array_to_tree (int integers[], TreeNode *tree)
{
    for (int i = 0; i < MAX_READ - 1; i++) { insert (tree, integers[i]); }
}