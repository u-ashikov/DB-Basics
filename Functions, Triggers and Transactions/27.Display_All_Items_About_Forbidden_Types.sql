SELECT
	i.Name AS Item,i.Price,i.MinLevel,gt.Name AS [Forbidden Game Type]
	FROM Items AS i
	LEFT JOIN GameTypeForbiddenItems AS gfi
	ON i.Id = gfi.ItemId
	LEFT JOIN GameTypes AS gt
	ON gfi.GameTypeId = gt.Id
	ORDER BY gt.Name DESC,i.Name