-- Q1: How to keep track of the user a record was last modified by?
-- A1: This works for the initial INSERT...

ALTER TABLE dbo.t_hello_world
ADD last_modified_by VARCHAR (50) DEFAULT SUSER_NAME();

-- Remove stuff if it is already there
DELETE FROM dbo.t_hello_world
 WHERE my_message IN('Hello World2', 'Hello World3', 'Hello World4');

-- Load test rows
INSERT INTO dbo.t_hello_world(my_message)
VALUES('Hello World2'), ('Hello World3');

--See if the trigger worked
SELECT t.*
  FROM dbo.t_hello_world AS t;

-- Try it again
UPDATE dbo.t_hello_world SET my_message = 'Hello World4'
 WHERE my_message = 'Hello World3';

-- See if the trigger worked
SELECT t.*
 FROM dbo.t_hello_world AS t;
