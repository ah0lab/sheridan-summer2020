using System;

namespace OraExample.Model
{
    class Part 
    {
        public int ID {get;set;}
        public string Name {get;set;}
        public int CompositionID {get;set;}

        public Part (int id, string name, int compid)
        {
            this.ID = id;
            this.Name = name;
            this.CompositionID = compid;
        }

        public static Part Parse (object[] dataset) 
        {
            return new Part (
                id      : Convert.ToInt32 ((dataset[0] is DBNull)? 0 : dataset[0]),
                name    : dataset[1].ToString(),
                compid  : Convert.ToInt32 ((dataset[2] is DBNull) ? 0 : dataset[2])
            );
        }

        override public string ToString() 
        {
            return $"{this.ID} : {this.Name} : {this.CompositionID}";
        }
    }
}