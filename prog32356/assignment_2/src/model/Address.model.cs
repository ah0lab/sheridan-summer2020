using System;

namespace Assignment.Model
{
    internal readonly struct Address {
        public string Street     {get;}
        public string City       {get;}
        public string Region     {get;}
        public string PostalCode {get;}
        public string Country    {get;}

        public Address (string street, string city, string region, 
                        string postalcode, string country)
        {
            this.Street     = street;
            this.City       = city;
            this.Region     = region;
            this.PostalCode = postalcode;
            this.Country    = country;
        }

        override public string ToString() 
        {
            return $"\tStreet         : {this.Street}\n"    +
                   $"\tCity           : {this.City}\n"      +
                   $"\tRegion         : {this.Region}\n"    +
                   $"\tPostalCode     : {this.PostalCode}\n"+
                   $"\tCountry        : {this.Country}";
        }
    }
}