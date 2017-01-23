SELECT
	t.Name AS name
	FROM Towns AS t
	WHERE LEN(t.Name) IN (5,6)
	ORDER BY t.Name