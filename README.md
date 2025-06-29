# Chord Note Music Database  
#### Author: Bocaletto Luca (@bocaletto-luca)

A robust, production-ready MySQL schema that catalogs every chord extension (triads, 6ths, 7ths, 9ths, 11ths, 13ths) for all 12 chromatic notes (naturals, sharps, flats), with bilingual metadata (Italian & English).  

---

## 📖 Overview

The **Chord Note Music Database** provides a uniform set of tables—one per note of the chromatic scale—populated with every common chord type up to the 13th. Each table stores:

- Italian & English chord names  
- Interval breakdowns in both languages  
- Automatic `created_at` / `updated_at` timestamps  
- Unique constraints to prevent duplicates  

Use it as a standalone MySQL reference or convert to JSON for web/mobile apps and APIs.

---

## 🗄️ Table Structure (Production-Ready)

Every table is named `NoteXY` (where `XY` is the note: DO, DOdiesis, REb, REdiesis, …) and follows this DDL:

```sql
CREATE TABLE NoteXY (
  id               INT UNSIGNED    NOT NULL AUTO_INCREMENT,
  note_ita         VARCHAR(3)      NOT NULL COMMENT 'Italian note name, e.g. Do♯',
  chord_ita        VARCHAR(50)     NOT NULL COMMENT 'Italian chord name, e.g. Do♯ Maggiore 7',
  chord_note_ita   VARCHAR(100)    NOT NULL COMMENT 'Italian intervals, e.g. Do♯-Mi-Sol♯-Si',
  note_eng         VARCHAR(2)      NOT NULL COMMENT 'English note name, e.g. C#',
  chord_eng        VARCHAR(20)     NOT NULL COMMENT 'English chord name, e.g. C#Maj7',
  chord_note_eng   VARCHAR(100)    NOT NULL COMMENT 'English intervals, e.g. C#-E#-G#-B#',
  created_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP
                         ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
```

**Columns**  
- `note_ita` / `note_eng`: root note name in Italian / English  
- `chord_ita` / `chord_eng`: chord type (triad, 7th, 9th, 11th, 13th…)  
- `chord_note_ita` / `chord_note_eng`: interval composition (Do-Mi-Sol / C-E-G…)  
- `created_at` / `updated_at`: timestamps for audit  
- Unique keys to prevent duplicate entries  

---

## 🎹 Included Tables

| Table Name        | Italian / English |  
|-------------------|-------------------|  
| NoteDO            | Do / C            |  
| NoteDOdiesis      | Do♯ / C#          |  
| NoteDOb           | Do♭ / Cb          |  
| NoteRE            | Re / D            |  
| NoteREdiesis      | Re♯ / D#          |  
| NoteREb           | Re♭ / Db          |  
| NoteMI            | Mi / E            |  
| NoteMIdiesis      | Mi♯ / E#          |  
| NoteMIb           | Mi♭ / Eb          |  
| NoteFA            | Fa / F            |  
| NoteFAdiesis      | Fa♯ / F#          |  
| NoteFAb           | Fa♭ / Fb          |  
| NoteSOL           | Sol / G           |  
| NoteSOLdiesis     | Sol♯ / G#         |  
| NoteSOLb          | Sol♭ / Gb         |  
| NoteLA            | La / A            |  
| NoteLAdiesis      | La♯ / A#          |  
| NoteLAb           | La♭ / Ab          |  
| NoteSI            | Si / B            |  
| NoteSIdiesis      | Si♯ (rare)        |  
| NoteSIb           | Si♭ / Bb          |  

Each table includes full `INSERT` statements to populate chords up to the 13th.

---

## 🛠️ Scripts & Utilities

This repo provides three key files:

1. **`file.sql`**  
   - Complete DDL & `INSERT` statements for all `NoteXY` tables  

2. **`sql_to_json.sh`**  
   - Bash script (requires `mysql` & `python3`)  
   - Imports `file.sql` into MySQL → dumps all tables to a single `chords.json`  

   Usage:
   ```bash
   chmod +x sql_to_json.sh
   ./sql_to_json.sh
   # → generates chords.json
   ```

3. **`sql_to_json.py`**  
   - Pure-Python parser (no MySQL server required)  
   - Reads `file.sql`, extracts all `INSERT` data, writes `chords.json`  

   Usage:
   ```bash
   # Optional: pip install sqlparse
   python3 sql_to_json.py file.sql [output.json]
   # → default output.json = chords.json
   ```

---

## 🚀 Quick Start

1. **Clone the repo**  
   ```bash
   git clone https://github.com/bocaletto-luca/Chords-Note-Music.git
   cd Chords-Note-Music
   ```

2. **Import schema & data**  
   ```sql
   mysql -u <user> -p < file.sql
   ```

3. **(Optional) Generate JSON**  
   - With MySQL: `./sql_to_json.sh`  
   - Without MySQL: `python3 sql_to_json.py file.sql`

4. **Query example**  
   ```sql
   SELECT * 
     FROM NoteRE 
    WHERE chord_eng LIKE 'D%9%';
   ```

---

## 🔗 Links

- GitHub Repository:  
  https://github.com/bocaletto-luca/Chords-Note-Music/  
- Author’s GitHub:  
  https://github.com/bocaletto-luca  
- Author’s Website:  
  https://bocalettoluca.altervista.org  

---

## ⚖️ License

This project is licensed under **GPLv3**. See [LICENSE](LICENSE).

---

> **Note:** This repository replaces the old account `@Elektronoide`. All future updates will be under `@bocaletto-luca`.

---

> **New:** A multilingual site has been added! At the end of this repo you’ll find `index.html`, plus language-specific pages:  
> - `english.html`  
> - `italian.html`  
> - `spanish.html`  
> - `french.html`  
> - `german.html`  
> - `portuguese.html`  
> - `chinese.html`  
> - `russian.html`  

Navigate your preferred language from the main selector page.  

---
