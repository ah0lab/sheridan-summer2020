using System;
using Oracle.ManagedDataAccess.Client;

namespace Assignment
{
    public static class DBAconnection
    {
        private static string connectionString = "User Id=S8_AHOLAB; Data Source=boba.fast.sheridanc.on.ca:1521/ACES.FAST.SHERIDANC.ON.CA;"; 

        public static void Connect() {
            using (OracleConnection con = new OracleConnection (connectionString)) {
                using (OracleCommand cmd = con.CreateCommand ()) {
                    try {
                        con.Open();
                        cmd.BindByName = true;

                        cmd.CommandText = "select ProductID, ProductName from products;";

                        OracleDataReader reader = cmd.ExecuteReader ();
                        while (reader.Read ()) {
                            Console.WriteLine ($"Returned Data : {reader.GetString(0)}\n");
                        }
                        reader.Dispose ();
                    } catch (Exception ex) {
                        Console.WriteLine (ex.Message);
                    }
                }
            }
        }
    }
}
