SELECT t.deposit_group
FROM (SELECT
	w.DepositGroup AS deposit_group,AVG(w.MagicWandSize) AS average_wand_size
	FROM WizzardDeposits AS w
	GROUP BY w.DepositGroup) AS t
	WHERE t.average_wand_size = (SELECT MIN(wands.avgwand)
								FROM (SELECT wd.DepositGroup,AVG(wd.MagicWandSize) AS avgwand
									FROM WizzardDeposits AS wd GROUP BY wd.DepositGroup) AS wands)
