----------------------------------
-- QUESTION 3 - B
--  Show the movies which has least 
--  renting cost and highest renting 
--  cost? Display their names/titles.
--
CREATE OR REPLACE PROCEDURE highcost()
IS
v_title Titles_T.Title%type;
BEGIN
SELECT Title INTO v_title
FROM Titles_T
WHERE MAX(cost) = 5.29 OR MIN(cost) = 3.99;
DBMS_OUTPUT.PUT_LINE('Here are the movies that are the most expensive and cheapest' || v_title);
END;
/
EXECUTE highcost();
-- Contributor : Joshua Clark
----------------------------------
