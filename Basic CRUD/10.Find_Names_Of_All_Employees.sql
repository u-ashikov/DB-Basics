SELECT
	empl.FirstName+' '+empl.MiddleName+' '+empl.LastName AS full_name
	FROM Employees AS empl
	WHERE empl.Salary = 25000 OR empl.Salary = 14000 OR empl.Salary = 12500
	OR empl.Salary = 23600

USE SoftUni

SELECT
	empl.FirstName+' '+empl.MiddleName+' '+empl.LastName AS full_name
	FROM Employees AS empl
	WHERE empl.Salary IN (25000, 14000, 12500, 23600)