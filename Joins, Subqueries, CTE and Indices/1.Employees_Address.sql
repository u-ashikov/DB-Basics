SELECT TOP 5 e.EmployeeID,e.JobTitle,a.AddressID,a.AddressText 
	FROM Employees AS e
	INNER JOIN Addresses AS a
	ON e.AddressID = a.AddressID
	ORDER BY e.AddressID

SELECT TOP 5 empl.EmployeeID,empl.JobTitle,adr.AddressID,adr.AddressText
	FROM
(SELECT e.EmployeeID,e.JobTitle, e.AddressID
	FROM Employees AS e) AS empl,
(SELECT a.AddressID,a.AddressText
		FROM Addresses AS a) AS adr
	WHERE empl.AddressID = adr.AddressID
	ORDER BY adr.AddressID