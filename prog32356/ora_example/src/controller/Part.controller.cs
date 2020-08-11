using System;
using System.Collections.Generic;
using Oracle.ManagedDataAccess.Client;

using OraExample.Connection;
using OraExample.Model;

namespace OraExample.Controller
{
    class PartController 
    {
        private static string Query_GetAllParts = "SELECT * FROM PART";
        private static string Query_GetPartByID = "SELECT * FROM PART WHERE PART_ID = :partid";
        private static string Query_InsertPart = @"INSERT INTO PART (PART_ID, NAME, COMPOSITION_ID) 
            VALUES(:partid, :name, :compid)";
        private static string Query_DeletePart = @"DELETE FROM PART WHERE PART_ID = :partid";

        public static List<Part> GetParts() 
        {
            List<object[]> retrievedData = new List<object[]>();

            if (DBConnected.FetchData (Query_GetAllParts, in retrievedData)) {
                List<Part> parts = new List<Part>();

                foreach (object[] rowValues in retrievedData) 
                    parts.Add ( Part.Parse (rowValues));

                return parts;
            }
            return new List<Part>();
        }

        public static List<Part> GetPartByID (int id)
        {
            List<object[]> retrievedData = new List<object[]>();

            Stack<OracleParameter> parameters = new Stack<OracleParameter>();
            parameters.Push (new OracleParameter ("partid", id));

            if (DBConnected.FetchData (Query_GetPartByID, parameters, in retrievedData)) {
                List<Part> parts = new List<Part>();

                foreach (object[] rowValues in retrievedData)
                    parts.Add (Part.Parse (rowValues));

                return parts;
            }

            return new List<Part>();
        }

        public static bool AddPart (int id, string name, int compid) 
        {
            Stack<OracleParameter> parameters = new Stack<OracleParameter> (new OracleParameter[] {
                new OracleParameter ("partid", id),
                new OracleParameter ("name", name),
                new OracleParameter ("compid", compid)
            });

            return DBConnected.UpdateData (Query_InsertPart, parameters);
        }

        public static bool RemovePart (int id) 
        {
            Stack<OracleParameter> parameters = new Stack<OracleParameter>(); 
            parameters.Push (new OracleParameter ("partid", id));

            return DBConnected.UpdateData (Query_DeletePart, parameters);
        }
    }
}