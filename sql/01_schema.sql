-- ============================================================
-- Projekt: Buchausleih-Anwendung – Data-Mart-Erstellung in SQL
-- Phase 3: Finalisierte relationale Datenbank
-- Weiterentwicklung auf Basis des Tutorfeedbacks aus Phase 2
-- DBMS: MySQL
-- ============================================================

-- ------------------------------------------------------------
-- 1. Datenbank erstellen
-- ------------------------------------------------------------
DROP DATABASE IF EXISTS buchausleihe_db;
CREATE DATABASE buchausleihe_db;
USE buchausleihe_db;

-- ------------------------------------------------------------
-- 2. Tabellen erstellen
-- ------------------------------------------------------------
-- Tabelle BENUTZER
-- Speichert die registrierten Benutzer der Anwendung.
CREATE TABLE BENUTZER (
    Benutzer_ID INT AUTO_INCREMENT,
    Anrede VARCHAR(20),
    Vorname VARCHAR(100) NOT NULL,
    Nachname VARCHAR(100) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Telefonnummer VARCHAR(30),
    Passwort_Hash VARCHAR(255) NOT NULL,
    Rolle VARCHAR(20) NOT NULL,

    CONSTRAINT pk_benutzer
        PRIMARY KEY (Benutzer_ID),

    CONSTRAINT chk_benutzer_rolle
        CHECK (Rolle IN ('Benutzer', 'Administrator'))
);

-- Tabelle STANDORT
-- Speichert die möglichen Standorte der Benutzer und Buchangebote.
-- Die Koordinaten ermöglichen eine standortbasierte Umkreissuche.
CREATE TABLE STANDORT (
    Standort_ID INT AUTO_INCREMENT,
    Strasse VARCHAR(150) NOT NULL,
    Hausnummer VARCHAR(20) NOT NULL,
    PLZ VARCHAR(10) NOT NULL,
    Ort VARCHAR(100) NOT NULL,
    Breitengrad DECIMAL(9,6) NOT NULL,
    Laengengrad DECIMAL(9,6) NOT NULL,

    CONSTRAINT pk_standort
        PRIMARY KEY (Standort_ID)
);

-- Tabelle AUTOR
-- Speichert die Autoren der Bücher.
CREATE TABLE AUTOR (
    Autor_ID INT AUTO_INCREMENT,
    Vorname VARCHAR(100),
    Nachname VARCHAR(100) NOT NULL,

    CONSTRAINT pk_autor
        PRIMARY KEY (Autor_ID)
);

-- Tabelle GENRE
-- Speichert die verschiedenen Genres, denen Bücher zugeordnet werden können.
CREATE TABLE GENRE (
    Genre_ID INT AUTO_INCREMENT,
    Genre_Name VARCHAR(100) NOT NULL UNIQUE,

    CONSTRAINT pk_genre
        PRIMARY KEY (Genre_ID)
);

-- Tabelle VERLAG
-- Speichert die Verlage der Bücher.
CREATE TABLE VERLAG (
    Verlag_ID INT AUTO_INCREMENT,
    Verlag_Bezeichnung VARCHAR(150) NOT NULL UNIQUE,

    CONSTRAINT pk_verlag
        PRIMARY KEY (Verlag_ID)
);


-- Tabelle UEBERGABEART
-- Speichert die möglichen Arten der Übergabe eines Buches.
CREATE TABLE UEBERGABEART (
    Uebergabe_ID INT AUTO_INCREMENT,
    Uebergabeart VARCHAR(50) NOT NULL UNIQUE,

    CONSTRAINT pk_uebergabeart
        PRIMARY KEY (Uebergabe_ID)
);

-- Tabelle BUCH
-- Speichert die bibliografischen Angaben eines Buches.
-- Jedes Buch ist genau einem Verlag zugeordnet.
CREATE TABLE BUCH (
    Buch_ID INT AUTO_INCREMENT,
    Titel VARCHAR(255) NOT NULL,
    Erscheinungsjahr INT,
    Sprache VARCHAR(50) NOT NULL,
    Kurzbeschreibung TEXT,
    Verlag_ID INT NOT NULL,

    CONSTRAINT pk_buch
        PRIMARY KEY (Buch_ID),

    CONSTRAINT fk_buch_verlag
        FOREIGN KEY (Verlag_ID)
        REFERENCES VERLAG(Verlag_ID)
);

