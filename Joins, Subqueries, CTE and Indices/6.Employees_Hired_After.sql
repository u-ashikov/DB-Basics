SELECT
	e.FirstName,e.LastName,e.HireDate, d.Name AS DeptName
	FROM Employees AS e
	INNER JOIN Departments AS d
	ON e.DepartmentID = d.DepartmentID
	WHERE d.Name IN ('Sales','Finance')
	AND e.HireDate > '01.01.1999'

SELECT
e.FirstName,e.LastName,e.HireDate,d.Name AS DeptName
FROM
(SELECT
	e.FirstName,e.LastName,e.DepartmentID,e.HireDate
	FROM Employees AS e) AS e,
(SELECT
	d.DepartmentID,d.Name
	FROM Departments AS d) AS d
	WHERE e.DepartmentID = d.DepartmentID
	AND d.Name IN ('Sales','Finance') AND e.HireDate > '01.01.1999'