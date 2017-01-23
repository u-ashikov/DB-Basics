SELECT
	c.CountryName AS country_name,
	c.CountryCode AS country_code,
	CASE
		WHEN c.CurrencyCode = 'EUR' THEN 'Euro'
		ELSE 'Not Euro'
		END AS 'currency'
	FROM Countries AS c
	ORDER BY c.CountryName