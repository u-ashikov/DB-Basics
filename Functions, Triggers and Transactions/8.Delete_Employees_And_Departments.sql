ALTER TABLE Departments
ALTER COLUMN ManagerID int NULL
 
ALTER TABLE Employees
ALTER COLUMN DepartmentID int NULL

DELETE EmployeesProjects
WHERE EmployeeID IN
(SELECT
	empl.EmployeeID
	FROM Employees AS empl 
	INNER JOIN Departments AS d
	ON empl.DepartmentID = d.DepartmentID
	WHERE d.DepartmentID IN (7,8))

	UPDATE Employees
	SET DepartmentID = NULL
	WHERE DepartmentID IN (7,8)

	UPDATE Employees
	SET ManagerID = NULL
	WHERE DepartmentID IS NULL

	DELETE Departments
	WHERE DepartmentID IN (7,8)

	UPDATE Employees
	SET ManagerID = NULL
	WHERE ManagerID IN
	(SELECT
	empl.EmployeeID
	FROM Employees AS empl 
	WHERE empl.DepartmentID IS NULL AND empl.ManagerID IS NULL)

	DELETE Employees
	WHERE DepartmentID IS NULL AND ManagerId IS NULL
