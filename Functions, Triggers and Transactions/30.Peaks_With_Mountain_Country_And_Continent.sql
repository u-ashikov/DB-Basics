SELECT
	p.PeakName,m.MountainRange AS Mountain,c.CountryName,cc.ContinentName
	FROM Peaks AS p
	INNER JOIN Mountains AS m
	ON p.MountainId = m.Id
	INNER JOIN MountainsCountries AS mc
	ON m.Id = mc.MountainId
	INNER JOIN Countries AS c
	ON mc.CountryCode = c.CountryCode
	INNER JOIN Continents AS cc
	ON c.ContinentCode = cc.ContinentCode
	ORDER BY p.PeakName,c.CountryName

