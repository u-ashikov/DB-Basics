SELECT
	cn.ContinentName,SUM(CAST(c.AreaInSqKm AS bigint)) AS CountriesArea,SUM(CAST(c.Population AS bigint)) AS CountriesPopulation
	FROM Continents AS cn
	LEFT JOIN Countries AS c
	ON cn.ContinentCode = c.ContinentCode
	GROUP BY cn.ContinentName
	ORDER BY [CountriesPopulation] DESC