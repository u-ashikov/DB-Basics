SELECT TOP (50) e.FirstName,e.LastName,t.Name AS Town,a.AddressText
	FROM Employees AS e
	INNER JOIN Addresses AS a
	ON e.AddressID = a.AddressID
	INNER JOIN Towns AS t
	ON a.TownID = t.TownID
	ORDER BY e.FirstName, e.LastName



SELECT TOP 50 
empl.FirstName,empl.LastName,t.Name AS Town, adr.AddressText
FROM
(SELECT
	t.Name,t.TownID
	FROM Towns AS t) AS t,
(SELECT
	e.FirstName,e.LastName,e.AddressID
	FROM Employees AS e) AS empl,
(SELECT
	a.AddressID,a.AddressText,a.TownID
	FROM Addresses AS a) AS adr
	WHERE empl.AddressID = adr.AddressID
	  AND adr.TownID = t.TownID
	ORDER BY empl.FirstName,empl.LastName