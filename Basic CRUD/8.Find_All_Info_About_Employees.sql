SELECT 
	empl.EmployeeID AS id,
	empl.FirstName AS "First Name",
	empl.LastName AS "Last Name",
	empl.MiddleName AS "Middle Name",
	empl.JobTitle AS "Job Title",
	empl.DepartmentID AS DeptID,
	empl.ManagerID AS MngrID,
	empl.HireDate AS HireDate,
	empl.Salary AS salary,
	empl.AddressID AS address_id
	FROM Employees AS empl
	WHERE empl.JobTitle = 'Sales Representative'