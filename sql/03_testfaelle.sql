-- ============================================================
-- Projekt: Buchausleih-Anwendung – Data-Mart-Erstellung in SQL
-- Phase 2: Testfälle
-- DBMS: MySQL
-- ============================================================

USE buchausleihe_db;

-- ============================================================
-- TESTFALL 1: Anzahl der Buchangebote pro Benutzer
-- ============================================================
-- Ziel:
-- Ermittlung der Anzahl der Buchangebote je Benutzer.
-- Benutzer ohne Buchangebot sollen ebenfalls berücksichtigt
-- werden.
--
-- Erwartetes Ergebnis:
-- Jeder Benutzer wird genau einmal angezeigt.
-- Benutzer ohne Buchangebot erhalten den Wert 0.
-- ============================================================
SELECT
    b.Benutzer_ID,
    b.Vorname,
    b.Nachname,
    COUNT(ba.Buchangebot_ID) AS Anzahl_Angebote
FROM BENUTZER b
LEFT JOIN BUCHANGEBOT ba
    ON b.Benutzer_ID = ba.Benutzer_ID
GROUP BY
    b.Benutzer_ID,
    b.Vorname,
    b.Nachname
ORDER BY Anzahl_Angebote DESC;

-- ============================================================
-- TESTFALL 2: Buchangebote mit optionalem Standort
-- ============================================================
-- Ziel:
-- Ermittlung aller Buchangebote mit Buchtitel und dem
-- zugeordneten Standort. Angebote ohne Standort werden
-- ebenfalls angezeigt.
--
-- Erwartetes Ergebnis:
-- Alle Buchangebote werden angezeigt. Ist einem Angebot
-- kein Standort zugeordnet, enthalten die Standortfelder NULL.
-- ============================================================
SELECT
    ba.Buchangebot_ID,
    b.Titel,
    s.PLZ,
    s.Ort
FROM BUCHANGEBOT ba
INNER JOIN BUCH b
    ON ba.Buch_ID = b.Buch_ID
LEFT JOIN STANDORT s
    ON ba.Standort_ID = s.Standort_ID
ORDER BY ba.Buchangebot_ID;

-- ============================================================
-- TESTFALL 3: Verfügbare Buchangebote
-- ============================================================
-- Ziel:
-- Ermittlung aller aktuell verfügbaren Buchangebote
-- einschließlich Buchtitel und Zustand des Exemplars.
--
-- Erwartetes Ergebnis:
-- Es werden ausschließlich Buchangebote angezeigt,
-- bei denen verfuegbar = 1 ist.
-- ============================================================
USE buchausleihe_db;
SELECT
    ba.Buchangebot_ID,
    b.Titel,
    ba.Zustand,
    ba.verfuegbar
FROM BUCHANGEBOT ba
INNER JOIN BUCH b
    ON ba.Buch_ID = b.Buch_ID
WHERE ba.verfuegbar = 1;

-- ============================================================
-- TESTFALL 4: Buchangebote mit Besitzer
-- ============================================================
-- Ziel:
-- Ermittlung aller Buchangebote mit dem zugehörigen Buch
-- und dem Benutzer, der das Angebot eingestellt hat.
--
-- Erwartetes Ergebnis:
-- Jedem Buchangebot wird genau ein Buch und genau ein
-- Besitzer zugeordnet.
-- ============================================================
SELECT
    ba.Buchangebot_ID,
    b.Titel,
    bz.Vorname,
    bz.Nachname
FROM BUCHANGEBOT ba
INNER JOIN BUCH b
    ON ba.Buch_ID = b.Buch_ID
INNER JOIN BENUTZER bz
    ON ba.Benutzer_ID = bz.Benutzer_ID;

-- ============================================================
-- TESTFALL 5: Bücher und Autoren
-- ============================================================
-- Ziel:
-- Ermittlung der Autoren, die den jeweiligen Büchern
-- zugeordnet sind. Die Zuordnung erfolgt über die
-- Brückentabelle BUCH_AUTOR.
--
-- Erwartetes Ergebnis:
-- Für jedes Buch werden die zugeordneten Autoren angezeigt.
-- ============================================================
SELECT
    b.Buch_ID,
    b.Titel,
    a.Vorname,
    a.Nachname
FROM BUCH b
INNER JOIN BUCH_AUTOR ba
    ON b.Buch_ID = ba.Buch_ID
INNER JOIN AUTOR a
    ON ba.Autor_ID = a.Autor_ID
ORDER BY b.Buch_ID;

-- ============================================================
-- TESTFALL 6: Bücher und Genres
-- ============================================================
-- Ziel:
-- Ermittlung der Genres, die den jeweiligen Büchern
-- zugeordnet sind. Die Zuordnung erfolgt über die
-- Brückentabelle BUCH_GENRE.
--
-- Erwartetes Ergebnis:
-- Für jedes Buch werden die zugeordneten Genres angezeigt.
-- Ein Buch kann dabei mehrfach erscheinen, wenn es mehreren
-- Genres zugeordnet ist.
-- ============================================================
SELECT
    b.Buch_ID,
    b.Titel,
    g.Genre_Name
