SELECT
	empl.EmployeeID AS id,
	empl.FirstName AS FirstName,
	empl.LastName AS LastName,
	empl.MiddleName AS MiddleName,
	empl.JobTitle AS job_title,
	empl.DepartmentID AS DeptID,
	empl.ManagerID AS MngrID,
	empl.HireDate AS HireDate,
	empl.Salary AS salary,
	empl.AddressID AS address_id
	FROM Employees AS empl
	ORDER BY empl.Salary DESC, empl.FirstName, empl.LastName DESC, empl.MiddleName