-- Tabelle BUCHANGEBOT
-- Speichert konkrete Buchangebote, die von Benutzern eingestellt werden.
-- Jedes Angebot gehört zu einem Benutzer und einem Buch.
-- Ein Standort ist optional, z. B. bei reinem Postversand.
CREATE TABLE BUCHANGEBOT (
    Buchangebot_ID INT AUTO_INCREMENT,
    Benutzer_ID INT NOT NULL,
    Buch_ID INT NOT NULL,
    Standort_ID INT,
    Zustand VARCHAR(50) NOT NULL,
    maximale_Ausleihdauer INT NOT NULL,
    Einstelldatum DATE NOT NULL,
    Beschreibung_zum_Exemplar TEXT,
    verfuegbar BOOLEAN NOT NULL,

    CONSTRAINT pk_buchangebot
        PRIMARY KEY (Buchangebot_ID),

    CONSTRAINT fk_buchangebot_benutzer
        FOREIGN KEY (Benutzer_ID)
        REFERENCES BENUTZER(Benutzer_ID),

    CONSTRAINT fk_buchangebot_buch
        FOREIGN KEY (Buch_ID)
        REFERENCES BUCH(Buch_ID),

    CONSTRAINT fk_buchangebot_standort
        FOREIGN KEY (Standort_ID)
        REFERENCES STANDORT(Standort_ID),

    CONSTRAINT chk_buchangebot_ausleihdauer
        CHECK (maximale_Ausleihdauer > 0)
);

-- Tabelle ZEITSLOT
-- Speichert die von einem Buchangebot angebotenen Zeitfenster
-- für die Übergabe eines Buches.
CREATE TABLE ZEITSLOT (
    Zeitslot_ID INT AUTO_INCREMENT,
    Buchangebot_ID INT NOT NULL,
    Datum DATE NOT NULL,
    Startzeit TIME NOT NULL,
    Endzeit TIME NOT NULL,

    CONSTRAINT pk_zeitslot
        PRIMARY KEY (Zeitslot_ID),

    CONSTRAINT fk_zeitslot_buchangebot
        FOREIGN KEY (Buchangebot_ID)
        REFERENCES BUCHANGEBOT(Buchangebot_ID),

    CONSTRAINT chk_zeitslot_zeit
        CHECK (Endzeit > Startzeit)
);

-- Tabelle AUSLEIHANFRAGE
-- Speichert Anfragen von Benutzern zur Ausleihe eines Buchangebots.
-- Jede Anfrage wählt eine Übergabeart.
-- Die Auswahl eines Zeitslots ist optional.
CREATE TABLE AUSLEIHANFRAGE (
    Anfrage_ID INT AUTO_INCREMENT,
    Benutzer_ID INT NOT NULL,
    Buchangebot_ID INT NOT NULL,
    Uebergabe_ID INT NOT NULL,
    Zeitslot_ID INT,
    gewuenschter_Start DATE NOT NULL,
    gewuenschtes_Ende DATE NOT NULL,
    Anfragedatum DATE NOT NULL,
    Status VARCHAR(20) NOT NULL,

    CONSTRAINT pk_ausleihanfrage
        PRIMARY KEY (Anfrage_ID),

    CONSTRAINT fk_anfrage_benutzer
        FOREIGN KEY (Benutzer_ID)
        REFERENCES BENUTZER(Benutzer_ID),

    CONSTRAINT fk_anfrage_buchangebot
        FOREIGN KEY (Buchangebot_ID)
        REFERENCES BUCHANGEBOT(Buchangebot_ID),

    CONSTRAINT fk_anfrage_uebergabeart
        FOREIGN KEY (Uebergabe_ID)
        REFERENCES UEBERGABEART(Uebergabe_ID),

    CONSTRAINT fk_anfrage_zeitslot
        FOREIGN KEY (Zeitslot_ID)
        REFERENCES ZEITSLOT(Zeitslot_ID),

    CONSTRAINT chk_anfrage_zeitraum
        CHECK (gewuenschtes_Ende >= gewuenschter_Start),

    CONSTRAINT chk_anfrage_status
        CHECK (Status IN ('offen', 'angenommen', 'abgelehnt'))
);

