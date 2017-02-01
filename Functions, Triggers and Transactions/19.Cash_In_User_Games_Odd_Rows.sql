CREATE FUNCTION ufn_CashInUsersGames(@GameName VARCHAR(50))
	RETURNS @SumOddRowsCash TABLE (
			SumCash MONEY
	)
	AS
	BEGIN
		INSERT INTO @SumOddRowsCash
		VALUES (
		(SELECT SUM(GameCash.Cash) FROM
			(SELECT
				ug.Cash,
				ROW_NUMBER() OVER (PARTITION BY g.Name ORDER BY ug.Cash DESC) AS RowNum
				FROM Games AS g
				INNER JOIN UsersGames AS ug
				ON g.Id = ug.GameId
				WHERE g.Name = @GameName) AS GameCash
				WHERE GameCash.RowNum%2 =1)
			)
			RETURN
	END