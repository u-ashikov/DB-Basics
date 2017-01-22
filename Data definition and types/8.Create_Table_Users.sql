CREATE TABLE People
(
	Id bigint UNIQUE IDENTITY,
	Username varchar(30) UNIQUE NOT NULL,
	Password varchar(26) NOT NULL,
	ProfilePicture binary(900),
	LastLoginTime date,
	IsDeleted char(6) CHECK(IsDeleted IN ('true','false'))
)

ALTER TABLE People
ADD CONSTRAINT PK_UserId
PRIMARY KEY (Id)

ALTER TABLE People
ALTER COLUMN ProfilePicture image

ALTER TABLE People
ALTER COLUMN IsDeleted char(6)


INSERT INTO People (Username,Password,ProfilePicture,LastLoginTime,IsDeleted)
VALUES 
	('pesho','asd',NULL,'1993-01-01','true'),
	('kiro','123',NULL,'1993-01-02','false'),
	('gergan','asd1',NULL,'1993-01-03','true'),
	('kolio','asdasd',NULL,NULL,'true'),
	('kaizera','aa1234',NULL,'1993-01-05','false')