SELECT TOP 5
	empl.FirstName AS first_name,
	empl.LastName AS last_name
	FROM Employees AS empl
	ORDER BY empl.Salary DESC