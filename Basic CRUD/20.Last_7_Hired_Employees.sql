SELECT TOP 7
	empl.FirstName AS first_name,
	empl.LastName AS last_name,
	empl.HireDate AS hire_date
	FROM Employees AS empl
	ORDER BY empl.HireDate DESC