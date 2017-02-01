CREATE PROCEDURE usp_WithdrawMoney(@AccountId INT,@MoneyAmount FLOAT)
AS
BEGIN
	BEGIN TRAN
		UPDATE Accounts
		SET Balance-=@MoneyAmount
		WHERE Id = @AccountId
	IF (@AccountId IS NULL OR @MoneyAmount IS NULL)
	BEGIN
		ROLLBACK
	END
	ELSE IF (@MoneyAmount <=0)
	BEGIN
		ROLLBACK
	END
	ELSE IF ((SELECT acc.Balance FROM Accounts AS acc WHERE acc.Id = @AccountId)<=0)
	BEGIN
		ROLLBACK
	END
	ELSE
	BEGIN
		COMMIT
	END
END