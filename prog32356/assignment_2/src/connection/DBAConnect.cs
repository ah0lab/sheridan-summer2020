using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;

using System.Runtime.CompilerServices;

[assembly: InternalsVisibleTo("Test")]
namespace Assignment.Connection 
{
    static class DBConnected
    {
        private static string connectionString = "User Id=S8_AHOLAB; Password=991361645;Data Source=boba.fast.sheridanc.on.ca:1521/ACES.FAST.SHERIDANC.ON.CA;"; 


        public static bool UpdateData (string queryString, Stack<OracleParameter> parameters)
        {
            using (OracleConnection con = new OracleConnection (connectionString)) {
                using (OracleCommand cmd = con.CreateCommand ()) {
                    try {
                        con.Open ();
                        cmd.BindByName = true;

                        cmd.CommandText = queryString;
                        while (parameters.Count != 0) cmd.Parameters.Add (parameters.Pop ());
                        cmd.ExecuteNonQuery ();
                    } catch (Exception ex) {
                        Console.WriteLine (ex.Message);
                        return false;
                    }
                }
            }
            return true;
        }

        public static bool FetchData (string queryString, Stack<OracleParameter> parameters, in List<object[]> result)
        {
            using (OracleConnection con = new OracleConnection (connectionString)) {
                using (OracleCommand cmd = con.CreateCommand ()) {
                    try {
                        con.Open ();
                        cmd.BindByName = true;

                        cmd.CommandText = queryString;
                        Console.WriteLine ($"{parameters.Count} Parameters passed");
                        while (parameters.Count != 0) cmd.Parameters.Add (parameters.Pop());

                        OracleDataReader reader = cmd.ExecuteReader ();
                        int currentRow = 0;
                        while (reader.Read ()) {
                            result.Add (new object[reader.FieldCount]);
                            reader.GetValues (result[currentRow]);
                            currentRow++;
                        }
                        reader.Dispose ();
                    } catch (Exception ex) {
                        Console.WriteLine (ex.Message);
                        return false;
                    }
                    return true;
                }
            }
        }
        public static bool FetchData (string queryString, in List<Object[]> result)
        {
            using (OracleConnection con = new OracleConnection (connectionString)) {
                using (OracleCommand cmd = con.CreateCommand ()) {
                    try {
                        con.Open ();
                        cmd.BindByName = true;

                        cmd.CommandText = queryString;

                        OracleDataReader reader = cmd.ExecuteReader ();
                        int currentRow = 0;
                        while (reader.Read ()) {
                            result.Add (new object[reader.FieldCount]);
                            reader.GetValues (result[currentRow]);
                            currentRow++;
                        }
                        reader.Dispose ();
                    } catch (Exception ex) {
                        Console.WriteLine (ex.Message);
                        return false;
                    }
                    return true;
                }
            }
        }

    }
}