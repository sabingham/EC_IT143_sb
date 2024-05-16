-- Q: What book has the most ratings?

-- A: Let's ask SQL Server and find out...

SELECT v.Book
	 , v.Ratings
	 INTO dbo.t_book_ratings
	FROM dbo.v_book_ratings_load AS v;	