CREATE TABLE Users
(
	Id int UNIQUE IDENTITY NOT NULL,
	Name nvarchar(200) NOT NULL,
	Picture image,
	Height float(2),
	Weight float(2),
	Gender char(1) NOT NULL CHECK(Gender IN ('m','f')),
	Birthdate date NOT NULL,
	Biography nvarchar(max)
)

INSERT INTO Users (Name,Picture,Height,Weight,Gender,Birthdate,Biography)
VALUES 
	('Gosho',NULL,180.20,85.10,'m','1999-01-01',NULL),
	('Pesho',NULL,170.8,80,'m','1991-04-21','Hello my name is Pesho. I am from Sofia.'),
	('Gergan',NULL,163.61,60.10,'m','1991-01-03','Аз съм бай Герган и уча в СофУни!'),
	('Maria',NULL,173,51.10,'f','1998-08-31','Mariika sum.'),
	('Goshka',NULL,202.20,131.10,'f','1945-01-01','Въй майкооооо спечелих джакпота в Испания!')

ALTER TABLE Users
ADD CONSTRAINT PK_Id
PRIMARY KEY (Id)