CREATE VIEW v_employees_hired_after_2000 AS
SELECT
	empl.FirstName AS first_name,
	empl.LastName AS last_name
	FROM Employees AS empl
	WHERE YEAR(empl.HireDate) > 2000 

SELECT * FROM v_employees_hired_after_2000