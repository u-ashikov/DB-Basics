SELECT DepositGroup AS deposit_group, MAX(MagicWandSize) AS longest_magic_wand
	FROM WizzardDeposits AS w
	GROUP BY DepositGroup
