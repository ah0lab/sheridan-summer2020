/* Credit Limit Calculator
 *	Benjamin Ahola
 *
 * 	Develop a program that will determine if a department store customer has
 *	exceeded the credit limit on a charge account. 
 */
#include <stdio.h>

int main(void)
{
	int accountNumber;
	float beginningBalance, totalCharges, totalCredits, creditLimit, balance;

	while (accountNumber != -1) {
		printf ("Enter account number\t(-1 to end): ");
		scanf ("%d", &accountNumber);

		if (accountNumber == -1 ) continue;

		printf ("Enter beginning balance\t           : ");
		scanf ("%f", &beginningBalance);

		printf ("Enter total charges\t           : ");
		scanf ("%f", &totalCharges);

		printf ("Enter total credits\t           : ");
		scanf ("%f", &totalCredits);

		printf ("Enter credit limit\t           : ");
		scanf ("%f", &creditLimit);

		balance = beginningBalance + totalCharges - totalCredits;

		if (balance > creditLimit) {
		printf ("Account\t\t: %d\n", accountNumber);
		printf ("Credit limit\t: %.2f\n", creditLimit);
		printf ("Balance\t\t: %.2f\n", 
			beginningBalance + totalCharges - totalCredits);
		printf ("Credit Limit Exceeded.\n\n");
		} else {
			printf ("Approved.");
		}
	}


}