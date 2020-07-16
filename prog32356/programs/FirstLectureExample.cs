using System;

namespace FirstLectureExample
{
  class FirstExample {
    static void Main( string[] args)
    {
      Console.WriteLine("Enter circle radius: ");
      double radius = double.Parse(Console.ReadLine());

      double diameter = 2 * radius;
      double circum = 2 * Math.PI * radius;
      double area = Math.PI * radius * radius;

      Console.WriteLine("Diameter     : " + diameter);
      Console.WriteLine("Circumfrence : " + circum);
      Console.WriteLine("Area         : " + circum);
    }
  }
}
