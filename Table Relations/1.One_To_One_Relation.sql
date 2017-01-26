CREATE TABLE Passports
(
	PassportID int IDENTITY(101,1),
	PassportNumber varchar(50) NOT NULL
)

ALTER TABLE Passports
ADD CONSTRAINT PK_PassportID PRIMARY KEY(PassportID)

CREATE TABLE Persons
(
	PersonID int IDENTITY,
	FirstName nvarchar(50) NOT NULL,
	Salary decimal(10,2) NOT NULL,
	PassportID int UNIQUE
)

ALTER TABLE Persons
ADD CONSTRAINT PK_PersonID PRIMARY KEY(PersonID)

ALTER TABLE Persons
ADD CONSTRAINT FK_Persons_Passports FOREIGN KEY(PassportID) REFERENCES Passports(PassportID)

INSERT INTO Passports(PassportNumber)
VALUES
		('N34FG21B'),
		('K65LO4R7'),
		('ZE657QP2')

INSERT INTO Persons(FirstName,Salary,PassportID)
VALUES
		('Roberto',43300.00,102),
		('Tom',56100.00,103),
		('Yana',60200.00,101)

SELECT p.FirstName,p.Salary,ps.PassportID,ps.PassportNumber
	FROM Persons AS p
	INNER JOIN Passports AS ps
	ON p.PassportID = ps.PassportID

INSERT INTO Passports(PassportNumber)
VALUES
		('AABBCCFF')

INSERT INTO Persons(FirstName,Salary,PassportID)
VALUES('Stamat',40000.00,104)






