CREATE DATABASE SoftUni

USE SoftUni

CREATE TABLE Towns
(
	Id int NOT NULL IDENTITY PRIMARY KEY,
	Name nvarchar(50) NOT NULL
)

CREATE TABLE Addresses
(
	Id int NOT NULL PRIMARY KEY IDENTITY, 
	AddressText nvarchar(255), 
	TownId int FOREIGN KEY (TownId) REFERENCES Towns(Id)
)

ALTER TABLE Addresses
ALTER COLUMN AddressText nvarchar(255) NOT NULL

CREATE TABLE Departments
(
	Id int NOT NULL PRIMARY KEY IDENTITY, 
	Name nvarchar(100) NOT NULL
)

CREATE TABLE Employees
(
	Id int NOT NULL PRIMARY KEY IDENTITY, 
	FirstName nvarchar(50) NOT NULL, 
	MiddleName nvarchar(50) NOT NULL, 
	LastName nvarchar(50) NOT NULL, 
	JobTitle nvarchar(50) NOT NULL, 
	DepartmentId int FOREIGN KEY (DepartmentId) REFERENCES Departments(Id), 
	HireDate date NOT NULL, 
	Salary decimal	NOT NULL, 
	AddressId int FOREIGN KEY (AddressId) REFERENCES Addresses(Id)
)