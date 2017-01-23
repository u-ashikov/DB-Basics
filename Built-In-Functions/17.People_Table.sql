CREATE TABLE People
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	Name varchar(100) NOT NULL,
	Birthdate date NOT NULL
)

INSERT INTO People (Name,Birthdate)
VALUES
	('Victor','2000-12-07 00:00:00'),
	('Steven','1992-09-10 00:00:00'),
	('Stephen','1910-09-19 00:00:00'),
	('John','2010-01-06 00:00:00')

SELECT * FROM People

SELECT 
	p.Name AS name,
	DATEDIFF(YEAR,p.Birthdate,GETDATE()) AS age_in_years,
	DATEDIFF(MONTH,p.Birthdate,GETDATE()) AS age_in_months,
	DATEDIFF(DAY,p.Birthdate,GETDATE()) AS age_in_days,
	DATEDIFF(MINUTE,p.Birthdate,GETDATE()) AS age_in_minutes
	FROM People AS p