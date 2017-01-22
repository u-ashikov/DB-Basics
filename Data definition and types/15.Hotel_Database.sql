CREATE DATABASE Hotel

CREATE TABLE Employees
(
	Id int NOT NULL PRIMARY KEY IDENTITY, 
	FirstName nvarchar(50) NOT NULL, 
	LastName nvarchar(50) NOT NULL, 
	Title nvarchar(255) NOT NULL, 
	Notes nvarchar(max)
)

INSERT INTO Employees (FirstName, LastName, Title, Notes)
VALUES
	('Ivan','Ivanov','Director',NULL),
	('Стамат','Стаматов','Чистач','Ако не е тоя ще умрем ей!'),
	('Герган','Герганов','Бос',NULL)

CREATE TABLE Customers
(
	AccountNumber int IDENTITY PRIMARY KEY NOT NULL, 
	FirstName nvarchar(50) NOT NULL, 
	LastName nvarchar(50) NOT NULL, 
	PhoneNumber varchar(50) NOT NULL, 
	EmergencyName nvarchar(50) NOT NULL, 
	EmergencyNumber varchar(50) NOT NULL, 
	Notes nvarchar(max)
)

INSERT INTO Customers (FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
VALUES
	('Garry','Speed','123-123-123','Stephen Hawk','555-123',NULL),
	('Jack','Sparow','0889 44 44 44','Will Sparow','559-897','Лоялен клиент'),
	('Деян','Топалски','0883 44 18 19','Благой Иванов','999-114','Бияч')

CREATE TABLE RoomStatus
(
	Id int NOT NULL IDENTITY PRIMARY KEY,
	RoomStatus nvarchar(255) NOT NULL,
	Notes nvarchar(max)
)

INSERT INTO RoomStatus (RoomStatus, Notes)
VALUES
	('free',NULL),
	('occupied',NULL),
	('cleaned',NULL)

CREATE TABLE RoomTypes
(
	Id int NOT NULL IDENTITY PRIMARY KEY,
	RoomType nvarchar(255) NOT NULL,
	Notes nvarchar(max)
)

INSERT INTO RoomTypes (RoomType, Notes)
VALUES
	('single',NULL),
	('double',NULL),
	('apartment',NULL)

CREATE TABLE BedTypes
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	BedType nvarchar(255) NOT NULL, 
	Notes nvarchar(max)
)

INSERT INTO BedTypes (BedType, Notes)
VALUES
	('single-bed',NULL),
	('double-bed',NULL),
	('kids-bed',NULL)

CREATE TABLE Rooms
(
	RoomNumber int NOT NULL PRIMARY KEY IDENTITY, 
	RoomType int FOREIGN KEY (RoomType) REFERENCES RoomTypes(Id), 
	BedType int FOREIGN KEY (BedType) REFERENCES BedTypes(Id), 
	Rate int, 
	RoomStatus int FOREIGN KEY (RoomStatus) REFERENCES RoomStatus(Id), 
	Notes nvarchar(max)
)

INSERT INTO Rooms (RoomType, BedType, Rate, RoomStatus, Notes)
VALUES
	(1,1,10,1,NULL),
	(2,2,9,2,NULL),
	(3,3,10,3,'Ne beshe chisteno!')

CREATE TABLE Payments
(
	Id int NOT NULL PRIMARY KEY IDENTITY, 
	EmployeeId int FOREIGN KEY(EmployeeId) REFERENCES Employees(Id), 
	PaymentDate date NOT NULL,
	AccountNumber int FOREIGN KEY (AccountNumber) REFERENCES Customers(AccountNumber), 
	FirstDateOccupied date NOT NULL, 
	LastDateOccupied date NOT NULL, 
	TotalDays int NOT NULL, 
	AmountCharged decimal(8,2) NOT NULL, 
	TaxRate decimal(8,2) NOT NULL, 
	TaxAmount decimal(8,2) NOT NULL,
	PaymentTotal decimal(8,2) NOT NULL, 
	Notes nvarchar(max)
)

INSERT INTO Payments (EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
VALUES
	(1,'2017-01-01',1,'2016-12-30','2017-01-01',3,100.59,20,20.59,121.18,NULL),
	(2,'2017-01-01',2,'2016-12-30','2017-01-01',5,150.90,20,30.80,220.59,'Verry good!'),
	(3,'2017-01-01',3,'2016-12-30','2017-01-01',7,180.18,20,36.59,198.99,'Pleasent!')

CREATE TABLE Occupancies
(
	Id int NOT NULL PRIMARY KEY IDENTITY, 
	EmployeeId int FOREIGN KEY (EmployeeId) REFERENCES Employees(Id), 
	DateOccupied date NOT NULL, 
	AccountNumber int FOREIGN KEY (AccountNumber) REFERENCES Customers(AccountNumber), 
	RoomNumber int FOREIGN KEY (RoomNumber) REFERENCES Rooms(RoomNumber), 
	RateApplied int, 
	PhoneCharge decimal(5,2) NOT NULL, 
	Notes nvarchar(max)
)

INSERT INTO Occupancies (EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
VALUES
	(1,'2017-01-01',1,1,10,50.20,NULL),
	(2,'2017-01-01',2,2,8,0.00,NULL),
	(3,'2017-01-01',3,3,NULL,0.00,NULL)