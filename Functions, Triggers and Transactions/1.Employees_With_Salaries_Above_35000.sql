CREATE PROCEDURE usp_GetEmployeesSalaryAbove35000
AS
BEGIN
	DECLARE @SalaryAbove INT = 35000
	
	SELECT
		empl.FirstName AS first_name,
		empl.LastName AS last_name
		FROM Employees AS empl
		WHERE empl.Salary > @SalaryAbove
END

EXEC usp_GetEmployeesSalaryAbove35000