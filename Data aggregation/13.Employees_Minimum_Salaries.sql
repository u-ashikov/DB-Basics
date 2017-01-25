SELECT
	empl.DepartmentID AS department_id,
	MIN(empl.Salary) AS minimum_salary 
	FROM Employees AS empl
	WHERE empl.DepartmentID in (2,5,7) AND empl.HireDate > '01/01/2000'
	GROUP BY empl.DepartmentID