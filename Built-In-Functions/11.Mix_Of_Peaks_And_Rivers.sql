SELECT
	p.PeakName AS peak_name,
	r.RiverName AS river_name,
	CONCAT(SUBSTRING(LOWER(p.PeakName),1,LEN(p.PeakName)-1),LOWER(r.RiverName)) AS mix
	FROM Peaks AS p, Rivers AS r
	WHERE RIGHT(LOWER(p.PeakName),1) = LEFT(LOWER(r.RiverName),1)
	ORDER BY mix

SELECT
	p.PeakName AS peak_name,
	r.RiverName AS river_name,
	CONCAT(SUBSTRING(LOWER(p.PeakName),1,LEN(p.PeakName)-1),LOWER(r.RiverName)) AS mix
	FROM Peaks AS p, Rivers AS r
	WHERE SUBSTRING(LOWER(p.PeakName),LEN(p.PeakName),1) = SUBSTRING(LOWER(r.RiverName),1,1)
	ORDER BY mix