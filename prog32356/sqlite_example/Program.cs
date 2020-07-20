using Microsoft.Data.Sqlite;
using System;

namespace sqlite_example
{
    class Program
    {

        static void Main(string[] args)
        {
            PrintAlbums ();
            AddAlbum ("");
        }

        public static void PrintAlbums () 
        {
            using (var conn = new SqliteConnection ("Data Source=db/chinook.db")) {
                conn.Open ();

                var command = conn.CreateCommand ();
                command.CommandText = @" SELECT title FROM albums; ";

                using (var reader = command.ExecuteReader ()) {
                    while (reader.Read ())
                    {
                        var title = reader.GetString (0);
                        Console.WriteLine ($"{title}\n");
                    }
                }
            }
        }

    }
}