ALTER TABLE Minions
ADD CONSTRAINT FK_TownId FOREIGN KEY (TownId)
REFERENCES Towns(Id)

INSERT INTO Towns
VALUES ('Sofia'), ('Plovdiv'), ('Varna')

INSERT INTO Minions
VALUES ('Kevin',22,1), ('Bob',15,3), ('Steward',NULL,2)
