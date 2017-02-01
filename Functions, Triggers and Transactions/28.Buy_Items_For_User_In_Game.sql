DECLARE @UserId INT = (SELECT
							u.Id
							FROM Users AS u
							WHERE u.Username = 'Alex')

DECLARE @GameId INT = (SELECT
							g.Id
							FROM Games AS g
							WHERE g.Name = 'Edinburgh')

DECLARE @UserGameId INT = (SELECT
								ug.Id
								FROM UsersGames AS ug
								WHERE UG.GameId = @GameId AND ug.UserId = @UserId)


DECLARE @TotalItemsPrice MONEY = (SELECT
										SUM(i.Price) 
										FROM Items AS i
											WHERE i.Name IN ('Blackguard',
											'Bottomless Potion of Amplification',
											'Eye of Etlich (Diablo III)',
											'Gem of Efficacious Toxin',
											'Golden Gorget of Leoric',
											'Hellfire Amulet'))
INSERT INTO UserGameItems
SELECT
	i.Id, @UserGameId
	FROM Items AS i
		WHERE i.Name IN ('Blackguard',
		'Bottomless Potion of Amplification',
		'Eye of Etlich (Diablo III)',
		'Gem of Efficacious Toxin',
		'Golden Gorget of Leoric',
		'Hellfire Amulet')

UPDATE UsersGames
SET Cash-=@TotalItemsPrice
WHERE Id = @UserGameId


SELECT
	u.Username,g.Name,ug.Cash,i.Name AS [Item Name]
	FROM UsersGames AS ug
	INNER JOIN Games AS g
	ON ug.GameId = g.Id
	INNER JOIN Users AS u
	ON ug.UserId = u.Id
	INNER JOIN UserGameItems AS ugi
	ON ugi.UserGameId = ug.Id
	INNER JOIN Items AS i
	ON ugi.ItemId = i.Id
	WHERE g.Name = 'Edinburgh'
	ORDER BY i.Name
	