---
--- CURSORS
---     Cursor is a pointer to a data struct that holds 
---     the result set of a select statement and allows
---     accessing this result

---
--- EXAMPLE 1
---
DECLARE 
    C_ID    sh.CUSTOMERS.CUST_ID%TYPE;
    C_FName sh.CUSTOMERS.CUST_FIRST_NAME%TYPE;
    C_LName sh.CUSTOMERS.CUST_LAST_NAME%TYPE;

    CURSOR cr IS SELECT Cust_ID, CUST_FIRST_NAME, CUST_LAST_NAME
        FROM sh.CUSTOMERS
        WHERE CUST_ID < 100;
BEGIN
    -- Open cursor and loop through selected rows
    OPEN cr;
    LOOP
        -- Fetch a row from the selected set into vars
        FETCH cr INTO C_ID, C_FName, C_LName;
        DBMS_OUTPUT.PUT_LINE (C_ID || ' ' ||
            C_FName || ' ' || C_LName);
        EXIT WHEN cr%NOTFOUND;
    END LOOP;
    CLOSE cr;
END;

---
--- EXAMPLE 2
---
SET SERVEROUTPUT ON;
DECLARE
    Dept_name   hr.Departments.Department_Name%TYPE;
    Dept_avgSal hr.Employees.Salary%TYPE;

    CURSOR cr IS SELECT Department_Name, AVG(Salary)
        FROM hr.Employees e JOIN hr.Departments d
            ON d.Department_ID = e.Department_ID
        GROUP BY Department_Name;
BEGIN
    OPEN cr;
    LOOP
        FETCH cr INTO Dept_name, Dept_avgSal;
            DBMS_OUTPUT.PUT_LINE ('Average Salary of the ' || Dept_name 
                || ' department is ' || Dept_AvgSal);
    END LOOP;
    CLOSE cr;
END;

---
--- COLLECTIONS
---  Collections are an ordered group of elements,
---  all of which are the same type.
---

---
--- EXAMPLE 3
---
DECLARE 
    -- Record is a data struct that can have fields 
    --  with different data types.
    TYPE Rec_Cust IS RECORD (
        C_ID    sh.CUSTOMERS.CUST_ID%TYPE;
        C_FName sh.CUSTOMERS.CUST_FIRST_NAME%TYPE;
        C_LName sh.CUSTOMERS.CUST_LAST_NAME%TYPE;
    ); Cust Rec_Cust; --Aliases for struct (like c?)

    CURSOR cr IS SELECT Cust_ID, CUST_FIRST_NAME,
        CUST_LAST_NAME
    FROM sh.CUSTOMERS
        WHERE CUST_ID < 100;
BEGIN
    OPEN cr;
    LOOP
        FETCH cr INTO Cust; -- Load data into struct
        -- Access data from struct
        DBMS_OUTPUT.PUT_LINE (Cust.C_ID || ' ' ||
            Cust.C_FName || ' ' || Cust.C_LName);
        EXIT WHEN cr%NOTFOUND; -- Exit loop when row cannot be found (end of rows)
    END LOOP;
    CLOSE cr;
END;

---
--- EXAMPLE 4 (Record Insert)
---
CREATE TABLE MyCustomer AS (
    SELECT Cust_ID, Cust_First_Name, Cust_Last_Name
        FROM sh.Customer WHERE ROWNUM < 0
);

DECLARE 
    TYPE Rec_Cust IS RECORD (
        C_ID NUMBER,
        C_FName VARCHAR2 (20),
        C_LName VARCHAR2 (40)
    ); Cust Rec_Cust;
    CURSOR cr IS SELECT Cust_ID, Cust_First_Name, Cust_Last_Name
        FROM sh.Customers;
            WHERE Cust_ID < 100;
BEGIN
    OPEN cr;
    LOOP
        FETCH cr INTO Cust;
        -- Insert into row in the MyCustomer table using the data 
        --  stored in the Cust Record.
        INSERT INTO MyCustomer VALUES (
            Cust.C_ID,
            Cust.C_FName,
            Cust.C_LName
        );
        EXIT WHEN cr%NOTFOUND;
    END LOOP;
    CLOSE cr;
END;
COMMIT; 

SELECT * FROM MyCustomer;
DROP TABLE MyCustomer;

---
--- EXAMPLE 5 (Bulk Retrieval)
---
DECLARE 
    TYPE Rec_Cust IS RECORD (
        C_ID NUMBER,
        C_FName VARCHAR2 (20),
        C_LName VARCHAR2 (40)
    -- Arr_Cust is a collection that holds data of type record. It is
    --  a collection of records.
    ); TYPE Arr_Cust IS TABLE OF Rec_Cust; Cust Arr_Cust;
    CURSOR cr IS SELECT Cust_ID, Cust_First_Name, Cust_Last_Name
        FROM sh.Customers
            WHERE Cust_ID < 100;
BEGIN
    OPEN cr;
        -- Load the data into the collection of records.
        --  No looping through individual rows required as done before.
        FETCH cr BULK COLLECT INTO Cust;
    CLOSE cr;

    -- Loop through the collection of records as you would an array
    FOR i IN 1..Cust.LAST LOOP
        DBMS_OUTPUT.PUT_LINE ( 
            Cust(i).C_ID    || ' ' ||
            Cust(i).C_FName || ' ' ||
            Cust(i).C_LName
        );
    END LOOP;
END;


---
--- EXAMPLE 6 (Bulk Insert)
---
CREATE TABLE MyCustomer AS (
    SELECT * FROM sh.Customers WHERE ROWNUM < 0
);

DECLARE
    TYPE Arr_Cust IS TABLE OF sh.Customers%ROWTYPE
        Cust Arr_Cust;
    CURSOR cr IS SELECT * FROM sh.Customers
        WHERE Cust_ID < 100;
BEGIN
    OPEN cr;
        FETCH cr BULK COLLECT INTO Cust;
    CLOSE cr;
    -- FORALL is used to make bulk DML operations.
    --  You can only use one DML statement within a 
    --  FORALL as shown.
    FORALL i IN 1..Cust.LAST
        INSERT INTO MyCustomer VALUES Cust(i);
END;

SELECT * FROM MyCustomer;