-- Nutzen Sie die Datenbank ProjektDB, 
-- um die folgenden Aufgaben zu l�sen

USE ProjektDB
-- Aufgabe 3.1
--
-- Finden Sie Namen und Personalnummer aller Mitarbeiter, 
-- deren Name mit dem Buchstaben "K" beginnt.
--
--      nachname  id
--      Kaufmann  2581
--      Kr�ger    17000
--      Keller    25348

SELECT nachname, id
FROM Mitarbeiter
WHERE nachname LIKE 'k%';

-- Aufgabe 3.2
--
-- Nennen Sie Namen, Vornamen und Id aller Mitarbeiter, 
-- deren Vorname als zweiten Buchstaben ein "a" hat.
--
--      nachname  vorname   id
--      Sch�fer   Sabine    5765
--      Meier     Rainer    9031
--      Kr�ger    Martin    17000
--      M�ller    Gabriele  18316
--      Keller    Hans      25348

SELECT nachname, vorname , id 
FROM Mitarbeiter
WHERE vorname LIKE '_a%';

-- Aufgabe 3.3
--
-- Finden Sie Abteilungs-Id und Standort aller Abteilungen, die 
-- sich in den Orten befinden, die mit einem Buchstaben zwischen 
-- "N" und "Z" beginnen.
--
--      id  stadt
--      a3  Stuttgart
--      a5  Ulm

SELECt id,stadt
FROM Abteilung
WHERE stadt LIKE '[n-z]%';

-- Aufgabe 3.4
--
-- Finden Sie Id, Nachnamen und Vornamen aller Mitarbeiter, deren 
-- Namen nicht mit den Buchstaben K, L, M, N, O und P beginnen,
-- und deren Vornamen nicht mit dem Buchstaben U beginnen.
--
--      id     nachname  vorname
--      5765   Sch�fer   Sabine
--      9912   Wolf      Klaus
--      10102  Huber     Petra
--      20204  Fuchs     Dirk
--      22222  Vogel     Anke
--      24321  Schubert  Rolf
--      27365  Albrecht  Lena

SELECT id,vorname, nachname
FROM Mitarbeiter
WHERE nachname < 'k' OR nachname >= 'q' AND vorname NOT LIKE 'u%';
--WHERE nachname NOT LIKE '[k-p]%' AND vorname NOT LIKE 'u%';

-- Aufgabe 3.5
--
-- Nennen Sie Vor- und Nachname aller Mitarbeiter, deren Name 
-- nicht mit "er" endet.
--
--      vorname   nachname
--      Brigitte  Kaufmann
--      Klaus     Wolf
--      Dirk      Fuchs
--      Anke      Vogel
--      Rolf      Schubert
--      Lena      Albrecht
--      Andreas   Probst
SELECT vorname, nachname
FROM Mitarbeiter
--WHERE SUBSTRING(nachname,len(nachname)-1,2) NOT LIKE 'er';
WHERE nachname NOT LIKE '%er';

-- Aufgabe 3.6
--
-- Wie kann man nach dem Unterstrich (_) oder dem Prozentzeichen (%)
-- mit LIKE suchen? Finden Sie alle Kunden, in deren Datensatz ein 
-- solches Sonderzeichen vorkommt.
--
--      firma                  stadt
--      100% Sonderzeichen AG  Baden_Baden

SELECT firma, stadt
FROM Kunde
WHERE firma LIKE '%[_%]%' OR stadt LIKE '%[_%]%';

-- Aufgabe 3.7
--
-- Nennen Sie alle Mitarbeiter, deren Vorname mindestens 
-- drei Vokale enth�lt.
--
--      id     nachname  vorname   abt_id  stadt
--      2581   Kaufmann  Brigitte  a2      NULL
--      5765   Sch�fer   Sabine    a3      Landshut
--      9031   Meier     Rainer    a2      NULL
--      12121  Richter   Ursula    a4      M�nchen
--      18316  M�ller    Gabriele  a1      Rosenheim
--      28559  Mozer     Sibille   a1      Ulm
--      29346  Probst    Andreas   a2      Augsburg

SELECT *
FROM Mitarbeiter
--WHERE vorname LIKE '%[aeiou]%[aeiuo]%[aeiou]%';
WHERE (LEN (vorname)*5 - len (replace(vorname,'a',''))
		- len (replace(vorname, 'e',''))
		- len (replace(vorname, 'i',''))
		- len (replace(vorname, 'o',''))
		- len (replace(vorname, 'u','')))>=3;

-- Aufgabe 3.8
-- 
-- Finden Sie alle Mitarbeiter, deren Vorname aus genau sieben
-- Buchstaben besteht.
--
--      id     nachname  vorname  abt_id  stadt
--      28559  Mozer     Sibille  a1      Ulm
--      29346  Probst    Andreas  a2      Augsburg

SELECT *
FROM Mitarbeiter
WHERE vorname LIKE '_______';
--WHERE len(vorname) = 7;

-- Aufgabe 3.9
--
-- Finden Sie alle Mitarbeiter, deren Vorname aus genau sechs
-- Buchstaben besteht und deren Vorname nicht mit einem Vokal endet.
--
--      id     nachname  vorname  abt_id  stadt
--      9031   Meier     Rainer   a2      NULL
--      17000  Kr�ger    Martin   a5      Ulm

SELECT * 
FROM Mitarbeiter
--WHERE vorname NOT LIKE '%[aeiou]' AND Len(vorname) = 6;
WHERE vorname NOT LIKE '%[aeiou]' AND vorname LIKE '______';

-- Aufgabe 3.10
--
-- Finden Sie alle Mitarbeiter, bei deren Vorname der vorletzte
-- Buchstabe ein Vokal ist.
--
--      id     nachname  vorname  abt_id  stadt
--      9031   Meier     Rainer   a2      NULL
--      9912   Wolf      Klaus    a4      Heidenheim
--      17000  Kr�ger    Martin   a5      Ulm
--      29346  Probst    Andreas  a2      Augsburg

SELECT *
FROM Mitarbeiter
WHERE vorname LIKE '%[aeiuo]_';