-- Tabelle AUSLEIHE
-- Speichert die tatsächlich zustande gekommenen Ausleihen.
-- Eine Ausleihe entsteht aus genau einer angenommenen Ausleihanfrage.
CREATE TABLE AUSLEIHE (
    Ausleihe_ID INT AUTO_INCREMENT,
    Anfrage_ID INT NOT NULL UNIQUE,
    Ausleihdatum DATE NOT NULL,
    vereinbartes_Rueckgabedatum DATE NOT NULL,
    tatsaechliches_Rueckgabedatum DATE,
    Status VARCHAR(20) NOT NULL,

    CONSTRAINT pk_ausleihe
        PRIMARY KEY (Ausleihe_ID),

    CONSTRAINT fk_ausleihe_anfrage
        FOREIGN KEY (Anfrage_ID)
        REFERENCES AUSLEIHANFRAGE(Anfrage_ID),

    CONSTRAINT chk_ausleihe_rueckgabe
        CHECK (vereinbartes_Rueckgabedatum >= Ausleihdatum),

    CONSTRAINT chk_ausleihe_status
        CHECK (Status IN ('aktiv', 'abgeschlossen'))
);

-- Tabelle BEWERTUNG
-- Speichert Bewertungen, die Benutzer zu abgeschlossenen Ausleihen abgeben.
-- Ein Benutzer darf dieselbe Ausleihe nur einmal bewerten.
CREATE TABLE BEWERTUNG (
    Bewertung_ID INT AUTO_INCREMENT,
    Ausleihe_ID INT NOT NULL,
    Benutzer_ID INT NOT NULL,
    Bewertung_Text TEXT,
    Bewertung_Punkte INT NOT NULL,
    Bewertungsdatum DATE NOT NULL,

    CONSTRAINT pk_bewertung
        PRIMARY KEY (Bewertung_ID),

    CONSTRAINT fk_bewertung_ausleihe
        FOREIGN KEY (Ausleihe_ID)
        REFERENCES AUSLEIHE(Ausleihe_ID),

    CONSTRAINT fk_bewertung_benutzer
        FOREIGN KEY (Benutzer_ID)
        REFERENCES BENUTZER(Benutzer_ID),

    CONSTRAINT uq_bewertung_ausleihe_benutzer
        UNIQUE (Ausleihe_ID, Benutzer_ID),

    CONSTRAINT chk_bewertung_punkte
        CHECK (Bewertung_Punkte BETWEEN 1 AND 5)
);

-- ------------------------------------------------------------
-- Brückentabellen für n:m-Beziehungen
-- ------------------------------------------------------------
-- Tabelle BENUTZER_STANDORT
-- Verknüpft Benutzer mit ihren möglichen Standorten.
CREATE TABLE BENUTZER_STANDORT (
    Benutzer_ID INT NOT NULL,
    Standort_ID INT NOT NULL,

    CONSTRAINT pk_benutzer_standort
        PRIMARY KEY (Benutzer_ID, Standort_ID),

    CONSTRAINT fk_benutzer_standort_benutzer
        FOREIGN KEY (Benutzer_ID)
        REFERENCES BENUTZER(Benutzer_ID),

    CONSTRAINT fk_benutzer_standort_standort
        FOREIGN KEY (Standort_ID)
        REFERENCES STANDORT(Standort_ID)
);


-- Tabelle BUCH_AUTOR
-- Löst die n:m-Beziehung zwischen Büchern und Autoren auf.
CREATE TABLE BUCH_AUTOR (
    Buch_ID INT NOT NULL,
    Autor_ID INT NOT NULL,

    CONSTRAINT pk_buch_autor
        PRIMARY KEY (Buch_ID, Autor_ID),

    CONSTRAINT fk_buch_autor_buch
        FOREIGN KEY (Buch_ID)
        REFERENCES BUCH(Buch_ID),

    CONSTRAINT fk_buch_autor_autor
        FOREIGN KEY (Autor_ID)
        REFERENCES AUTOR(Autor_ID)
);


-- Tabelle BUCH_GENRE
-- Löst die n:m-Beziehung zwischen Büchern und Genres auf.
CREATE TABLE BUCH_GENRE (
    Buch_ID INT NOT NULL,
    Genre_ID INT NOT NULL,

    CONSTRAINT pk_buch_genre
        PRIMARY KEY (Buch_ID, Genre_ID),

    CONSTRAINT fk_buch_genre_buch
        FOREIGN KEY (Buch_ID)
        REFERENCES BUCH(Buch_ID),

    CONSTRAINT fk_buch_genre_genre
        FOREIGN KEY (Genre_ID)
        REFERENCES GENRE(Genre_ID)
);


