SELECT
SUM(diff.Difference) AS sum_difference
FROM
(SELECT 
	tw.[Host Wizzard],
	tw.[Host Wizzard Deposit],
	tw.[Guest Wizzard],
	tw.[Guest Wizzard Deposit],
	(tw.[Host Wizzard Deposit]-tw.[Guest Wizzard Deposit]) AS Difference
	FROM
	(SELECT
		w.FirstName AS 'Host Wizzard',
		w.DepositAmount AS 'Host Wizzard Deposit',
		(
			SELECT
				w2.FirstName
				FROM WizzardDeposits w2
				WHERE w2.Id = w.Id+1
		) AS 'Guest Wizzard',
		(
			SELECT
				w3.DepositAmount
				FROM WizzardDeposits w3
				WHERE w3.Id = w.Id+1
		) AS 'Guest Wizzard Deposit'
		FROM WizzardDeposits AS w
		WHERE w.Id%2!=0) AS tw) AS diff

SELECT SUM(wdd.Diff) AS sum_difference
	FROM
		(SELECT
			w.DepositAmount - (SELECT DepositAmount FROM WizzardDeposits AS wd WHERE wd.Id=w.Id+1) AS Diff
			FROM WizzardDeposits AS w) AS wdd