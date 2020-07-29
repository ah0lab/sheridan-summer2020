SET serveroutput ON;
    ACCEPT firstname PROMPT 'Please enter the name of the salesman';
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM hr.Employees
    WHERE UPPER (first_name) = UPPER ('&firstname');
        IF v_count > 0 THEN
            dbms_output.put_line (' There are ' || v_count || ' Employees with name ' || '&firstname' );
        ELSE
            dbms_output.put_line ('No employee found');
        END IF;
END;