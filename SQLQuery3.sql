CREATE DATABASE Getraenkebestellung03
GO
USE Getraenkebestellung03

CREATE TABLE Artikel(
ArtikelID INT PRIMARY KEY,
Bezeichnung VARCHAR(50)
)
CREATE TABLE Lieferant(
LieferantID INT PRIMARY KEY,
Firma VARCHAR(50),
StraßeHausNr VARCHAR(100),
Plz VARCHAR(10),
Ort VARCHAR(100)
)
CREATE TABLE Lieferant_Artikel(
LieferantID INT,
ArtikelID INT,
PRIMARY KEY (LieferantID, ArtikelID),
Einzelpreis DECIMAL(10,2),
CONSTRAINT LieferArtikel_Lieferant FOREIGN KEY (LieferantID)
	REFERENCES Lieferant (LieferantID),
CONSTRAINT LieferArtikel_Artikel FOREIGN KEY (ArtikelID)
	REFERENCES Artikel (ArtikelID)
)

CREATE TABLE BestellPosition(
BestellungID INT,
ArtikelID INT,
Menge INT
PRIMARY KEY(BestellungID, ArtikelID),
CONSTRAINT Bestellposition_Artikel FOREIGN KEY (ArtikelID)
	REFERENCES Artikel (ArtikelID)
)
CREATE TABLE Bestellung(
BestellungID INT PRIMARY KEY,
Datum DATE,
LieferantID INT FOREIGN KEY REFERENCES Lieferant (LieferantID)
)

ALTER TABLE BestellPosition
ADD 
--CONSTRAINT FK_Position_Bestellung
	FOREIGN KEY (BestellungID) 
	REFERENCES Bestellung (BestellungID)

GO