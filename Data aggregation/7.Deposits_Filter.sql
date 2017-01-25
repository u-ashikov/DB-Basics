SELECT 
	w.DepositGroup AS deposit_group,
	SUM(w.DepositAmount) AS total_sum
	FROM WizzardDeposits AS w
	WHERE w.MagicWandCreator = 'Ollivander family'
	GROUP BY w.DepositGroup
	HAVING SUM(w.DepositAmount) < 150000
	ORDER BY total_sum DESC