FROM BUCH b
INNER JOIN BUCH_GENRE bg
    ON b.Buch_ID = bg.Buch_ID
INNER JOIN GENRE g
    ON bg.Genre_ID = g.Genre_ID
ORDER BY b.Buch_ID;

-- ============================================================
-- TESTFALL 7: Bücher und Verlage
-- ============================================================
-- Ziel:
-- Darstellung der Bücher mit dem jeweils zugeordneten Verlag.
--
-- Erwartetes Ergebnis:
-- Jedes Buch wird mit dem zugehörigen Verlag angezeigt.
-- ============================================================
SELECT
    b.Buch_ID,
    b.Titel,
    v.Verlag_Bezeichnung
FROM BUCH b
INNER JOIN VERLAG v
    ON b.Verlag_ID = v.Verlag_ID
ORDER BY b.Buch_ID;

-- ============================================================
-- TESTFALL 8: Ausleihanfragen mit Benutzer, Buch und Status
-- ============================================================
-- Ziel:
-- Darstellung aller Ausleihanfragen mit dem anfragenden
-- Benutzer, dem angefragten Buch und dem Status der Anfrage.
--
-- Erwartetes Ergebnis:
-- Jede Ausleihanfrage wird mit dem zugehörigen Benutzer,
-- Buchtitel und Status angezeigt.
-- ============================================================
SELECT
    aa.Anfrage_ID,
    bz.Vorname,
    bz.Nachname,
    b.Titel,
    aa.Status
FROM AUSLEIHANFRAGE aa
INNER JOIN BENUTZER bz
    ON aa.Benutzer_ID = bz.Benutzer_ID
INNER JOIN BUCHANGEBOT ba
    ON aa.Buchangebot_ID = ba.Buchangebot_ID
INNER JOIN BUCH b
    ON ba.Buch_ID = b.Buch_ID
ORDER BY aa.Anfrage_ID;

-- ============================================================
-- TESTFALL 9: Ausleihen mit Buch und Status
-- ============================================================
-- Ziel:
-- Darstellung aller tatsächlichen Ausleihen mit der
-- zugehörigen Ausleihanfrage, dem ausgeliehenen Buch
-- und dem aktuellen Ausleihstatus.
--
-- Erwartetes Ergebnis:
-- Jede Ausleihe wird genau einer Ausleihanfrage zugeordnet.
-- Zusätzlich werden der Buchtitel und der Status angezeigt.
-- ============================================================
SELECT
    a.Ausleihe_ID,
    aa.Anfrage_ID,
    b.Titel,
    a.Status
FROM AUSLEIHE a
INNER JOIN AUSLEIHANFRAGE aa
    ON a.Anfrage_ID = aa.Anfrage_ID
INNER JOIN BUCHANGEBOT ba
    ON aa.Buchangebot_ID = ba.Buchangebot_ID
INNER JOIN BUCH b
    ON ba.Buch_ID = b.Buch_ID
ORDER BY a.Ausleihe_ID;

-- ============================================================
-- TESTFALL 10: Bewertungen mit Buch und Bewerter
-- ============================================================
-- Ziel:
-- Darstellung der Bewertungen mit dem Namen des Bewerters,
-- dem bewerteten Buch und der vergebenen Punktzahl.
--
-- Erwartetes Ergebnis:
-- Jede Bewertung wird dem richtigen Benutzer und über die
-- zugehörige Ausleihe dem richtigen Buch zugeordnet.
-- ============================================================
SELECT
    bw.Bewertung_ID,
    bz.Vorname,
    bz.Nachname,
    b.Titel,
    bw.Bewertung_Punkte
FROM BEWERTUNG bw
INNER JOIN BENUTZER bz
    ON bw.Benutzer_ID = bz.Benutzer_ID
INNER JOIN AUSLEIHE a
    ON bw.Ausleihe_ID = a.Ausleihe_ID
INNER JOIN AUSLEIHANFRAGE aa
    ON a.Anfrage_ID = aa.Anfrage_ID
INNER JOIN BUCHANGEBOT ba
    ON aa.Buchangebot_ID = ba.Buchangebot_ID
INNER JOIN BUCH b
    ON ba.Buch_ID = b.Buch_ID
ORDER BY bw.Bewertung_ID;

-- ============================================================
-- TESTFALL 11: Angebotene Übergabearten je Buchangebot
-- ============================================================
-- Ziel:
-- Darstellung der für jedes Buchangebot verfügbaren
-- Übergabearten.
--
-- Erwartetes Ergebnis:
-- Ein Buchangebot kann mehrfach erscheinen, wenn mehrere
-- Übergabearten angeboten werden.
-- ============================================================
SELECT
    ba.Buchangebot_ID,
    b.Titel,
    ue.Uebergabeart
