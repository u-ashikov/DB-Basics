SELECT * FROM Countries

SELECT * FROM MountainsCountries

SELECT * FROM Mountains

SELECT
COUNT(c.CountryCode) AS CountryCode
FROM
(SELECT
	c.CountryCode,c.CountryName,m.MountainRange
	FROM Countries AS c
	LEFT JOIN MountainsCountries AS mc
	ON c.CountryCode = mc.CountryCode
	LEFT JOIN Mountains AS m
	ON mc.MountainId = m.Id
	WHERE m.MountainRange IS NULL
	) AS c