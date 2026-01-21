CREATE DATABASE Bestellung01;
GO --das USE und gleichzeitiges CREATE DB in einem Batch funktioniert nicht
--desshalb führen wir das CREATE mit dem GO aus um dannach das USE zu verwenden
USE Bestellung01
CREATE TABLE Kunde(
KundenNr INT PRIMARY KEY,
KundenName VARCHAR(100)
)

CREATE TABLE Bestellung(
BestellNr INT PRIMARY KEY,
Datum DATE,
Kunde INT CONSTRAINT fk_Bestellung_Kunde FOREIGN KEY REFERENCES Kunde (KundenNr)
)
CREATE TABLE Einzelposition(
PositionsNr INT NOT NULL,
BestellNr INT NOT NULL,
ArtikelNr INT,
Anzahl INT,
CONSTRAINT fk_Einzelposition_Bestellung 
	FOREIGN KEY (BestellNr) REFERENCES Bestellung (BestellNr),
PRIMARY KEY (PositionsNr, BestellNr)
)
CREATE TABLE Artikel(
ArtikelNr INT PRIMARY KEY,
Artikelbezeichnung VARCHAR(100)
)
ALTER TABLE Einzelposition
ADD CONSTRAINT fk_Einzelposition_Artikel 
	FOREIGN KEY (ArtikelNr) 
	REFERENCES Artikel (ArtikelNr)
GO