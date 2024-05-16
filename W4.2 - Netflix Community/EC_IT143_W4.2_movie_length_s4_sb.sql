DROP VIEW IF EXISTS dbo.v_movie_length_load;
GO

CREATE VIEW dbo.v_movie_length_load
AS

/*****************************************************************************************************************
NAME:    dbo.v_movie_length_load
PURPOSE: Create the Movie Length - Load view

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/15/2024   SABING        1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation
 
******************************************************************************************************************/

SELECT TOP (1)
		  title AS 'Title'
		, runtime AS 'Runtime'
	FROM dbo.Netflix_titles
	WHERE type LIKE 'MOVIE'
	ORDER BY 'Runtime' DESC;