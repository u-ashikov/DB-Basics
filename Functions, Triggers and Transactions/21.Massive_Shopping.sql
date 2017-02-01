	DECLARE @UserLevel INT = (SELECT ug.[Level] FROM UsersGames AS ug
						INNER JOIN Users AS u
							ON ug.UserId = u.Id
							AND u.Username = 'Stamat'
						INNER JOIN Games AS g
							ON g.Id = ug.GameId
							AND g.[Name] = 'Safflower')

	DECLARE @UserMoney MONEY = (SELECT ug.Cash FROM UsersGames AS ug
						INNER JOIN Users AS u
							ON ug.UserId = u.Id
							AND u.Username = 'Stamat'
						INNER JOIN Games AS g
							ON g.Id = ug.GameId
							AND g.[Name] = 'Safflower')

	DECLARE @UserId INT = (SELECT ug.UserId FROM UsersGames AS ug
						INNER JOIN Users AS u
							ON ug.UserId = u.Id
							AND u.Username = 'Stamat'
						INNER JOIN Games AS g
							ON g.Id = ug.GameId
							AND g.[Name] = 'Safflower')

	DECLARE @UserGameId INT = (SELECT ug.Id FROM UsersGames AS ug
						INNER JOIN Users AS u
							ON ug.UserId = u.Id
							AND u.Username = 'Stamat'
						INNER JOIN Games AS g
							ON g.Id = ug.GameId
							AND g.[Name] = 'Safflower')

	BEGIN TRAN
	
	DECLARE @TotalItemsSum MONEY = (SELECT SUM(i.Price) 
										FROM Items As i
										WHERE i.MinLevel IN (11,12))

	INSERT INTO UserGameItems
	SELECT Id, @UserGameId FROM Items 
	WHERE MinLevel IN (11,12)

	IF (@TotalItemsSum > @UserMoney OR @UserLevel < 12)
	BEGIN
		ROLLBACK
	END
	ELSE
	BEGIN
		UPDATE UsersGames
		SET Cash -= @TotalItemsSum
		WHERE UserId = @UserId
		COMMIT
	END

	BEGIN TRAN
	
	DECLARE @TotalItemsSum2 MONEY = (SELECT SUM(i.Price) 
										FROM Items As i
										WHERE i.MinLevel IN (19,20,21))

	INSERT INTO UserGameItems
	SELECT Id, @UserGameId FROM Items 
	WHERE MinLevel IN (19,20,21)

	IF (@TotalItemsSum2 > @UserMoney OR @UserLevel < 21)
	BEGIN
		ROLLBACK
	END
	ELSE
	BEGIN
		UPDATE UsersGames
		SET Cash -= @TotalItemsSum2
		WHERE UserId = @UserId
		COMMIT
	END

	SELECT
		i.Name AS [Item Name]
		FROM UserGameItems AS ugi
		INNER JOIN Items AS i
		ON ugi.ItemId = i.Id
		WHERE ugi.UserGameId = @UserGameId
		ORDER BY i.Name

