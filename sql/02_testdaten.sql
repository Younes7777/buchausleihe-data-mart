-- ============================================================
-- Projekt: Buchausleih-Anwendung – Data-Mart-Erstellung in SQL
-- Phase 2: Testdaten
-- DBMS: MySQL
-- ============================================================

-- ------------------------------------------------------------
-- Testdaten
-- ------------------------------------------------------------
-- Die folgenden Dummy-Daten dienen zur Überprüfung der
-- Funktionalität des relationalen Datenmodells.

USE buchausleihe_db;

-- ------------------------------------------------------------
-- Vorhandene Testdaten löschen
-- ------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE BEWERTUNG;
TRUNCATE TABLE AUSLEIHE;
TRUNCATE TABLE AUSLEIHANFRAGE;
TRUNCATE TABLE ZEITSLOT;

TRUNCATE TABLE BENUTZER_STANDORT;
TRUNCATE TABLE BUCH_AUTOR;
TRUNCATE TABLE BUCH_GENRE;
TRUNCATE TABLE BUCHANGEBOT_UEBERGABEART;

TRUNCATE TABLE BUCHANGEBOT;
TRUNCATE TABLE BUCH;
TRUNCATE TABLE AUTOR;
TRUNCATE TABLE GENRE;
TRUNCATE TABLE VERLAG;
TRUNCATE TABLE UEBERGABEART;
TRUNCATE TABLE STANDORT;
TRUNCATE TABLE BENUTZER;

SET FOREIGN_KEY_CHECKS = 1;

-- ------------------------------------------------------------
-- 1. Testdaten: BENUTZER
-- ------------------------------------------------------------
-- Es werden 50 fiktive Benutzer angelegt.
-- Die Daten dienen ausschließlich zu Testzwecken.
INSERT INTO BENUTZER
    (Anrede, Vorname, Nachname, Email, Telefonnummer, Passwort_Hash, Rolle)
VALUES
    ('Herr', 'Daniel', 'Schmidt', 'daniel.schmidt@example.de', '0151-10000001', 'hash_user_01', 'Benutzer'),
    ('Frau', 'Laura', 'Meyer', 'laura.meyer@example.de', '0151-10000002', 'hash_user_02', 'Benutzer'),
    ('Herr', 'Thomas', 'Weber', 'thomas.weber@example.de', '0151-10000003', 'hash_user_03', 'Benutzer'),
    ('Frau', 'Sarah', 'Wagner', 'sarah.wagner@example.de', '0151-10000004', 'hash_user_04', 'Benutzer'),
    ('Herr', 'Mehmet', 'Kaya', 'mehmet.kaya@example.de', '0151-10000005', 'hash_user_05', 'Benutzer'),
    ('Frau', 'Nadine', 'Hoffmann', 'nadine.hoffmann@example.de', '0151-10000006', 'hash_user_06', 'Benutzer'),
    ('Herr', 'Omar', 'El Amrani', 'omar.elamrani@example.de', '0151-10000007', 'hash_user_07', 'Benutzer'),
    ('Frau', 'Julia', 'Becker', 'julia.becker@example.de', '0151-10000008', 'hash_user_08', 'Benutzer'),
    ('Herr', 'Michael', 'Krueger', 'michael.krueger@example.de', '0151-10000009', 'hash_user_09', 'Benutzer'),
    ('Frau', 'Aylin', 'Demir', 'aylin.demir@example.de', '0151-10000010', 'hash_user_10', 'Benutzer'),

    ('Herr', 'Jan', 'Schulz', 'jan.schulz@example.de', '0151-10000011', 'hash_user_11', 'Benutzer'),
    ('Frau', 'Anna', 'Fischer', 'anna.fischer@example.de', '0151-10000012', 'hash_user_12', 'Benutzer'),
    ('Herr', 'David', 'Neumann', 'david.neumann@example.de', '0151-10000013', 'hash_user_13', 'Benutzer'),
    ('Frau', 'Lea', 'Zimmermann', 'lea.zimmermann@example.de', '0151-10000014', 'hash_user_14', 'Benutzer'),
    ('Herr', 'Mustafa', 'Yilmaz', 'mustafa.yilmaz@example.de', '0151-10000015', 'hash_user_15', 'Benutzer'),
    ('Frau', 'Sophie', 'Braun', 'sophie.braun@example.de', '0151-10000016', 'hash_user_16', 'Benutzer'),
    ('Herr', 'Christian', 'Hartmann', 'christian.hartmann@example.de', '0151-10000017', 'hash_user_17', 'Benutzer'),
    ('Frau', 'Miriam', 'Lange', 'miriam.lange@example.de', '0151-10000018', 'hash_user_18', 'Benutzer'),
    ('Herr', 'Yusuf', 'Aydin', 'yusuf.aydin@example.de', '0151-10000019', 'hash_user_19', 'Benutzer'),
    ('Frau', 'Katharina', 'Wolf', 'katharina.wolf@example.de', '0151-10000020', 'hash_user_20', 'Benutzer'),

    ('Herr', 'Stefan', 'Koch', 'stefan.koch@example.de', '0151-10000021', 'hash_user_21', 'Benutzer'),
    ('Frau', 'Lisa', 'Richter', 'lisa.richter@example.de', '0151-10000022', 'hash_user_22', 'Benutzer'),
    ('Herr', 'Ahmed', 'Mansour', 'ahmed.mansour@example.de', '0151-10000023', 'hash_user_23', 'Benutzer'),
    ('Frau', 'Jasmin', 'Klein', 'jasmin.klein@example.de', '0151-10000024', 'hash_user_24', 'Benutzer'),
    ('Herr', 'Patrick', 'Schroeder', 'patrick.schroeder@example.de', '0151-10000025', 'hash_user_25', 'Benutzer'),
    ('Frau', 'Mona', 'Schwarz', 'mona.schwarz@example.de', '0151-10000026', 'hash_user_26', 'Benutzer'),
    ('Herr', 'Tobias', 'Werner', 'tobias.werner@example.de', '0151-10000027', 'hash_user_27', 'Benutzer'),
    ('Frau', 'Elena', 'Schmitz', 'elena.schmitz@example.de', '0151-10000028', 'hash_user_28', 'Benutzer'),
    ('Herr', 'Karim', 'Bennani', 'karim.bennani@example.de', '0151-10000029', 'hash_user_29', 'Benutzer'),
    ('Frau', 'Nicole', 'Krause', 'nicole.krause@example.de', '0151-10000030', 'hash_user_30', 'Benutzer'),

    ('Herr', 'Martin', 'Lehmann', 'martin.lehmann@example.de', '0151-10000031', 'hash_user_31', 'Benutzer'),
    ('Frau', 'Vanessa', 'Schmid', 'vanessa.schmid@example.de', '0151-10000032', 'hash_user_32', 'Benutzer'),
    ('Herr', 'Ali', 'Oezdemir', 'ali.oezdemir@example.de', '0151-10000033', 'hash_user_33', 'Benutzer'),
    ('Frau', 'Christina', 'Meier', 'christina.meier@example.de', '0151-10000034', 'hash_user_34', 'Benutzer'),
    ('Herr', 'Sebastian', 'Walter', 'sebastian.walter@example.de', '0151-10000035', 'hash_user_35', 'Benutzer'),
    ('Frau', 'Fatima', 'Zahra', 'fatima.zahra@example.de', '0151-10000036', 'hash_user_36', 'Benutzer'),
    ('Herr', 'Andreas', 'Koenig', 'andreas.koenig@example.de', '0151-10000037', 'hash_user_37', 'Benutzer'),
    ('Frau', 'Melanie', 'Lorenz', 'melanie.lorenz@example.de', '0151-10000038', 'hash_user_38', 'Benutzer'),
    ('Herr', 'Samir', 'Haddad', 'samir.haddad@example.de', '0151-10000039', 'hash_user_39', 'Benutzer'),
    ('Frau', 'Carolin', 'Baumann', 'carolin.baumann@example.de', '0151-10000040', 'hash_user_40', 'Benutzer'),

    ('Herr', 'Robert', 'Frank', 'robert.frank@example.de', '0151-10000041', 'hash_user_41', 'Benutzer'),
    ('Frau', 'Maren', 'Albrecht', 'maren.albrecht@example.de', '0151-10000042', 'hash_user_42', 'Benutzer'),
    ('Herr', 'Bilal', 'Alaoui', 'bilal.alaoui@example.de', '0151-10000043', 'hash_user_43', 'Benutzer'),
    ('Frau', 'Sandra', 'Simon', 'sandra.simon@example.de', '0151-10000044', 'hash_user_44', 'Benutzer'),
    ('Herr', 'Florian', 'Peters', 'florian.peters@example.de', '0151-10000045', 'hash_user_45', 'Benutzer'),
    ('Frau', 'Amira', 'Nasser', 'amira.nasser@example.de', '0151-10000046', 'hash_user_46', 'Benutzer'),
    ('Herr', 'Marco', 'Jung', 'marco.jung@example.de', '0151-10000047', 'hash_user_47', 'Benutzer'),
    ('Frau', 'Claudia', 'Voigt', 'claudia.voigt@example.de', '0151-10000048', 'hash_user_48', 'Benutzer'),

    -- Zwei Administratoren
    ('Herr', 'Markus', 'Admin', 'markus.admin@example.de', NULL, 'hash_admin_01', 'Administrator'),
    ('Frau', 'Sabine', 'Admin', 'sabine.admin@example.de', NULL, 'hash_admin_02', 'Administrator');
    -- Kontrolle der eingefügten Benutzerdaten
