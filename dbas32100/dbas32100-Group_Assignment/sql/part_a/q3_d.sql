----------------------------------
-- QUESTION 3 - D
--  Show the names of the customers 
--  and the number of movies rented 
--  by him.
--
-- Contributor : Benjamin Ahola
----------------------------------
SELECT FIRSTNAME, LASTNAME, COUNT (TapeID) AS "Movies Rented"
    FROM Customer_T c JOIN Rental_T r
        ON c.CustomerID = r.CustomerID
    GROUP BY (FIRSTNAME, LASTNAME);