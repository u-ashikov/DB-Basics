SELECT * FROM Employees

SELECT * FROM Departments

SELECT TOP 5
	e.EmployeeID,e.FirstName,e.Salary,d.Name AS DepartmentName
	FROM Employees AS e
	INNER JOIN Departments AS d
	ON e.DepartmentID = d.DepartmentID
	WHERE e.Salary > 15000
	ORDER BY e.DepartmentID

SELECT TOP 5
e.EmployeeID,e.FirstName,e.Salary,d.Name AS DepartmentName
FROM
(SELECT
	e.EmployeeID,e.FirstName,e.Salary,e.DepartmentID
	FROM Employees AS e) AS e,
(SELECT
	d.DepartmentID,d.Name
	FROM Departments AS d) AS d
WHERE e.DepartmentID = d.DepartmentID
	ORDER BY e.DepartmentID