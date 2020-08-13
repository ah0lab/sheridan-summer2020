-- -------------------------
-- PROCEDURES
-- -------------------------
--
-- EXAMPLE 1
--
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE GREETINGS
    (v_myname IN VARCHAR2, v_greet IN VARCHAR2)
IS      -- Declare vars
    v_greeting VARCHAR2 (24);
BEGIN   -- Start PL/SQL
    v_greeting := ' HELLO ' || v_myname || ' ' || v_greet;
    DBMS_OUTPUT.PUT_LINE (v_greeting);
END;

-- Call Procedure
EXECUTE GREETINGS ('Ben', 'Bensons');

-- Call from script
BEGIN
    GREETINGS ('&fname', '&lname');
END;

--
-- EXAMPLE 2
--
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE NUM_GREATEST
    (v_num1 IN NUMBER, v_num2 IN NUMBER)
IS
BEGIN
    IF v_num1 = v_num2 THEN
        DBMS_OUTPUT.PUT_LINE ('Both numbers are equal');
    ELSIF v_num1 < v_num2 THEN
        DBMS_OUTPUT.PUT_LINE ('The largest number is ' || v_num2);
    ELSE
        DBMS_OUTPUT.PUT_LINE ('The largest number is ' || v_num1);
    END IF;
END;

EXECUTE NUM_GREATEST (1, 2);

--
-- EXAMPLE 3
--
CREATE OR REPLACE PROCEDURE ADD_TWO (v_addend1 IN NUMBER, v_addend2 IN NUMBER)
IS
    v_sum NUMBER(2, 0);
BEGIN
    v_sum := v_addend1 + v_addend2;
    DBMS_OUTPUT.PUT_LINE (v_addend1 || ' + ' || v_addend2 || ' = ' || v_sum); 
END;

EXECUTE ADD_TWO (1, 1);

--
-- DROP PROCEDURES
--
DROP PROCEDURE ADD_TWO;
DROP PROCEDURE NUM_GREATEST;
DROP PROCEDURE GREETINGS;

-- IN 
--  Procedure must be called with a value for the parameter.
--  This value cannot be changed
-- OUT
--  Procedure must be called with a variable for the parameter.
--  Changes to the parameter are see by user