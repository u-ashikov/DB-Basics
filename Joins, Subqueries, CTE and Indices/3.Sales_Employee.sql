SELECT * FROM Employees

SELECT * FROM Departments

SELECT
	e.EmployeeID,e.FirstName,e.LastName, d.Name AS DepartmentName
	FROM Employees AS e
	INNER JOIN Departments AS d
	ON e.DepartmentID = d.DepartmentID
	WHERE d.Name = 'Sales'
	ORDER BY e.EmployeeID

SELECT
e.EmployeeID,e.FirstName,e.LastName,d.Name AS DepartmentName
FROM
(SELECT
	e.EmployeeID,e.FirstName,e.LastName,e.DepartmentID
	FROM Employees AS e) AS e,
(SELECT
	d.Name,d.DepartmentID
	FROM Departments AS d) AS d
WHERE e.DepartmentID = d.DepartmentID
AND d.Name = 'Sales'
ORDER BY e.EmployeeID
