-- Q: What is the longest movie?

-- A: Let's ask SQL Server and find out...

SELECT TOP (1)
		  title AS 'Title'
		, runtime AS 'Runtime'
	FROM dbo.Netflix_titles
	WHERE type LIKE 'MOVIE'
	ORDER BY 'Runtime' DESC;