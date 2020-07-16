using System;

public readonly struct pos 
{
	int x;
	int y;
}

static class ReadOnly
{
	static void Main()
	{
		pos p; 
		p.x = 4;
		p.y = 5;

		Console.WriteLine ($"x: {p.x}\ny: {p.y}")

		AlterPos(ref p);

		Console.WriteLine ($"x: {p.x}\ny: {p.y}")

	}

	public static void AlterPos(ref pos p)
	{
		p.x = 1;
		p.y = 2;
	}

}