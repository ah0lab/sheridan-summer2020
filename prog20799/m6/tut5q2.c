#include <stdio.h>

#define TOTAL_SALESPERSONS 5
#define TOTAL_PRODUCTS 4

int main (void)
{
	float sales[TOTAL_SALESPERSONS][TOTAL_PRODUCTS];
	float totals[TOTAL_SALESPERSONS];

	int sales_id, prod_id;

	// Enter table data
	for (int i=0; i < TOTAL_SALESPERSONS; i++) {
		int total_sales;
		for (int j=0; j < TOTAL_PRODUCTS; j++) {
			printf ("Enter the sales amount for product %d under sales person %d : ", j, i);
			scanf ("%f", &sales[i][j]);

			total_sales += sales[i][j];
		}
		totals[i] = total_sales;
	}

	// Output totals
	printf ("\t\tSP 1\tSP 2\tSP 3\tSP 4\tSP 5\n");

	for (int i=0; i < TOTAL_PRODUCTS; i++) {
		printf ("Prod %d:\t\t", i+1);
		for (int j=0; j < TOTAL_SALESPERSONS; j++) {
			printf ("%.2f\t", sales[j][i]);
		}
		printf ("\n");
	}

	printf ("Total :\t\t"
		"$%.2f\t$%.2f\t$%.2f\t$%.2f\n", 
		totals[0], totals[1], totals[2], totals[3],
		totals[4]);
}