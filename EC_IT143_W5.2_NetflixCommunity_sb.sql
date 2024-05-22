/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_Netflix_Community_sb
PURPOSE: My script purpose is to create answers to questions from assignment 4.3

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/22/2024   SBINGHAM       1. Built this script for EC IT143


RUNTIME: 
0m 1s

NOTES: 
This is script answers questions created in assignment 4.3 as part of the My Communities Analysis Final Project.
This script is for the Netflix community.
 
******************************************************************************************************************/

-- Q1:(Scott Martinez) We want to market our international offerings.  We want to see how much of our catalog are non US productions. 
-- We would like to see it grouped by country (including the percentage of total productions), program type (movie or
-- show) and ratings. Please only consider productions that have no US involvement.

-- A1: The answer is a list of production_countries (excluding the US) with a count of the total titles for movies and for shows.
SELECT production_countries
	 , COUNT(Title) AS Total_Titles
     , type
FROM Netflix_titles
WHERE production_countries NOT LIKE '%US%'
GROUP BY production_countries, type
ORDER BY production_countries;

-- Q2: (Mine) We are interested in creating a new list of movies called “Cameos.” Could you provide a list of movie titles where actors
-- appear as themselves in the movies. They would be listed in the credits either as “Themselves” or with their own name as the character.

-- A2: The answer is a list of titles where the actor is the same as the character.

SELECT Netflix_titles.title AS Title
     , Netflix_credits.name AS Cameo
FROM Netflix_titles
JOIN Netflix_credits
 ON Netflix_titles.id = Netflix_credits.id
WHERE Netflix_titles.type LIKE 'MOVIE' AND (Netflix_credits.character LIKE Netflix_credits.name
OR Netflix_credits.character LIKE 'Themsel%')

-- Q3: (Mine) We will be removing some movie titles from our ‘family’ category, but we want to keep our top 100 most popular titles based on their IMDB popularity. Could you provide a list that shows this information?

-- A3: The answer is a list of the top 100 most popular famliy movies based on IMDB popularity.
SELECT TOP (100)
		 title
	   , genres
	   , tmdb_popularity AS IMDB_popularity
FROM Netflix_titles
WHERE genres LIKE '%family%'
 AND tmdb_popularity IS NOT NULL
ORDER BY IMDB_popularity

-- Q4: (Mine) In our menu we would like to highlight movies and shows starring Morgan Freeman. Could you provide a list of movie titles that have Morgan Freeman in the cast as an actor?

-- A4: The answer is a list of movie titles with Morgan Freeman listed as an actor in the credits.

SELECT Netflix_titles.title
FROM Netflix_titles
JOIN Netflix_credits
ON Netflix_titles.id = Netflix_credits.id
WHERE Netflix_credits.name LIKE 'Morgan Freeman'
	AND role LIKE 'ACTOR'