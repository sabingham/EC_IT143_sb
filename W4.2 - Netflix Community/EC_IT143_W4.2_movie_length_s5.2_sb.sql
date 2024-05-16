DROP TABLE IF EXISTS dbo.t_movie_length;
GO

CREATE TABLE dbo.t_movie_length
(Title		VARCHAR(MAX) NOT NULL,
Runtime 	INT NOT NULL
);
GO