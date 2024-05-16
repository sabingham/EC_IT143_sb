DROP VIEW IF EXISTS dbo.v_book_ratings_load;
GO

CREATE VIEW dbo.v_book_ratings_load
AS

/*****************************************************************************************************************
NAME:    dbo.v_book_ratings_load
PURPOSE: Create the Book Ratings - Load view

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/15/2024   SABING        1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation
 
******************************************************************************************************************/

SELECT TOP (1) Title AS 'Book'
			 , No_of_People_rated AS 'Ratings'
FROM dbo.Books_books
ORDER BY Ratings DESC;