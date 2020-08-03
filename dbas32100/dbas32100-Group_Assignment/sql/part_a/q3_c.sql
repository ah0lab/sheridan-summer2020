----------------------------------
-- QUESTION 3 - C
--  Show all the detail of a 
--  customer and the movies he/she 
--  is renting.
--
-- Contributor : Benjamin Ahola
----------------------------------
SELECT c.CustomerID, FirstName, LastName, PhoneNumber, 
       Birthdate, DriversLicenseNumber, Status, CreditCardNumber,
       t.TITLE
    FROM Customer_T c JOIN RENTAL_T r
        ON c.CustomerID = r.CustomerID 
        JOIN TITLES_T t
        ON t.TapeID = r.TapeID;