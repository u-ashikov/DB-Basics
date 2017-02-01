CREATE TABLE NotificationEmails
(
	Id INT IDENTITY,
	Recipient INT,
	Subject NVARCHAR(255),
	Body TEXT,
	CONSTRAINT PK_NotificationEmails PRIMARY KEY(Id)
)

CREATE TRIGGER tr_EmailOnAccountChange
ON Logs
AFTER INSERT
AS
BEGIN
	INSERT INTO NotificationEmails(Recipient,Subject,Body)
	SELECT
		i.AccountId,
		CONCAT('Balance change for account: ',i.AccountId),
		CONCAT('On ',GETDATE(),' your balance was changed from ',I.OldSum,' to ',i.NewSum) 
		FROM inserted AS i
END

SELECT * FROM Logs

SELECT * FROM NotificationEmails

SELECT * FROM Accounts

UPDATE Accounts
SET Balance+=100
WHERE Id = 1
