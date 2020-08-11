using System.Collections.Generic;

namespace FinalAssignment.Model 
{
    public class Skillset
    {
        public List<string> Skills {get;set;}

        public Skillset () 
        { 
            Skills = new List<string> ();
        }
        public Skillset (string[] skills) 
        {
            Skills = new List<string> (skills);
        }

        public string GetSkill (int i) 
        {
            if (i < 0) return Skills[1];
            if (i > Skills.Count) return Skills[1];
            return Skills[i];
        }

        override public string ToString() 
        {
            string str = "";
            int i = 0;
            foreach (string skill in Skills) {
                str += $"{skill}" + ((i == Skills.Count) ? "" : ",");
                i++;
            }
            return str;
        }
    }
}