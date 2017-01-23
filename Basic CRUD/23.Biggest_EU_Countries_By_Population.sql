SELECT TOP 30
	c.CountryName AS country_name,
	c.Population AS population
	FROM Countries AS c
	WHERE c.ContinentCode = 'EU'
	ORDER BY c.Population DESC, c.CountryName