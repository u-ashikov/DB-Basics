SELECT
	agegr.age_groups,
	COUNT(agegr.age) AS wizzard_count
	FROM
	(SELECT 
		CASE
			WHEN w.Age >=0 AND w.Age <=10 THEN '[0-10]'
			WHEN w.Age>=11 AND w.Age<=20 THEN '[11-20]'
			WHEN w.Age >=21 AND w.Age<=30 THEN '[21-30]'
			WHEN w.Age>=31 AND w.Age<=40 THEN '[31-40]'
			WHEN w.Age>=41 AND w.Age <=50 THEN '[41-50]'
			WHEN w.Age>=51 AND w.Age <=60 THEN '[51-60]'
			ELSE '[61+]'
			END age_groups,
			w.Age AS age
			FROM WizzardDeposits AS w) AS agegr
			GROUP BY agegr.age_groups