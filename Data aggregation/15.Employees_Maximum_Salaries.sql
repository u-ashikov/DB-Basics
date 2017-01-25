SELECT
	empl.DepartmentID AS department_id,
	MAX(empl.Salary) AS max_salary
	FROM Employees AS empl
	GROUP BY empl.DepartmentID
	HAVING MAX(empl.Salary) NOT BETWEEN 30000 AND 70000