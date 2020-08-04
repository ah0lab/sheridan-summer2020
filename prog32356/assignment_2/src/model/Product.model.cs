using System;

namespace Assignment.Model 
{
    class Product 
    {
        public string ID {get;set;}
        public string Name {get;set;}
        public string SupplierID {get;set;}
        public string CategoryID {get;set;}
        public string QPU {get;set;}
        public Decimal UnitPrice {get;set;}
        public int UnitsInStock {get;set;}
        public int UnitsOnOrder {get;set;}
        public int ReOrderLevel  {get;set;}
        public bool Discontinued {get;set;}

        public Product (string id, string name, string supplierid, string categoryid,
                        string qpu, Decimal unitprice, int unitsinstock, int unitsonorder,
                        int reorderlevel, bool discontinued)
        {
            this.ID = id;
            this.Name = name;
            this.SupplierID = supplierid;
            this.CategoryID = categoryid;
            this.QPU = qpu;
            this.UnitPrice = unitprice;
            this.UnitsInStock = unitsinstock;
            this.UnitsOnOrder = unitsonorder;
            this.ReOrderLevel = reorderlevel;
            this.Discontinued = discontinued;
        }

        public override string ToString()
        {
            return "";
        }
    }
}