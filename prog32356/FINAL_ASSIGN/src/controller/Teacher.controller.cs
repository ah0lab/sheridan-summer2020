using System;
using System.Globalization;
using System.Collections.Generic;
using Oracle.ManagedDataAccess.Client;
using Newtonsoft.Json;

using FinalAssignment.Connection;
using FinalAssignment.Model;

namespace FinalAssignment.Controller 
{
    public class TeacherController 
    {
        /**
         * QUERY STATEMENTS
         */
        private static string Query_CreateTable = 
            @"CREATE TABLE Teacher_T (
                TeacherID   NUMBER   (3, 0)     NOT NULL,
                FirstName   VARCHAR2 (15 CHAR)  NOT NULL,
                LastName    VARCHAR2 (15 CHAR)  NOT NULL,
                Salary      NUMBER   (9, 2)     NOT NULL,
                SkillSet    VARCHAR2 (50 CHAR)  NOT NULL,
                PupilCount  NUMBER   (2, 0)     NOT NULL,
                DateAdded   VARCHAR2 (20 CHAR)  NOT NULL
            )";
        //PART 3 a.
        private static string Query_AddTeacher = 
            @"INSERT INTO Teacher_T (
                TeacherID, FirstName, LastName, Salary, SkillSet,
                PupilCount, DateAdded) 
            VALUES (
                :id, :firstname, :lastname, :salary, :skillset,
                :pupilcount, :dateadded)";
        //PART 3 c.
        private static string Query_UpdateTeacher = 
            @"UPDATE Teacher_T
                SET 
                    FirstName = :firstname,
                    LastName  = :lastname,
                    Salary    = :salary,
                    SkillSet  = :skillset,
                    PupilCount= :pupilcount,
                    DateAdded = :dateadded
                WHERE TeacherID = :id";
        //PART 3 c.
        private static string Query_SelectAll = 
            "SELECT * FROM Teacher_T";
        //PART 3 d.
        private static string Query_SelectByPupilCount = 
            @"SELECT FirstName, LastName, PupilCount 
                FROM Teacher_T 
                    WHERE PupilCount > :count";
        //PART 3 e.
        private static string Query_UpdateSalary =
            @"UPDATE Teacher_T
                SET Salary = :salary
                    WHERE TeacherID = :id";
        //PART 3 f
        private static string Query_RemoveBySalary =
            @"DELETE FROM Teacher_T
                WHERE Salary > :salary";
        

        /*
         * CREATE TABLE
         */
        public static bool CreateTable () { return DBConnect.UpdateDB(Query_CreateTable); }

        public static bool AddTeacher (Teacher T)
                                       
        {
            Stack<OracleParameter> parameters = new Stack<OracleParameter> (new OracleParameter[] {
                new OracleParameter ("id", T.ID),
                new OracleParameter ("firstname", T.FirstName),
                new OracleParameter ("lastname", T.LastName),
                new OracleParameter ("salary", (float)T.Salary),
                new OracleParameter ("skillset", JsonConvert.SerializeObject(T.Skills.Skills.ToArray())),
                new OracleParameter ("pupilcount", T.PupilCount),
                new OracleParameter ("dateadded", T.DateAdded.ToString ("d", new CultureInfo("pt-BR"))),
            });

            return  DBConnect.UpdateDB (Query_AddTeacher, parameters);
        }

        public static bool UpdateTeacher (Teacher T)
        {
            Stack<OracleParameter> parameters = new Stack<OracleParameter> (new OracleParameter[] {
                new OracleParameter ("id", T.ID),
                new OracleParameter ("firstname", T.FirstName),
                new OracleParameter ("lastname", T.LastName),
                new OracleParameter ("salary", T.Salary),
                new OracleParameter ("skillset", 
                    JsonConvert.SerializeObject (T.Skills.Skills.ToArray())),
                new OracleParameter ("pupilcount", T.PupilCount),
                new OracleParameter ("dateadded", T.DateAdded.ToString ("d", new CultureInfo("pt-BR"))),
            });
            return DBConnect.UpdateDB (Query_UpdateTeacher, parameters);
        }

        public static List<Teacher> GetTeachers ()
        {
            List<object[]> retrievedData = new List<object[]>();

            if (DBConnect.FetchData (Query_SelectAll, in retrievedData)) {
                List<Teacher> teachers = new List<Teacher>();

                foreach (object[] rowValues in retrievedData)
                    teachers.Add (Teacher.Parse (rowValues));
                
                return teachers;
            }
            return new List<Teacher>();
        }

        public static List<Teacher> GetByPupilCount (int pupilcount)
        {
            List<object[]> retrievedData = new List<object[]>();

            Stack<OracleParameter> parameters = new Stack<OracleParameter>();
            parameters.Push (new OracleParameter ("count", pupilcount));

            if (DBConnect.FetchData (Query_SelectByPupilCount, parameters, in retrievedData)) {
                List<Teacher> teachers = new List<Teacher>();

                foreach (object[] rowValues in retrievedData) {
                    teachers.Add ( new Teacher {
                        FirstName = rowValues[0].ToString (),
                        LastName = rowValues[1].ToString (),
                        PupilCount = Convert.ToInt32(rowValues[2])
                    });
                }
                return teachers;
            }
            return new List<Teacher>();
        }

        public static bool UpdateSalary (int id, Decimal salary)
        {
            Stack<OracleParameter> parameters = new Stack<OracleParameter>( new OracleParameter[] {
                new OracleParameter("id", id),
                new OracleParameter("salary", (float)salary)
            });

            return DBConnect.UpdateDB (Query_UpdateSalary, parameters);
        }

        public static bool RemoveBySalary (Decimal salary)
        {
            Stack<OracleParameter> parameters = new Stack<OracleParameter>();
            parameters.Push (new OracleParameter ("salary", (float)salary));

            return DBConnect.UpdateDB (Query_RemoveBySalary, parameters);
        }


    }
}