# 📚 Buchausleih-Anwendung – Data-Mart-Erstellung in SQL

Dieses Projekt wurde im Rahmen des Kurses **Database Development** an der **IU Akademie** erstellt.

Ziel des Projekts ist die Konzeption und Implementierung einer relationalen MySQL-Datenbank für eine Buchausleih-Anwendung. Benutzer können Bücher anbieten, Ausleihanfragen stellen, Übergabearten und Zeitslots auswählen sowie abgeschlossene Ausleihen bewerten.

## 👤 Autor

**Younes Iferd**  
IU Akademie  
Projektphase 3 – Finalisierung

## 🗄️ Datenbank

Die Datenbank wurde mit **MySQL** entwickelt und umfasst:

- 12 fachliche Entitäten
- 4 Brückentabellen
- 16 physische Tabellen
- 724 Testdatensätze
- Primär- und Fremdschlüssel
- NOT NULL-, UNIQUE- und CHECK-Constraints
- Normalisierung bis zur dritten Normalform (3NF)

## 🔄 Zentraler Prozess

Buchangebot → Ausleihanfrage → Annahme → Ausleihe → Rückgabe → Bewertung

## 📁 SQL-Dateien

| Datei | Beschreibung |
|---|---|
| `01_schema.sql` | Erstellt die Datenbank, Tabellen, Beziehungen und Constraints |
| `02_testdaten.sql` | Befüllt alle Tabellen mit Testdaten |
| `03_testfaelle.sql` | Enthält 16 Testfälle zur Überprüfung der Datenbank |

## ⚙️ Installation

Vorausgesetzt werden **MySQL Server** und **MySQL Workbench**.

Die SQL-Dateien werden in folgender Reihenfolge ausgeführt:

1. `01_schema.sql`
2. `02_testdaten.sql`
3. `03_testfaelle.sql`

Nach der Installation kann die Datenbank beispielsweise mit folgenden Befehlen überprüft werden:

```sql
USE buchausleihe_db;
SHOW TABLES;
