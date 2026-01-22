-- Nutzen Sie die ProjektDB-Datenbank, um die folgenden
-- Aufgaben zu lösen

USE ProjektDB
-- Aufgabe 6.1
--
-- Schreiben Sie eine Abfrage, die alle Mitarbeiter aus der 
-- Abteilung a4 ausgibt. Geben Sie die Felder vorname, nachname
-- und Abteilungsname aus.
--
--      vorname  nachname  bezeichnung
--      Klaus    Wolf      Einkauf
--      Ursula   Richter   Einkauf
--      Dirk     Fuchs     Einkauf
--      Anke     Vogel     Einkauf
SELECT vorname, nachname, bezeichnung
FROM Mitarbeiter ma
INNER JOIN Abteilung a ON ma.abt_id = a.id
WHERE abt_id = 'a4';

-- Aufgabe 6.2
--
-- Schreiben Sie eine Abfrage, die alle Projekte mit den 
-- zugehörigen Projektleitern ausgibt. Geben Sie alle Daten 
-- aus der Projekt-Tabelle und zusätzlich Id und Einstell-
-- Datum aus der Arbeit-Tabelle aus. Sortieren Sie das
-- Ergebnis nach der Projekt-ID.
--
--      id  bezeichnung  mittel     kd_id  mit_id  einst_dat
--      p1  Apollo       120000,00  3      10102   2018-10-01
--      p3  Merkur       186500,00  1      2581    2019-10-15
--      p4  Pluto        88500,00   4      5765    2018-07-20
--      p5  Ariane       165000,00  2      22222   2019-01-01
SELECT id, bezeichnung, mittel, kd_id, mit_id, einst_dat
FROM Projekt p
INNER JOIN Arbeit a ON p.id = a.pro_id
WHERE aufgabe = 'projektleiter'
ORDER BY pro_id;

-- Aufgabe 6.3
--
-- Verändern Sie die Abfrage aus Aufgabe 6.2, indem Sie statt der
-- Mitarbeiter-Id den Nachnamen des Mitarbeiters in das Ergebnis 
-- einbauen.
--
--      id  bezeichnung  mittel     kd_id  nachname  einst_dat
--      p1  Apollo       120000,00  3      Huber     2018-10-01
--      p3  Merkur       186500,00  1      Kaufmann  2019-10-15
--      p4  Pluto        88500,00   4      Schäfer   2018-07-20
--      p5  Ariane       165000,00  2      Vogel     2019-01-01
SELECT Projekt.*,Mitarbeiter.nachname,Arbeit.einst_dat
FROM Projekt
INNER JOIN Arbeit ON Projekt.id = Arbeit.pro_id
INNER JOIN Mitarbeiter ON Arbeit.mit_id = Mitarbeiter.id
WHERE Arbeit.aufgabe = 'projektleiter'
ORDER BY pro_id;

-- Aufgabe 6.4
--
-- Erweitern Sie die Abfrage aus Aufgabe 6.3, indem Sie zusätzlich
-- die Bezeichnung der Abteilung in das Ergebnis einbauen.
--
--      id  bezeichnung  mittel     kd_id  nachname  einst_dat   bezeichnung
--      p1  Apollo       120000,00  3      Huber     2018-10-01  Freigabe
--      p3  Merkur       186500,00  1      Kaufmann  2019-10-15  Diagnose
--      p4  Pluto        88500,00   4      Schäfer   2018-07-20  Freigabe
--      p5  Ariane       165000,00  2      Vogel     2019-01-01  Einkauf
SELECT Projekt.*,Mitarbeiter.nachname,Arbeit.einst_dat, Abteilung.bezeichnung
FROM Projekt
INNER JOIN Arbeit ON Projekt.id = Arbeit.pro_id
INNER JOIN Mitarbeiter ON Arbeit.mit_id = Mitarbeiter.id
INNER JOIN Abteilung ON Mitarbeiter.abt_id = Abteilung.id
WHERE Arbeit.aufgabe = 'projektleiter'
ORDER BY pro_id;

