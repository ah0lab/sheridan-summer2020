using System;

namespace Sheridan.Prog32356.ExerciseSet2
{
	class Init
	{
		static void Main(){

			PrintExerciseHeader(1);
			FindPayableAmount exercise1 = new FindPayableAmount();
			Console.Write ("Enter Subtotal: ");
			exercise1.Subtotal = Convert.ToSingle(Console.ReadLine());
			Console.Write ("Enter discount percent (0 - 100): ");
			exercise1.DiscountPercentage = 
				Convert.ToSingle(Console.ReadLine()) * 0.01f;
			exercise1.CalculateTotal();
			Console.WriteLine(exercise1.ToString());

			PrintExerciseHeader(2);
			FindPayableAmountV2 exercise2 = new FindPayableAmountV2();
			Console.Write ("Enter customer type [R|C]: ");
			exercise2.CustomerType = Convert.ToChar(
				(Console.ReadLine().ToUpper()));
			Console.Write ("Enter Subtotal: ");
			exercise2.Subtotal = Convert.ToSingle(Console.ReadLine());
			exercise2.CalculateTotal();
			Console.WriteLine(exercise2.ToString());

			PrintExerciseHeader(3);
			Console.Write ("Enter monthly investment\t: ");
			Decimal monthlyInvestment = Convert.ToDecimal(Console.ReadLine());
			Console.Write ("Enter yearly interest rate\t: ");
			float yearlyInterestRate = Convert.ToSingle(Console.ReadLine());
			Console.Write ("Enter number of years\t: ");
			int yearlyPeriod = Convert.ToInt32(Console.ReadLine());

			Decimal fv = FutureValue.CalculateFutureValue (
				yearlyPeriod, yearlyInterestRate, monthlyInvestment
			);

			Console.WriteLine ($"Future value\t: {fv.ToString("C")}");

			PrintExerciseHeader(4);
			Console.Write ("Enter your weight \t    [kg]: ");
			float weight = Convert.ToSingle(Console.ReadLine());
			Console.Write ("Enter your height \t[meters]: ");
			float height = Convert.ToSingle(Console.ReadLine());

			Console.WriteLine 
				($"Your weight is {BodyMassIndexCalculator.CalculateBMI(weight, height)}");
			Console.WriteLine (BodyMassIndexCalculator.DisplayBMIChart());
		}

		public static void PrintExerciseHeader (int exerciseNumber) {
			Console.WriteLine ("\n##################################");
			Console.WriteLine ($"# Exercise {exerciseNumber}");
			Console.WriteLine ("##################################\n");
		}
	}

	/*
	 * Exercise 1
	 */
	class FindPayableAmount
	{
		public float DiscountPercentage {get; set;} = 0.10f;
		public float Total {get; private set;} = 0.00f;
		public float Subtotal {get; set;} = 450.00f;
		public float DiscountedAmount {get; private set;}

		public FindPayableAmount (float subtotal, float discountPercentage) 
		{
			DiscountPercentage = discountPercentage;
			Subtotal = subtotal;
		}

		public FindPayableAmount () {}

		public float CalculateDiscountedAmount() 
		{

			return Subtotal * DiscountPercentage;
		}

		public void CalculateTotal() 
		{
			DiscountedAmount = CalculateDiscountedAmount();

			Total = (Subtotal - DiscountedAmount);
		}

		new public String ToString() 
		{
			return 
				$"\nDiscount Percentage\t: {(DiscountPercentage * 1).ToString("P")}\n" +
				$"Discounted Amount\t: {DiscountedAmount.ToString("C")}\n" +
				$"Total\t\t\t: {Total.ToString("C")}\n";
		}
	}

	/*
	 * Exercise 2
	 */
	class FindPayableAmountV2 : FindPayableAmount 
	{
		public char CustomerType {get; set;} = 'R';

		public FindPayableAmountV2 
			(char customerType, float discountPercentage, float subtotal) 
			: base (subtotal, discountPercentage) 
		{
			CustomerType = customerType;
		}

		public FindPayableAmountV2 (char customerType) : base() 
		{
			CustomerType = customerType;
		}

		public FindPayableAmountV2 () : base () {}

		public void EvaluateCustomerDiscount() {
			switch (CustomerType) {
				case 'R':
					if (Subtotal >= 250f) 
						DiscountPercentage = 0.25f;
					else if (Subtotal >= 100f) 
						DiscountPercentage = 0.10f;
					else
						DiscountPercentage = 0f;
					break;
				case 'C':
					if (Subtotal >= 250f)
						DiscountPercentage = 0.30f;
					else
						DiscountPercentage = 0.20f;
					break;
				default:
					DiscountPercentage = 0.00f;
					break;
			}
		}

		new public String ToString() {
			return $"\nCustomer Type\t\t: {CustomerType}" +
				base.ToString();
		}
	}

	/*
	 * Exercise 3
	 */
	static class FutureValue 
	{
		public static Decimal CalculateFutureValue 
			(int yearlyPeriod, float yearlyInterestRate,
			 Decimal monthlyInvestment) 
		{
			int numberOfMonths = yearlyPeriod * 12;
			float monthlyInterestRate = yearlyInterestRate / 12f;

			Decimal futureValue = 0.00m;
			for (int i=0; i < numberOfMonths; i++) {
				futureValue = 
					(futureValue + monthlyInvestment) * (Decimal)(1 + monthlyInterestRate);
			}
			return futureValue;
		}
	}

	/*
	 * Exercise 4
	 */
	static class BodyMassIndexCalculator
	{
		public static float CalculateBMI (float weight, float height) 
		{
			return weight / (height * height);
		}

		public static String DisplayBMIChart()
		{
			return "Classification\t|  BMI Category (kg/m^2)\n" +
				"UnderWeight\t|\t< 18.5\n" +
				"Normal Weight\t|\t18.5 - 24.9\n" +
				"Overweight\t|\t25.0 - 29.9\n" +
				"Obese Class I\t|\t30.0 - 34.9\n" +
				"Obese Class II\t|\t35.0 - 39.9\n" +
				"Obese Class III\t|\t>=40.0";
		}
	}

}