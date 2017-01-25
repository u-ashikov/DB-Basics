SELECT DISTINCT
	SUBSTRING(names.FirstName,1,1) AS first_letter
	FROM
	(SELECT
		w.DepositGroup,
		w.FirstName
		FROM WizzardDeposits AS w
		WHERE w.DepositGroup = 'Troll Chest'
		GROUP BY w.DepositGroup, w.FirstName) AS names