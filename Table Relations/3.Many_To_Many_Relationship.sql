CREATE TABLE Students
(
	StudentID int IDENTITY,
	Name varchar(50) NOT NULL,
	CONSTRAINT PK_StudentId PRIMARY KEY(StudentID)
)

INSERT INTO Students (Name)
VALUES
		('Mila'),
		('Toni'),
		('Ron')

CREATE TABLE Exams
(
	ExamID int IDENTITY(101,1),
	Name nvarchar(50) NOT NULL,
	CONSTRAINT PK_ExamId PRIMARY KEY(ExamID)
)

INSERT INTO Exams(Name)
VALUES
		('SpringMVC'),
		('Neo4j'),
		('Oracle 11g')

CREATE TABLE [StudentsExams]
(
	StudentID int,
	ExamID int,
	CONSTRAINT PK_StudentsExams PRIMARY KEY(StudentID,ExamID),
	CONSTRAINT FK_StudentsExams_Students FOREIGN KEY(StudentID)
	REFERENCES Students(StudentID),
	CONSTRAINT FK_StudentsExams_Exams FOREIGN KEY(ExamID)
	REFERENCES Exams(ExamID)
)

INSERT INTO [StudentsExams]
VALUES
		(1,101),
		(1,102),
		(2,101),
		(3,103),
		(2,102),
		(2,103)

SELECT * 
	FROM Students AS s
	INNER JOIN [StudentsExams] AS se
	ON se.StudentID = s.StudentID
	INNER JOIN Exams AS e
	ON se.ExamID = e.ExamID