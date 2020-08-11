using Newtonsoft.Json;
using System;

namespace FinalAssignment.Model 
{

    public class Teacher 
    {
        public int ID {get;set;}
        public string FirstName {get;set;}
        public string LastName {get;set;}
        public Decimal Salary {get;set;}
        public Skillset Skills {get;set;}
        public DateTime DateAdded {get;set;}
        public int PupilCount {get;set;}

        public Teacher (int id = 0, string fname = "", 
                        string lname = "", Decimal salary = 0m, 
                        int pupilcount = 0, DateTime dateadded = new DateTime())
        {
            this.ID = id;
            this.FirstName = fname;
            this.LastName = lname;
            this.Salary = salary;
            this.PupilCount = pupilcount;
            this.DateAdded = dateadded;
        }

        public Teacher (string[] skillset, int id = 0, string fname = "", 
                        string lname = "", Decimal salary = 0m, 
                        int pupilcount = 0, DateTime dateadded = new DateTime()) 
                        : this(id, fname, lname, salary, pupilcount, dateadded)
        {
            this.Skills = new Skillset(skillset);
        }

        override public string ToString() 
        {
            return $"{this.FirstName} {this.LastName}\n"    +
                   $"\tID           : {this.ID}\n"          +
                   $"\tSalary       : {this.Salary}\n"      +
                   $"\tSkills       : {this.Skills}\n"      +
                   $"\tStudent Count: {this.PupilCount}\n"  +
                   $"\tDate Added   : {this.DateAdded}\n";
        }

        public static Teacher Parse (object[] dataset) 
        {
            return new Teacher (Convert.ToInt32(dataset[0])) {
                FirstName   = dataset[1].ToString (),
                LastName    = dataset[2].ToString (),
                Salary      = Convert.ToDecimal (dataset[3]),
                Skills      = new Skillset (JsonConvert.DeserializeObject<string[]>(dataset[4].ToString())),
                PupilCount  = Convert.ToInt32(dataset[5]),
                DateAdded   = DateTime.Parse (dataset[6].ToString ())
            };
        }

        public string Serialize () { return JsonConvert.SerializeObject (this); }

        public static Teacher Deserialize (string json) 
        {
            return (Teacher)JsonConvert.DeserializeObject (json);
        }
    }

}