DROP TABLE IF EXISTS dbo.t_book_ratings;
GO

CREATE TABLE dbo.t_book_ratings
(book		VARCHAR(MAX) NOT NULL,
ratings		INT NOT NULL
);
GO