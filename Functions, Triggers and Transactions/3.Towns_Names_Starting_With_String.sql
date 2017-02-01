CREATE PROCEDURE usp_GetTownsStartingWith(@InputString VARCHAR(MAX))
AS
BEGIN
	SELECT
		t.Name AS town
		FROM Towns AS t
		WHERE t.Name LIKE @InputString+'%'
END