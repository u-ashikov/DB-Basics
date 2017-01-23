SELECT
	empl.FirstName AS first_name,
	empl.LastName AS last_name
	FROM Employees AS empl
	WHERE SUBSTRING(empl.FirstName,1,2) = 'SA'

SELECT
	empl.FirstName AS first_name,
	empl.LastName AS last_name
	FROM Employees AS empl
	WHERE LEFT(empl.FirstName,2) = 'SA'