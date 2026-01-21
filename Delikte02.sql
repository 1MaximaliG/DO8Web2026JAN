CREATE DATABASE Delikte02
GO

USE Delikte02

CREATE TABLE Delikt(
	DeliktID INT PRIMARY KEY,
	DeliktArt VARCHAR(50)
)
CREATE TABLE Dokument(
	DokumentID INT PRIMARY KEY,
	DokumentArt VARCHAR(50)
)
CREATE TABLE Bearbeiter(
	BearbeiterID INT PRIMARY KEY,
	BearbeiterName VARCHAR(50),
	Vorname VARCHAR(100)
)
CREATE TABLE Deliquent(
	DeliquentID INT PRIMARY KEY,
	Anrede VARCHAR(4),
	NachName VARCHAR(50),
	VorName VARCHAR(100),
	Adresse VARCHAR(100)
)
CREATE TABLE Vorgang(
VorgangsID INT PRIMARY KEY,
Datum DATE,
BearbeiterID INT 
	CONSTRAINT fk_Vorgang_Bearbeiter
	FOREIGN KEY
	REFERENCES Bearbeiter (BearbeiterID),
DeliquentID INT
	CONSTRAINT fk_Vorgang_Deliquent
	FOREIGN KEY
	REFERENCES Deliquent (DeliquentID)
)
CREATE TABLE VorgangDelikt(
VorgangsID INT,
DeliktID INT,
PRIMARY KEY (VorgangsID,DeliktID),
CONSTRAINT fk_VorgangDelikt_Vorgang 
	FOREIGN KEY (VorgangsID) 
	REFERENCES Vorgang (VorgangsID),
CONSTRAINT fk_VorgangDelikt_Delikt
	FOREIGN KEY (DeliktID)
	REFERENCES Delikt (DeliktID)
)
CREATE TABLE VorgangDokument(
VorgangsID INT FOREIGN KEY REFERENCES Vorgang (VorgangsID),
DokumentID INT FOREIGN KEY REFERENCES Dokument (DokumentID),
PRIMARY KEY (VorgangsID, DokumentID)
)
GO