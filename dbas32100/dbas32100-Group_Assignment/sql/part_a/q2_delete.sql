----------------------------------
-- QUESTION 2 - Delete 
-- 
-- Contributor : Benjamin Ahola
----------------------------------

--Category Table
ACCEPT p_CategoryID PROMPT 'Enter the category ID'
BEGIN
    DELETE FROM Category_T 
        WHERE CategoryID = p_CategoryID;
END;

--Customer Table
ACCEPT p_CustomerID PROMPT 'Enter the customer ID'
BEGIN
    DELETE FROM Customer_T
        WHERE CustomerID = p_CustomerID;
END;

--Titles Table
ACCEPT p_TapeID PROMPT 'Enter the tape ID'
BEGIN
    DELETE FROM Titles_T
        WHERE TapeID = p_TapeID;
END;

--Rental Table
ACCEPT p_RentalID PROMPT 'Enter the rental ID'
BEGIN
    DELETE FROM Rentals_T
        WHERE RentalID = p_RentalID;
END; 