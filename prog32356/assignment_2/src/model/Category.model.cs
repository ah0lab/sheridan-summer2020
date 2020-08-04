using System;

namespace Assignment.Model
{
    class Category 
    {
        public string ID {get;set;}
        public string Name {get;set;}
        public string Description {get;set;}
        public string Picture {get;set;}

        public Category (string id, string name, string description, 
                        string picture)
        {
            this.ID = id;
            this.Name = name;
            this.Description = description;
            this.Picture = picture;
        }
    }
}