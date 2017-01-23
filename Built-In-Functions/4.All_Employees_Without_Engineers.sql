SELECT
	empl.FirstName AS first_name,
	empl.LastName AS last_name
	FROM Employees AS empl 
	WHERE CHARINDEX('engineer',empl.JobTitle,1) = 0 