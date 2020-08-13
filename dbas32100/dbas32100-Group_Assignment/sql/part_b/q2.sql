----------------------------------
-- QUESTION 2 
--  Create a stored procedure which 
--  accepts a customer name as an 
--  argument and displays the total 
--  amount the customer has spent 
--  buying cars. Use car database.
--
-- Contributor : Benjamin Ahola 
----------------------------------
SET serveroutput ON;
CREATE OR REPLACE PROCEDURE Get_Total_Spent (v_custname in VARCHAR2)
IS
    v_totalspent NUMBER;
BEGIN
    SELECT SUM (CarSalePrice) INTO v_totalspent
        FROM si.SaleInv WHERE CustName = v_custname;

    DBMS_OUTPUT.PUT_LINE (v_custname|| ' has spent a total of ' ||v_totalspent);
END;

EXECUTE Get_Total_Spent ('MITUL RAMI');