
-- Table Setup
DROP TABLE Room;
CREATE TABLE Room (
    RoomID  NUMBER (2),
    RoomName VARCHAR (12),
    Comments VARCHAR (124)
);

INSERT INTO Room VALUES (1, 'North Room', '');
INSERT INTO Room VALUES (1, 'South Room', '');
INSERT INTO Room VALUES (1, 'West Room', '');

DROP TABLE Prod1;
CREATE TABLE Prod1 (
    prod_ID NUMBER (3),
    Prod_Name VARCHAR2 (24)
);

INSERT INTO Prod1 VALUES (1, 'Tomato');
INSERT INTO Prod1 VALUES (2, 'Potato');
INSERT INTO Prod1 VALUES (3, 'Fish');

DROP TABLE ProdAudit;
CREATE TABLE ProdAudit (
    Operation    VARCHAR2 (24),
    DateOfChange DATE
);

COMMIT;

-- ---------------
-- TRIGGERS 
-- ---------------

--
-- EXAMPLE 1 (DML)
-- ---------------
--  Use :NEW to put new data into a row
--  Use :OLD to retreve old data from a row
CREATE OR REPLACE TRIGGER InsertRoom
    BEFORE UPDATE OF RoomName ON Room
FOR EACH ROW
    DECLARE
        com Room.Comments%TYPE;
    BEGIN
        com := :NEW.RoomName || ' previously known as ' || :OLD.RoomName;
        :NEW.Comments := com;
    END;

UPDATE ROOM SET 
    RoomName = 'East Room'
        WHERE RoomName = 'West Room';
COMMIT;
SELECT * FROM Room;


--
-- EXAMPLE 2 (Row vs Statement)
--

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

--
-- EXAMPLE 1 (Simple)
--
CREATE SEQUENCE vendor_id_seq
    START WITH 124;

--
-- EXAMPLE 2 (Extensive)
--
CREATE SEQUENCE test_seq
    START WITH 100
    INCREMENT BY 10
    MINVALUE 0
    MAXVALUE 1000
    CYCLE
    CACHE;

--
-- EXAMPLE 3 (Using Sequences)
--
CREATE SEQUENCE seq_test;

SELECT Seq_test.NEXTVAL from dual;
SELECT SysDate FROM Dual;

--
-- EXAMPLE 4
--
-- Table Setup
CREATE TABLE MyCustomer1 -- Make table from select statement
AS (SELECT Cust_ID, Cust_First_Name,
        Cust_Last_Name, CUST_GENDER 
            FROM sh.CUSTOMERS
                WHERE ROWNUM < 0);

CREATE SEQUENCE Seq_Cust 
    START WITH      14 
    INCREMENT BY    1
    NOCACHE
    NOCYCLE;

--
-- Create Auto Increment values for Customer IDs
--
CREATE OR REPLACE TRIGGER Cust_trg
    BEFORE INSERT ON MyCustomer1
    FOR EACH ROW
        BEGIN
            SELECT Seq_Cust.NEXTVAL INTO :NEW.Cust_ID FROM dual;
        END;

INSERT ALL
    INTO MyCustomer1 (CUST_FIRST_NAME, CUST_LAST_NAME,
        CUST_GENDER) VALUES ('John', 'Field', 'M')
    INTO MyCustomer1 (CUST_FIRST_NAME, CUST_LAST_NAME,
        CUST_GENDER) VALUES ('Sally', 'Field', 'F');

SELECT * FROM Dual;
SELECT * FROM MyCustomer1;

--
-- EXERCISE
--
CREATE TABLE Customer5
    AS (SELECT * FROM si.Customer);
COMMIT;

CREATE OR REPLACE TRIGGER ToUpper_trg
    BEFORE INSERT OR UPDATE ON Customer5
        FOR EACH ROW
            DECLARE
                v_newName si.Customer.CustName%TYPE;
            BEGIN
                v_newName := :NEW.CustName;
                SELECT UPPER(v_newName) INTO :NEW.CUSTNAME FROM Dual;
            END;

ACCEPT p_custname PROMPT 'Enter Customer Name'
ACCEPT p_custstreet PROMPT 'Enter Customer Name'
ACCEPT p_custcity PROMPT 'Enter Customer Name'
ACCEPT p_custprov PROMPT 'Enter Customer Name'

ACCEPT p_custname PROMPT 'Enter Customer Name'
ACCEPT p_custname PROMPT 'Enter Customer Name'
ACCEPT p_custname PROMPT 'Enter Customer Name'

INSERT INTO Customer5 (CUSTNAME, CUSTSTREET, CUSTCITY, CUSTPROVINCE)
    VALUES ('ben', '123 Fake St.', 'Faketown', 'FK');

SELECT * FROM Customer5;

