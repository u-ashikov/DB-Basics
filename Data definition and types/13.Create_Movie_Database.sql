CREATE DATABASE Movies

USE Movies

CREATE TABLE Directors
(
	Id int NOT NULL IDENTITY PRIMARY KEY,
	DirectorName nvarchar(255) NOT NULL,
	Notes nvarchar(max)
)

INSERT INTO Directors (DirectorName,Notes)
VALUES 
	('Martin Skorseze','Very good director'),
	('Spielberg','Crazy man!'),
	('Ben Aflek',NULL),
	('Shayamalan',NULL),
	('Peter Jackson','Идеален е !')

CREATE TABLE Genres
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	GenreName nvarchar(20) NOT NULL,
	Notes nvarchar(max) 
)

INSERT INTO Genres (GenreName,Notes)
VALUES
	('action',NULL),
	('horror',NULL),
	('adventure',NULL),
	('fantasy',NULL),
	('comedy',NULL)

CREATE TABLE Categories
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	CategoryName nvarchar(50) NOT NULL,
	Notes nvarchar(max)
)

INSERT INTO Categories (CategoryName,Notes)
VALUES
	('Best movie of the year',NULL),
	('Best comedy',NULL),
	('Most times viewed',NULL),
	('Best director',NULL),
	('Best actors',NULL)

CREATE TABLE Movies
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	Title nvarchar(255) NOT NULL,
	DirectorId int FOREIGN KEY (DirectorId) REFERENCES Directors(Id),
	CopyrightYear int,
	Length int,
	GenreId int FOREIGN KEY (GenreId) REFERENCES Genres(Id),
	CategoryId int FOREIGN KEY (CategoryId) REFERENCES Categories(Id),
	Rating int,
	Notes nvarchar(max)
)

INSERT INTO Movies (Title,DirectorId,CopyrightYear,Length,GenreId,CategoryId,Rating,Notes)
VALUES
	('Lord of the rings',5,2000,180,5,5,10,NULL),
	('Gladiator',1,2003,NULL,1,1,8,'Filma e mnogo qk!'),
	('The silent of the lambs',2,2004,100,2,2,7,'Много страшен филм не е за гледане!'),
	('Spiderman',3,2009,130,3,3,NULL,NULL),
	('How to train your dragon',4,2007,110,4,4,9,'Animation!')