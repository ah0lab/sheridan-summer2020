----------------------------------
-- QUESTION 3 - B
--  Which movie(s) is/are available 
--  right now to rent out? Display 
--  their names/titles.
--
-- Contributor : Joshua Clark
----------------------------------
CREATE OR REPLACE PROCEDURE avail ()
IS
v_title Titles_T.Title%type;
BEGIN
SELECT Title INTO v_title
FROM Titles_T
WHERE RentedOut = 'No';
DBMS_OUTPUT.PUT_LINE('Here are the movies currentlly available ' || v_title);
END;
/
EXECUTE avail();
