SELECT
MIN(avgdepsal.AverageSalary) AS MinAverageSalary
FROM
(SELECT
	d.Name,AVG(e.Salary) AS AverageSalary
	FROM Departments AS d
	INNER JOIN Employees AS e
	ON d.DepartmentID = e.DepartmentID
	GROUP BY d.Name) AS avgdepsal