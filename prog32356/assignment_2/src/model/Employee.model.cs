using System;

namespace Assignment.Model 
{
    class Employee 
    {
        public int ID {get;set;}
        public string FirstName {get;set;}
        public string LastName {get;set;}
        public string Title {get;set;}
        public string TitleOfCourtesy {get;set;}
        public DateTime BirthDate {get;set;}
        public DateTime HireDate {get;set;}
        public Address Addr {get;set;}
        public string HomePhone {get;set;}
        public string Extension {get;set;}
        public string Photo {get;set;}
        public string Notes {get;set;}
        public int ReportsTo {get;set;}
        public Employee (int id, string firstname, string lastname,
                         string title, string titleofcourtesy, DateTime birthdate,
                         DateTime hiredate, Address address, string homephone,
                         string extension, string photo, string notes, 
                         int reportsto)
        {
            this.ID              = id;
            this.FirstName       = firstname;
            this.LastName        = lastname;
            this.Title           = title;
            this.TitleOfCourtesy = titleofcourtesy;
            this.BirthDate       = birthdate;
            this.HireDate        = hiredate;
            this.Addr            = address;
            this.HomePhone       = homephone;
            this.Extension       = extension;
            this.Photo           = photo;
            this.Notes           = notes;
            this.ReportsTo       = reportsto;
        }

        public static Employee Parse (object[] dataset)
        {
            if (dataset.Length != 17) {
                Console.WriteLine ("Incomplete Dataset!");
                return null;
            }

            Console.WriteLine (DateTime.Parse (dataset[5].ToString()));
            Console.WriteLine (DateTime.Parse (dataset[6].ToString()));

            return new Employee (
                id              : (int)dataset[0],
                firstname       : dataset[1].ToString(),
                lastname        : dataset[2].ToString(),
                title           : dataset[3].ToString(),
                titleofcourtesy : dataset[4].ToString(),
                birthdate       : DateTime.Parse (dataset[5].ToString()),
                hiredate        : DateTime.Parse (dataset[6].ToString()),
                address : new Address (
                street          : dataset[7].ToString(),
                city            : dataset[8].ToString(),
                region          : dataset[9].ToString(),
                postalcode      : dataset[10].ToString(),
                country         : dataset[11].ToString()),
                homephone       : dataset[12].ToString(),
                extension       : dataset[13].ToString(),
                photo           : dataset[14].ToString(),
                notes           : dataset[15].ToString(),
                reportsto       : (dataset[16] is System.DBNull) ? 0 : (int)dataset[16]);
        }

        override public string ToString() 
        {
            return $"First Name         : {this.FirstName}\n"       +
                   $"Last Name          : {this.LastName}\n"        +
                   $"Title              : {this.Title}\n"           +
                   $"Title Of Courtesy  : {this.TitleOfCourtesy}\n" +
                   $"Birthdate          : {this.BirthDate}\n"       +
                   $"Hire Date          : {this.HireDate}\n"        +
                   $"Address\n {this.Addr}\n"                       +
                   $"Home Phone         : {this.HomePhone}\n"       +
                   $"Extension          : {this.Extension}\n"       +
                   $"Photo              : {this.Photo}\n"           +
                   $"Notes              : {this.ReportsTo}";

        }
    }

}
