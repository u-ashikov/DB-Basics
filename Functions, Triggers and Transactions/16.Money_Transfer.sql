CREATE PROCEDURE usp_TransferMoney (@SenderAccountId INT, @ReceiverAccountId INT, @MoneyAmount FLOAT)
AS
BEGIN
	BEGIN TRAN
	UPDATE Accounts
	SET Balance+=@MoneyAmount
	WHERE Id = @ReceiverAccountId

	UPDATE Accounts
	SET Balance-=@MoneyAmount
	WHERE Id = @SenderAccountId

	IF (@MoneyAmount <=0 OR @MoneyAmount IS NULL)
	BEGIN
		ROLLBACK
	END
	ELSE IF (@SenderAccountId IS NULL OR @ReceiverAccountId IS NULL)
	BEGIN
		ROLLBACK
	END
	ELSE IF (@SenderAccountId <=0 OR @ReceiverAccountId <=0)
	BEGIN
		ROLLBACK
	END
	ELSE IF (@SenderAccountId > (SELECT TOP 1 acc.Id FROM Accounts AS acc ORDER BY acc.Id DESC) 
	OR @ReceiverAccountId > (SELECT TOP 1 acc.Id FROM Accounts AS acc ORDER BY acc.Id DESC))
	BEGIN
		ROLLBACK
	END
	ELSE IF (@MoneyAmount > (SELECT acc.Balance FROM Accounts AS acc WHERE acc.Id = @SenderAccountId))
	BEGIN
		ROLLBACK
	END
	ELSE
	BEGIN
		COMMIT
	END
END

EXEC usp_MoneyTransfer 1,2,100

select * from Accounts

