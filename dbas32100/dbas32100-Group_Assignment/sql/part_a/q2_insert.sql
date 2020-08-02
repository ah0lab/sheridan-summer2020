----------------------------------
-- QUESTION 2 - Insert
-- Category Table
ACCEPT p_catID PROMPT 'Enter Category ID'
ACCEPT p_catName PROMPT 'Eenter Category Name:'
DECLARE
v_catID NUMBER;
v_catName VARCHAR2(20);
BEGIN
v_catID := &p_catID;
v_catName := &p_catName;
INSERT INTO Category_T VALUES(v_catID, v_catName);
END;

-- Customer Table
ACCEPT p_custInitial PROMPT 'Enter Customers Initials'
ACCEPT p_custFirst PROMPT 'Enter First Name:'
ACCEPT p_custLast PROMPT 'Enter Last Name:'
ACCEPT p_phone PROMPT 'Enter Phone Number:'
ACCEPT p_birth PROMPT 'Enter birth date:'
ACCEPT p_license PROMPT 'Enter Phone Number:'
ACCEPT p_status PROMPT 'Enter customer status:'
ACCEPT p_ccn PROMPT 'Enter Credit Card Number:'
DECLARE
v_custInitial NUMBER;
v_custFirst VARCHAR2(20);
v_custLast VARCHAR2(20);
v_phone VARCHAR2(20);
v_birth DATE;
v_license NUMBER;
v_status VARCHAR2(20);
v_ccn NUMBER;
BEGIN
v_custInitial := &p_custInitial;
v_custFirst := &p_custFirst;
v_custLast := &p_custLast;
v_phone := &p_phone;
v_birth := &p_birth;
v_license := &p_license;
v_status := &p_status;
v_ccn := &p_ccn;
INSERT INTO Customer_T VALUES(v_custInitial, v_custFirst, v_custLast, v_phone, v_birth,
v_license, v_status, v_ccn);
END;

--Movie Table
ACCEPT p_tapeID PROMPT 'Enter Tape ID:'
ACCEPT p_title PROMPT 'Enter Movie Title:'
ACCEPT p_year PROMPT 'Enter Release Year:'
ACCEPT p_purDate PROMPT 'Enter Date of Purchase:'
ACCEPT p_cost PROMPT 'Enter Purchase Cost:'
ACCEPT p_categoryID PROMPT 'Enter Category ID:'
ACCEPT p_rentStatus PROMPT 'Enter rent status:'
ACCEPT p_rating PROMPT 'Enter MPAA Rating:'
ACCEPT p_action PROMPT 'Enter Action on Return:'
ACCEPT p_reserved PROMPT 'Enter reserved customers name'
DECLARE
v_tapeID NUMBER;
v_title VARCHAR2(20);
v_year NUMBER;
v_purDate DATE;
v_cost NUMBER;
v_categoryID NUMBER;
v_rentStatus VARCHAR2(20);
v_rating VARCHAR2(20);
v_action VARCHAR2(20);
v_reserved VARCHAR2(20);
BEGIN
v_tapeID := &p_tapeID;
v_title := &p_title;
v_year := &p_year;
v_purDate := &p_purDate;
v_cost := &p_cost;
v_categoryID := &p_categoryID;
v_rentStatus := &p_rentStatus;
v_rating := &p_rating;
v_action := &p_action;
v_reserved := &p_reserved;
INSERT INTO Titles_T VALUES(v_tapeID, v_title, v_year, v_purDate, v_cost, v_categoryID, v_rentStatus,
v_rating, v_action, v_reserved);
END;

--Rent Table
ACCEPT p_RentalID PROMPT 'Enter Rental ID'
ACCEPT p_rentDate PROMPT 'Enter Rental Date:'
ACCEPT p_custInitials PROMPT 'Enter Customer Initials:'
ACCEPT p_tapeID PROMPT 'Enter Tape ID:'
DECLARE
v_RentalID NUMBER;
v_rentDate DATE;
v_custInitials VARCHAR2(3);
v_tapeID NUMBER;
BEGIN
v_RentalID := &p_RentalID;
v_rentDate := &p_rentDate;
v_custInitials := &p_custInitials;
v_tapeID := &p_tapeID;
INSERT INTO Rental_T VALUES(v_RentalID, v_rentDate, v_custInitials, v_tapeID);
END;
-- Contributor : Joshua Clark
----------------------------------
