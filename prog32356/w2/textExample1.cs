using static System;

namespace sheridan.W2TextbookExamples
{
  ///
  class TextbookExample1
  {
    public void Example() 
    {
      var name     = "Bugs Bunny";
      var age      = 25;
      var isRabbit = true;

      Type nameType     = name.getType();
      Type ageType      = age.getType();
      Type isRabbitType = isRabbit.getType();

      WriteLine ($"name is of type {nameType}");
      WriteLine ($"age is of type {ageType}");
      WriteLine ($"isRabbit is of type {isRabbitType}");
    }
  }
}
