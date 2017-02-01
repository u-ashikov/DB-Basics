CREATE TABLE Logs
(
	LogId INT IDENTITY,
	AccountId INT,
	OldSum DECIMAL(14,2),
	NewSum DECIMAL(14,2),
	CONSTRAINT PK_Logs PRIMARY KEY(LogId)
)

CREATE TRIGGER tr_AccountsLogs
ON Accounts
AFTER UPDATE
AS
BEGIN
	INSERT INTO Logs(AccountId,OldSum,NewSum)
	SELECT i.Id,(SELECT d.Balance FROM deleted AS d WHERE d.Id = i.Id),i.Balance
		FROM inserted AS i
END

UPDATE Accounts
SET Balance+=100.00
WHERE Id = 1

SELECT * FROM Logs