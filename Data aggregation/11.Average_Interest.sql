SELECT
	w.DepositGroup AS deposit_group,
	w.IsDepositExpired AS is_deposit_expired,
	AVG(w.DepositInterest) AS average_interest
	FROM WizzardDeposits AS w
	WHERE w.DepositStartDate > '01.01.1985'
	GROUP BY w.DepositGroup,w.IsDepositExpired
	ORDER BY deposit_group DESC, is_deposit_expired