SELECT *
FROM BENUTZER;

-- ------------------------------------------------------------
-- 2. Testdaten: STANDORT
-- ------------------------------------------------------------
-- Es werden 50 fiktive Standorte im Raum Pinneberg angelegt.
-- Die unterschiedlichen Koordinaten ermöglichen später
-- Tests einer standortbasierten Umkreissuche.
INSERT INTO STANDORT
    (Strasse, Hausnummer, PLZ, Ort, Breitengrad, Laengengrad)
VALUES
    ('Bahnhofstrasse', '12', '25421', 'Pinneberg', 53.661200, 9.797500),
    ('Bahnhofstrasse', '28', '25421', 'Pinneberg', 53.660900, 9.799100),
    ('Fahltskamp', '15', '25421', 'Pinneberg', 53.662100, 9.804200),
    ('Fahltskamp', '33', '25421', 'Pinneberg', 53.663000, 9.806000),
    ('Elmshorner Strasse', '21', '25421', 'Pinneberg', 53.666200, 9.791800),
    ('Elmshorner Strasse', '47', '25421', 'Pinneberg', 53.668100, 9.789500),
    ('Dingstaette', '18', '25421', 'Pinneberg', 53.661500, 9.800600),
    ('Dingstaette', '41', '25421', 'Pinneberg', 53.660800, 9.802100),
    ('Muehlenstrasse', '9', '25421', 'Pinneberg', 53.659900, 9.803700),
    ('Muehlenstrasse', '26', '25421', 'Pinneberg', 53.658800, 9.805200),

    ('Thesdorfer Weg', '14', '25421', 'Pinneberg', 53.656900, 9.811500),
    ('Thesdorfer Weg', '39', '25421', 'Pinneberg', 53.655500, 9.814300),
    ('Wedeler Weg', '17', '25421', 'Pinneberg', 53.655200, 9.796100),
    ('Wedeler Weg', '44', '25421', 'Pinneberg', 53.653800, 9.793500),
    ('Prisdorfer Strasse', '11', '25421', 'Pinneberg', 53.670200, 9.801500),
    ('Prisdorfer Strasse', '36', '25421', 'Pinneberg', 53.672100, 9.799300),
    ('Saarlandstrasse', '8', '25421', 'Pinneberg', 53.663700, 9.810500),
    ('Saarlandstrasse', '29', '25421', 'Pinneberg', 53.664800, 9.812700),
    ('Ruebekamp', '16', '25421', 'Pinneberg', 53.658300, 9.794900),
    ('Ruebekamp', '35', '25421', 'Pinneberg', 53.657100, 9.792600),

    ('Damm', '10', '25421', 'Pinneberg', 53.660300, 9.808400),
    ('Damm', '31', '25421', 'Pinneberg', 53.659200, 9.810100),
    ('Bismarckstrasse', '13', '25421', 'Pinneberg', 53.664100, 9.798600),
    ('Bismarckstrasse', '38', '25421', 'Pinneberg', 53.665400, 9.797200),
    ('Rathauspassage', '5', '25421', 'Pinneberg', 53.661800, 9.800200),
    ('Rathauspassage', '16', '25421', 'Pinneberg', 53.661300, 9.801100),
    ('Hindenburgdamm', '19', '25421', 'Pinneberg', 53.657700, 9.807600),
    ('Hindenburgdamm', '42', '25421', 'Pinneberg', 53.656200, 9.809500),
    ('Richard-Koehn-Strasse', '7', '25421', 'Pinneberg', 53.668500, 9.805600),
    ('Richard-Koehn-Strasse', '24', '25421', 'Pinneberg', 53.669400, 9.807900),

    ('Friedrich-Ebert-Strasse', '11', '25421', 'Pinneberg', 53.662800, 9.795600),
    ('Friedrich-Ebert-Strasse', '34', '25421', 'Pinneberg', 53.663600, 9.793900),
    ('Lindenstrasse', '9', '25421', 'Pinneberg', 53.659700, 9.790800),
    ('Lindenstrasse', '27', '25421', 'Pinneberg', 53.658600, 9.788900),
    ('Goethestrasse', '15', '25421', 'Pinneberg', 53.665900, 9.803400),
    ('Goethestrasse', '32', '25421', 'Pinneberg', 53.667000, 9.804900),
    ('Schillerstrasse', '12', '25421', 'Pinneberg', 53.654900, 9.802800),
    ('Schillerstrasse', '37', '25421', 'Pinneberg', 53.653600, 9.804700),
    ('Mozartstrasse', '6', '25421', 'Pinneberg', 53.667500, 9.813100),
    ('Mozartstrasse', '25', '25421', 'Pinneberg', 53.668800, 9.815200),

    ('Beethovenstrasse', '14', '25421', 'Pinneberg', 53.663100, 9.817400),
    ('Beethovenstrasse', '30', '25421', 'Pinneberg', 53.664300, 9.819200),
    ('Kiefernweg', '8', '25421', 'Pinneberg', 53.652900, 9.798400),
    ('Kiefernweg', '22', '25421', 'Pinneberg', 53.651700, 9.796700),
    ('Ahornweg', '10', '25421', 'Pinneberg', 53.670700, 9.811000),
    ('Ahornweg', '28', '25421', 'Pinneberg', 53.671900, 9.813300),
    ('Birkenweg', '13', '25421', 'Pinneberg', 53.656500, 9.787900),
    ('Birkenweg', '31', '25421', 'Pinneberg', 53.655100, 9.785800),
    ('Rosenstrasse', '7', '25421', 'Pinneberg', 53.660600, 9.815900),
    ('Rosenstrasse', '23', '25421', 'Pinneberg', 53.659400, 9.817800);
