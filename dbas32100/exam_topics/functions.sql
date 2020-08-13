-- -------------------------
-- FUNCTIONS
-- -------------------------
--  Always return a value
--  Can't make changes to database (no INSERT, UPDATE, or DELETE)
--  Can be used in SELECT statements

--
-- EXAMPLE 1
--
CREATE OR REPLACE FUNCTION emp_count (v_salary IN Employees.salary%TYPE)
RETURN NUMBER -- The type returned
IS
    total NUMBER;
BEGIN
    SELECT COUNT (*) INTO total
        FROM Employees
    WHERE salary = v_salary;

RETURN total;
END;

-- Call function
SET SERVEROUTPUT ON;
ACCEPT p_salary;
DECLARE
    v_num Employees.salary%TYPE;
BEGIN
    v_num := emp_count('&p_salary');
    DBMS_OUTPUT.PUT_LINE ('There are ' || v_num || ' Employees');
END;

--
-- EXAMPLE 2
--
CREATE OR REPLACE FUNCTION COUNT_DISCOUNT (v_date IN SI.SaleInv.SaleDate%TYPE)
RETURN SI.SaleInv.Discount%TYPE
IS
    v_totalDiscount SI.SALEINV.DISCOUNT%TYPE;
BEGIN
    SELECT SUM (Discount) INTO v_totalDiscount
        FROM si.SaleInv 
    WHERE si.SaleInv.SaleDate > v_date;
RETURN v_totalDiscount;
END;

-- Use the function
SET SERVEROUTPUT ON;
ACCEPT p_date DATE PROMPT 'Enter a date';
DECLARE
    v_totalDiscounts si.SaleInv.Discount%TYPE;
BEGIN
    v_totalDiscounts := COUNT_DISCOUNT (&p_date);
    DBMS_OUTPUT.PUT_LINE ('Total discounts after ' || &p_date || ' is' || v_totalDiscounts);
END;