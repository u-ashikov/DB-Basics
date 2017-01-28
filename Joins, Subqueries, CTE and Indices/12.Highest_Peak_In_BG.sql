SELECT * FROM Mountains

SELECT * FROM Countries

SELECT * FROM Peaks

SELECT * FROM MountainsCountries

SELECT
	mc.CountryCode,m.MountainRange,p.PeakName,p.Elevation
	FROM Mountains AS m
	LEFT JOIN Peaks AS p
	ON m.Id = p.MountainId
	LEFT JOIN MountainsCountries AS mc
	ON m.Id = mc.MountainId
	WHERE mc.CountryCode = 'BG' AND p.Elevation > 2835
	ORDER BY p.Elevation DESC


WITH pm AS (
	SELECT mc.CountryCode,m.MountainRange,p.PeakName,p.Elevation
	FROM
	(SELECT p.Elevation,p.MountainId,p.PeakName
		FROM Peaks AS p) AS p,
	(SELECT
		m.Id,m.MountainRange
		FROM Mountains AS m) AS m,
	(SELECT
		mc.MountainId,mc.CountryCode
		FROM MountainsCountries AS mc
	) AS mc
	WHERE m.Id = p.MountainId AND mc.MountainId = m.Id
)
SELECT *
	FROM pm
	WHERE pm.CountryCode = 'BG' AND pm.Elevation > 2835
	ORDER BY pm.Elevation DESC