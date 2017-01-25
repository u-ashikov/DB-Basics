SELECT
	w.DepositGroup AS deposit_group,
	SUM(w.DepositAmount) AS total_sum 
	FROM WizzardDeposits AS w
	GROUP BY w.DepositGroup