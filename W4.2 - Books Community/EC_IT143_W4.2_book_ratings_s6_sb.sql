-- Q: What book has the most ratings?

-- A: Let's ask SQL Server and find out...



-- 1) Reload data

TRUNCATE TABLE dbo.t_book_ratings;

INSERT INTO dbo.t_book_ratings
	   SELECT v.Book
			, v.Ratings
		 FROM dbo.v_book_ratings_load AS v;

-- 2) Review Results

SELECT t.*
  FROM dbo.t_book_ratings AS t;