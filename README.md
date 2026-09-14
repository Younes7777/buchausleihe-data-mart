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

## 📁 Projektstruktur

```text
buchausleihe-data-mart/
│
├── README.md
│
├── sql/
│   ├── 01_schema.sql
│   ├── 02_testdaten.sql
│   └── 03_testfaelle.sql
│
└── docs/
    ├── Installationsanleitung_Phase3_Younes_Iferd.docx
    ├── Abstract_Phase3_Younes_Iferd.docx
    └── Phase3_Younes_Iferd.docx
```

### SQL-Dateien

| Datei | Beschreibung |
|---|---|
| `sql/01_schema.sql` | Erstellt die Datenbank, Tabellen, Beziehungen und Constraints |
| `sql/02_testdaten.sql` | Befüllt alle Tabellen mit Testdaten |
| `sql/03_testfaelle.sql` | Enthält 16 Testfälle zur Überprüfung der Datenbank |

### Dokumentation

| Datei | Beschreibung |
|---|---|
| `docs/Installationsanleitung_Phase3_Younes_Iferd.docx` | Anleitung zur Einrichtung und Prüfung der Datenbank |
| `docs/Abstract_Phase3_Younes_Iferd.docx` | Abstract zur Finalisierungsphase |
| `docs/Phase3_Younes_Iferd.docx` | Dreiseitige Dokumentation zu Funktionalität, Metadaten und Tests |

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
```

Die Datenbank sollte anschließend **16 Tabellen** enthalten.

Eine ausführlichere Beschreibung der Einrichtung befindet sich in:

`docs/Installationsanleitung_Phase3_Younes_Iferd.docx`

## 🧪 Tests

Für die Datenbank wurden **16 Testfälle** erstellt. Sie überprüfen unter anderem:

- Beziehungen zwischen den Tabellen
- JOIN-Abfragen über mehrere Tabellen
- optionale Beziehungen
- Aggregationen
- referenzielle Integrität
- CHECK- und UNIQUE-Constraints

Einige Testfälle erzeugen bewusst Fehlermeldungen, um die Wirksamkeit der definierten Constraints nachzuweisen.

## 📊 Testdaten und Metadaten

Die Datenbank enthält insgesamt **724 Testdatensätze** in 16 Tabellen.

Beispielsweise:

- 50 Benutzer
- 50 Bücher
- 50 Buchangebote
- 50 Ausleihanfragen
- 30 Ausleihen
- 40 Bewertungen

Der in MySQL ermittelte Speicherbedarf der Tabellen einschließlich Indizes beträgt ungefähr **0,56 MB**.

## 🛠️ Technologien

- MySQL
- MySQL Workbench
- SQL
- Git
- GitHub

## 🎓 Projektkontext

**IU Akademie – Database Development**  
**Phase 3: Finalisierungsphase**  
**Younes Iferd**