FROM BUCHANGEBOT ba
INNER JOIN BUCHANGEBOT_UEBERGABEART bu
    ON ba.Buchangebot_ID = bu.Buchangebot_ID
INNER JOIN UEBERGABEART ue
    ON bu.Uebergabe_ID = ue.Uebergabe_ID
INNER JOIN BUCH b
    ON ba.Buch_ID = b.Buch_ID
ORDER BY ba.Buchangebot_ID;

-- ============================================================
-- TESTFALL 12: Zeitslots pro Buchangebot
-- ============================================================
-- Ziel:
-- Darstellung der zu einem Buchangebot angebotenen
-- Zeitslots mit Datum, Startzeit und Endzeit.
--
-- Erwartetes Ergebnis:
-- Für jedes Buchangebot werden die zugehörigen Zeitslots
-- angezeigt.
-- ============================================================
SELECT
    ba.Buchangebot_ID,
    b.Titel,
    z.Datum,
    z.Startzeit,
    z.Endzeit
FROM BUCHANGEBOT ba
INNER JOIN ZEITSLOT z
    ON ba.Buchangebot_ID = z.Buchangebot_ID
INNER JOIN BUCH b
    ON ba.Buch_ID = b.Buch_ID
ORDER BY ba.Buchangebot_ID, z.Datum, z.Startzeit;

-- ============================================================
-- TESTFALL 13: Ausleihen nur aus angenommenen Anfragen
-- ============================================================
-- Ziel:
-- Prüfung, ob jede vorhandene Ausleihe aus einer
-- angenommenen Ausleihanfrage entstanden ist.
--
-- Erwartetes Ergebnis:
-- Die Abfrage sollte 0 Zeilen liefern.
-- ============================================================
SELECT
    aa.Anfrage_ID,
    aa.Status AS Anfrage_Status,
    a.Ausleihe_ID,
    a.Status AS Ausleihe_Status
FROM AUSLEIHANFRAGE aa
INNER JOIN AUSLEIHE a
    ON aa.Anfrage_ID = a.Anfrage_ID
WHERE aa.Status <> 'angenommen';

-- ============================================================
-- TESTFALL 14: CHECK-Constraint für Bewertung_Punkte
-- ============================================================
-- Ziel:
-- Prüfung, ob eine Bewertung mit einer ungültigen Punktzahl
-- von 6 durch die Datenbank verhindert wird.
--
-- Erwartetes Ergebnis:
-- Der INSERT-Befehl muss mit einer Fehlermeldung abgelehnt
-- werden, weil Bewertung_Punkte nur Werte von 1 bis 5
-- enthalten darf.
-- ============================================================
INSERT INTO BEWERTUNG (
    Ausleihe_ID,
    Benutzer_ID,
    Bewertung_Text,
    Bewertung_Punkte,
    Bewertungsdatum
)
VALUES (
    1,
    1,
    'Testbewertung',
    6,
    '2026-09-10'
);

-- ============================================================
-- TESTFALL 15: UNIQUE-Constraint für Anfrage_ID in AUSLEIHE
-- ============================================================
-- Ziel:
-- Prüfung, ob zu derselben Ausleihanfrage mehr als eine
-- Ausleihe angelegt werden kann.
--
-- Erwartetes Ergebnis:
-- Der INSERT-Befehl muss mit einer Fehlermeldung abgelehnt
-- werden, weil Anfrage_ID in AUSLEIHE eindeutig sein muss.
-- ============================================================
INSERT INTO AUSLEIHE (
    Anfrage_ID,
    Ausleihdatum,
    vereinbartes_Rueckgabedatum,
    tatsaechliches_Rueckgabedatum,
    Status
)
VALUES (
    1,
    '2026-09-10',
    '2026-09-20',
    NULL,
    'aktiv'
);

-- ============================================================
-- TESTFALL 16: Zeitslot gehört zum richtigen Buchangebot
-- ============================================================
-- Ziel:
-- Prüfung, ob ein ausgewählter Zeitslot tatsächlich
-- zum Buchangebot der jeweiligen Ausleihanfrage gehört.
--
-- Erwartetes Ergebnis:
-- Die Abfrage sollte 0 Zeilen liefern.
-- ============================================================
SELECT
    aa.Anfrage_ID,
    aa.Buchangebot_ID AS Anfrage_Buchangebot,
    aa.Zeitslot_ID,
    z.Buchangebot_ID AS Zeitslot_Buchangebot
FROM AUSLEIHANFRAGE aa
INNER JOIN ZEITSLOT z
    ON aa.Zeitslot_ID = z.Zeitslot_ID
WHERE aa.Buchangebot_ID <> z.Buchangebot_ID;
