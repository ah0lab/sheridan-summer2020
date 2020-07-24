/*
 * Selection Sort
 */
#include <stdio.h>
#include <time.h>

#define MAX_ARRAY_LENGTH 10

/* getSmallest
 *  returns smallest number in array     
 */
int getSmallest (int array[], int low, int high)
{
    int small = low; // keeps index of smallest value in array

    for (int i = low + 1; i <= high; i++) {
        if (array[i] < array[small]) {
            small = i;
        }
    }

    return small;
}

/* swap 
 *  swaps two numbers of an array
 */
void swap (int array[], int i, int j)
{
    int hold = array[i]; 
    array[i] = array[j];
    array[j] = hold;
}

/* selectSort
 *  swaps two numbers of an array
 */
void selectionSort (int array[], int size)
{
    for (int i = 1; i <= size; i++) {
        int small = getSmallest (array, i, size);
        swap (array, i, small);
    }
}

// Partition
int partition (int array[], int low, int high) 
{
    int pivot = array[low];
    int lastSmall = low;

    for (int j = low + 1; j <= high; j++) {
        if (array[j] < pivot) {
            ++lastSmall;
            swap (array, lastSmall, j);
        }
    }

    swap (array, low, lastSmall);
    return lastSmall;
}

// Quick sort
void quickSort (int array[], int low, int high)
{
    if (low < high) {
        int p = partition (array, low, high);

        quickSort ();
        quickSort ();
    }

}

void printArray (int array[], int size)
{
    for (int i = 0; i < size; i++) {
        printf ("\ti: %d - val: %d\n", i, array[i]) ;
    }
}

int main (void)
{
    int array[MAX_ARRAY_LENGTH];

    // Populate array
    array[0] = 1; 
    array[1] = 60; 
    array[2] = 5; 
    array[3] = 78; 
    array[4] = 33; 
    array[5] = 64; 
    array[6] = 4; 
    array[7] = 2; 
    array[8] = 32; 
    array[9] = 24; 

    printf ("Before sorting: \n\n");
    printArray (array, MAX_ARRAY_LENGTH);

    // Sort it
    selectionSort (array, MAX_ARRAY_LENGTH);

    printf ("\nAfter sorting: \n\n");
    printArray (array, MAX_ARRAY_LENGTH);
}