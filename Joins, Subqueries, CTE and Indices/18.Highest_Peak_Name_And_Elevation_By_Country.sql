SELECT TOP 5
	mp.CountryName AS Country,
	CASE
		WHEN mp.PeakName IS NULL THEN '(no highest peak)'
		ELSE mp.PeakName
		END HighestPeakName,
	CASE
		WHEN mp.PeakName IS NULL THEN 0
		ELSE mp.Elevation
		END HighestPeakElevation ,
	CASE
		WHEN mp.PeakName IS NULL THEN '(no mountain)'
		ELSE mp.MountainRange
		END Mountain
	FROM
		(SELECT
			c.CountryCode,c.IsoCode,c.CountryName,mc.MountainId,m.MountainRange,p.PeakName,p.Elevation,
			DENSE_RANK() OVER (PARTITION BY c.CountryCode ORDER BY p.Elevation DESC) AS Rank
			FROM MountainsCountries AS mc
			FULL JOIN Countries AS c
			ON mc.CountryCode = c.CountryCode
			FULL JOIN Peaks AS p
			ON mc.MountainId = p.MountainId
			FULL JOIN Mountains AS m
			ON p.MountainId = m.Id
			) AS mp
			WHERE mp.Rank = 1 AND mp.CountryName IS NOT NULL
			ORDER BY mp.CountryName,mp.PeakName