SELECT *
FROM STANDORT;

-- ------------------------------------------------------------
-- 3. Testdaten: AUTOR
-- ------------------------------------------------------------
-- Es werden 50 Autoren angelegt.
-- Die Autoren werden später über die Brückentabelle BUCH_AUTOR
-- den entsprechenden Büchern zugeordnet.
INSERT INTO AUTOR
    (Vorname, Nachname)
VALUES
    ('Johann Wolfgang', 'von Goethe'),
    ('Friedrich', 'Schiller'),
    ('Thomas', 'Mann'),
    ('Hermann', 'Hesse'),
    ('Franz', 'Kafka'),
    ('Erich Maria', 'Remarque'),
    ('Heinrich', 'Böll'),
    ('Günter', 'Grass'),
    ('Michael', 'Ende'),
    ('Cornelia', 'Funke'),

    ('Juli', 'Zeh'),
    ('Daniel', 'Kehlmann'),
    ('Bernhard', 'Schlink'),
    ('Patrick', 'Süskind'),
    ('Sebastian', 'Fitzek'),
    ('Charlotte', 'Link'),
    ('Frank', 'Schätzing'),
    ('Marc-Uwe', 'Kling'),
    ('Walter', 'Moers'),
    ('Wolfgang', 'Herrndorf'),

    ('George', 'Orwell'),
    ('Aldous', 'Huxley'),
    ('Ernest', 'Hemingway'),
    ('F. Scott', 'Fitzgerald'),
    ('Harper', 'Lee'),
    ('Stephen', 'King'),
    ('John', 'Steinbeck'),
    ('Dan', 'Brown'),
    ('Ken', 'Follett'),
    ('George R. R.', 'Martin'),

    ('J. R. R.', 'Tolkien'),
    ('J. K.', 'Rowling'),
    ('Agatha', 'Christie'),
    ('Arthur Conan', 'Doyle'),
    ('Jane', 'Austen'),
    ('Charles', 'Dickens'),
    ('Oscar', 'Wilde'),
    ('Mary', 'Shelley'),
    ('Bram', 'Stoker'),
    ('Virginia', 'Woolf'),

    ('Gabriel García', 'Márquez'),
    ('Paulo', 'Coelho'),
    ('Umberto', 'Eco'),
    ('Haruki', 'Murakami'),
    ('Khaled', 'Hosseini'),
    ('Yuval Noah', 'Harari'),
    ('Stephen', 'Hawking'),
    ('Richard', 'Dawkins'),
    ('Daniel', 'Kahneman'),
    ('Robert', 'C. Martin');
select * from autor;

-- ------------------------------------------------------------
-- 4. Testdaten: GENRE
-- ------------------------------------------------------------
-- Es werden 10 verschiedene Genres angelegt.
-- Bücher können später über die Brückentabelle BUCH_GENRE
-- einem oder mehreren Genres zugeordnet werden.
INSERT INTO GENRE
    (Genre_Name)
VALUES
    ('Roman'),
    ('Krimi'),
    ('Thriller'),
    ('Fantasy'),
    ('Science-Fiction'),
    ('Kinder- und Jugendbuch'),
    ('Sachbuch'),
    ('Biografie'),
    ('Geschichte'),
    ('Informatik');
select * from genre;

-- ------------------------------------------------------------
-- 5. Testdaten: VERLAG
-- ------------------------------------------------------------
-- Es werden 10 Verlage angelegt.
-- Jeder Datensatz in BUCH wird später genau einem Verlag
-- über Verlag_ID zugeordnet.
INSERT INTO VERLAG
    (Verlag_Bezeichnung)
VALUES
    ('Suhrkamp Verlag'),
    ('Rowohlt Verlag'),
    ('Fischer Verlag'),
    ('Carlsen Verlag'),
    ('Piper Verlag'),
    ('Heyne Verlag'),
    ('Goldmann Verlag'),
    ('Kiepenheuer & Witsch'),
    ('dtv Verlagsgesellschaft'),
    ('O''Reilly Verlag');
select * from verlag; 

-- ------------------------------------------------------------
-- 6. Testdaten: UEBERGABEART
-- ------------------------------------------------------------
-- Es werden 10 mögliche Übergabearten angelegt.
-- Ein Buchangebot kann über die Brückentabelle
-- BUCHANGEBOT_UEBERGABEART mehrere Übergabearten anbieten.
INSERT INTO UEBERGABEART
    (Uebergabeart)
VALUES
    ('Abholung beim Anbieter'),
    ('Persönliches Treffen'),
    ('Treffen am Bahnhof'),
    ('Treffen in der Innenstadt'),
    ('Treffen an der Universität'),
    ('Treffen am Arbeitsplatz'),
    ('Standardversand'),
    ('Versicherter Versand'),
    ('Paketstation'),
    ('Übergabe durch Boten');
select * from UEBERGABEART;

-- ------------------------------------------------------------
-- 7. Testdaten: BUCH
-- ------------------------------------------------------------
-- Es werden 50 Bücher angelegt.
-- Jedes Buch ist über Verlag_ID einem vorhandenen Verlag
-- aus der Tabelle VERLAG zugeordnet.
-- Die Zuordnung zu Autoren und Genres erfolgt später über
-- die Brückentabellen BUCH_AUTOR und BUCH_GENRE.
INSERT INTO BUCH
    (Titel, Erscheinungsjahr, Sprache, Kurzbeschreibung, Verlag_ID)
