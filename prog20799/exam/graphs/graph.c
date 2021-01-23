#include <stdlib.h>
#define MAX_VERT_SIZE 10

/*
 *  EDGE
 */
typedef struct gEdge {
    int child, weight;
    struct gEdge *nextEdge;
} GEdge, *GEdgePtr;

GEdgePtr newGEdge (int child, int weight)
{
    GEdgePtr edge = (GEdgePtr)malloc (sizeof (GEdge));
    edge->child = child;
    edge->weight = weight;
    edge->nextEdge = NULL;
    return edge;
}

/*
 *  VERTEX
 */
typedef struct {
    char label;
    int parent;
    GEdgePtr firstEdge;
} GVertex;

GVertex newGVertex (char label)
{
    GVertex vert;

    vert.label = label;
    vert.firstEdge = NULL;

    return vert;
}

/*
 *  GRAPH
 */
typedef struct graph {
    int vertexCount;
    GVertex vertices[MAX_VERT_SIZE + 1];
} *Graph;

Graph newGraph (int vCount)
{
    if (vCount > MAX_VERT_SIZE) {
        printf ("Error");
        exit (1);
    }

    Graph g = (Graph)malloc (sizeof (struct graph));

    g->vertexCount = vCount;

    return g;
}

void addEdge (char nodeLabel, char adjLabel, int weight, Graph g)
{
    int nodeIndex, adjIndex;

    // Find node label in list of verts
    for (int nodeIndex = 0; nodeIndex < g->vertexCount; nodeIndex++)
        if (nodeLabel == g->vertices[nodeIndex].label) break;
    // Finde node label in adj list of verts
    for (int adjIndex = 0; adjIndex < g->vertexCount; adjIndex++)
        if (nodeLabel == g->vertices[adjIndex].label) break;
    
    if (nodeIndex > g->vertexCount || adjIndex > g->vertexCount) {
        printf ("Error: Edge %c -> %c does not exist.\n", nodeLable, adjLabel);
        exit (1);
    }

    GEdgePtr edge = newGEdge (adjIndex, weight);
    GEdgePtr previous, current = g->vertices[nodeIndex].firstEdge;

    while (current != NULL && adjLabel > g->vertices[current->child].lable) {
        previous = current;
        current  = current->nextEdge;
    }

    if (previous == current) {
        edge->nextEdge = g->vertices[nodeIndex].firstEdge;
        g->vertices[nodeIndex].firstEdge = edge;
    } else {
        edge->nextEdge     = g->vertices[nodeIndex].firstEdge;
        previous->nextEdge = edge;
    }
}

void buildGraph (FILE *in, Graph graph)
{
    int edgeCount, weight;
    char label, adjLabel;

    for (int j = 0; j < graph->vertexCount; j++) {
        graph->vertices[j] = newGVertex ('');
        fscanf (in, "%c", graph->vertices[j].label);
    }

    for (int j = 0; j < graph->vertexCount; j++) {
        fscanf (in, "%c %d", &label, &edgeCount);
        for (int k = 0; k < edgeCount; k++) {
            fscanf (in, "%c %c", &adjLabel, &weight)
            addEdge (nodeLabel, adjLabel, weight, graph);
        }
    }
}

void printGraph (Graph graph)
{
    for (int j = 0; j < graph->vertexCount; j++) {
        printf ("%c:", graph->vertices[j].label);
        GEdgePtr edge = graph->vertices[j].firstEdge;
        while (edge != NULL) {
            printf (" %c %d ", graph->vertices[edge->child].label, edge->weight);
            edge = edge->nextEdge;
        }
        printf ("\n");
    }
}