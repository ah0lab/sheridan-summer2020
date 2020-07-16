#include <stdio.h>

typedef struct friend{
  int id;
  char name[20];
} Friend;

int main() 
{
  // declare array of structures for 3 friends
  Friend x[3];
  size_t i;

  // read values into array of structs
  for (i=0; i < 3; i++) {
    printf ("Enter Friend Id: ");
    scanf ("%d", &x[i].id);
    printf ("Enter Friend Name: ");
    scanf ("%s", x[i].name);
  }

  // print values from array of structs
  printf ("Id \tName\n");
  for (i=0; i < 3; i++) {
    printf ("Friend ID: %d", x[i].id);
    printf ("Friend Name: %s", x[i].name);
  }
}
