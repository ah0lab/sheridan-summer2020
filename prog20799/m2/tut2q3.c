/* Sales Commission Calculator
 *	Benjamin Ahola
 */

#include <stdio.h>

#define BASE_PAY 200.00
#define COMMISSION 0.09

int main (void)
{
	float salesAmount;
	while (salesAmount != -1.0) {
		printf ("\nEnter sales in dollars\t (-1 to end): $");
		scanf("%f", &salesAmount);

		if (salesAmount == -1.0) continue;

		printf ("Salary is\t            : $%.2f\n",
			BASE_PAY + (salesAmount * COMMISSION));
	}
}