using System;
using System.Collections.Generic;
using Oracle.ManagedDataAccess.Client;

namespace OraExample.Connection
{
    class DBConnected : DBAuth
    {
        public static bool UpdateData (string queryString, Stack<OracleParameter> parameters)
        {
            using (OracleConnection con = new OracleConnection (DBAuth.ConnectionString)) {
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
            using (OracleConnection con = new OracleConnection (DBAuth.ConnectionString)) {
                using (OracleCommand cmd = con.CreateCommand ()) {
                    try {
                        con.Open ();
                        cmd.BindByName = true;

                        cmd.CommandText = queryString;
                        while (parameters.Count != 0) cmd.Parameters.Add (parameters.Pop ());

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

        public static bool FetchData (string queryString, in List<object[]> result)
        {
            using (OracleConnection con = new OracleConnection (DBAuth.ConnectionString)) {
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
                    } catch (Exception ex) {
                        Console.WriteLine (ex.Message);
                        return false;
                    }
                }
            }
            return true;
        }
    }
}