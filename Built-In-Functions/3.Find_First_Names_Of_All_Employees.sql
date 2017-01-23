SELECT
	empl.FirstName AS first_name
	FROM Employees AS empl
	WHERE (empl.DepartmentID IN (10,3) AND YEAR(empl.HireDate) BETWEEN 1995 AND 2005)