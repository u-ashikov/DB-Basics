CREATE PROCEDURE usp_AssignProject (@employeeId INT, @projectID INT)
AS
BEGIN
	DECLARE @EmployeeProjectsCount INT
	SET @EmployeeProjectsCount = (SELECT 
			COUNT(*)
			FROM EmployeesProjects AS ep
			WHERE ep.EmployeeId = @employeeId)
	
	BEGIN TRAN
	INSERT INTO EmployeesProjects(EmployeeID,ProjectID)
	VALUES (@employeeId,@projectID)
	IF (@EmployeeProjectsCount > 3)
	BEGIN
		RAISERROR('The employee has too many projects!',16,1)
		ROLLBACK
	END
	ELSE
	BEGIN
		COMMIT
	END
END
