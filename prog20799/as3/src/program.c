#include <stdbool.h>
#include <stdlib.h>
#include <ctype.h>

#include "include/customer_queue.h"

typedef enum {Prompt_Name, Prompt_TotalPrice} MenuOption;
#define prompt_user(prompt) ((prompt == Prompt_Name)?\
    printf ("\tEnter Customer Name            : ")   :\
    printf ("\tEnter Total Price of Purchases : "))
#define MAX_NAME_SIZE 20

int strsize (char *);
char* strlower (char *);

int main (void)
{
    char customerName[MAX_NAME_SIZE];
    float totalPrice = 0.0;
    bool requestEnd = false;
    int recordNumber = 0;



    while (!requestEnd) {
        printf ("Record #%d\n", recordNumber + 1);

        prompt_user (Prompt_Name); 
        fgets(customerName, MAX_NAME_SIZE, stdin);

        if (strlower (customerName) == 'end') continue;

        prompt_user (Prompt_TotalPrice);
        totalPrice = get_totalPrice ();

        // Add to queue
    }
}

float get_totalPrice ()
{
    char input[MAX_NAME_SIZE];

    fgets (input, MAX_NAME_SIZE, stdin);

    return strtof (input, NULL);
}

int strsize (char *str) {
    int count = 0;
    char *tmp = str;
    while (*tmp++ != '\0') { count++; }
    return tmp;
}

char* strlower (char *str) 
{
    if (strsize(str) == 0) return NULL;

    char *lowered_str = calloc (MAX_NAME_SIZE, strsize (str));
    char *tmp = str;

    int i = 0;
    do { lowered_str[i] = tolower(*tmp++); i++; } while (*tmp != '\0');

    return lowered_str;
}