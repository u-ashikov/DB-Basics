SELECT
	c.CountryName AS country_name,
	c.IsoCode AS iso_code
	FROM Countries AS c
	WHERE LEN(c.CountryName) - LEN(REPLACE(LOWER(c.CountryName),'a','')) >= 3
	ORDER BY c.IsoCode