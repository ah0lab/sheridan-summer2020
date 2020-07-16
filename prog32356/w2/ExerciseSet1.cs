using System;

namespace Sheridan.Prog32356.ExerciseSet1
{

	class Init 
	{
		static void Main() {
			SquareCubeChart exerciseOne = new SquareCubeChart (0, 10);
			PrintExerciseHeader(1);
			exerciseOne.PrintChart();

			BasicArithmatic exerciseTwo = new BasicArithmatic(20);
			PrintExerciseHeader(2);
			exerciseTwo.AskArithmatic();
			exerciseTwo.ShowEvaluation();

			BasicArithmaticV2 exerciseThree = new BasicArithmaticV2(10);
			PrintExerciseHeader(3);
			exerciseThree.AskUntilCorrect();

			BasicArithmaticV3 exerciseFour = new BasicArithmaticV3(100);
			PrintExerciseHeader(4);
			exerciseFour.AskUntilCorrect();

			NumberGuess exerciseFive = new NumberGuess();
			PrintExerciseHeader(5);
			exerciseFive.MakeGuess();

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
	class SquareCubeChart
	{

		public int StartingNumber {get;} = 0;
		public int EndingNumber {get;} = 0;

		public SquareCubeChart (int startingNumber, int endingNumber) {
			StartingNumber = startingNumber;
			EndingNumber   = endingNumber;
		}

		public void PrintChart(){
			int cntr = StartingNumber;

			Console.WriteLine ("number\tsquare\tcube");
			while (cntr <= EndingNumber) {
				Console.WriteLine ($"{cntr}\t{Math.Pow(cntr,2)}\t{Math.Pow(cntr,3)}");
				cntr++;
			}
		}
	}

	/*
	 * Exercise 2
	 */
	class BasicArithmatic
	{
		private static Random rand = new Random();
		public int AddendSize {get; set;} = 10;
		public bool CorrectlyAnswered {get; set;} = false;
		public int UserAnswer {get; set;}

		public BasicArithmatic (int addendSize) {
			AddendSize = addendSize;
		}

		public void AskArithmatic() {
			var addends = new {
				LeftAddend = rand.Next(AddendSize),
				RightAddend = rand.Next(AddendSize)
			};

			int correctAnswer = addends.LeftAddend + addends.RightAddend;

			Console.WriteLine 
				($"What is {addends.LeftAddend} + {addends.RightAddend}?");

			UserAnswer = Convert.ToInt32(Console.ReadLine());

			if (UserAnswer == correctAnswer)
				CorrectlyAnswered = true;
			else
				CorrectlyAnswered = false;
		}

		public void ShowEvaluation() {
			Console.WriteLine 
				($"{UserAnswer} is {((CorrectlyAnswered)?"Correct":"Incorrect")}");
		}
	}

	/*
	 * Exercise 3
	 */
	class BasicArithmaticV2 : BasicArithmatic 
	{

		public BasicArithmaticV2(int addendSize) : base(addendSize) {}

	 	public void AskUntilCorrect() {
	 		while (!CorrectlyAnswered) {
	 			AskArithmatic();
	 			ShowEvaluation();
	 		}
	 	}
	}

	/*
	 * Exercise 4
	 */
	class BasicArithmaticV3 : BasicArithmaticV2 
	{

		public bool WouldLikeToContinue {get; set;} = true;

		public BasicArithmaticV3(int addendSize) : base(addendSize) {}

		new public void AskUntilCorrect() {
			while (!CorrectlyAnswered && WouldLikeToContinue) {
				AskArithmatic();
				ShowEvaluation();
				AskToContinue();
			}
		}

		public void AskToContinue() {
			Console.WriteLine ("Would you like another question? [y/n] : ");
			String answer = Console.ReadLine();
			if (answer == "n" || answer == "N")
				WouldLikeToContinue = false;
		}
	}

	/*
	 * Exercise 5
	 */
	class NumberGuess 
	{
		private static Random rand = new Random();
		private int Number {get;} = rand.Next(100);
		private bool Guessed {get; set;} = false;

		public NumberGuess() {}

		public void MakeGuess () {
			Console.WriteLine ("Guess a number between 0 and 100 :");
			while (!Guessed) 
				GiveClue (Convert.ToInt32(Console.ReadLine()));
		}

		public void GiveClue (int guess) {
			if (guess < Number) { 
				Console.WriteLine ("Too Low");
			}else if (guess > Number) {
				Console.WriteLine ("Too High");
			}else{
				Console.WriteLine ("Congrats! You Guessed It!!");
				Guessed = true;
			}
		}
	}
}