package ca.sheridancollege.week1.softwarefundamentals;

public class StudentList 
{
  public static void main(String[] args)
  {
    //TODO: Create array of students
    Student[] sList = new Student[5];
    
    //TODO: Populate 5 names within array
    for( int i=0; <=sList.length-1;i++)
    {
      sList[i] = new Student();
      sList[i].setName("Student_" + (i+1));
    }

    //TODO: Print the array
    for( Student s:sList ){
      System.out.println("The Student name is: "+ s.getName());
    }

  }
}