-- Aufgabe 6.5
--
-- Erstellen Sie eine Abfrage, die die Mitarbeiter mit allen
-- zusätzlichen Informationen zu Abteilung, Gehalt, Arbeit und 
-- Projekt ausgibt. Geben Sie dabei keine Spalten doppelt im 
-- Ergebnis aus.
--
--      id     nachname  vorname   abt_id  stadt       bezeichnung  stadt      gehalt   aufgabe         einst_dat   bezeichnung  kd_id
--      2581   Kaufmann  Brigitte  a2      NULL        Diagnose     München    3000,00  Projektleiter   2019-10-15  Merkur       1
--      5765   Schäfer   Sabine    a3      Landshut    Freigabe     Stuttgart  4500,00  Projektleiter   2018-07-20  Pluto        4
--      9031   Meier     Rainer    a2      NULL        Diagnose     München    4000,00  Gruppenleiter   2019-04-15  Apollo       3
--      9031   Meier     Rainer    a2      NULL        Diagnose     München    4000,00  Sachbearbeiter  2018-11-15  Merkur       1
--      9912   Wolf      Klaus     a4      Heidenheim  Einkauf      München    3500,00  Sachbearbeiter  2019-01-17  Ariane       2
--      10102  Huber     Petra     a3      Landshut    Freigabe     Stuttgart  3500,00  Projektleiter   2018-10-01  Apollo       3
--      ...
--      (20 Zeilen)

SELECT Mitarbeiter.*,Abteilung.bezeichnung,Abteilung.stadt,Gehalt.gehalt,Arbeit.aufgabe, Arbeit.einst_dat,Projekt.bezeichnung,Projekt.kd_id
FROM Mitarbeiter
INNER JOIN Abteilung ON Mitarbeiter.abt_id = Abteilung.id
INNER JOIN Gehalt ON Mitarbeiter.id = Gehalt.mit_id
INNER JOIN Arbeit ON Mitarbeiter.id = Arbeit.mit_id
INNER JOIN Projekt ON Arbeit.pro_id = Projekt.id;


-- Aufgabe 6.6
--
-- Geben Sie für die Projekte die mit "A" beginnen die unten
-- gezeigten Informationen aus. Sortieren Sie die Ausgabe 
-- nach dem Projektnamen aufsteigend und der Mitarbeiter-Id 
-- absteigend.
--
--      bezeichnung  firma                    mit_id  aufgabe
--      Apollo       Frankreich-Reisen GmbH   29346   Sachbearbeiter
--      Apollo       Frankreich-Reisen GmbH   28559   NULL
--      Apollo       Frankreich-Reisen GmbH   17000   NULL
--      Apollo       Frankreich-Reisen GmbH   10102   Projektleiter
--      Apollo       Frankreich-Reisen GmbH   9031    Gruppenleiter
--      Ariane       Technische Produkte oHG  22222   Projektleiter
--      Ariane       Technische Produkte oHG  17000   NULL
--      Ariane       Technische Produkte oHG  9912    Sachbearbeiter 

SELECT p.bezeichnung, k.firma, a.mit_id,a.aufgabe
FROM Arbeit a 
INNER JOIN Projekt p ON a.pro_id = p.id
INNER JOIN Kunde k ON p.kd_id = k.id
WHERE p.bezeichnung LIKE 'A%'
ORDER BY p.bezeichnung,a.mit_id DESC;

-- Aufgabe 6.7
--
-- Finden Sie Namen und Vornamen aller Mitarbeiter, 
-- die im Projekt Merkur arbeiten.
--
--      nachname  vorname
--      Kaufmann  Brigitte            
--      Meier     Rainer              
--      Huber     Petra 
--      Schubert  Rolf

SELECT nachname,vorname
FROM Mitarbeiter mi
INNER JOIN Arbeit a ON mi.id = a.mit_id
INNER JOIN Projekt p ON a.pro_id = p.id
WHERE p.bezeichnung = 'MERKUR';

-- Aufgabe 6.8
--
-- Nennen Sie Namen und Vornamen aller Projektleiter, deren 
-- Abteilung den Standort München hat.
--
--      nachname  vorname
--      Kaufmann  Brigitte
--      Vogel     Anke

SELECT nachname, vorname
FROM Mitarbeiter mit
INNER JOIN Arbeit a ON a.mit_id = mit.id
INNER JOIN Abteilung abt ON abt.id = mit.abt_id
WHERE aufgabe = 'Projektleiter' AND abt.stadt = 'München';
