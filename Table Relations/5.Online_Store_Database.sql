CREATE TABLE Cities
(
	CityID int IDENTITY,
	Name varchar(50) NOT NULL UNIQUE,
	CONSTRAINT PK_Cities PRIMARY KEY (CityID)
)

CREATE TABLE Customers
(
	CustomerID int IDENTITY,
	Name varchar(50) NOT NULL,
	Birthday date,
	CityID int,
	CONSTRAINT PK_Customers PRIMARY KEY (CustomerID),
	CONSTRAINT FK_Customers_Cities FOREIGN KEY(CityID)
	REFERENCES Cities(CityID)
)

CREATE TABLE ItemTypes
(
	ItemTypeID int IDENTITY,
	Name varchar(50) NOT NULL UNIQUE,
	CONSTRAINT PK_ItemTypes PRIMARY KEY (ItemTypeID)
)

CREATE TABLE Items
(
	ItemID int IDENTITY,
	Name varchar(50) NOT NULL,
	ItemTypeID int,
	CONSTRAINT PK_Items PRIMARY KEY (ItemID),
	CONSTRAINT FK_Items_ItemTypes FOREIGN KEY(ItemTypeID)
	REFERENCES ItemTypes(ItemTypeID)
)

CREATE TABLE Orders
(
	OrderID int IDENTITY,
	CustomerID int NOT NULL,
	CONSTRAINT PK_Orders PRIMARY KEY (OrderID),
	CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID)
	REFERENCES Customers(CustomerID)
)

CREATE TABLE OrderItems
(
	OrderID int NOT NULL,
	ItemID int NOT NULL,
	CONSTRAINT PK_OrderItems PRIMARY KEY (OrderID,ItemID),
	CONSTRAINT FK_OrderItems_Orders FOREIGN KEY (OrderID)
	REFERENCES Orders(OrderID),
	CONSTRAINT FK_OrderItems_Items FOREIGN KEY (ItemID)
	REFERENCES Items(ItemID)
)