SELECT TOP 50
	g.Name AS name,
	CONVERT(char(10),g.Start,126) AS start
	FROM Games AS g
	WHERE YEAR(g.Start) IN (2011,2012)
	ORDER BY g.Start,g.Name