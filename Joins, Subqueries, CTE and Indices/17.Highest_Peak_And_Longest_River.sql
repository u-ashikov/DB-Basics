SELECT TOP 5
	c.CountryName,p.HighestPeak AS HighestPeakElevation, r.LongestRiver AS LongestRiverLength
	FROM Countries AS c
	LEFT JOIN (SELECT
	c.CountryCode, MAX(r.Length) AS LongestRiver
	FROM Countries AS c
	LEFT JOIN CountriesRivers AS cr
	ON c.CountryCode = cr.CountryCode
	LEFT JOIN Rivers AS r
	ON cr.RiverId = r.Id
	GROUP BY c.CountryCode) AS r
	ON c.CountryCode = r.CountryCode
	LEFT JOIN (SELECT
	c.CountryCode,MAX(p.Elevation) AS HighestPeak
	FROM Countries AS c
	LEFT JOIN MountainsCountries AS mc
	ON c.CountryCode = mc.CountryCode
	LEFT JOIN Peaks AS p
	ON mc.MountainId = p.MountainId
	GROUP BY c.CountryCode) AS p
	ON c.CountryCode = p.CountryCode
	ORDER BY p.HighestPeak DESC,r.LongestRiver DESC, c.CountryName
