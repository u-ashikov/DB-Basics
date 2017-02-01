CREATE PROCEDURE usp_GetEmployeesFromTown(@EmployeeTown VARCHAR(50))
AS
BEGIN
	SELECT
	empl.FirstName AS first_name,
	empl.LastName AS last_name
	FROM Employees AS empl
	LEFT JOIN Addresses AS a
	ON empl.AddressID = a.AddressID
	LEFT JOIN Towns AS t
	ON a.TownID = t.TownID
	WHERE t.Name = @EmployeeTown
END

EXEC usp_GetEmployeesFromTown 'Sofia'