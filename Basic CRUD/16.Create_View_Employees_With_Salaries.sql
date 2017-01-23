CREATE VIEW v_employees_salaries (first_name,last_name,salary) AS
SELECT
	empl.FirstName,
	empl.LastName,
	empl.Salary
	FROM Employees AS empl