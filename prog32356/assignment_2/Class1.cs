using System;
using System.Collections.Generic;
using Oracle.ManagedDataAccess.Client;

using Assignment.Controller;
using Assignment.Model;

namespace Assignment
{
    static class Program 
    {
        static void Main(string[] args) 
        {
            List<Employee> retrievedEmployees = EmployeeController.GetEmployeeByFirstName ("Davolio");
            foreach (Employee e in retrievedEmployees) {
                Console.WriteLine (e);
            }
        }
    }

}
