SELECT m.MountainRange,p.PeakName,p.Elevation	
	FROM Peaks AS p
	INNER JOIN Mountains AS m
	ON p.MountainId = m.Id
	WHERE m.MountainRange = 'Rila'
	ORDER BY p.Elevation DESC