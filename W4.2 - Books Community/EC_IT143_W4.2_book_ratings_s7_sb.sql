CREATE PROCEDURE dbo.usp_book_ratings_load
AS

/*****************************************************************************************************************
NAME:    dbo.usp_book_ratings_load
PURPOSE: Book Ratings - user stored procedure

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/15/2024   SABING        1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
This script exists to help me learn step 7 of 8 in the Answer Focused Approach for T-SQL Data Manipulation

******************************************************************************************************************/

	BEGIN

		-- 1) Reload data

		TRUNCATE TABLE dbo.t_book_ratings;

		INSERT INTO dbo.t_book_ratings
			   SELECT v.Book
					, v.Ratings
				 FROM dbo.v_book_ratings_load AS v;

		-- 2) Review results

		SELECT t.*
		  FROM dbo.t_book_ratings AS t;

	END;
GO