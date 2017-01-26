CREATE TABLE Subjects
(
	SubjectID int IDENTITY,
	SubjectName varchar(250) NOT NULL,
	CONSTRAINT PK_Subjects PRIMARY KEY (SubjectID)
)

CREATE TABLE Majors
(
	MajorID int IDENTITY,
	Name varchar(100) NOT NULL,
	CONSTRAINT PK_Majors PRIMARY KEY (MajorID)
)

CREATE TABLE Students
(
	StudentID int IDENTITY,
	StudentNumber int NOT NULL UNIQUE,
	StudentName varchar(100) NOT NULL,
	MajorID int,
	CONSTRAINT PK_Students PRIMARY KEY (StudentID),
	CONSTRAINT FK_Students_Majors FOREIGN KEY (MajorID)
	REFERENCES Majors(MajorID)
)

CREATE TABLE Payments
(
	PaymentID int IDENTITY,
	PaymentDate date NOT NULL,
	PaymentAmount decimal(10,2) NOT NULL,
	StudentID int,
	CONSTRAINT PK_Payments PRIMARY KEY (PaymentID),
	CONSTRAINT FK_Payments_Students FOREIGN KEY (StudentID)
	REFERENCES Students(StudentID)
)

CREATE TABLE Agenda
(
	StudentID int NOT NULL,
	SubjectID int NOT NULL,
	CONSTRAINT PK_Agenda PRIMARY KEY (StudentID,SubjectID),
	CONSTRAINT FK_Agenda_Students FOREIGN KEY (StudentID)
	REFERENCES Students(StudentID),
	CONSTRAINT FK_Agenda_Subjects FOREIGN KEY (SubjectID)
	REFERENCES Subjects(SubjectID)
)