SELECT 
	empl.FirstName AS first_name,
	empl.LastName AS last_name,
	empl.JobTitle
	FROM Employees AS empl
	WHERE empl.Salary BETWEEN 20000 AND 30000

