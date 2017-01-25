SELECT
	COUNT(empl.Salary) AS count 
	FROM Employees AS empl
	WHERE empl.ManagerID IS NULL