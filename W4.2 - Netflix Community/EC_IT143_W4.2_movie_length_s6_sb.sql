-- Q: What is the longest movie?

-- A: Let's ask SQL Server and find out...



-- 1) Reload data

TRUNCATE TABLE dbo.t_movie_length;

INSERT INTO dbo.t_movie_length
	   SELECT v.Title
			, v.Runtime
		 FROM dbo.v_movie_length_load AS v;

-- 2) Review Results

SELECT t.*
  FROM dbo.t_movie_length AS t;