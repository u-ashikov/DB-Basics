CREATE PROCEDURE usp_CalculateFutureValueForAccount(@AccountId INT,@InterestRate FLOAT)
AS
BEGIN
	SELECT
	acc.Id AS 'Account_Id',
	ah.FirstName AS 'First Name',
	ah.LastName AS 'Last Name',
	acc.Balance AS 'Current Balance',
	dbo.ufn_CalculateFutureValue(acc.Balance,@InterestRate,5) AS 'Balance in 5 years'
	FROM AccountHolders AS ah
	LEFT JOIN Accounts AS acc
	ON ah.Id = acc.AccountHolderId
	WHERE acc.Id = @AccountId
END

EXEC dbo.usp_CalculateFutureValueForAccount 1,0.1