----------------------------------
-- QUESTION 1 - Database Creation
--
-- Contributor : Benjamin Ahola
----------------------------------

DROP TABLE Category_T   CASCADE CONSTRAINTS;
DROP TABLE Customer_T   CASCADE CONSTRAINTS;
DROP TABLE Titles_T     CASCADE CONSTRAINTS;
DROP TABLE Rental_T     CASCADE CONSTRAINTS;

-- CATEGORY TABLE 
CREATE TABLE Category_T (
    CategoryID NUMBER (3, 0) NOT NULL,
    CategoryName VARCHAR2 (25 CHAR) NOT NULL,
CONSTRAINT Category_PK PRIMARY KEY (CategoryID)
);

-- CUSTOMER TABLE 
CREATE TABLE Customer_T (
    CustomerID              NUMBER   (4, 0)    NOT NULL,
    FirstName               VARCHAR2 (15 CHAR) NOT NULL,
    LastName                VARCHAR2 (15 CHAR) NOT NULL,
    PhoneNumber             VARCHAR2 (13 CHAR) NOT NULL,
    Birthdate               DATE               NOT NULL,
    DriversLicenseNumber    VARCHAR2 (10 CHAR),
    Status                  VARCHAR2 (13 CHAR) NOT NULL,
    CreditCardNumber        VARCHAR2 (10 CHAR), 
CONSTRAINT Customer_PK PRIMARY KEY (CustomerID),
CONSTRAINT ChkStatus CHECK (Status IN ('Active', 'Amount Owing', 'Suspended')));

-- TITLES TABLE 
CREATE TABLE Titles_T (
    TapeID          NUMBER   (3, 0)     NOT NULL,
    Title           VARCHAR2 (50 CHAR)  NOT NULL,
    YearReleased    NUMBER   (4, 0)     NOT NULL,
    DatePurchased   DATE                NOT NULL,
    Cost            NUMBER   (3, 2)     NOT NULL,
    CategoryID      NUMBER   (3, 0)     NOT NULL,
    RentedOut       VARCHAR2 (3 CHAR)   NOT NULL,
    Rating          VARCHAR2 (3 CHAR)   NOT NULL,
    ActionOnReturn  VARCHAR2 (20 CHAR)  NOT NULL,
    ReservedBy      Number   (4, 0),
CONSTRAINT Titles_PK PRIMARY KEY (TapeID),
CONSTRAINT Titles_FK1 FOREIGN KEY (CategoryID) 
    REFERENCES Category_T (CategoryID),
CONSTRAINT Titles_FK2 FOREIGN KEY (ReservedBy)
    REFERENCES Customer_T (CustomerID),
CONSTRAINT ChkRentedOut CHECK (RentedOut IN ('Yes', 'No')),
CONSTRAINT ChkRating CHECK (
    Rating IN ('G', 'PG', 'PG-13', 'R', 'NC-17', '14A', '3')),
CONSTRAINT ChkActionOnReturn CHECK (
    ActionOnReturn IN ('Return to Shelf', 'Sell'))
);

-- RENTAL TABLE 
CREATE TABLE Rental_T (
    RentalID    NUMBER (4, 0)       NOT NULL,
    RentalDate  DATE                NOT NULL,
    CustomerID  NUMBER (4, 0)       NOT NULL, 
    TapeID      NUMBER (3, 0)       NOT NULL,
CONSTRAINT Rental_PK PRIMARY KEY (RentalID),
CONSTRAINT Rental_FK1 FOREIGN KEY (CustomerID)
    REFERENCES Customer_T (CustomerID),
CONSTRAINT Rental_FK2 FOREIGN KEY (TapeID)
    REFERENCES Titles_T (TapeID)
);

-- Category_T Data --
INSERT INTO Category_T (CategoryID, CategoryName)
    VALUES (1, 'Action/Adventure');
INSERT INTO Category_T (CategoryID, CategoryName)
    VALUES (2, 'Biography');
