SELECT
	i.Name,i.Price,i.MinLevel,s.Strength,s.Defence,s.Speed,s.Luck,s.Mind
	FROM Items AS i
	INNER JOIN [Statistics] AS s
	ON i.StatisticId = s.Id
	WHERE s.Luck > (SELECT AVG(Luck) FROM [Statistics])
	  AND s.Speed > (SELECT AVG(Speed) FROM [Statistics])
	  AND s.Mind > (SELECT AVG(Mind) FROM [Statistics])
	ORDER BY i.Name