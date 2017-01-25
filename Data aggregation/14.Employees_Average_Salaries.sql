SELECT * 
	INTO AverageSalaries
	FROM Employees
	WHERE Salary > 30000

DELETE
	FROM AverageSalaries
	WHERE ManagerID = 42

UPDATE AverageSalaries
SET Salary +=5000
WHERE DepartmentID = 1

SELECT
	avg.DepartmentID AS department_id,
	AVG(avg.Salary) AS manager_id
	FROM AverageSalaries AS avg
	GROUP BY avg.DepartmentID