VALUES
    ('Faust I', 1808, 'Deutsch',
     'Tragödie über Wissen, Verführung und die Suche nach Erkenntnis.', 1),

    ('Die Räuber', 1781, 'Deutsch',
     'Drama über Freiheit, Familie und gesellschaftliche Konflikte.', 2),

    ('Der Zauberberg', 1924, 'Deutsch',
     'Roman über einen jungen Mann in einem Schweizer Sanatorium.', 3),

    ('Siddhartha', 1922, 'Deutsch',
     'Roman über die spirituelle Suche eines jungen Mannes.', 1),

    ('Die Verwandlung', 1915, 'Deutsch',
     'Erzählung über einen Mann, der sich eines Morgens verwandelt wiederfindet.', 2),

    ('Im Westen nichts Neues', 1929, 'Deutsch',
     'Roman über die Erfahrungen junger Soldaten im Ersten Weltkrieg.', 3),

    ('Die verlorene Ehre der Katharina Blum', 1974, 'Deutsch',
     'Roman über Medien, Öffentlichkeit und persönliche Freiheit.', 4),

    ('Die Blechtrommel', 1959, 'Deutsch',
     'Roman über deutsche Geschichte aus ungewöhnlicher Perspektive.', 5),

    ('Die unendliche Geschichte', 1979, 'Deutsch',
     'Fantasyroman über die fantastische Welt Phantásien.', 6),

    ('Tintenherz', 2003, 'Deutsch',
     'Fantasyroman über Bücher und Figuren, die zum Leben erwachen.', 4),

    ('Unterleuten', 2016, 'Deutsch',
     'Gesellschaftsroman über Konflikte in einem brandenburgischen Dorf.', 7),

    ('Die Vermessung der Welt', 2005, 'Deutsch',
     'Roman über Alexander von Humboldt und Carl Friedrich Gauß.', 2),

    ('Der Vorleser', 1995, 'Deutsch',
     'Roman über Liebe, Schuld und die deutsche Vergangenheit.', 3),

    ('Das Parfum', 1985, 'Deutsch',
     'Roman über einen Mann mit außergewöhnlichem Geruchssinn.', 5),

    ('Die Therapie', 2006, 'Deutsch',
     'Psychothriller über das Verschwinden eines jungen Mädchens.', 6),

    ('Die Suche', 2018, 'Deutsch',
     'Spannungsroman über ein rätselhaftes Verschwinden.', 7),

    ('Der Schwarm', 2004, 'Deutsch',
     'Wissenschaftsthriller über eine unbekannte Bedrohung aus dem Meer.', 8),

    ('QualityLand', 2017, 'Deutsch',
     'Satirischer Roman über Algorithmen und eine vollständig digitalisierte Gesellschaft.', 9),

    ('Die 13 1/2 Leben des Käpt''n Blaubär', 1999, 'Deutsch',
     'Fantastischer Roman über die Abenteuer des Käpt''n Blaubär.', 9),

    ('Tschick', 2010, 'Deutsch',
     'Jugendroman über eine ungewöhnliche Reise zweier Jugendlicher.', 2),

    ('1984', 1949, 'Englisch',
     'Dystopischer Roman über Überwachung und einen totalitären Staat.', 6),

    ('Brave New World', 1932, 'Englisch',
     'Dystopischer Roman über eine technologisch kontrollierte Gesellschaft.', 5),

    ('The Old Man and the Sea', 1952, 'Englisch',
     'Roman über den Kampf eines alten Fischers mit einem großen Fisch.', 3),

    ('The Great Gatsby', 1925, 'Englisch',
     'Roman über Wohlstand, Liebe und gesellschaftlichen Aufstieg.', 2),

    ('To Kill a Mockingbird', 1960, 'Englisch',
     'Roman über Gerechtigkeit und gesellschaftliche Vorurteile.', 7),

    ('The Shining', 1977, 'Englisch',
     'Horrorroman über eine Familie in einem abgelegenen Hotel.', 6),

    ('Of Mice and Men', 1937, 'Englisch',
     'Roman über Freundschaft und Hoffnung während der Weltwirtschaftskrise.', 3),

    ('The Da Vinci Code', 2003, 'Englisch',
     'Thriller über eine rätselhafte Spur durch Kunst und Geschichte.', 7),

    ('The Pillars of the Earth', 1989, 'Englisch',
     'Historischer Roman über den Bau einer Kathedrale im Mittelalter.', 5),

    ('A Game of Thrones', 1996, 'Englisch',
     'Fantasyroman über Machtkämpfe in einer fiktiven Welt.', 6),

    ('The Lord of the Rings', 1954, 'Englisch',
     'Fantasyepos über den Kampf um einen mächtigen Ring.', 4),

    ('Harry Potter and the Philosopher''s Stone', 1997, 'Englisch',
     'Fantasyroman über einen jungen Zauberer und seine erste Zeit in Hogwarts.', 4),

    ('Murder on the Orient Express', 1934, 'Englisch',
     'Kriminalroman über einen Mord während einer Zugreise.', 7),

    ('The Hound of the Baskervilles', 1902, 'Englisch',
     'Kriminalroman über einen geheimnisvollen Fall von Sherlock Holmes.', 9),

    ('Pride and Prejudice', 1813, 'Englisch',
     'Roman über Liebe und gesellschaftliche Erwartungen.', 3),

    ('Oliver Twist', 1838, 'Englisch',
     'Roman über das Leben eines Waisenjungen im viktorianischen England.', 2),

    ('The Picture of Dorian Gray', 1890, 'Englisch',
     'Roman über Schönheit, Moral und die Folgen menschlicher Entscheidungen.', 5),

    ('Frankenstein', 1818, 'Englisch',
     'Roman über einen Wissenschaftler und das von ihm geschaffene Wesen.', 6),

    ('Dracula', 1897, 'Englisch',
     'Horrorroman über den geheimnisvollen Grafen Dracula.', 7),

    ('Mrs Dalloway', 1925, 'Englisch',
     'Roman über einen Tag im Leben einer Londoner Gesellschaftsfrau.', 1),

    ('Hundert Jahre Einsamkeit', 1967, 'Deutsch',
     'Roman über mehrere Generationen einer Familie in Macondo.', 1),

    ('Der Alchimist', 1988, 'Deutsch',
     'Roman über einen jungen Hirten auf der Suche nach seinem persönlichen Lebensweg.', 3),

    ('Der Name der Rose', 1980, 'Deutsch',
     'Historischer Roman und Kriminalgeschichte in einem mittelalterlichen Kloster.', 5),

    ('Kafka am Strand', 2002, 'Deutsch',
     'Roman über Schicksal, Erinnerung und eine ungewöhnliche Reise.', 9),

    ('Drachenläufer', 2003, 'Deutsch',
     'Roman über Freundschaft, Schuld und die Geschichte Afghanistans.', 2),

    ('Eine kurze Geschichte der Menschheit', 2011, 'Deutsch',
     'Sachbuch über die Entwicklung und Geschichte des Homo sapiens.', 3),

    ('Eine kurze Geschichte der Zeit', 1988, 'Deutsch',
     'Sachbuch über Kosmologie, Raum, Zeit und das Universum.', 6),

    ('Das egoistische Gen', 1976, 'Deutsch',
     'Sachbuch über Evolution und die Rolle von Genen.', 7),

    ('Schnelles Denken, langsames Denken', 2011, 'Deutsch',
     'Sachbuch über menschliches Denken, Urteilen und Entscheiden.', 5),

    ('Clean Code', 2008, 'Englisch',
     'Fachbuch über Prinzipien und Praktiken zur Entwicklung verständlicher Software.', 10);
select * from buch;

-- ------------------------------------------------------------
-- 8. Testdaten: BUCHANGEBOT
-- ------------------------------------------------------------
-- Es werden 50 konkrete Buchangebote angelegt.
-- Jedes Angebot gehört zu einem vorhandenen Benutzer und Buch.
-- Der Standort ist optional und kann daher NULL sein.
-- verfuegbar = FALSE bedeutet, dass das Exemplar aktuell
-- ausgeliehen ist.

INSERT INTO BUCHANGEBOT
    (Benutzer_ID, Buch_ID, Standort_ID, Zustand,
     maximale_Ausleihdauer, Einstelldatum,
     Beschreibung_zum_Exemplar, verfuegbar)
