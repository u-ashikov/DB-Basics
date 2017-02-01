WITH ItemsStats AS 
(SELECT
	ug.UserId,ug.GameId,
	SUM(ItemStats.Defence) AS ItemDefence,
	SUM(ItemStats.Luck) AS ItemLuck,
	SUM(ItemStats.Mind) AS ItemMind,
	SUM(ItemStats.Speed) AS ItemSpeed,
	SUM(ItemStats.Strength) AS ItemStrength
	FROM Users AS u
	INNER JOIN UsersGames AS ug
	ON u.Id = ug.UserId
	INNER JOIN Games AS g
	ON ug.GameId = g.Id
	INNER JOIN UserGameItems AS ugi
	ON ug.Id = ugi.UserGameId
	INNER JOIN Items AS i
	ON ugi.ItemId = i.Id
	INNER JOIN [Statistics] AS ItemStats
	ON i.StatisticId = ItemStats.Id
	GROUP BY ug.UserId,ug.GameId)

	SELECT
		u.Username,g.Name AS Game,
		MAX(ch.Name) AS Character,
		MAX(ItemsStats.ItemStrength)+MAX(GameStats.Strength)+MAX(CharStats.Strength) AS Strength,
		MAX(ItemsStats.ItemDefence)+MAX(GameStats.Defence)+MAX(CharStats.Defence) AS Defence,
		MAX(ItemsStats.ItemSpeed)+MAX(GameStats.Speed)+MAX(CharStats.Speed) AS Speed,
		MAX(ItemsStats.ItemMind)+MAX(GameStats.Mind)+MAX(CharStats.Mind) AS Mind,
		MAX(ItemsStats.ItemLuck)+MAX(GameStats.Luck)+MAX(CharStats.Luck) AS Luck
		FROM UsersGames AS ug
		INNER JOIN Users AS u
		ON ug.UserId = u.Id
		INNER JOIN Games AS g
		ON ug.GameId = g.Id
		INNER JOIN GameTypes AS gt
		ON g.GameTypeId = gt.Id
		INNER JOIN [Statistics] AS GameStats
		ON gt.BonusStatsId = GameStats.Id
		INNER JOIN Characters AS ch
		ON ug.CharacterId = ch.Id
		INNER JOIN [Statistics] AS CharStats
		ON ch.StatisticId = CharStats.Id
		INNER JOIN ItemsStats
		ON u.Id = ItemsStats.UserId
		AND g.Id = ItemsStats.GameId
		GROUP BY u.Username,g.Name
		ORDER BY Strength DESC, Defence DESC, Speed DESC, Mind DESC, Luck DESC