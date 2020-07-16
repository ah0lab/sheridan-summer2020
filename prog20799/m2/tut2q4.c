/* Salary Calculator
 * 	
 * 	Develop a program that will determine the gross pay for 
 *	each of several employees.
 */

#define OVERTIME_HOURS_INTERVAL 41

#include <stdio.h>

int main (void) 
{
	int hoursWorkedOvertime, hoursWorked;
	float hourlyRate, salary;

	while ( hoursWorked != -1 ) {
		printf ("Enter # of hours worked\t\t(-1 to end): ");
		scanf ("%d", &hoursWorked);

		if (hoursWorked == -1) continue;

		printf ("Enter hourly rate of worker\t   ($__.__): $");
		scanf ("%f", &hourlyRate);

		hoursWorkedOvertime = 
			(hoursWorked - (hoursWorked % OVERTIME_HOURS_INTERVAL));

		salary = (hoursWorkedOvertime * (hourlyRate * 1.5)) + 
			(hoursWorked - hoursWorkedOvertime) * hourlyRate;

		printf ("Salary\t\t\t\t: $%.2f\n", salary);
	}
}