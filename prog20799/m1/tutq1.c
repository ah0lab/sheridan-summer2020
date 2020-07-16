/* Tutorial Question 1 - Benjamin Ahola
 *
 * Write a program that reads an integer and determines and prints whether it 
 *  is odd or even.
 */

#include <stdio.h>

int main(void)
{
  int num = 0;
  printf ("Enter an integer: " );
  scanf ("%d", &num);

  if( num % 2 == 0 ) 
    printf ("%d is even\n", num);
  else
    printf ("%d is odd\n", num);
}
