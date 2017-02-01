SELECT
RiversByCountry.CountryName,RiversByCountry.ContinentName,RiversByCountry.RiversCount,
CASE
	WHEN RiversByCountry.RiversCount <= 0 THEN 0
	ELSE RiversByCountry.TotalLength
	END TotalLength
FROM
(SELECT
	c.CountryName,cc.ContinentName,COUNT(r.RiverName) AS RiversCount,SUM(r.Length) AS TotalLength
	FROM Countries AS c
	LEFT JOIN CountriesRivers AS cr
	ON c.CountryCode = cr.CountryCode
	LEFT JOIN Rivers AS r
	ON cr.RiverId = r.Id
	LEFT JOIN Continents AS cc
	ON c.ContinentCode = cc.ContinentCode
	GROUP BY c.CountryName,cc.ContinentName) AS RiversByCountry
	ORDER BY RiversByCountry.RiversCount DESC, RiversByCountry.TotalLength DESC, RiversByCountry.CountryName