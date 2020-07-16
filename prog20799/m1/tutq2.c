/* Tutorial Question 2 - Benjamin Ahola
 *
 *  Write a program that reads in two integers and determines if the first is a 
 *  multiple of the second.
 */
#include <stdio.h>

int main(void)
{
  int num1, num2;

  printf ("Enter the first integer : ");
  scanf ("%d", &num1);
  printf ("Enter the second integer: ");
  scanf ("%d", &num2);

  if( num2 % num1 == 0) 
    printf ("%d is a multiple of %d\n", num1, num2);
  else
    printf ("%d is not a multiple of %d\n", num1, num2);
}
