WITH cm AS
(SELECT mc.CountryCode,m.MountainRange
	FROM MountainsCountries AS mc
	LEFT JOIN Mountains AS m
	ON mc.MountainID = m.Id 
	WHERE mc.CountryCode IN ('BG','RU','US')
)

SELECT
	cm.CountryCode,COUNT(cm.MountainRange) AS MountainRanges
	FROM cm
	GROUP BY cm.CountryCode