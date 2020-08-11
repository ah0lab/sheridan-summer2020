using FinalAssignment.Model;
using FinalAssignment.Controller;
using System;
using System.Collections.Generic;

namespace FinalAssignment
{
    class Program
    {
        static void Main(string[] args)
        {

            List<Teacher> teachers = GenerateTeachers ();

            // CREATE Table
            if (TeacherController.CreateTable()) {
                //ADD TEACHER
                foreach (Teacher T in teachers) {
                    TeacherController.AddTeacher (T);
                }

                //SHOW ALL TEACHERS
                foreach (Teacher T in TeacherController.GetTeachers()) {
                    Console.WriteLine ("#####################");
                    Console.WriteLine (T);
                    Console.WriteLine ("#####################");
                }

                //UPDATE TEACHER BY ID
                Teacher modifiedTeacher = teachers[0];
                modifiedTeacher.LastName = "Barf";
                TeacherController.UpdateTeacher (modifiedTeacher);

                //SHOW ALL TEACHERS
                foreach (Teacher T in TeacherController.GetTeachers()) {
                    Console.WriteLine ("#####################");
                    Console.WriteLine (T);
                    Console.WriteLine ("#####################");
                }

                //SHOW ALL TEACHERS WITH MORE THAN 10 STUDENTS
                foreach (Teacher T in TeacherController.GetByPupilCount (9)) {
                    Console.WriteLine ("#####################");
                    Console.WriteLine (T);
                    Console.WriteLine ("#####################");
                }

                //UPDATE TEACHERS SALARY USING THEIR ID
                if (TeacherController.UpdateSalary (1, 3.00m)) {
                    foreach (Teacher T in TeacherController.GetTeachers()) {
                        Console.WriteLine ("#####################");
                        Console.WriteLine (T);
                        Console.WriteLine ("#####################");
                    }
                }

                //REMOVE TEACHERS WHOSE SALARY IS HIGHER THAN 50,000
                if (TeacherController.RemoveBySalary (50000)) {
                    foreach (Teacher T in TeacherController.GetTeachers()) {
                        Console.WriteLine ("#####################");
                        Console.WriteLine (T);
                        Console.WriteLine ("#####################");
                    }
                }

            }

        }

        private static List<Teacher> GenerateTeachers()
        {
            Random rand = new Random();

            return new List<Teacher>(new Teacher[]{
                new Teacher {
                    ID = 1,
                    FirstName = "Garth",
                    LastName = "Smith",
                    Salary = rand.Next(40000,100000),
                    Skills = new Skillset(new String[]{"C","Java"}),
                    DateAdded = DateTime.Today,
                    PupilCount = rand.Next(10, 50)
                },
                new Teacher {
                    ID = 2,
                    FirstName = "Foo",
                    LastName = "Bar",
                    Salary = rand.Next(40000,100000),
                    Skills = new Skillset(new String[]{"HTML","C","Java"}),
                    DateAdded = DateTime.Today,
                    PupilCount = rand.Next(10, 50)
                },
                new Teacher {
                    ID = 3,
                    FirstName = "Joe",
                    LastName = "Blo",
                    Salary = rand.Next(40000,100000),
                    Skills = new Skillset(new String[]{"CSS","C","Java"}),
                    DateAdded = DateTime.Today,
                    PupilCount = rand.Next(10, 50)
                },
                new Teacher {
                    ID = 4,
                    FirstName = "Lucy",
                    LastName = "Plar",
                    Salary = rand.Next(40000,100000),
                    Skills = new Skillset(new String[]{"JavaScript","C","Java"}),
                    DateAdded = DateTime.Today,
                    PupilCount = rand.Next(10, 50)
                },
                new Teacher {
                    ID = 5,
                    FirstName = "Edgar",
                    LastName = "Bar",
                    Salary = rand.Next(40000,100000),
                    Skills = new Skillset(new String[]{"C++","C","Java"}),
                    DateAdded = DateTime.Today,
                    PupilCount = rand.Next(10, 50)
                },
                new Teacher {
                    ID = 6,
                    FirstName = "Jerry",
                    LastName = "Berry",
                    Salary = rand.Next(40000,100000),
                    Skills = new Skillset(new String[]{"C#","JavaScript","Java"}),
                    DateAdded = DateTime.Today,
                    PupilCount = rand.Next(10, 50)
                },
                new Teacher {
                    ID = 7,
                    FirstName = "Berry",
                    LastName = "Jerry",
                    Salary = rand.Next(40000,100000),
                    Skills = new Skillset(new String[]{"C#","C","Java"}),
                    DateAdded = DateTime.Today,
                    PupilCount = rand.Next(10, 50)
                },
                new Teacher {
                    ID = 8,
                    FirstName = "Hans",
                    LastName = "Heart",
                    Salary = rand.Next(40000,100000),
                    Skills = new Skillset(new String[]{"C#","Rust","Java"}),
                    DateAdded = DateTime.Today,
                    PupilCount = rand.Next(10, 50)
                },
                new Teacher {
                    ID = 9,
                    FirstName = "Tommy",
                    LastName = "Thompson",
                    Salary = rand.Next(40000,100000),
                    Skills = new Skillset(new String[]{"C#","C","HTML"}),
                    DateAdded = DateTime.Today,
                    PupilCount = rand.Next(10, 50)
                },
                new Teacher {
                    ID = 10,
                    FirstName = "Greg",
                    LastName = "Keplar",
                    Salary = rand.Next(40000,100000),
                    Skills = new Skillset(new String[]{"C#","C","Java"}),
                    DateAdded = DateTime.Today,
                    PupilCount = rand.Next(10, 50)
                }
            });
        }

    }
}