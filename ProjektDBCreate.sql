IF DB_ID('ProjektDB') IS NOT NULL
BEGIN
	USE master 
	DROP DATABASE ProjektDB
END
GO
SET DATEFORMAT dmy;

CREATE DATABASE ProjektDB;
GO

USE ProjektDB;
GO

CREATE TABLE Abteilung (
abt_nr CHAR(4)		NOT NULL,
abt_name CHAR(20)	NOT NULL,
stadt CHAR(15)			NULL,
CONSTRAINT pk_abteilung PRIMARY KEY (abt_nr)
)

CREATE TABLE Projekt (
pr_nr CHAR(4)		NOT NULL,
pr_name CHAR(20)	NOT NULL,
mittel INTEGER		NOT NULL,
CONSTRAINT pk_projekt PRIMARY KEY (pr_nr)
)

CREATE TABLE Mitarbeiter (
m_nr INTEGER		NOT NULL,
m_name CHAR(20)		NOT NULL,
m_vorname CHAR(20)	NOT NULL,
abt_nr CHAR(4)		NOT NULL,
CONSTRAINT pk_mitarbeiter PRIMARY KEY (m_nr),
CONSTRAINT fk_mitarbeiter_abteilung FOREIGN KEY (abt_nr) REFERENCES Abteilung(abt_nr) 
)

CREATE TABLE Arbeiten (
m_nr INTEGER		NOT NULL,
pr_nr CHAR(4)		NOT NULL,
aufgabe CHAR(50)	NULL,
einst_dat DATE		NULL,
CONSTRAINT pk_arbeiten PRIMARY KEY (m_nr, pr_nr),
CONSTRAINT fk_arbeiten_mitarbeiter FOREIGN KEY (m_nr) REFERENCES Mitarbeiter(m_nr), 
CONSTRAINT fk_arbeiten_projekt FOREIGN KEY (pr_nr) REFERENCES Projekt(pr_nr) 
)


INSERT INTO Projekt Values
('p1', 'Apollo', 120000),
('p2', 'Gemini', 95000),
('p3', 'Merkur', 186500)

INSERT INTO Abteilung values
('a1', 'Beratung', 'München'),
('a2','Diagnose', 'München'),
('a3', 'Freigabe','Stuttgart')

INSERT INTO Mitarbeiter values
(25348, 'Keller', 'Hans', 'a3'),
(10102, 'Huber', 'Petra', 'a3'),
(18316, 'Müller', 'Gabriela', 'a1'),
(29346, 'Probst', 'Andreas', 'a2'),
(9031, 'Meier', 'Rainer', 'a2'),
(2581, 'Kaufmann', 'Brigitte', 'a2'),
(28559, 'Mozer', 'Sibille', 'a1')

INSERT INTO Arbeiten values 
(10102,'p1', 'Projektleiter','01.10.2018'),
(10102, 'p3', 'Gruppenleiter', '01.01.2019'),
(25348, 'p2', 'Sachbearbeiter', '15.02.2018'),
(18316, 'p2',NULL,'01.06.2019'),
(29346, 'p2', NULL, '15.12.2017'),
(2581, 'p3', 'Projektleiter', '15.10.2019'),
(9031, 'p1', 'Gruppenleiter', '15.04.2019'),
(28559, 'p1', NULL, '15.04.2019'),
(28559, 'p2', 'Sachbearbeiter', '01.02.2018'),
(9031, 'p3', 'Sachbearbeiter', '15.11.2018'),
(29346, 'p1', 'Sachbearbeiter', '01.04.2019')