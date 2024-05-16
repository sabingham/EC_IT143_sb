-- Q: What is the longest movie?

-- A: Let's ask SQL Server and find out...

SELECT v.Title
	 , v.Runtime
	 INTO dbo.t_movie_length
	FROM dbo.v_movie_length_load AS v;	