CREATE DATABASE CarRental

USE CarRental

CREATE TABLE Categories
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	Category varchar(50) NOT NULL,
	DailyRate int,
	WeeklyRate int,
	MonthlyRate int,
	WeekendRate int
)

INSERT INTO Categories(Category,DailyRate,WeeklyRate,MonthlyRate,WeekendRate)
VALUES
	('Family car',10,10,10,10),
	('Mini van',NULL,NULL,NULL,NULL),
	('Highland car',8,9,NULL,NULL)

CREATE TABLE Cars
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	PlateNumber int NOT NULL, 
	Make varchar(50) NOT NULL, 
	Model varchar(50) NOT NULL, 
	CarYear int, 
	CategoryId int FOREIGN KEY (CategoryId) REFERENCES Categories(Id), 
	Doors int, 
	Picture image, 
	Condition varchar(255), 
	Available varchar NOT NULL CHECK (Available IN ('yes','no'))
)

INSERT INTO Cars (PlateNumber, Make, Model, CarYear, CategoryId, Doors, Picture, Condition, Available)
VALUES
	(1112,'Ford','Focus',2009,1,5,NULL,NULL,'yes'),
	(1113,'VW','Golf',2012,2,3,NULL,'very good','no'),
	(1114,'Nissan','Pathfinder',2014,3,5,NULL,NULL,'yes')

CREATE TABLE Employess
(
	Id int PRIMARY KEY NOT NULL IDENTITY, 
	FirstName nvarchar(50) NOT NULL, 
	LastName nvarchar(50) NOT NULL, 
	Title nvarchar(255), 
	Notes nvarchar(max)
)

INSERT INTO Employess (FirstName, LastName, Title, Notes)
VALUES
	('Stanimir','Martinov',NULL,NULL),
	('Герган','Герганов','Боса','Най-добрият шеф!'),
	('Glen','Smith',NULL,'Bai Mangau')

CREATE TABLE Customers
(
	Id int NOT NULL PRIMARY KEY IDENTITY, 
	DriverLicenceNumber int NOT NULL, 
	FullName nvarchar(50) NOT NULL,
	Address nvarchar(255) NOT NULL, 
	City nvarchar(255) NOT NULL, 
	ZIPCode int, 
	Notes nvarchar(max)
)

INSERT INTO Customers (DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes)
VALUES
	(123456789,'Ivan Ivanov','Strandja str.18','Sofia',NULL,NULL),
	(345678125,'Страхил Попов','ул.Младежка 118','Варна',9000,'Лоален клиент и често пазарува!'),
	(556722344,'Stanislav Petkow','Maliovica str.5','Burgas',NULL,'Great customer')

CREATE TABLE RentalOrders
(
Id int NOT NULL IDENTITY PRIMARY KEY, 
EmployeeId int FOREIGN KEY (EmployeeId) REFERENCES Employess(Id), 
CustomerId int FOREIGN KEY (CustomerId) REFERENCES Customers(Id), 
CarId int FOREIGN KEY (CarId) REFERENCES Cars(Id), 
CarCondition nvarchar(max) NOT NULL, 
TankLevel int NOT NULL, 
KilometrageStart int NOT NULL, 
KilometrageEnd int NOT NULL, 
TotalKilometrage int NOT NULL, 
StartDate date NOT NULL, 
EndDate date NOT NULL, 
TotalDays int NOT NULL, 
RateApplied int, 
TaxRate decimal(10,2) NOT NULL, 
OrderStatus nvarchar(50) NOT NULL, 
Notes nvarchar(max)
)

INSERT INTO RentalOrders (EmployeeId, CustomerId, CarId, CarCondition, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes)
VALUES
	(1,1,2,'new',50,123456,123496,123496,'2017-01-01','2017-01-02',115,10,20.50,'processed',NULL),
	(2,2,3,'very good',15,123156,123396,123396,'2017-02-01','2017-02-03',220,8,11.80,'processing',NULL),
	(3,3,4,'new',100,123956,124096,124096,'2017-03-01','2017-03-06',98,6,50.15,'processed',NULL)