/* Gas Mileage
 * 	Benjamin Ahola
 */
#include <stdio.h>

int main(void) {
	float milesDriven = 0.0;
	float gallonsUsed = 0.0;
	float totalGallonsUsed = 0.0;
	float totalMilesDriven = 0.0;
	int cntr = 0;

	while (gallonsUsed >= 0.0) {
		// Input the gallons used 
		printf ("Enter the gallons used (-1 to end): ");
		scanf ("%f", &gallonsUsed);

		if (gallonsUsed < 0.0) continue;

		// Input the miles driven
		printf ("Enter the miles driven: ");
		scanf ("%f", &milesDriven);

		// Calculate the miles per gallon obtained for each tankful
		printf ("The miles / gallon for this tank was %f\n\n",
			milesDriven / gallonsUsed);

		totalGallonsUsed += gallonsUsed;
		totalMilesDriven += milesDriven;
		cntr++;
	}

	// Calculate & print the combined miles/gallon obtained from all tankfuls
	printf ("\nThe overall average miles/gallon was %f\n", 
		(totalMilesDriven / totalGallonsUsed) );
}