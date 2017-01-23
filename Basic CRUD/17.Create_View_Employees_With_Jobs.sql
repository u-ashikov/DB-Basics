CREATE VIEW V_EmployeesJobTitles AS
SELECT
	CASE
		WHEN empl.MiddleName IS NOT NULL THEN empl.FirstName+' '+empl.MiddleName+' '+empl.LastName
		ELSE empl.FirstName+' '+''+' '+empl.LastName
		END AS full_name,
	empl.JobTitle AS job_title
	FROM Employees AS empl
