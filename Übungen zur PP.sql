--Abfrangen an ProjektDB
USE ProjektDB
--SELECT *
--FROM Mitarbeiter
--ORDER BY abt_nr ASC, m_nr DESC;

--SELECT COUNT(*) AS Anzahl
--FROM Mitarbeiter
--GROUP BY abt_nr;

--SELECT Distinct aufgabe
--FROM Arbeiten
--ORDER BY aufgabe DESC

--SELECT SUM(mittel) AS Budget
--FROM Projekt

--SELECT MIN(mittel) AS Kleinstes
--FROM Projekt


--SELECT AVG(mittel) AS Durchschnitt
--FROM Projekt

--ADD Umstäze

--SELECT m_nr AS Mitarbeiter, SUM(umsatz) AS Umsätze 
--FROM Umsatz
--GROUP BY m_nr;


--SELECT m_nr AS Mitarbeiter, SUM(umsatz) AS Umsätze 
--FROM Umsatz
--GROUP BY m_nr
--HAVING SUM(umsatz) >=100000;

--SELECT  * 
--FROM Umsatz
--ORDER BY m_nr;

--SubSelect in der SELECT anweisung
--SELECT m_vorname, m_name,(
--							SELECT abt_name
--							FROM Abteilung a
--							WHERE a.abt_nr = mi.abt_nr
--							)AS bezeichnung
--FROM Mitarbeiter mi;

--SubSelect in der WHERE anweisung
--SELECT *
--FROM Mitarbeiter
--WHERE abt_nr IN (
--				SELECT abt_nr
--				FROM Abteilung
--				WHERE stadt = 'München'
--);

SELECT * 
FROM Mitarbeiter m1
WHERE m_nr > (
		SELECT MIN(m_nr) FROM Mitarbeiter m2
		WHERE m2.abt_nr = m1.abt_nr);