SELECT
	g.Name AS Game,
	CASE
		WHEN DATEPART(HOUR,g.Start) >= 0 AND DATEPART(HOUR,g.Start) <12 THEN 'Morning'
		WHEN DATEPART(HOUR,g.Start) >=12 AND DATEPART(HOUR,g.Start) < 18 THEN 'Afternoon'
		ELSE 'Evening' 
		END'Part of the Day',
	CASE
		WHEN g.Duration <=3 THEN 'Extra Short'
		WHEN g.Duration BETWEEN 4 AND 6 THEN 'Short'
		WHEN g.Duration > 6 THEN 'Long'
		ELSE 'Extra Long'
		END 'Duration'
	FROM Games AS g
	ORDER BY [Game],[Duration],[Part of the Day]