INSERT INTO Category_T (CategoryID, CategoryName)
    VALUES (3, 'Children');
INSERT INTO Category_T (CategoryID, CategoryName)
    VALUES (4, 'Comedy');
INSERT INTO Category_T (CategoryID, CategoryName)
    VALUES (5, 'Drama');
INSERT INTO Category_T (CategoryID, CategoryName)
    VALUES (6, 'Horror');
INSERT INTO Category_T (CategoryID, CategoryName)
    VALUES (7, 'Musical');
INSERT INTO Category_T (CategoryID, CategoryName)
    VALUES (8, 'Science Fiction');

-- Customer_T Data --
INSERT INTO Customer_T (CustomerID, LastName, 
    FirstName, PhoneNumber, BirthDate, DriversLicenseNumber,
    Status, CreditCardNumber)
VALUES (1001, 'Edward', 'Vongsaplay', '(905)555-8932', '1-JAN-1990',
        '537597397', 'Active', '420032xxxx');
INSERT INTO Customer_T (CustomerID, LastName, 
    FirstName, PhoneNumber, BirthDate, DriversLicenseNumber,
    Status, CreditCardNumber)
VALUES (1002, 'Fiona', 'Esposito', '(905)345-3920', '28-MAR-1955',
        '232323290', 'Active', '450036xxxx');
INSERT INTO Customer_T (CustomerID, LastName, 
    FirstName, PhoneNumber, BirthDate, DriversLicenseNumber,
    Status, CreditCardNumber)
VALUES (1003, 'Graeme', 'Sands', '(416)849-5391', '30-NOV-1973',
        '492830981', 'Amount Owing', '460033xxxx');
INSERT INTO Customer_T (CustomerID, LastName, 
    FirstName, PhoneNumber, BirthDate, DriversLicenseNumber,
    Status, CreditCardNumber)
VALUES (1004, 'Margeret', 'Armstrong', '(905)745-7342', '19-JUN-1968',
        '987654336', 'Suspended', '430022xxxx');
INSERT INTO Customer_T (CustomerID, LastName, 
    FirstName, PhoneNumber, BirthDate, DriversLicenseNumber,
    Status, CreditCardNumber)
VALUES (1005, 'Michael', 'McGuinty', '(905)648-3246', '30-MAR-1984',
        '345678998', 'Active', '450029xxxx');
INSERT INTO Customer_T (CustomerID, LastName, 
    FirstName, PhoneNumber, BirthDate, DriversLicenseNumber,
    Status, CreditCardNumber)
VALUES (1006, 'Phil', 'Charest', '(416)371-3979', '10-DEC-1980',
        '604604047', 'Suspended', '410079xxxx');
INSERT INTO Customer_T (CustomerID, LastName, 
    FirstName, PhoneNumber, BirthDate, DriversLicenseNumber,
    Status, CreditCardNumber)
VALUES (1007, 'Paula', 'Chow', '(416)635-5555', '12-OCT-1979', '', 'Active', '');

-- Titles_T Data --
INSERT INTO Titles_T (TapeID, Title, YearReleased, DatePurchased, Cost, CategoryID, RentedOut,
    Rating, ActionOnReturn, ReservedBy)
VALUES (1, 'Elizabeth: The Golden Age', 2008, '23-FEB-2008', 5.29, 5, 'Yes', 'PG', 
    'Return to Shelf', '');
INSERT INTO Titles_T (TapeID, Title, YearReleased, DatePurchased, Cost, CategoryID, RentedOut,
    Rating, ActionOnReturn, ReservedBy)
VALUES (10, 'The Kings Speech', 2010, '3-MAR-2010', 5.29, 5, 'Yes', 'R', 
    'Return to Shelf', '');
INSERT INTO Titles_T (TapeID, Title, YearReleased, DatePurchased, Cost, CategoryID, RentedOut,
    Rating, ActionOnReturn, ReservedBy)
