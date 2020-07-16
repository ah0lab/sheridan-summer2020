/* 
 * Hailstone Solution - Benjamin Ahola
 */

#include <stdio.h>

void hailstone (int);

/*
 *
 */
int main(void)
{
  int number;
  printf( "Enter start number for hailstone series generation" );
  scanf( "%d", &number );
  hailstone( number );
}

/*
 *
 */
void hailstone ( int num ) 
{
  while( num >= 1 ){
    printf("%d ", num);

    if( num == 1 ){
      break;
    }else if( num % 2 == 0 ){
      num = num / 2;
    }else{                        // num is odd
      num = (3 * num) + 1;
    }
    puts("");
  }
}
