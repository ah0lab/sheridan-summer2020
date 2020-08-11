using System;
using System.Collections.Generic;
using Oracle.ManagedDataAccess.Client;
using Assignment.Connection;
using Assignment.Model;

namespace Assignment.Controller 
{
    static class EmployeeController 
    {
        private static string Task1a_Query = "SELECT * FROM EMPLOYEES";
        private static string Task1b_Query = "SELECT * FROM EMPLOYEES WHERE FIRSTNAME LIKE :firstname";
        private static string Task1c_Query = "SELECT * FROM EMPLOYEES WHERE LASTNAME = :lastname";
        private static string Task1d_Query = 
            @"INSERT INTO EMPLOYEES (EMPLOYEE_ID, LASTNAME, FIRSTNAME, TITLE,
                TITLE_OF_COURTESY, BIRTHDATE, HIREDATE, ADDRESS, CITY, REGION,
                POSTAL_CODE, COUNTRY, HOME_PHONE, EXTENSION, PHOTO, NOTES, REPORTS_TO)
              VALUES (:id, :firstname, :lastname, :title, :titleofcourtesy, 
                TO_DATE(:birthdate), TO_DATE(:hiredate), :address, :city, :region, 
                :postalcode, :country, :homephone, :extension, :photo, :notes, :reportsto);";
        private static string Task1e_Query = @"UPDATE EMPLOYEE
            SET LASTNAME = :lastname,
            SET FIRSTNAME = :firstname,
            SET TITLE = :title,
            SET TITLE_OF_COURTESY = :titleofcourtesy,
            SET BIRTHDATE = TO_DATE(:birthdate),
            SET HIREDATE = TO_DATE(:hiredate),
            SET ADDRESS = :address,
            SET CITY = :city,
            SET REGION = :region,
            SET POSTAL_CODE = :postalcode,
            SET COUNTRY = :country,
            SET HOME_PHONE = :homephone,
            SET EXTENSION = :extension,
            SET PHOTO = :photo,
            SET NOTES = :notes,
            SET REPORTS_TO = :reportsto
                WHERE EMPLOYEE_ID = :id;";
        private static string Task1f_Query = "DELETE FROM EMPLOYEE WHERE EMPLOYEE_ID = :id;";

        public static List<Employee> GetEmployees ()
        {
            List<object[]> retrievedData = new List<object[]>(); 

            if (DBConnected.FetchData (Task1a_Query, in retrievedData)) {
                List<Employee> employees = new List<Employee>();

                foreach (object[] rowValues in retrievedData) {
                    employees.Add (Employee.Parse (rowValues));
                }
                return employees;
            }
            return new List<Employee>();
        }

        public static List<Employee> GetEmployeeByFirstName (string firstname)
        {
            List<object[]> retrievedData = new List<object[]>(); 

            Stack<OracleParameter> parameters = new Stack<OracleParameter>();
            parameters.Push (new OracleParameter ("firstname", firstname));

            if (DBConnected.FetchData (Task1b_Query, parameters, in retrievedData)) {
                List<Employee> employees = new List<Employee>();
                Console.WriteLine ($"{retrievedData.Count} entries fetched!");

                foreach (object[] rowValues in retrievedData) {
                    employees.Add (Employee.Parse (rowValues));
                }

                return employees;
            } 

            return new List<Employee>();
        }

        public static List<Employee> GetEmployeeByLastName (string lastname)
        {
            List<object[]> retrievedData = new List<object[]>();

            Stack<OracleParameter> parameters = new Stack<OracleParameter>();
            parameters.Push (new OracleParameter ("lastname", lastname));

            if (DBConnected.FetchData (Task1c_Query, parameters, retrievedData)) {
                List<Employee> employees = new List<Employee>();

                foreach (object[] rowValues in retrievedData) {
                    employees.Add (Employee.Parse (rowValues));
                }

                return employees;
            }
            return new List<Employee>();
        }

        public static bool AddEmployee (Employee employee)
        {
            Stack<OracleParameter> parameters = SetQueryUpdateParameters (employee);
            return DBConnected.UpdateData (Task1d_Query, parameters);
        }

        public static bool UpdateEmployee (string id, Employee updatedinfo)
        {
            Stack<OracleParameter> parameters = SetQueryUpdateParameters (updatedinfo);
            return DBConnected.UpdateData (Task1e_Query, parameters);
        }

        public static bool RemoveEmployee (string id)
        {
            Stack<OracleParameter> parameters = new Stack<OracleParameter>();
            parameters.Push (new OracleParameter ("id", id) );
            return DBConnected.UpdateData (Task1f_Query, parameters);
        }

        private static Stack<OracleParameter> SetQueryUpdateParameters (Employee employee) {
            return new Stack<OracleParameter>( new OracleParameter[] {
                    new OracleParameter ("id", employee.ID),
                    new OracleParameter ("firstname", employee.FirstName),
                    new OracleParameter ("lastname", employee.LastName),
                    new OracleParameter ("title", employee.Title ),
                    new OracleParameter ("titleofcourtesy", 
                        employee.TitleOfCourtesy),
                    new OracleParameter ("birthdate", 
                        employee.BirthDate.ToLongDateString()),
                    new OracleParameter ("hiredate", 
                        employee.HireDate.ToLongDateString()),
                    new OracleParameter ("address", employee.Addr.Street),
                    new OracleParameter ("city", employee.Addr.City),
                    new OracleParameter ("region", employee.Addr.Region),
                    new OracleParameter ("postalcode", employee.Addr.PostalCode),
                    new OracleParameter ("country", employee.Addr.Country),
                    new OracleParameter ("homephone", employee.Extension),
                    new OracleParameter ("photo", employee.Photo),
                    new OracleParameter ("notes", employee.Notes),
                    new OracleParameter ("reportsto", employee.ReportsTo)
            });
        }
    }
}
