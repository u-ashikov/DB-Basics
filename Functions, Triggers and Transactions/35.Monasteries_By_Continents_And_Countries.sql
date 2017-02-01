UPDATE Countries
SET CountryName = 'Burma'
WHERE CountryName = 'Myanmar'

INSERT INTO Monasteries (Name,CountryCode)
VALUES ('Hanga Abbey',(SELECT CountryCode FROM Countries WHERE CountryName = 'Tanzania'))

INSERT INTO Monasteries (Name,CountryCode)
VALUES ('Myin-Tin-Daik',(SELECT CountryCode FROM Countries WHERE CountryName = 'Myanmar'))

SELECT
	AllContinents.ContinentName, c.CountryName,COUNT(m.Name) AS MonasteriesCount
	FROM Continents AS AllContinents
	LEFT JOIN Countries AS c
	ON AllContinents.ContinentCode = c.ContinentCode
	LEFT JOIN Monasteries AS m
	ON c.CountryCode = m.CountryCode
	WHERE c.IsDeleted !=1
	GROUP BY AllContinents.ContinentName, c.CountryName
	ORDER BY [MonasteriesCount] DESC,c.CountryName
