CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber(@InputSalary FLOAT)
AS
BEGIN
	BEGIN TRAN
	SELECT
		empl.FirstName AS first_name,
		empl.LastName AS last_name
		FROM Employees AS empl
		WHERE empl.Salary >= @InputSalary
	COMMIT
END