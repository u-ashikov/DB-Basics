CREATE PROCEDURE usp_EmployeesBySalaryLevel(@SalaryLevel VARCHAR(10))
AS
BEGIN
	SELECT
		empl.FirstName AS 'First Name',
		empl.LastName AS 'Last Name'
		FROM Employees AS empl
		WHERE dbo.ufn_GetSalaryLevel(empl.Salary) = @SalaryLevel
END

EXEC usp_EmployeesBySalaryLevel 'Low'