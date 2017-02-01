SELECT
	cr.CurrencyCode,cr.Description AS Currency,COUNT(c.CountryName) AS NumberOfCountries
	FROM Currencies AS cr
	LEFT JOIN Countries AS c
	ON cr.CurrencyCode = c.CurrencyCode
	GROUP BY cr.CurrencyCode,cr.Description
	ORDER BY [NumberOfCountries] DESC, [Currency]