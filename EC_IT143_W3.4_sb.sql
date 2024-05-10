/*****************************************************************************************************************
NAME:    EC_IT143_W3.4_SB
PURPOSE: My script purpose is to create answers to questions created by fellow students using AdventureWorks2019.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/23/2022   JJAUSSI       1. Built this script for EC IT440
1.1		05/09/2024	 SABINGHAM	   2. Modified the script for IT 143 assignment 3.4.


RUNTIME: 
Xm Xs

NOTES: 
I modified this script to add queries that will answer questions created by my fellow students in IT 143. The queries
use the AdventureWorks2019 database.
 
******************************************************************************************************************/

-- Q1: What is the highest discount for a product in the Sales? Complexity: Marginal, Author: Rolando Ismael Alfaro Ramirez
-- A1: The answer is to join the SpecialOfferProduct and SpecialOffer tables on the SpecialOfferID, so that the Discount_Percent
--     matches with the Product ID, then ordering high to low. The highest discount is 50%.

SELECT TOP (1) *
FROM (SELECT TOP (1000)	SpecialOfferProduct.ProductID AS ProductID,
		SpecialOffer.DiscountPct AS Discount_Percent
		FROM Sales.SpecialOfferProduct
			JOIN Sales.SpecialOffer
			ON SpecialOfferProduct.SpecialOfferID = SpecialOffer.SpecialOfferID
		ORDER BY Discount_Percent DESC) AS HighestDiscount;

-- Q2: What is the most expensive product? Complexity: Marginal, Author: Adrian Marwin Matro
-- A2: The answer is to select the product and price, order by price, and then select the top price.
--     The most expensive product is the Road-150 Red,62.

SELECT TOP (1) *
FROM (SELECT TOP (1000) Name AS Product,
						ListPrice
		FROM Production.Product
		ORDER BY ListPrice DESC) AS HighestPrice;

-- Q3:I am interested in salespersons’ performance improvement. I define improvement as sales YTD 
--    greater than or equal to sales last year. Which salesperson improved the most? 
--    Complexity: Moderate, Author: Me (Sam Bingham)
-- A3: The answer will be the sales person whose YTD sales increased the most from last years sales.
--     This should exclude sales persons who had zero sales last year. The answer is Linda Mitchell.

SELECT TOP (1) *
FROM(SELECT TOP (1000) FirstName,
					   LastName,
					   SalesLastYear,
					   SalesYTD,
					   (SalesYTD - SalesLastYear) AS Sales_Difference
		 FROM Person.Person
		JOIN Sales.SalesPerson
			ON Person.BusinessEntityID = SalesPerson.BusinessEntityID
		WHERE (SalesLastYear > 0)
		ORDER BY Sales_Difference DESC)AS MostGrowth;

-- Q4: I am interested in production cost increases. Compare the current standard cost to the standard 
--	   cost in 2012. Which ten products increased the most in price? 
--    Complexity: Moderate, Author: Me (Sam Bingham)
-- A4:The answer will require the Product and Product Cost History tables to be joined on the productID,
--    then compare the Standard Cost to the Product Cost History from 2012 only. The top 10 products with
--    the largest increases is the answer.

SELECT TOP (10) *
FROM(SELECT Product.Name,
		    Product.StandardCost AS CurrentCost,
		    ProductCostHistory.StandardCost AS PastCost,
			ProductCostHistory.StartDate,
			Product.StandardCost - ProductCostHistory.StandardCost AS Increase
	 FROM Production.Product
	 JOIN Production.ProductCostHistory
		ON Product.ProductID = ProductCostHistory.ProductID
	WHERE ProductCostHistory.StartDate BETWEEN '2012-01-01' AND '2012-12-31') AS CostIncrease
ORDER BY Increase DESC;

-- Q5:Increased complexity:  We want to show appreciation for our biggest customers.  Can you give me a list
--	  of Customers who have spent the most in 2013.  Please include the country they are in so we can abide 
--    by all local laws on gifts.
--    Complexity: Increased  Author: Scott Martinez
-- A5: The answer includes data from four tables: Person, CustomerID, SalesTerritory, and SalesOrderHeader.
--     Joining these tables, filter the order dates to 2013, then ordering by top sales creates a list. The
--     question did not specify how many customers to include.

SELECT 	Person.FirstName,
		Person.LastName,
		SalesTerritory.Name AS Country,
		SUM(SalesOrderHeader.TotalDue) AS TotalSpent
FROM ((Sales.Customer 
JOIN Person.Person
	ON Customer.CustomerID = Person.BusinessEntityID )
JOIN Sales.SalesOrderHeader
	ON Customer.CustomerID = SalesOrderHeader.CustomerID)
JOIN Sales.SalesTerritory
	ON Customer.TerritoryID = SalesTerritory.TerritoryID
	WHERE SalesOrderHeader.OrderDate BETWEEN '2013-01-01' AND '2013-12-31'
	GROUP BY Person.FirstName, Person.LastName, SalesTerritory.Name
	ORDER BY TotalSpent DESC;

-- Q6: We are investigating on the customer's reviews. Could you please prepare a table which unifies the Product 
--     Reviews with their names and standard costs?
--     Complexity: Increased  Author: Daniel Catteneo
-- A6: The answer includes data from two tables. Joining the ProductReview and Product tables creates a list of reviews
--     with the name and standard cost of the product.

SELECT ProductReview.ReviewerName,
	   ProductReview.ReviewDate,
	   ProductReview.ProductID,
	   Product.Name AS Product,
	   Product.StandardCost,
	   ProductReview.Rating,
	   ProductReview.Comments
	FROM Production.ProductReview
	JOIN Production.Product
		ON ProductReview.ProductID = Product.ProductID;

-- Q7: Can you list the AdventureWorks columns containing customer credit card details, including CreditCardID and ModifiedDate?
--     Metadata question Author: Rolando Ismael Alfaro Ramirez
-- A7: By selecting the table name and column name from the Infromation Schema, I can list 3 tables with CreditCardID columns.

SELECT Table_Name, Column_Name
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME LIKE 'CreditCardID'

-- Q8: Provide a count of the number of tables with a ProductID column, grouped by schema
--     Metadata question Author:Ian Tavener 
-- A8: Selecting the Table_Schema and counting the list of tables with ProductID columns gets the answer to the query.

SELECT	TABLE_SCHEMA AS 'Schema',
		COUNT(TABLE_NAME) AS '#_Tables _w/ProductID'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME LIKE 'ProductID'
GROUP BY TABLE_SCHEMA;
					   
SELECT GETDATE() AS my_date;