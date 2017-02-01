CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan(@InputBalance DECIMAL(14,2))
AS
BEGIN
	SELECT
	TotalCustomersSums.FirstName AS first_name,
	TotalCustomersSums.LastName AS last_name
	FROM
	(SELECT
	ah.FirstName,ah.LastName,SUM(acc.Balance) AS TotalSum
	FROM AccountHolders AS ah
	LEFT JOIN Accounts AS acc
	ON ah.Id = acc.AccountHolderId
	GROUP BY ah.FirstName,ah.LastName) AS TotalCustomersSums
	WHERE TotalCustomersSums.TotalSum > @InputBalance
END

EXEC usp_GetHoldersWithBalanceHigherThan 800000.001