VALUES (11, 'True Grit', 2010, '23-FEB-2011', 5.29, 1, 'Yes', 'PG', 
        'Return to Shelf', '');
INSERT INTO Titles_T (TapeID, Title, YearReleased, DatePurchased, Cost, CategoryID, RentedOut,
    Rating, ActionOnReturn, ReservedBy)
VALUES (2, 'The Bourne Ultimatum', 2009, '29-MAR-2009', 3.99, 1, 'No', 'PG', 
        'Sell', '');
INSERT INTO Titles_T (TapeID, Title, YearReleased, DatePurchased, Cost, CategoryID, RentedOut,
    Rating, ActionOnReturn, ReservedBy)
VALUES (3, 'Shrek 3', 2004, '9-NOV-2010', 3.99, 3, 'No', '3', 
        'Return to Shelf', '');
INSERT INTO Titles_T (TapeID, Title, YearReleased, DatePurchased, Cost, CategoryID, RentedOut,
    Rating, ActionOnReturn, ReservedBy)
VALUES (4, 'Ace Ventura, Pet Detective', 1994, '30-JUN-1994', 3.99, 4, 'No', '14A', 
        'Sell', '');
INSERT INTO Titles_T (TapeID, Title, YearReleased, DatePurchased, Cost, CategoryID, RentedOut,
    Rating, ActionOnReturn, ReservedBy)
VALUES (5, 'Hairspray', 2007, '17-SEP-2007', 5.29, 7, 'No', 'PG', 
        'Sell', '');
INSERT INTO Titles_T (TapeID, Title, YearReleased, DatePurchased, Cost, CategoryID, RentedOut,
    Rating, ActionOnReturn, ReservedBy)
VALUES (6, 'A Charlie Brown Christmas', 2000, '13-APR-2000', 3.99, 3, 'No', 'G', 
        'Return to Shelf', '');
INSERT INTO Titles_T (TapeID, Title, YearReleased, DatePurchased, Cost, CategoryID, RentedOut,
    Rating, ActionOnReturn, ReservedBy)
VALUES (7, 'Leonard Cohen: Im Your Man', 2006, '15-FEB-2006', 3.99, 2, 'Yes', 'R', 
        'Return to Shelf', '');
INSERT INTO Titles_T (TapeID, Title, YearReleased, DatePurchased, Cost, CategoryID, RentedOut,
    Rating, ActionOnReturn, ReservedBy)
VALUES (8, 'Nightmare on Elm Street', 1999, '2-MAY-1999', 3.99, 6, 'Yes', 'R', 
        'Return to Shelf', '');
INSERT INTO Titles_T (TapeID, Title, YearReleased, DatePurchased, Cost, CategoryID, RentedOut,
    Rating, ActionOnReturn, ReservedBy)
VALUES (9, 'Star Trek: Nemesis', 2005, '23-OCT-2005', 3.99, 8, 'Yes', 'PG', 
        'Return to Shelf', '');

-- Titles_T Data --
INSERT INTO Rental_T (RentalID, RentalDate, CustomerID, TapeID)
    VALUES (1000, '2-DEC-2011', 1002, 10);
INSERT INTO Rental_T (RentalID, RentalDate, CustomerID, TapeID)
    VALUES (1002, '2-DEC-2011', 1002, 3);
INSERT INTO Rental_T (RentalID, RentalDate, CustomerID, TapeID)
    VALUES (1003, '2-DEC-2011', 1005, 6);
INSERT INTO Rental_T (RentalID, RentalDate, CustomerID, TapeID)
    VALUES (1004, '7-DEC-2011', 1006, 1);
INSERT INTO Rental_T (RentalID, RentalDate, CustomerID, TapeID)
    VALUES (1005, '7-JUL-2011', 1003, 7);
INSERT INTO Rental_T (RentalID, RentalDate, CustomerID, TapeID)
    VALUES (1006, '7-JUL-2011', 1003, 9);