-- Tabelle BUCHANGEBOT_UEBERGABEART
-- Löst die n:m-Beziehung zwischen Buchangeboten
-- und möglichen Übergabearten auf.
CREATE TABLE BUCHANGEBOT_UEBERGABEART (
    Buchangebot_ID INT NOT NULL,
    Uebergabe_ID INT NOT NULL,

    CONSTRAINT pk_buchangebot_uebergabeart
        PRIMARY KEY (Buchangebot_ID, Uebergabe_ID),

    CONSTRAINT fk_buchangebot_uebergabeart_angebot
        FOREIGN KEY (Buchangebot_ID)
        REFERENCES BUCHANGEBOT(Buchangebot_ID),

    CONSTRAINT fk_buchangebot_uebergabeart_art
        FOREIGN KEY (Uebergabe_ID)
        REFERENCES UEBERGABEART(Uebergabe_ID)
);

SHOW TABLES;
-- Kontrolle der Tabellenstruktur
-- Zeigt Spalten, Datentypen, NULL-Regeln, Schlüssel und AUTO_INCREMENT
-- für alle Tabellen der Projektdatenbank.

SELECT
    TABLE_NAME,
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'buchausleihe_db'
ORDER BY TABLE_NAME, CONSTRAINT_TYPE, CONSTRAINT_NAME;

-- ============================================================
-- TRIGGER ZUR ABSICHERUNG VON GESCHÄFTSREGELN
-- ============================================================

DELIMITER $$


-- ------------------------------------------------------------
-- Trigger 1:
-- Eine neue Ausleihe darf nur aus einer angenommenen
-- Ausleihanfrage entstehen.
-- ------------------------------------------------------------

CREATE TRIGGER trg_ausleihe_nur_angenommene_anfrage
BEFORE INSERT ON AUSLEIHE
FOR EACH ROW
BEGIN
    DECLARE v_status VARCHAR(20);

    SELECT Status
    INTO v_status
    FROM AUSLEIHANFRAGE
    WHERE Anfrage_ID = NEW.Anfrage_ID;

    IF v_status <> 'angenommen' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'Ausleihe nicht möglich: Die Ausleihanfrage ist nicht angenommen.';
    END IF;
END$$


-- ------------------------------------------------------------
-- Trigger 2:
-- Bei einer neuen Ausleihanfrage muss ein ausgewählter
-- Zeitslot zum Buchangebot der Anfrage gehören.
-- ------------------------------------------------------------

CREATE TRIGGER trg_zeitslot_passend_zum_buchangebot
BEFORE INSERT ON AUSLEIHANFRAGE
FOR EACH ROW
BEGIN
    DECLARE v_buchangebot_id INT;

    IF NEW.Zeitslot_ID IS NOT NULL THEN

        SELECT Buchangebot_ID
        INTO v_buchangebot_id
        FROM ZEITSLOT
        WHERE Zeitslot_ID = NEW.Zeitslot_ID;

        IF v_buchangebot_id <> NEW.Buchangebot_ID THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
                'Zeitslot nicht möglich: Der Zeitslot gehört zu einem anderen Buchangebot.';
        END IF;

    END IF;
END$$


-- ------------------------------------------------------------
-- Trigger 3:
-- Auch bei einer Änderung einer Ausleihe muss die zugehörige
-- Ausleihanfrage den Status 'angenommen' besitzen.
-- ------------------------------------------------------------

CREATE TRIGGER trg_ausleihe_nur_angenommene_anfrage_update
BEFORE UPDATE ON AUSLEIHE
FOR EACH ROW
BEGIN
    DECLARE v_status VARCHAR(20);

    SELECT Status
    INTO v_status
    FROM AUSLEIHANFRAGE
    WHERE Anfrage_ID = NEW.Anfrage_ID;

    IF v_status <> 'angenommen' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'Ausleihe nicht möglich: Die Ausleihanfrage ist nicht angenommen.';
    END IF;
END$$


-- ------------------------------------------------------------
-- Trigger 4:
-- Auch bei einer Änderung einer Ausleihanfrage muss ein
-- ausgewählter Zeitslot zum Buchangebot der Anfrage gehören.
-- ------------------------------------------------------------

CREATE TRIGGER trg_zeitslot_passend_zum_buchangebot_update
BEFORE UPDATE ON AUSLEIHANFRAGE
FOR EACH ROW
BEGIN
    DECLARE v_buchangebot_id INT;

    IF NEW.Zeitslot_ID IS NOT NULL THEN

        SELECT Buchangebot_ID
        INTO v_buchangebot_id
        FROM ZEITSLOT
        WHERE Zeitslot_ID = NEW.Zeitslot_ID;

        IF v_buchangebot_id <> NEW.Buchangebot_ID THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
                'Zeitslot nicht möglich: Der Zeitslot gehört zu einem anderen Buchangebot.';
        END IF;

    END IF;
END$$


DELIMITER ;

SHOW TABLES;
SHOW TRIGGERS;