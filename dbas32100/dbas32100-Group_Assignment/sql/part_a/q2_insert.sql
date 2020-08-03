----------------------------------
-- QUESTION 2 - Insert
-- Category Table
--
-- Contributor : Joshua Clark
----------------------------------
ACCEPT p_catID      PROMPT 'Enter Category ID'
ACCEPT p_catName    PROMPT 'Eenter Category Name:'
DECLARE
    v_catID     CATEGORY_T.CATEGORYID%TYPE;
    v_catName   CATEGORY_T.CATEGORYNAME%TYPE;
BEGIN
    v_catID     := &p_catID;
    v_catName   := '&p_catName';

    INSERT INTO Category_T VALUES (v_catID, v_catName);
END;

-- Customer Table
ACCEPT p_customerId  PROMPT 'Enter Customer ID:'
ACCEPT p_custFirst   PROMPT 'Enter First Name:'
ACCEPT p_custLast    PROMPT 'Enter Last Name:'
ACCEPT p_phone       PROMPT 'Enter Phone Number:'
ACCEPT p_birth       PROMPT 'Enter birth date:'
ACCEPT p_license     PROMPT 'Enter Drivers License Number:'
ACCEPT p_status      PROMPT 'Enter customer status:'
ACCEPT p_ccn         PROMPT 'Enter Credit Card Number:'
DECLARE
    v_customerId  Customer_T.CustomerID%TYPE;
    v_custFirst   Customer_T.FIRSTNAME%TYPE;
    v_custLast    Customer_T.LASTNAME%TYPE;
    v_phone       Customer_T.PHONENUMBER%TYPE;
    v_birth       Customer_T.BIRTHDATE%TYPE;
    v_license     Customer_T.DRIVERSLICENSENUMBER%TYPE;
    v_status      Customer_T.STATUS%TYPE;
    v_ccn         Customer_T.CREDITCARDNUMBER%TYPE;
BEGIN
    v_customerId  := 100; --&p_custInitial;
    v_custFirst   := 'Chris P.';--'&p_custFirst';
    v_custLast    := 'Bacon';--'&p_custLast';
    v_phone       := '911';--'&p_phone';
    -- TODO: Figure out how to give SQL a date it will accept...
    v_birth       := TO_DATE ('05-JUN-1990');--&p_birth;
    v_license     := '567432001239';--'&p_license';
    v_status      := 'Active';--'&p_status';
    v_ccn         := '345423456';--'&p_ccn';

    INSERT INTO Customer_T VALUES (v_customerId, v_custFirst, 
        v_custLast, v_phone, v_birth, v_license, v_status, v_ccn);
END;

--Movie Table
ACCEPT p_tapeID     PROMPT 'Enter Tape ID:'
ACCEPT p_title      PROMPT 'Enter Movie Title:'
ACCEPT p_year       PROMPT 'Enter Release Year:'
ACCEPT p_purDate    PROMPT 'Enter Date of Purchase:'
ACCEPT p_cost       PROMPT 'Enter Purchase Cost:'
ACCEPT p_categoryID PROMPT 'Enter Category ID:'
ACCEPT p_rentStatus PROMPT 'Enter rent status:'
ACCEPT p_rating     PROMPT 'Enter MPAA Rating:'
ACCEPT p_action     PROMPT 'Enter Action on Return:'
ACCEPT p_reserved   PROMPT 'Enter reserved customers name'
DECLARE
    v_tapeID        TITLES_T.TAPEID%TYPE;
    v_title         TITLES_T.TITLE%TYPE;
    v_year          TITLES_T.YEARRELEASED%TYPE;
    v_purDate       TITLES_T.DATEPURCHASED%TYPE;
    v_cost          TITLES_T.COST%TYPE;
    v_categoryID    TITLES_T.CATEGORYID%TYPE;
    v_rentStatus    TITLES_T.RENTEDOUT%TYPE;
    v_rating        TITLES_T.RATING%TYPE;
    v_action        TITLES_T.ACTIONONRETURN%TYPE;
    v_reserved      TITLES_T.RESERVEDBY%TYPE;
BEGIN
    v_tapeID        := 111;--&p_tapeID;
    v_title         := 'Black Pepper';--'&p_title';
    v_year          := 1992;--&p_year;
    -- TODO: Same date issue as above
    v_purDate       := '25-DEC-2010';--&p_purDate;
    v_cost          := 0.25;--&p_cost;
    v_categoryID    := 1;--&p_categoryID;
    v_rentStatus    := 'No';--'&p_rentStatus';
    v_rating        := 'R';--'&p_rating';
    v_action        := 'Return To Shelf';--'&p_action';
    v_reserved      := 1001;--'&p_reserved';

    INSERT INTO Titles_T VALUES (v_tapeID, v_title, v_year, 
        v_purDate, v_cost, v_categoryID, v_rentStatus, v_rating, 
        v_action, v_reserved);
END;

--Rent Table
ACCEPT p_rentalID       PROMPT 'Enter Rental ID'
ACCEPT p_rentDate       PROMPT 'Enter Rental Date:'
ACCEPT p_customerID     PROMPT 'Enter Customer ID:'
ACCEPT p_tapeID         PROMPT 'Enter Tape ID:'
DECLARE
    v_rentalID      RENTAL_T.RENTALID%TYPE;
    v_rentDate      RENTAL_T.RENTALDATE%TYPE;
    v_customerID    RENTAL_T.CUSTOMERID%TYPE;
    v_tapeID        RENTAL_T.TAPEID%TYPE;
BEGIN
    v_rentalID      := 1007;--&p_rentalID;
    v_rentDate      := '25-DEC-2019';--&p_rentDate;
    v_customerID    := 1002;--&p_custInitials;
    v_tapeID        := 10;--&p_tapeID;

    INSERT INTO Rental_T VALUES (v_RentalID, v_rentDate, v_custInitials, 
        v_tapeID);
END;
