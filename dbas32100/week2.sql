/*Week 2 SQL*/

-- Simple CASE
SELECT Prod_ID, Cust_ID, Channel_ID,
	CASE Channel_ID
		WHEN 1 THEN 'Channel_1'
		WHEN 2 THEN 'Channel_2'
		WHEN 3 THEN 'Channel_3'
		ELSE 'NO CHANNEL'
	END AS "Channel"
FROM sh.Sales
	WHERE ROWNUM < 100;

-- Conditional CASE
SELECT Cust_ID, Cust_First_Name,
	Cust_Last_Name, Cust_Year_Of_Birth,
	CASE WHEN Cust_Year_Of_Birth <  1944 THEN 'Silent Generation'
		WHEN Cust_Year_Of_Birth <= 1964 THEN 'Baby Boomer'
		WHEN Cust_Year_Of_Birth <= 1979 THEN 'Gen X'
		ELSE 'Miliennial'
	END AS "Generation"
FROM sh.Customers
WHERE ROWNUM < 100;

-- Exercise 1
SELECT Employee_ID, First_Name, Last_Name, Salary,
	CASE
		WHEN Salary <= 6000 THEN 'Low'
		WHEN Salary <= 10000 THEN 'Medium'
		ELSE 'High'
	END AS "Salary Category"
FROM hr.Employees
WHERE ROWNUM < 100
ORDER BY Salary DESC;

/*******************************
 * Set Operations
 *******************************
 */

-- UNION ALL :	ALL Display all contents of both tables, Show duplicates 
SELECT Cust_ID, Cust_First_Name, Cust_Last_Name
	FROM sh.Customers
		WHERE Cust_ID IN (101, 102, 103)
UNION ALL
SELECT Cust_ID, Cust_First_Name, Cust_Last_Name
	FROM sh.Customers
		WHERE Cust_ID IN (103, 104, 105);

-- UNION : 		Display all contents of both tables, exclude duplicates 
SELECT Cust_ID, Cust_First_Name, Cust_Last_Name
	FROM sh.Customers
		WHERE Cust_ID IN (101, 102, 103);
UNION 
SELECT Cust_ID, Cust_First_Name, Cust_Last_Name
	FROM sh.Customers
		WHERE Cust_ID IN (103, 104, 105);

-- INTERSECT : 	Display only what is common in both tables
SELECT Cust_ID, Cust_First_Name, Cust_Last_Name
	FROM sh.Customers
		WHERE Cust_ID IN (101, 102, 103)
INTERSECT
SELECT Cust_ID, Cust_First_Name, Cust_Last_Name
	FROM sh.Customers
		WHERE Cust_ID IN (103, 104, 105);

-- MINUS : 		Display all contents of one table, and remove whats common in subtracting table
SELECT Cust_ID, Cust_First_Name, Cust_Last_Name
	FROM sh.Customers
		WHERE Cust_ID IN (101, 102, 103)
MINUS
SELECT Cust_ID, Cust_First_Name, Cust_Last_Name
	FROM sh.Customers
		WHERE Cust_ID IN (103, 104, 105);

-- Exercises
-- 1)
SELECT Employee_ID, First_Name, Last_Name, Department_ID
	FROM hr.Employees
MINUS
SELECT Employee_ID, First_Name, Last_Name, Department_ID
	FROM hr.Employees
		WHERE Department_ID IS NOT NULL;

-- 2)
SELECT Employee_ID, Job_ID
	FROM hr.job_History
UNION
SELECT Employee_ID, Job_ID
	FROM hr.Employees
ORDER BY Employee_ID, Job_ID;

-- 3) Hint, we need to use a join
SELECT Employee_ID, Job_ID
	FROM hr.Employees
UNION ALL
SELECT Employee_ID, Job_ID
	FROM hr.job_History;

-- 4)
SELECT Employee_ID, Department_ID
FROM hr.job_History
MINUS
SELECT Employee_ID, Department_ID
FROM hr.Employees;

/********************************
 * Aggregate Functions & Group By
 ********************************
 */

SELECT COUNT(I_Cost) AS "Number of items",
	MAX(I_Cost) AS "Maxmimum cost of items",
	MIN(I_Cost) AS "Min cost of items",
	AVG(I_Cost) AS "Average cost of items",
	SUM(I_Cost) AS "Sum cost of items"
FROM Item;

SELECT I_Class,
	COUNT(I_Cost) AS "Number of items",
	MAX(I_Cost) AS "Maxmimum cost of items",
	MIN(I_Cost) AS "Min cost of items",
	AVG(I_Cost) AS "Average cost of items",
	SUM(I_Cost) AS "Sum cost of items"
FROM Item
GROUP BY I_Class; -- Because we are using aggregate functions here, 

-- Restrictions with Grouping
SELECT I_Class
	COUNT(I_Cost) AS "Number of items",
	MAX(I_Cost) AS "Maxmimum cost of items",
	MIN(I_Cost) AS "Min cost of items",
	AVG(I_Cost) AS "Average cost of items",
	SUM(I_Cost) AS "Sum cost of items"
FROM Item
	WHERE I_MANUFACTUREYEAR > 2020
GROUP BY I_Class
	HAVING COUNT(I_Cost) <= 2;

-- Do not compare aggregate functions within the WHERE clause

SELECT Department_ID, COUNT(Employee_ID)
	FROM hr.Employees
WHERE Salary > 12000
GROUP BY Department_ID;

SELECT department_name, COUNT(*) AS "No. of Employees"
	FROM hr.employees e
JOIN hr.departments d
	ON e.department_id = d.department_id
GROUP BY department_name
	HAVING COUNT(*) > 5;

SELECT country_id, COUNT(location_id)
	FROM hr.locations
GROUP BY country_id
	HAVING COUNT(location_id) > 1;

SELECT Continent, Country, City, SUM(SaleAmount) AS "Total_Sales"
	FROM Sale
GROUP BY (Continent, Country, City);

SELECT Continent, Country, City, SUM(SaleAmount) AS "Total_Sales"
	FROM Sale
GROUP BY ROLLUP(Continent, Country, City);

SELECT Continent, Country, City, SUM(SaleAmount) AS "Total_Sales"
	FROM Sale
GROUP BY CUBE(Continent, Country, City);


--Grouping is for readability to show where the nulls are
SELECT Continent, Country, City, SUM(SaleAmount) AS TotalSales,
	GROUPING(Continent) AS GP_Continent,
	GROUPING(Country)	AS GP_Country,
	GROUPING(City)		AS GP_City
FROM Sale
GROUP BY ROLLUP(Continent, Country, City)

--slide 24 (1)
SELECT Department_Name, Job_Title, AVG(Salary)
FROM hr.Employees e INNER JOIN hr.Departments d
ON e.Department_ID = d.Department_ID
INNER JOIN hr.Jobs j
ON e.Job_ID = j.Job_ID

SELECT Department_Name, Job_Title, Avg(Salary)
FROM hr.Employees e INNER JOIN hr.Departments d
ON e.Department_ID = d.Department_ID
INNER JOIN hr.Jobs j
ON e.Job_ID = j.Job_ID
GROUP BY ROLLUP(Department_Name, Job_title)
ORDER BY Department_Name NULLS FIRST,
Job_title NULLS FIRST;
GROUP BY CUBE(Department_Name, Job_title);
