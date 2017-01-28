SELECT
	e.EmployeeID,e.FirstName, e.ManagerID, m.FirstName AS ManagerName
	FROM Employees AS e
	INNER JOIN Employees AS m
	ON e.ManagerID = m.EmployeeID
	WHERE e.ManagerID IN (3,7)
	ORDER BY e.EmployeeID

SELECT
e.EmployeeID,e.FirstName,e.ManagerID,m.FirstName
FROM
(SELECT
	m.FirstName,m.EmployeeID
	FROM Employees AS m) AS m,
(SELECT
	e.EmployeeID,e.FirstName,e.ManagerID
	FROM Employees AS e) AS e
	WHERE e.ManagerID = m.EmployeeID AND e.ManagerID IN (3,7)