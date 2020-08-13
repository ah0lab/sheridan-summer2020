----------------------------------
-- QUESTION 1 
--  Create a PL SQL script that uses
--  cursor to print information for 
--  customers who own a given make, 
--  model and year of a car. The 
--  three values must be entered by 
--  the user. Use SI database.
--
-- Contributor : Joshua Clark
----------------------------------
ACCEPT cmake PROMPT 'Enter a carmake';
ACCEPT cmodel PROMPT 'Enter a car model';
ACCEPT cyear PROMPT 'Enter the car year';
DECLARE
v_custname si.customer.custname%type;
v_custcity si.customer.custcity%type;
v_custphone si.customer.custhphone%type;
CURSOR custdetails IS
SELECT custname, custcity, custhphone
FROM si.customer s INNER JOIN si.car r
ON s.custname = r.custname
WHERE carmake = '&cmake' AND carmodel = '%cmodel' AND caryear = '&cyear';

BEGIN
OPEN custdetails;
LOOP
FETCH custdetails INTO v_custname, v_custcity, v_custphone;
EXIT WHEN custdetails%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(v_custname || ' ' || v_custcity || ' ' || v_custphone);
END LOOP;
CLOSE custdetails;
END;
/
