SELECT
	t.TownID AS town_id,
	t.Name AS name
	FROM Towns AS t
	WHERE LEFT(t.Name,1) IN ('M','K','B','E')
	ORDER BY t.Name

SELECT
	t.TownID AS town_id,
	t.Name
	FROM Towns AS t
	WHERE SUBSTRING(t.Name,1,1) IN ('M','K','B','E')
	ORDER BY T.Name