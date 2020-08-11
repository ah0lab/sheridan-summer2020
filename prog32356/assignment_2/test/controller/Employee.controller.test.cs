using NUnit.Framework;
using System;
using System.Collections.Generic;
using Assignment.Model;
using Assignment.Controller;

namespace Assignment.Test
{
    public class EmployeeControllerTest
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void Should_RetrieveAllEmployees()
        {
            List<Employee> employees = EmployeeController.GetEmployees ();
            foreach (Employee e in employees) {
                Console.WriteLine (e);
            }
        }

        [Test]
        public void Should_RetrieveEmployeeByFirstname ()
        {
            List<Employee> retrievedEmployees = EmployeeController.GetEmployeeByFirstName ("Davolio");
            foreach (Employee e in retrievedEmployees) {
                TestContext.Out.WriteLine (e);
            }
        }

        [Test]
        public void Should_CreateANewEmployee()
        {
            EmployeeController.AddEmployee (new Employee (
                id              : 10,
                firstname       : "Ben",
                lastname        : "Ahola",
                title           : "student",
                titleofcourtesy : "mr.",
                birthdate       : DateTime.Parse("06/03/1990"),
                hiredate        : DateTime.Today,
                address         : new Address (
                    street      : "123 Fake st",
                    city        : "Faketown",
                    region      : "ON",
                    postalcode  : "L6W5C2",
                    country     : "Canada"),
                homephone       : "911",
                extension       : "3543",
                photo           : "handsom.gif",
                notes           : "Just a student programming a program",
                reportsto       : 3)
            );
        }
    }
}