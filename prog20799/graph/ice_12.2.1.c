#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LABEL_SIZE 50
#define MAX_VERT 50

/*
 * EDGE
 */
typedef struct gEdge {
    int child, weight;
    struct gEdge *nextEdge;
}GEdge, *GEdgePtr;

// Edge Creation
GEdgePtr newGEdge (int c, int weight)
{
    GEdgePtr p = (GEdgePtr)malloc (sizeof (GEdge));
    p->child    = c;
    p->weight   = weight;
    p->nextEdge = NULL;

    return p;
}

/*
 * VERTEX
 */
typedef struct {
    char label[MAX_LABEL_SIZE + 1], colour;
    int parent, cost, discover, finish, inDegree;
    GEdgePtr firstEdge;
} GVertex;

// Vertex Creation
GVertex newGVertex (char name[])
{
    GVertex temp;
    strcpy (temp.label, name);
    temp.firstEdge = NULL;

    return temp;
}

/*
 * GRAPH
 */
typedef struct graph {
    int vCount;
    GVertex verts[MAX_VERT + 1];
} *Graph;


// Graph Creation
Graph newGraph (int vCount)
{
    if (vCount > MAX_VERT) { printf ("Error: Too many verts!"); exit (1); }

    Graph g = (Graph)malloc (sizeof (struct graph));

    g->vCount = vCount;

    return g;
}

void addEdge (char nodeLabel[], char adjacentLabel[], int weight, Graph g)
{
    int j, k;
    // find node lable in the list of verts
    for (j = 0; j < g->vCount; j++) 
        if (strcmp(nodeLabel, g->verts[j].label) == 0) break; 

    // find adjacent label in list of verts
    for (k = 0; k < g->vCount; k++)
        if (strcmp(adjacentLabel, g->verts[k].label) == 0) break;

    if (j > g->vCount || k > g->vCount) {
        printf ("Error: no such Edge '%s -> %s'\n", nodeLabel, adjacentLabel);
        exit (1);
    }

    GEdgePtr e = newGEdge (k, weight);
    GEdgePtr prev, curr;
    prev = curr = g->verts[j].firstEdge;
    while (curr != NULL && 
           strcmp (adjacentLabel, g->verts[curr->child].label) > 0)
    {
        prev = curr;
        curr = curr->nextEdge;
    }

    if (prev == curr) {
        e->nextEdge = g->verts[j].firstEdge;
        g->verts[j].firstEdge = e;
    } else {
        e->nextEdge     = curr;
        prev->nextEdge  = e;
    }
}

void buildGraph (FILE *in, Graph g)
{
    int j, k, eCount, weight;
    char nodeLabel[MAX_LABEL_SIZE + 1], adjacentLabel[MAX_LABEL_SIZE + 1];

    // 1. Read lables of verts
    for (j = 0; j < g->vCount; j++) {
        g->verts[j] = newGVertex("");
        // Read in label
        fscanf (in, "%s", g->verts[j].label);
    }

    // read and process lines to create edges
    for (j = 0; j < g->vCount; j++) {
        fscanf (in, "%s %d", nodeLabel, &eCount);
        for (k = 0; k < eCount; k++) {
            fscanf (in, "%s %d", adjacentLabel, &weight);
            addEdge (nodeLabel, adjacentLabel, weight, g);
        }
    }
}

void printGraph (Graph g)
{
    int j;
    for (j = 0; j < g->vCount; j++) {
        printf ("%s:", g->verts[j].label);
        GEdgePtr p = g->verts[j].firstEdge;
        while (p != NULL) {
            printf (" %s %d ", g->verts[p->child].label, p->weight);
            p = p->nextEdge;
        }
        printf ("\n");
    }
}

int main (void)
{
    int vCount;
    FILE *in = fopen ("graph1.txt", "r");
    if (in == NULL) {
        printf ("cannot open the file");
        exit (1);
    }
       
    // Read first line
    fscanf (in, "%d", &vCount);
    Graph G = newGraph (vCount);

    buildGraph (in, G);

    printf ("The graph has been built based on graph 1 file\n");
    printGraph (G);
    fclose (in);
}