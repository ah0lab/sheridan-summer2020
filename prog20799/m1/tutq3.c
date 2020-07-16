/* Tutorial Question 1 - Benjamin Ahola
 *
 *  Using only the techniques learned in this chapter, write a program
 *  that calculates the squares and cubes of the numbers from 0 to 10
 *  and uses tabs to print a formatted table
 * 
 *  Compile with : gcc tutq3.c -lm 
 */
#include <stdio.h>
#include <math.h>

int main(void)
{
  int cntr = 0;

  printf ("number\tsquare\tcube\n");
  while ( cntr < 11 ) {
    printf ("%d\t%.0f\t%.0f\n", cntr, 
        powf((float)cntr, 2.0f),
        powf((float)cntr, 3.0f));
    cntr++;
  }
}
