SELECT TOP 10
	p.ProjectID AS id,
	p.Name,
	p.Description,
	p.StartDate AS start_date,
	p.EndDate AS end_date
	FROM Projects AS p
	ORDER BY p.StartDate, p.Name