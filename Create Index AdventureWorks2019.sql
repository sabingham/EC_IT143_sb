SELECT c.*
  FROM Sales.CreditCard AS c
 WHERE c.CardType = 'Vista'

--USE [AdventureWorks2019]
--GO
--CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
--ON [Sales].[CreditCard] ([CardType])
--INCLUDE ([CardNumber],[ExpMonth],[ExpYear],[ModifiedDate])
--GO

SELECT s.*
  FROM Sales.Store AS s
 WHERE s.Name = 'Great Bikes'

--USE [AdventureWorks2019]
--GO
--CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
--ON [Sales].[Store] ([Name])

--GO





