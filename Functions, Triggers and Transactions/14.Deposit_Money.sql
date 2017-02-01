CREATE PROCEDURE usp_DepositMoney(@AccountId INT,@MoneyAmount FLOAT)
AS
BEGIN
	BEGIN TRAN
		UPDATE Accounts
		SET Balance+=@MoneyAmount
		WHERE Id = @AccountId
		IF (@AccountId <=0 OR @MoneyAmount IS NULL)
		BEGIN
			ROLLBACK
		END
		ELSE IF (@MoneyAmount <=0)
		BEGIN
			ROLLBACK
		END
		ELSE
		BEGIN
			COMMIT
		END
END