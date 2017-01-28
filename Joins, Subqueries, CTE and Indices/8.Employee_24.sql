SELECT 
	e.EmployeeID,
	e.FirstName, 
	CASE
		WHEN (p.StartDate) > '2005.01.01' THEN NULL
		ELSE p.Name
		END 'ProjectName'
	FROM EmployeesProjects AS ep
	LEFT JOIN Employees AS e
	ON ep.EmployeeID = e.EmployeeID
	LEFT JOIN Projects AS p
	ON ep.ProjectID = p.ProjectID
	WHERE e.EmployeeID = 24