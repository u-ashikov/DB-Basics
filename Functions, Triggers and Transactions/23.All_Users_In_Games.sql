SELECT
	g.Name AS Game,
	gt.Name AS 'Game Type',
	u.Username,
	ug.Level,
	ug.Cash,
	ch.Name AS Character
	FROM UsersGames AS ug
	INNER JOIN Games AS g
	ON ug.GameId = g.Id
	INNER JOIN GameTypes AS gt
	ON g.GameTypeId = gt.Id
	INNER JOIN Users AS u
	ON ug.UserId = u.Id
	INNER JOIN Characters AS ch
	ON ug.CharacterId = ch.Id 
	ORDER BY ug.Level DESC,u.Username,g.Name