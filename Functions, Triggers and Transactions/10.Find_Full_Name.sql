CREATE PROCEDURE usp_GetHoldersFullName
AS
BEGIN
	SELECT
		CONCAT(accholders.FirstName,' ',accholders.LastName) AS full_name
		FROM AccountHolders AS accholders
END

EXEC usp_GetHoldersFullName