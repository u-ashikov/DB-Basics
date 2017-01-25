SELECT DISTINCT
st.DepartmentID AS department_id,
st.Salary AS third_highest_salary
FROM
(SELECT
	e.DepartmentID,
	e.Salary,
	DENSE_RANK() OVER (PARTITION BY e.DepartmentID ORDER BY e.Salary DESC) AS SalaryRank 
	FROM Employees AS e) AS st
	WHERE st.SalaryRank =3