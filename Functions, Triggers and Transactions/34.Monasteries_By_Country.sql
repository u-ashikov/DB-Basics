CREATE TABLE Monasteries
(
	Id INT IDENTITY,
	Name VARCHAR(255),
	CountryCode CHAR(2),
	CONSTRAINT PK_Monasteries PRIMARY KEY (Id),
	CONSTRAINT FK_Monasteries_Countries FOREIGN KEY (CountryCode)
	REFERENCES Countries(CountryCode)
)

INSERT INTO Monasteries(Name, CountryCode) VALUES
('Rila Monastery “St. Ivan of Rila”', 'BG'), 
('Bachkovo Monastery “Virgin Mary”', 'BG'),
('Troyan Monastery “Holy Mother''s Assumption”', 'BG'),
('Kopan Monastery', 'NP'),
('Thrangu Tashi Yangtse Monastery', 'NP'),
('Shechen Tennyi Dargyeling Monastery', 'NP'),
('Benchen Monastery', 'NP'),
('Southern Shaolin Monastery', 'CN'),
('Dabei Monastery', 'CN'),
('Wa Sau Toi', 'CN'),
('Lhunshigyia Monastery', 'CN'),
('Rakya Monastery', 'CN'),
('Monasteries of Meteora', 'GR'),
('The Holy Monastery of Stavronikita', 'GR'),
('Taung Kalat Monastery', 'MM'),
('Pa-Auk Forest Monastery', 'MM'),
('Taktsang Palphug Monastery', 'BT'),
('Sümela Monastery', 'TR')

ALTER TABLE Countries
ADD IsDeleted BIT DEFAULT 0

UPDATE Countries
SET IsDeleted = 1
WHERE CountryCode IN (SELECT RiversCountPerCountry.CountryCode FROM (SELECT
						c.CountryCode,COUNT(r.Id) AS RiversCount
						FROM Countries AS c
						LEFT JOIN CountriesRivers AS cr
						ON c.CountryCode = cr.CountryCode
						LEFT JOIN Rivers AS r
						ON cr.RiverId = r.Id
						GROUP BY c.CountryCode
						HAVING COUNT(r.Id) > 3) AS RiversCountPerCountry)

SELECT
	m.Name AS Monastery,c.CountryName AS Country
	FROM Monasteries AS m
	LEFT JOIN Countries AS c
	ON m.CountryCode = c.CountryCode
	WHERE c.IsDeleted != 1
	ORDER BY m.Name