VALUES
    (1,  1,  1,  'Sehr gut', 21, '2026-05-02', 'Kaum Gebrauchsspuren.', TRUE),
    (2,  2,  2,  'Gut',      14, '2026-05-04', 'Leichte Gebrauchsspuren am Einband.', TRUE),
    (3,  3,  3,  'Gut',      28, '2026-05-06', NULL, TRUE),
    (4,  4,  4,  'Sehr gut', 21, '2026-05-08', 'Sehr gepflegtes Exemplar.', TRUE),
    (5,  5,  5,  'Akzeptabel', 14, '2026-05-10', 'Einige Markierungen vorhanden.', TRUE),
    (6,  6,  6,  'Gut',      21, '2026-05-12', NULL, TRUE),
    (7,  7,  7,  'Sehr gut', 14, '2026-05-14', 'Fast wie neu.', TRUE),
    (8,  8,  8,  'Gut',      28, '2026-05-16', 'Kleine Gebrauchsspuren.', TRUE),
    (9,  9,  9,  'Sehr gut', 21, '2026-05-18', NULL, TRUE),
    (10, 10, 10, 'Gut',      14, '2026-05-20', 'Einband leicht abgenutzt.', TRUE),

    (11, 11, 11, 'Sehr gut', 28, '2026-05-22', NULL, TRUE),
    (12, 12, 12, 'Gut',      21, '2026-05-24', 'Guter gebrauchter Zustand.', TRUE),
    (13, 13, 13, 'Sehr gut', 14, '2026-05-26', NULL, TRUE),
    (14, 14, 14, 'Gut',      21, '2026-05-28', 'Leichte Knicke am Umschlag.', TRUE),
    (15, 15, 15, 'Sehr gut', 14, '2026-06-01', 'Keine sichtbaren Beschädigungen.', TRUE),
    (16, 16, 16, 'Gut',      28, '2026-06-03', NULL, TRUE),
    (17, 17, 17, 'Akzeptabel', 21, '2026-06-05', 'Deutliche Gebrauchsspuren.', TRUE),
    (18, 18, 18, 'Sehr gut', 14, '2026-06-07', NULL, TRUE),
    (19, 19, 19, 'Gut',      21, '2026-06-09', 'Einige kleine Kratzer.', TRUE),
    (20, 20, 20, 'Sehr gut', 28, '2026-06-11', 'Sehr gepflegt.', TRUE),

    (21, 21, 21, 'Gut',      14, '2026-06-13', NULL, TRUE),
    (22, 22, 22, 'Sehr gut', 21, '2026-06-15', 'Neuwertiger Zustand.', TRUE),
    (23, 23, 23, 'Gut',      28, '2026-06-17', NULL, TRUE),
    (24, 24, 24, 'Akzeptabel', 14, '2026-06-19', 'Lesespuren am Buchrücken.', TRUE),
    (25, 25, 25, 'Sehr gut', 21, '2026-06-21', NULL, TRUE),
    (26, 26, 26, 'Gut',      14, '2026-06-23', 'Leichte Gebrauchsspuren.', TRUE),
    (27, 27, 27, 'Sehr gut', 28, '2026-06-25', NULL, TRUE),
    (28, 28, 28, 'Gut',      21, '2026-06-27', 'Gepflegtes Exemplar.', TRUE),
    (29, 29, 29, 'Sehr gut', 14, '2026-06-29', NULL, TRUE),
    (30, 30, 30, 'Gut',      28, '2026-07-01', 'Kleine Knicke am Einband.', TRUE),

    (31, 31, 31, 'Sehr gut', 21, '2026-07-03', NULL, TRUE),
    (32, 32, 32, 'Gut',      14, '2026-07-05', 'Leichte Lesespuren.', TRUE),
    (33, 33, 33, 'Sehr gut', 28, '2026-07-07', NULL, TRUE),
    (34, 34, 34, 'Gut',      21, '2026-07-09', 'Guter Allgemeinzustand.', TRUE),
    (35, 35, 35, 'Akzeptabel', 14, '2026-07-11', 'Mehrfach gelesen.', TRUE),
    (36, 36, 36, 'Sehr gut', 21, '2026-07-13', NULL, TRUE),
    (37, 37, 37, 'Gut',      28, '2026-07-15', 'Leicht vergilbte Seiten.', TRUE),
    (38, 38, 38, 'Sehr gut', 14, '2026-07-17', NULL, TRUE),
    (39, 39, 39, 'Gut',      21, '2026-07-19', 'Einband mit kleinen Spuren.', TRUE),
    (40, 40, 40, 'Sehr gut', 28, '2026-07-21', 'Sehr sauber erhalten.', TRUE),

    -- Buchangebot 41: aktuell verfügbar
    (1,  41, 41, 'Gut',      21, '2026-07-23', NULL, TRUE),

    -- Buchangebot 42: aktuell ausgeliehen
    (3,  42, 42, 'Sehr gut', 14, '2026-07-25', 'Fast neuwertig.', FALSE),

    -- Buchangebot 43: aktuell verfügbar
    (5,  43, 43, 'Gut',      28, '2026-07-27', 'Normale Gebrauchsspuren.', TRUE),

    -- Buchangebot 44: aktuell ausgeliehen
    (7,  44, 44, 'Sehr gut', 21, '2026-07-29', NULL, FALSE),

    -- Buchangebot 45: aktuell verfügbar
    (9,  45, 45, 'Gut',      14, '2026-08-01', 'Leichte Spuren am Umschlag.', TRUE),

    -- Buchangebot 46: aktuell ausgeliehen
    (11, 46, 46, 'Sehr gut', 28, '2026-08-03', NULL, FALSE),

    -- Buchangebot 47: aktuell ausgeliehen
    (13, 47, 47, 'Gut',      21, '2026-08-05', 'Gepflegter Zustand.', FALSE),

    -- Buchangebot 48: aktuell verfügbar
    (15, 48, 48, 'Sehr gut', 14, '2026-08-07', NULL, TRUE),

    -- Buchangebot 49: Versandangebot, aktuell ausgeliehen
    (17, 49, NULL, 'Gut',    21, '2026-08-09', 'Nur Versand möglich.', FALSE),

    -- Buchangebot 50: Versandangebot, aktuell verfügbar
    (19, 50, NULL, 'Sehr gut', 28, '2026-08-11',
     'Versandexemplar in sehr gutem Zustand.', TRUE);

SELECT *
FROM BUCHANGEBOT;


-- ------------------------------------------------------------
-- 9. Testdaten: ZEITSLOT
-- ------------------------------------------------------------
-- Es werden 50 mögliche Zeitfenster für die Übergabe angelegt.
-- Jeder Zeitslot gehört zu einem vorhandenen Buchangebot.
INSERT INTO ZEITSLOT
    (Buchangebot_ID, Datum, Startzeit, Endzeit)
VALUES
    (1,  '2026-09-10', '16:00:00', '18:00:00'),
    (2,  '2026-09-10', '17:00:00', '19:00:00'),
    (3,  '2026-09-11', '15:00:00', '17:00:00'),
    (4,  '2026-09-11', '18:00:00', '20:00:00'),
    (5,  '2026-09-12', '10:00:00', '12:00:00'),
    (6,  '2026-09-12', '14:00:00', '16:00:00'),
    (7,  '2026-09-13', '11:00:00', '13:00:00'),
    (8,  '2026-09-13', '16:00:00', '18:00:00'),
    (9,  '2026-09-14', '17:00:00', '19:00:00'),
    (10, '2026-09-14', '18:00:00', '20:00:00'),

    (11, '2026-09-15', '16:00:00', '18:00:00'),
    (12, '2026-09-15', '17:00:00', '19:00:00'),
    (13, '2026-09-16', '15:00:00', '17:00:00'),
    (14, '2026-09-16', '18:00:00', '20:00:00'),
    (15, '2026-09-17', '16:00:00', '18:00:00'),
    (16, '2026-09-17', '17:00:00', '19:00:00'),
    (17, '2026-09-18', '14:00:00', '16:00:00'),
    (18, '2026-09-18', '18:00:00', '20:00:00'),
    (19, '2026-09-19', '10:00:00', '12:00:00'),
    (20, '2026-09-19', '15:00:00', '17:00:00'),

    (21, '2026-09-20', '11:00:00', '13:00:00'),
    (22, '2026-09-20', '16:00:00', '18:00:00'),
    (23, '2026-09-21', '17:00:00', '19:00:00'),
    (24, '2026-09-21', '18:00:00', '20:00:00'),
    (25, '2026-09-22', '15:00:00', '17:00:00'),
    (26, '2026-09-22', '16:00:00', '18:00:00'),
    (27, '2026-09-23', '17:00:00', '19:00:00'),
    (28, '2026-09-23', '18:00:00', '20:00:00'),
    (29, '2026-09-24', '14:00:00', '16:00:00'),
    (30, '2026-09-24', '16:00:00', '18:00:00'),

    (31, '2026-09-25', '17:00:00', '19:00:00'),
    (32, '2026-09-25', '18:00:00', '20:00:00'),
    (33, '2026-09-26', '10:00:00', '12:00:00'),
    (34, '2026-09-26', '14:00:00', '16:00:00'),
    (35, '2026-09-27', '11:00:00', '13:00:00'),
    (36, '2026-09-27', '15:00:00', '17:00:00'),
    (37, '2026-09-28', '16:00:00', '18:00:00'),
    (38, '2026-09-28', '17:00:00', '19:00:00'),
    (39, '2026-09-29', '18:00:00', '20:00:00'),
    (40, '2026-09-29', '16:00:00', '18:00:00'),

    (41, '2026-09-30', '15:00:00', '17:00:00'),
    (42, '2026-09-30', '17:00:00', '19:00:00'),
    (43, '2026-10-01', '16:00:00', '18:00:00'),
    (44, '2026-10-01', '18:00:00', '20:00:00'),
    (45, '2026-10-02', '15:00:00', '17:00:00'),
    (46, '2026-10-02', '17:00:00', '19:00:00'),
    (47, '2026-10-03', '10:00:00', '12:00:00'),
    (48, '2026-10-03', '14:00:00', '16:00:00'),
    (49, '2026-10-04', '11:00:00', '13:00:00'),
    (50, '2026-10-04', '16:00:00', '18:00:00');
