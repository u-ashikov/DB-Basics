SELECT
	empl.FirstName AS first_name,
	empl.LastName AS last_name,
	empl.Salary AS salary
	FROM Employees AS empl
	WHERE empl.Salary > 50000
	ORDER BY empl.Salary DESC