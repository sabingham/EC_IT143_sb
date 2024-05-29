-- Q: How to extract last name from Contact Name?

-- A: Well, here is your problem...
-- CustomerName = Alejandra Camino -> Camino
-- Google search "How to extract last name from combined name tsql stack overflow"
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

WITH s2 -- Use a Common Table Expression and compare first_name to first_name2
	 AS (SELECT t.ContactName
			  , SUBSTRING(t.ContactName,CHARINDEX(' ',t.ContactName + ' ')+1,LEN(t.ContactName)) AS last_name
			  , dbo.udf_parse_last_name(t.ContactName) AS last_name2
		   FROM dbo.t_w3_schools_customers AS t)
	SELECT s2.*
	  FROM s2
	 WHERE s2.last_name <> s2.last_name2; -- Expected result is 0 rows