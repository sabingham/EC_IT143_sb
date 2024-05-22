/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_AmazonBooks_Community_sb
PURPOSE: My script purpose is to create answers to questions from assignment 4.3

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/22/2024   SBINGHAM      1. Built this script for EC IT143


RUNTIME: 
0m 1s

NOTES: 
This is script answers questions created in assignment 4.3 as part of the My Communities Analysis Final Project.
This script is for the AmazonBooks community.
 
******************************************************************************************************************/

-- Q1: (Ian Tavener) We'd like to organize a promotion to liquidate some of our most expensive inventory. Find the 
-- top 5 genres with the highest average rating per book, then for each genre, list the sub-genre that has the highest
-- average price per book.

-- A1: The answer is the a list of the genres below.

SELECT TOP (5)
       Main_Genre
	 , Sub_Genre
	 , AVG (Rating) AS avg_rating
	 , AVG (Price) AS avg_price
FROM Books_books
GROUP BY Main_Genre, Sub_Genre	
ORDER BY avg_rating DESC;

-- Q2: (Mine) We’d like to get an idea of what people are reading currently. It’s important that we understand what the most 
-- popular genres are based on ratings. Could I get a list of the top five genres with their average ratings along with
-- the number of books in each genre?

-- A2: The answer is a list of genres ordered by the avg rating and includes the number of books in each category.

SELECT Books_books.Main_Genre
	 , AVG (Books_books.Rating) AS avg_rating
	 , SUM (Books_subgenre.No_of_Books) AS Number_of_books
FROM Books_books
JOIN Books_subgenre
 ON Books_books.Main_Genre = Books_subgenre.Main_Genre
GROUP BY Books_books.Main_Genre
ORDER BY avg_rating DESC;


-- Q3:(Mine) Next year, Amazon will be celebrating 30 years of selling books online. As a special promotion we will discount our top 30 books. 
-- Could you provide a list of our top 30 books based on user ratings? The books should have at least 10,000 ratings.

-- A3: The answer is the top 30 books based on ratings where the books has been rated by at least 10000 people.

SELECT DISTINCT TOP (30)
				Title
			  , Rating
			  , No_of_People_rated
FROM Books_books
WHERE No_of_People_rated >= 10000
ORDER BY Rating DESC;	

-- Q4: (Mine) We carry a wide variety of books on sports. To make more room for our top sellers, we’d like to reduce our inventory in the
-- lowest five subgenres based on the number of ratings. Could provide a list of the sports subgenres with the lowest number of ratings?

-- A4: The answer is the five subgenres of sports that have the lowest average ratings.

SELECT TOP (5)
		Sub_Genre
	  , AVG (Rating) AS avg_rating
FROM Books_books
WHERE Main_Genre LIKE 'Sport_'
GROUP BY Sub_Genre
ORDER BY avg_rating ASC
