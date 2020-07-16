--
-- TRIGGERS Continued
--

CREATE TABLE Prod1 (
    prod_ID NUMBER (3),
    Prod_Name VARCHAR2 (24)
);

INSERT INTO Prod1 VALUES (1, 'Tomato');
INSERT INTO Prod1 VALUES (2, 'Potato');
INSERT INTO Prod1 VALUES (3, 'Fish');

COMMIT;

CREATE TABLE ProdAudit (
    Operation    VARCHAR2 (24),
    DateOfChange DATE
);

-- Create log of update
CREATE OR REPLACE TRIGGER RowTrigger
AFTER UPDATE ON Prod1
FOR EACH ROW
BEGIN
    INSERT INTO ProdAudit VALUES ('Row Trigger', SYSDATE);
END;

CREATE OR REPLACE TRIGGER StatementTrigger
AFTER UPDATE ON Prod1
BEGIN
    INSERT INTO ProdAudit VALUES ('Statement Trigger', SYSDATE);
END;

UPDATE Prod1 SET Prod_Name = Prod_Name || '-';
SELECT * FROM ProdAudit ORDER BY DateOfChange;

--
-- SEQUENCES
--
CREATE SEQUENCE seq_test;

SELECT Seq_test.NEXTVAL from dual;

SELECT SysDate FROM Dual;

-- Example 
CREATE TABLE MyCustomer1
AS (SELECT Cust_ID, Cust_First_Name,
        Cust_Last_Name, CUST_GENDER 
            FROM sh.CUSTOMERS
                WHERE ROWNUM < 0);

CREATE SEQUENCE Seq_Cust 
    START WITH      14 
    INCREMENT BY    1
    NOCACHE
    NOCYCLE;

CREATE OR REPLACE TRIGGER Cust_trg
BEFORE INSERT ON MyCustomer1
FOR EACH ROW
BEGIN
    SELECT Seq_Cust.NEXTVAL INTO :new.Cust_ID FROM dual;
END;

INSERT ALL
INTO MyCustomer1 (CUST_FIRST_NAME, CUST_LAST_NAME,
    CUST_GENDER) VALUES ('John', 'Field', 'M')
INTO MyCustomer1 (CUST_FIRST_NAME, CUST_LAST_NAME,
    CUST_GENDER) VALUES ('Sally', 'Field', 'F')

SELECT * FROM Dual;

SELECT * FROM MyCustomer1;

--
-- EXERCISE
--

---
--- CURSORS
---
DECLARE 
    C_ID    sh.CUSTOMERS.CUST_ID%TYPE;
    C_FName sh.CUSTOMERS.CUST_FIRST_NAME%TYPE;
    C_LName sh.CUSTOMERS.CUST_LAST_NAME%TYPE;
    CURSOR cr IS SELECT Cust_ID, CUST_FIRST_NAME,
        CUST_LAST_NAME
    FROM sh.CUSTOMERS
        WHERE CUST_ID < 100;
BEGIN
    OPEN cr;
    LOOP
        FETCH cr INTO C_ID, C_FName, C_LName;
        DBMS_OUTPUT.PUT_LINE (C_ID || ' ' ||
            C_FName || ' ' || C_LName);
        EXIT WHEN cr%NOTFOUND;
    END LOOP;
    CLOSE cr;
END;

--
-- TYPE
--

DECLARE 
    TYPE Rec_Cust IS RECORD (
        C_ID    sh.CUSTOMERS.CUST_ID%TYPE;
        C_FName sh.CUSTOMERS.CUST_FIRST_NAME%TYPE;
        C_LName sh.CUSTOMERS.CUST_LAST_NAME%TYPE;
    ); Cust Rec_Cust;

    CURSOR cr IS SELECT Cust_ID, CUST_FIRST_NAME,
        CUST_LAST_NAME
    FROM sh.CUSTOMERS
        WHERE CUST_ID < 100;
BEGIN
    OPEN cr;
    LOOP
        FETCH cr INTO Cust;
        DBMS_OUTPUT.PUT_LINE (Cust.C_ID || ' ' ||
            Cust.C_FName || ' ' || Cust.C_LName);
        EXIT WHEN cr%NOTFOUND;
    END LOOP;
    CLOSE cr;
END;

-- Exercise
