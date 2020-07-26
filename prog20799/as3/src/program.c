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
    Queue customerRecords = initQueue ();
    CustomerRecord record;
    CustomerRecord removedRecord;

    while (!requestEnd) {
        printf ("Record #%d\n", recordNumber + 1);

        prompt_user (Prompt_Name); 
        fgets(record.name, MAX_NAME_SIZE, stdin);

        if (strlower (record.name) == 'end') { requestEnd = true; continue; }

        prompt_user (Prompt_TotalPrice);
        record.purchase_total = get_totalPrice ();

        enqueue(customerRecords, record);
    }

    printf ("Current Queue\n");
    print_records (customerRecords);

    printf ("\nQueue with first record removed\n");
    remove_record (customerRecords);
    print_records (customerRecords);
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

void print_records (Queue queue)
{
    NodePtr record = queue->head;
    while (record != NULL) {
        printf ("%s\t%f\n", record->data.name, record->data.purchase_total);
        record = record->next;
    }
}