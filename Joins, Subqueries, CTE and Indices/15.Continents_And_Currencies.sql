SELECT
	ccu.ContinentCode,ccu.CurrencyCode,ccu.CurrencyUsage
	FROM
(SELECT
	cu.ContinentCode,cu.CurrencyCode,cu.CurrencyUsage,
	DENSE_RANK() OVER (PARTITION BY cu.ContinentCode ORDER BY cu.CurrencyUsage DESC) AS Rank
	FROM
(SELECT
	c.ContinentCode,c.CurrencyCode,COUNT(c.CurrencyCode) AS CurrencyUsage
	FROM Countries AS c
	GROUP BY c.ContinentCode,c.CurrencyCode) AS cu) AS ccu
	WHERE ccu.Rank = 1 AND ccu.CurrencyUsage > 1
	ORDER BY ccu.ContinentCode
