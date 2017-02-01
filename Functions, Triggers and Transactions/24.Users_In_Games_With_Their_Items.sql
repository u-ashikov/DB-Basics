SELECT
	u.Username,g.Name AS Game,COUNT(i.Name) AS [Items Count],SUM(i.Price) AS [Items Price]
	FROM UsersGames AS ug
	INNER JOIN Users AS u
	ON ug.UserId = u.Id
	INNER JOIN Games AS g
	ON ug.GameId = g.Id
	INNER JOIN UserGameItems AS ugi
	ON ug.Id = ugi.UserGameId
	INNER JOIN Items AS i
	ON ugi.ItemId = i.Id
	GROUP BY u.Username,g.Name
	HAVING COUNT(i.Name) >= 10
	ORDER BY [Items Count] DESC,[Items Price] DESC, u.Username