select * from zeitslot;

-- ------------------------------------------------------------
-- 10. Testdaten: BUCHANGEBOT_UEBERGABEART
-- ------------------------------------------------------------
-- Ordnet jedem Buchangebot mögliche Übergabearten zu.
-- Ein Buchangebot kann mehrere Übergabearten ermöglichen.
-- Dadurch wird die n:m-Beziehung zwischen BUCHANGEBOT
-- und UEBERGABEART umgesetzt.
INSERT INTO BUCHANGEBOT_UEBERGABEART
    (Buchangebot_ID, Uebergabe_ID)
VALUES
    (1, 1),  (1, 3),
    (2, 1),  (2, 2),
    (3, 2),  (3, 3),
    (4, 1),  (4, 4),
    (5, 2),  (5, 4),
    (6, 1),  (6, 7),
    (7, 2),  (7, 3),
    (8, 1),  (8, 8),
    (9, 3),  (9, 4),
    (10, 1), (10, 2),

    (11, 1), (11, 5),
    (12, 2), (12, 6),
    (13, 1), (13, 3),
    (14, 3), (14, 4),
    (15, 1), (15, 7),
    (16, 2), (16, 8),
    (17, 1), (17, 4),
    (18, 2), (18, 5),
    (19, 3), (19, 6),
    (20, 1), (20, 2),

    (21, 1), (21, 3),
    (22, 2), (22, 4),
    (23, 1), (23, 5),
    (24, 3), (24, 6),
    (25, 1), (25, 8),
    (26, 2), (26, 3),
    (27, 1), (27, 4),
    (28, 2), (28, 5),
    (29, 3), (29, 6),
    (30, 1), (30, 7),

    (31, 2), (31, 8),
    (32, 1), (32, 3),
    (33, 2), (33, 4),
    (34, 1), (34, 5),
    (35, 3), (35, 6),
    (36, 1), (36, 7),
    (37, 2), (37, 8),
    (38, 1), (38, 4),
    (39, 2), (39, 5),
    (40, 3), (40, 6),

    (41, 1), (41, 7),
    (42, 2), (42, 8),
    (43, 1), (43, 9),
    (44, 2), (44, 10),
    (45, 3), (45, 7),
    (46, 4), (46, 8),
    (47, 1), (47, 9),
    (48, 2), (48, 10),

    -- Angebote 49 und 50 haben keinen Standort.
    -- Deshalb werden hier Versandmöglichkeiten verwendet.
    (49, 7), (49, 8),
    (50, 8), (50, 9);
select * from BUCHANGEBOT_UEBERGABEART;

-- ------------------------------------------------------------
-- 11. Testdaten: AUSLEIHANFRAGE
-- ------------------------------------------------------------
-- Es werden 50 Ausleihanfragen angelegt.
-- Jede Anfrage bezieht sich auf ein vorhandenes Buchangebot.
-- Die gewählte Übergabeart gehört zu den für das Angebot
-- hinterlegten Übergabearten.
-- Der gewählte Zeitslot gehört ebenfalls zum jeweiligen Angebot.
INSERT INTO AUSLEIHANFRAGE
    (Benutzer_ID, Buchangebot_ID, Uebergabe_ID, Zeitslot_ID,
     gewuenschter_Start, gewuenschtes_Ende, Anfragedatum, Status)
VALUES
    (2,  1,  1,  1,  '2026-09-10', '2026-09-24', '2026-09-06', 'angenommen'),
    (3,  2,  2,  2,  '2026-09-10', '2026-09-20', '2026-09-06', 'angenommen'),
    (4,  3,  3,  3,  '2026-09-11', '2026-09-25', '2026-09-07', 'offen'),
    (5,  4,  4,  4,  '2026-09-11', '2026-09-22', '2026-09-07', 'angenommen'),
    (6,  5,  2,  5,  '2026-09-12', '2026-09-24', '2026-09-07', 'abgelehnt'),

    (7,  6,  1,  6,  '2026-09-12', '2026-09-26', '2026-09-08', 'angenommen'),
    (8,  7,  3,  7,  '2026-09-13', '2026-09-25', '2026-09-08', 'angenommen'),
    (9,  8,  8,  8,  '2026-09-13', '2026-09-27', '2026-09-08', 'offen'),
    (10, 9,  4,  9,  '2026-09-14', '2026-09-28', '2026-09-09', 'angenommen'),
    (11, 10, 2, 10,  '2026-09-14', '2026-09-24', '2026-09-09', 'abgelehnt'),

    (12, 11, 5, 11,  '2026-09-15', '2026-09-29', '2026-09-10', 'angenommen'),
    (13, 12, 6, 12,  '2026-09-15', '2026-09-26', '2026-09-10', 'angenommen'),
    (14, 13, 3, 13,  '2026-09-16', '2026-09-30', '2026-09-11', 'offen'),
    (15, 14, 4, 14,  '2026-09-16', '2026-09-28', '2026-09-11', 'angenommen'),
    (16, 15, 7, 15,  '2026-09-17', '2026-09-27', '2026-09-12', 'abgelehnt'),

    (17, 16, 8, 16,  '2026-09-17', '2026-10-01', '2026-09-12', 'angenommen'),
    (18, 17, 4, 17,  '2026-09-18', '2026-09-30', '2026-09-13', 'angenommen'),
    (19, 18, 5, 18,  '2026-09-18', '2026-10-02', '2026-09-13', 'offen'),
    (20, 19, 6, 19,  '2026-09-19', '2026-10-03', '2026-09-14', 'angenommen'),
    (21, 20, 2, 20,  '2026-09-19', '2026-09-29', '2026-09-14', 'abgelehnt'),

    (22, 21, 3, 21,  '2026-09-20', '2026-10-04', '2026-09-15', 'angenommen'),
    (23, 22, 4, 22,  '2026-09-20', '2026-10-01', '2026-09-15', 'angenommen'),
    (24, 23, 5, 23,  '2026-09-21', '2026-10-05', '2026-09-16', 'offen'),
    (25, 24, 6, 24,  '2026-09-21', '2026-10-03', '2026-09-16', 'angenommen'),
    (26, 25, 8, 25,  '2026-09-22', '2026-10-06', '2026-09-17', 'abgelehnt'),

    (27, 26, 3, 26,  '2026-09-22', '2026-10-02', '2026-09-17', 'angenommen'),
    (28, 27, 4, 27,  '2026-09-23', '2026-10-07', '2026-09-18', 'angenommen'),
    (29, 28, 5, 28,  '2026-09-23', '2026-10-05', '2026-09-18', 'offen'),
    (30, 29, 6, 29,  '2026-09-24', '2026-10-08', '2026-09-19', 'angenommen'),
    (31, 30, 7, 30,  '2026-09-24', '2026-10-04', '2026-09-19', 'abgelehnt'),

    (32, 31, 8, 31,  '2026-09-25', '2026-10-09', '2026-09-20', 'angenommen'),
    (33, 32, 3, 32,  '2026-09-25', '2026-10-06', '2026-09-20', 'angenommen'),
    (34, 33, 4, 33,  '2026-09-26', '2026-10-10', '2026-09-21', 'offen'),
    (35, 34, 5, 34,  '2026-09-26', '2026-10-08', '2026-09-21', 'angenommen'),
    (36, 35, 6, 35,  '2026-09-27', '2026-10-11', '2026-09-22', 'abgelehnt'),

    (37, 36, 7, 36,  '2026-09-27', '2026-10-07', '2026-09-22', 'angenommen'),
    (38, 37, 8, 37,  '2026-09-28', '2026-10-12', '2026-09-23', 'angenommen'),
    (39, 38, 4, 38,  '2026-09-28', '2026-10-10', '2026-09-23', 'offen'),
    (40, 39, 5, 39,  '2026-09-29', '2026-10-13', '2026-09-24', 'angenommen'),
    (41, 40, 6, 40,  '2026-09-29', '2026-10-09', '2026-09-24', 'abgelehnt'),

    (42, 41, 7, 41,  '2026-09-30', '2026-10-14', '2026-09-25', 'angenommen'),
    (43, 42, 8, 42,  '2026-09-30', '2026-10-11', '2026-09-25', 'angenommen'),
    (44, 43, 9, 43,  '2026-10-01', '2026-10-15', '2026-09-26', 'offen'),
    (45, 44, 10, 44, '2026-10-01', '2026-10-13', '2026-09-26', 'angenommen'),
    (46, 45, 7, 45,  '2026-10-02', '2026-10-16', '2026-09-27', 'abgelehnt'),

    (47, 46, 8, 46,  '2026-10-02', '2026-10-12', '2026-09-27', 'angenommen'),
    (48, 47, 9, 47,  '2026-10-03', '2026-10-17', '2026-09-28', 'angenommen'),
    (49, 48, 10, 48, '2026-10-03', '2026-10-15', '2026-09-28', 'offen'),

    -- Angebot 49 und 50 sind Versandangebote.
    -- Deshalb wird hier bewusst kein Zeitslot ausgewählt.
    (20, 49, 7, NULL, '2026-10-04', '2026-10-18', '2026-09-29', 'angenommen'),
    (21, 50, 8, NULL, '2026-10-04', '2026-10-18', '2026-09-29', 'abgelehnt');
