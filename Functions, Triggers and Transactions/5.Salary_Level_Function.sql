CREATE FUNCTION udf_GetSalaryLevel(@EmployeeSalary DECIMAL(10,2))
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @SalaryLevel VARCHAR(10) = 'Low'

	IF (@EmployeeSalary BETWEEN 30000 AND 50000)
	BEGIN
		SET @SalaryLevel = 'Average'
	END
	ELSE IF (@EmployeeSalary > 50000)
	BEGIN
		SET @SalaryLevel = 'High'
	END
	RETURN @SalaryLevel
END

SELECT
	dbo.udf_GetSalaryLever(empl.Salary) AS salary_level
	FROM SoftUni.dbo.Employees AS empl