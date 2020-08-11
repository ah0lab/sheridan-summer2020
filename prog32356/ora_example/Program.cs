using System;
using System.Collections.Generic;
using OraExample.Controller;
using OraExample.Model;

namespace OraExample
{
    class Program
    {
        static void Main(string[] args)
        {
            List<Part> parts = PartController.GetParts ();

            foreach (Part p in parts)
                Console.WriteLine (p);

            Console.WriteLine ("\nGetting Part By ID:\n");
            parts = PartController.GetPartByID (1);

            foreach (Part p in parts)
                Console.WriteLine (p);

            Console.WriteLine ("\nAdding Part 7...\n");
            if (PartController.AddPart (7, "part 7", 2)) {
                parts = PartController.GetPartByID (7);
                foreach (Part p in parts)
                    Console.WriteLine (p);
            }

            Console.WriteLine ("\nRemoving Part 7...\n");
            if (PartController.RemovePart (7)) {
                parts = PartController.GetParts ();
                foreach (Part p in parts)
                    Console.WriteLine (p);
            }
        }
    }
}