select * from AUSLEIHANFRAGE;

-- ------------------------------------------------------------
-- 12. Testdaten: AUSLEIHE
-- ------------------------------------------------------------
-- Es werden 30 Ausleihen angelegt.
-- Eine Ausleihe entsteht ausschließlich aus einer zuvor
-- angenommenen Ausleihanfrage.
-- Durch UNIQUE(Anfrage_ID) kann aus jeder Anfrage höchstens
-- eine Ausleihe entstehen.
INSERT INTO AUSLEIHE
    (Anfrage_ID, Ausleihdatum, vereinbartes_Rueckgabedatum,
     tatsaechliches_Rueckgabedatum, Status)
VALUES
    (1,  '2026-09-10', '2026-09-24', '2026-09-23', 'abgeschlossen'),
    (2,  '2026-09-10', '2026-09-20', '2026-09-20', 'abgeschlossen'),
    (4,  '2026-09-11', '2026-09-22', '2026-09-21', 'abgeschlossen'),
    (6,  '2026-09-12', '2026-09-26', '2026-09-25', 'abgeschlossen'),
    (7,  '2026-09-13', '2026-09-25', '2026-09-24', 'abgeschlossen'),

    (9,  '2026-09-14', '2026-09-28', '2026-09-27', 'abgeschlossen'),
    (11, '2026-09-15', '2026-09-29', '2026-09-29', 'abgeschlossen'),
    (12, '2026-09-15', '2026-09-26', '2026-09-25', 'abgeschlossen'),
    (14, '2026-09-16', '2026-09-28', '2026-09-28', 'abgeschlossen'),
    (16, '2026-09-17', '2026-10-01', '2026-09-30', 'abgeschlossen'),

    (17, '2026-09-18', '2026-09-30', '2026-09-30', 'abgeschlossen'),
    (19, '2026-09-19', '2026-10-03', '2026-10-02', 'abgeschlossen'),
    (21, '2026-09-20', '2026-10-04', '2026-10-04', 'abgeschlossen'),
    (22, '2026-09-20', '2026-10-01', '2026-09-30', 'abgeschlossen'),
    (24, '2026-09-21', '2026-10-03', '2026-10-03', 'abgeschlossen'),

    (26, '2026-09-22', '2026-10-02', '2026-10-01', 'abgeschlossen'),
    (27, '2026-09-23', '2026-10-07', '2026-10-06', 'abgeschlossen'),
    (29, '2026-09-24', '2026-10-08', '2026-10-08', 'abgeschlossen'),
    (31, '2026-09-25', '2026-10-09', '2026-10-08', 'abgeschlossen'),
    (32, '2026-09-25', '2026-10-06', '2026-10-06', 'abgeschlossen'),

    (34, '2026-09-26', '2026-10-08', '2026-10-08', 'abgeschlossen'),
    (36, '2026-09-27', '2026-10-07', '2026-10-07', 'abgeschlossen'),
    (37, '2026-09-28', '2026-10-12', '2026-10-11', 'abgeschlossen'),
    (39, '2026-09-29', '2026-10-13', '2026-10-12', 'abgeschlossen'),
    (41, '2026-09-30', '2026-10-14', '2026-10-14', 'abgeschlossen'),

    -- Die folgenden fünf Ausleihen sind noch aktiv.
    -- Deshalb ist das tatsächliche Rückgabedatum noch unbekannt.
    (42, '2026-09-30', '2026-10-11', NULL, 'aktiv'),
    (44, '2026-10-01', '2026-10-13', NULL, 'aktiv'),
    (46, '2026-10-02', '2026-10-12', NULL, 'aktiv'),
    (47, '2026-10-03', '2026-10-17', NULL, 'aktiv'),
    (49, '2026-10-04', '2026-10-18', NULL, 'aktiv');
select * from ausleihe; 

-- ------------------------------------------------------------
-- 13. Testdaten: BEWERTUNG
-- ------------------------------------------------------------
-- Es werden 40 Bewertungen zu abgeschlossenen Ausleihen angelegt.
-- Bewertungen werden nur für abgeschlossene Ausleihen erfasst.
-- Ein Benutzer kann dieselbe Ausleihe aufgrund des UNIQUE-Constraints
-- (Ausleihe_ID, Benutzer_ID) höchstens einmal bewerten.
INSERT INTO BEWERTUNG
    (Ausleihe_ID, Benutzer_ID, Bewertung_Text,
     Bewertung_Punkte, Bewertungsdatum)
