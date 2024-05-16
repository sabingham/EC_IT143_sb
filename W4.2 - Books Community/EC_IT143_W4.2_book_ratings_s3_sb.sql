-- Q: What book has the most ratings?

-- A: Let's ask SQL Server and find out...

SELECT TOP (1) Title AS 'Book'
			 , No_of_People_rated AS 'Ratings'
FROM dbo.Books_books
ORDER BY Ratings DESC;