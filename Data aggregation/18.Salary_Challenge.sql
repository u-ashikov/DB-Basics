SELECT TOP 10
	e.FirstName,
	e.LastName,
	e.DepartmentID
	FROM Employees AS e
	WHERE e.Salary > (SELECT
		AVG(Salary) FROM Employees AS e2
		WHERE e2.DepartmentID = e.DepartmentID)
		ORDER BY e.DepartmentID