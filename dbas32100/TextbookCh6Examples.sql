SELECT ProductDescription, ProductFinish, ProductStandardPrice
	FROM Product_T
	WHERE (ProductDescription LIKE '%Desk'
		OR ProductDescription LIKE '%TABLE')
		AND ProductStandardPrice > 300;

/* Using ranges for qualifications 
 */

-- Which products in the product table have a standard price between $200 & $300?
SELECT ProductDescription, ProductStandardPrice
	FROM Product_T
		WHERE ProductStandardPrice >= 200 AND ProductStandardPrice <= 300;

-- As above only using BETWEEN
SELECT ProductDescription, ProductStandardPrice
	FROM Product_T
		WHERE ProductStandardPrice BETWEEN 200 AND 300;

/* DISTINCT 
 *  DISTINCT comes after SELECT and before any columns or expressions.
 */

-- What are the distinct order numbers included in the OrderLine table?
SELECT DISTINCT OrderID
	FROM OrderLine_T;

/* IN
 * 	The list provided to IN can be a set of literals or a subquery with a single result column.
 */

-- List all customers who live in warmer states
SELECT CustomerName, CustomerCity, CustomerState
	FROM Customer_T
		WHERE CustomerState IN ('FL', 'TX', 'CA', 'HI');

/* ORDER BY
 * 	Sorts the final results rows in ascending or descending order.
 */

 -- List customer, city and state for all customers in the Customer table whose address is 
 --  Florida, Texas, California, and Hawaii. List the customers alphabetically by state and 
 --  alpabetically by customer within each state.
 SELECT CustomerName, CustomerCity, CustomerState
 	FROM Customer_T
 		WHERE CustomerState IN ('FL', 'TX', 'CA', 'HI')
 			ORDER BY CustomerState, CustomerName;

-- As above but referencing column positions as opposed to column names 			
 SELECT CustomerName, CustomerCity, CustomerState
 	FROM Customer_T
 		WHERE CustomerState IN ('FL', 'TX', 'CA', 'HI')
 			ORDER BY 1, 3;

-- As above but we limit the amount of output we see
 SELECT CustomerName, CustomerCity, CustomerState
 	FROM Customer_T
 		WHERE CustomerState IN ('FL', 'TX', 'CA', 'HI')
 			ORDER BY 1, 3 
 			FETCH FIRST 5 ROWS ONLY; --MySQL uses LIMIT 5

/* GROUP BY
 *	Divides a table into subsets; then an aggregate function can be used to provide summary
 *	information for that group.
 * 	- When a single value is returned by an aggregate function, that value is known as a 
 *		scalar aggregate.
 *  - When multiple values are returned by and aggregate function, the value is known as 
 *		a vector aggregate.
 *
 *  When using GROUP BY, keep the following in mind:
 *		Each column referenced in the SELECT statement must be referenced in the GROUP BY clause,
 *		unless the column is an argument for an aggregate function included in the SELECT clause.
 */

-- Count the number of customers with addresses in each state to which we ship.
SELECT CustomerState, COUNT(CustomerState)
	FROM Customer_T
		GROUP BY CustomerState; 

-- The following shows it is possible to nest groups within groups:

-- Count the number of customers with addresses in each city to which we ship. 
-- 	List cities by state 
SELECT CustomerState, CustomerCity, COUNT(CustomerCity)
	FROM Customer_T
		GROUP BY CustomerState, CustomerCity;

/* HAVING
 */

-- Find only states with more than one customer.
SELECT CustomerState, COUNT (CustomerState)
	FROM Customer_T
 		GROUP BY CustomerState
 		HAVING COUNT (CustomerState) > 1;

-- List, in alphabetical order, the product finish and the average standard price for each
-- 	finish for selected finishes having an average standard price less than 750.
SELECT ProductFinish, AVG (ProductStandardPrice)
	FROM Product_T
		WHERE ProductFinish IN ('Cherry', 'Natural Ash', 'Natural Maple', 'White Ash')
			GROUP BY ProductFinish
				HAVING AVG (ProductStandardPrice) < 750
					ORDER BY ProductFinish;

/* Views
 *
 */
-- What are the data elements necessary to create an invoice for a customer?
--	Save this query as a view named Invoice_V
CREATE VIEW Invoice_V AS
	SELECT Customer_T.CustomerID, CustomerAddress, Order_T.OrderID,
	  Product_T.ProductID, ProductStandardPrice, OrderedQuantity
		FROM Customer_T, Order_T, OrderLine_T, Product_T
			WHERE Customer_T.CustomerID = Order_T.CustomerID
			AND Order_T.OrderID = OrderLine_T.OrderID
			AND Product_T.ProductID = ORderLine_T.ProductID;

-- What is the total value of orders placed for each funiture product?
CREATE VIEW OrderTotals_V AS
	SELECT ProductID Product, SUM (ProductStandardPrice * OrderedQuantity)
	Total 
		FROM Invoice_V
		GROUP BY ProductID;

-- List all furniture products that have ever had 
--	a standard price over $300
CREATE VIEW ExpensiveStuff_V AS
	SELECT ProductID, ProductDescription, ProductStandardPrice
		FROM Product_T
			WHERE ProductStandardPrice > 300
			WITH CHECK OPTION;