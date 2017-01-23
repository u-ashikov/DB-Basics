CREATE DATABASE Orders

CREATE TABLE Orders
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	ProductName nvarchar(50) NOT NULL,
	OrderDate date NOT NULL
)

INSERT INTO Orders (ProductName,OrderDate)
VALUES
	('Butter','2016-09-19 00:00:00'),
	('Milk','2016-09-30 00:00:00'),
	('Cheese','2016-09-04 00:00:00'),
	('Bread','2015-12-20 00:00:00'),
	('Tomatoes','2015-12-30 00:00:00')

SELECT
	o.ProductName AS product_name,
	CAST(o.OrderDate AS datetime) AS order_date,
	CAST(DATEADD(DAY,3,o.OrderDate) AS datetime) AS pay_due,
	CAST(DATEADD(MONTH,1,o.OrderDate) AS datetime) AS deliver_due
	FROM Orders AS o