CREATE PROCEDURE dbo.usp_movie_length_load
AS

/*****************************************************************************************************************
NAME:    dbo.usp_movie_length_load
PURPOSE: Movie Length - user stored procedure

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

		TRUNCATE TABLE dbo.t_movie_length;

		INSERT INTO dbo.t_movie_length
			   SELECT v.Title
					, v.Runtime
				 FROM dbo.v_movie_length_load AS v;

		-- 2) Review results

		SELECT t.*
		  FROM dbo.t_movie_length AS t;

	END;
GO