VALUES
    -- Ausleihe 1: Ausleiher Benutzer 2 / Anbieter Benutzer 1
    (1, 2, 'Freundliche und unkomplizierte Übergabe.', 5, '2026-09-24'),
    (1, 1, 'Buch wurde pünktlich und ordentlich zurückgegeben.', 5, '2026-09-24'),

    -- Ausleihe 2: Benutzer 3 / Benutzer 2
    (2, 3, 'Alles hat sehr gut funktioniert.', 5, '2026-09-21'),
    (2, 2, 'Zuverlässiger Ausleiher.', 5, '2026-09-21'),

    -- Ausleihe 3: Benutzer 5 / Benutzer 4
    (3, 5, 'Gute Kommunikation und schnelle Übergabe.', 4, '2026-09-22'),
    (3, 4, 'Das Buch kam in gutem Zustand zurück.', 5, '2026-09-22'),

    -- Ausleihe 4
    (4, 7, 'Sehr angenehme Ausleihe.', 5, '2026-09-26'),
    (4, 6, 'Problemloser Ablauf.', 5, '2026-09-26'),

    -- Ausleihe 5
    (5, 8, 'Das Buch entsprach der Beschreibung.', 4, '2026-09-25'),
    (5, 7, 'Pünktliche Rückgabe.', 5, '2026-09-25'),

    -- Ausleihe 6
    (6, 10, 'Übergabe war einfach und zuverlässig.', 5, '2026-09-28'),
    (6, 9, 'Sehr zuverlässiger Kontakt.', 5, '2026-09-28'),

    -- Ausleihe 7
    (7, 12, 'Gute Erfahrung, gerne wieder.', 5, '2026-09-30'),
    (7, 11, 'Alles wie vereinbart.', 5, '2026-09-30'),

    -- Ausleihe 8
    (8, 13, 'Das Buch war in einem guten Zustand.', 4, '2026-09-26'),
    (8, 12, 'Schnelle und unkomplizierte Rückgabe.', 5, '2026-09-26'),

    -- Ausleihe 9
    (9, 15, 'Freundlicher Kontakt.', 5, '2026-09-29'),
    (9, 14, 'Alles problemlos verlaufen.', 5, '2026-09-29'),

    -- Ausleihe 10
    (10, 17, 'Gute Kommunikation.', 4, '2026-10-01'),
    (10, 16, 'Buch wurde sehr sorgfältig behandelt.', 5, '2026-10-01'),

    -- Ausleihe 11
    (11, 18, 'Sehr unkomplizierte Übergabe.', 5, '2026-10-01'),
    (11, 17, 'Zuverlässige Rückgabe.', 5, '2026-10-01'),

    -- Ausleihe 12
    (12, 20, 'Alles hat wie vereinbart funktioniert.', 4, '2026-10-03'),
    (12, 19, 'Freundlicher und zuverlässiger Ausleiher.', 5, '2026-10-03'),

    -- Ausleihe 13
    (13, 22, 'Sehr gute Erfahrung.', 5, '2026-10-05'),
    (13, 21, 'Das Buch kam pünktlich zurück.', 5, '2026-10-05'),

    -- Ausleihe 14
    (14, 23, 'Unkomplizierte Ausleihe.', 5, '2026-10-01'),
    (14, 22, 'Alles bestens.', 5, '2026-10-01'),

    -- Ausleihe 15
    (15, 25, 'Freundlicher Anbieter und gutes Buch.', 5, '2026-10-04'),
    (15, 24, 'Sehr zuverlässige Rückgabe.', 5, '2026-10-04'),

    -- Bei den folgenden Ausleihen bewertet jeweils nur eine Seite.
    (16, 27, 'Guter und unkomplizierter Ablauf.', 4, '2026-10-02'),
    (17, 28, 'Alles bestens funktioniert.', 5, '2026-10-07'),
    (18, 30, 'Übergabe und Rückgabe waren problemlos.', 5, '2026-10-09'),
    (19, 32, 'Gute Kommunikation mit dem Anbieter.', 4, '2026-10-09'),
    (20, 33, 'Sehr positive Erfahrung.', 5, '2026-10-07'),
    (21, 35, 'Buch war wie beschrieben.', 4, '2026-10-10'),
    (22, 37, 'Freundlicher Kontakt und einfache Übergabe.', 5, '2026-10-08'),
    (23, 38, 'Alles lief zuverlässig.', 5, '2026-10-12'),
    (24, 40, 'Gute Organisation der Ausleihe.', 4, '2026-10-13'),
    (25, 42, 'Sehr unkomplizierter Ablauf.', 5, '2026-10-15');

select * from BEWERTUNG; 

-- ------------------------------------------------------------
-- 14. Testdaten: BENUTZER_STANDORT
-- ------------------------------------------------------------
INSERT INTO BENUTZER_STANDORT
    (Benutzer_ID, Standort_ID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20),
    (21, 21),
    (22, 22),
    (23, 23),
    (24, 24),
    (25, 25),
    (26, 26),
    (27, 27),
    (28, 28),
    (29, 29),
    (30, 30),
    (31, 31),
    (32, 32),
    (33, 33),
    (34, 34),
    (35, 35),
    (36, 36),
    (37, 37),
    (38, 38),
    (39, 39),
    (40, 40),
    (41, 41),
    (42, 42),
    (43, 43),
    (44, 44),
    (45, 45),
    (46, 46),
    (47, 47),
    (48, 48),
    (49, 49),
    (50, 50),

    -- Zusätzliche Standorte einiger Benutzer
    -- zur Abbildung der n:m-Beziehung
    (1, 41),
    (3, 42),
    (5, 43),
    (7, 44),
    (9, 45),
    (11, 46),
    (13, 47),
    (15, 48);
select * from BENUTZER_STANDORT;

-- ------------------------------------------------------------
-- 15. Testdaten: BUCH_AUTOR
-- ------------------------------------------------------------
INSERT INTO BUCH_AUTOR
    (Buch_ID, Autor_ID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20),
    (21, 21),
    (22, 22),
    (23, 23),
    (24, 24),
    (25, 25),
    (26, 26),
    (27, 27),
    (28, 28),
    (29, 29),
    (30, 30),
    (31, 31),
    (32, 32),
    (33, 33),
    (34, 34),
    (35, 35),
    (36, 36),
    (37, 37),
    (38, 38),
    (39, 39),
    (40, 40),
    (41, 41),
    (42, 42),
    (43, 43),
    (44, 44),
    (45, 45),
    (46, 46),
    (47, 47),
    (48, 48),
    (49, 49),
    (50, 50);
select * from BUCH_AUTOR;

-- ------------------------------------------------------------
-- 16. Testdaten: BUCH_GENRE
-- ------------------------------------------------------------
INSERT INTO BUCH_GENRE
    (Buch_ID, Genre_ID)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (6, 1),
    (6, 9),
    (7, 1),
    (8, 1),

    (9, 4),
    (9, 6),
    (10, 4),
    (10, 6),

    (11, 1),
    (12, 1),
    (12, 9),
    (13, 1),

    (14, 1),
    (14, 3),
    (15, 3),
    (16, 3),
    (17, 3),

    (18, 5),
    (18, 1),

    (19, 4),
    (19, 6),
    (20, 1),
    (20, 6),

    (21, 5),
    (21, 1),
    (22, 5),
    (22, 1),

    (23, 1),
    (24, 1),
    (25, 1),

    (26, 3),
    (27, 1),
    (28, 3),

    (29, 1),
    (29, 9),

    (30, 4),
    (31, 4),
    (32, 4),
    (32, 6),

    (33, 2),
    (34, 2),

    (35, 1),
    (36, 1),
    (37, 1),

    (38, 1),
    (38, 3),
    (39, 1),
    (39, 3),

    (40, 1),
    (41, 1),
    (42, 1),

    (43, 1),
    (43, 2),

    (44, 1),
    (45, 1),

    (46, 7),
    (46, 9),
    (47, 7),
    (48, 7),

    (49, 7),
    (50, 10);
select * from BUCH_GENRE; 

