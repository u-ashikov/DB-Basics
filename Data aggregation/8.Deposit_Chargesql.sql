SELECT
	w.DepositGroup AS deposit_group,
	w.MagicWandCreator AS magic_wand_creator,
	MIN(w.DepositCharge) AS min_deposit_charge
	FROM WizzardDeposits AS w
	GROUP BY w.DepositGroup,w.MagicWandCreator
	ORDER BY magic_wand_creator, deposit_group