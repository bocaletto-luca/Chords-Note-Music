# Chord Note Music Database
#### Author: Bocaletto Luca

A MySQL schema storing chord definitions for every note in the chromatic scale, with names and interval lists in both Italian and English. Each note (natural, sharp, flat) gets its own table containing all common chord types up to the 13th.

## Table Structure (Production-Ready)

Every table is named `NoteXY` (where `XY` is the note: DO, DOdiesis, REb, REdiesis, …) and shares this definition:

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

- `note_ita` / `note_eng`: the root note name in Italian / English  
- `chord_ita` / `chord_eng`: chord type (triad, 7th, 9th, 11th, 13th…)  
- `chord_note_ita` / `chord_note_eng`: interval composition (Do-Mi-Sol / C-E-G…)  
- `created_at` / `updated_at`: automatic timestamps for auditing  
- Unique keys to prevent duplicate chord entries  

## Included Tables

Each of the 12 chromatic notes (plus enharmonic flats/sharps) has its own table:

- **NoteDO**            (Do / C)  
- **NoteDOdiesis**      (Do♯ / C#)  
- **NoteDOb**           (Do♭ / Cb)  

- **NoteRE**            (Re / D)  
- **NoteREdiesis**      (Re♯ / D#)  
- **NoteREb**           (Re♭ / Db)  

- **NoteMI**            (Mi / E)  
- **NoteMIdiesis**      (Mi♯ / E#)  
- **NoteMIb**           (Mi♭ / Eb)  

- **NoteFA**            (Fa / F)  
- **NoteFAdiesis**      (Fa♯ / F#)  
- **NoteFAb**           (Fa♭ / Fb)  

- **NoteSOL**           (Sol / G)  
- **NoteSOLdiesis**     (Sol♯ / G#)  
- **NoteSOLb**          (Sol♭ / Gb)  

- **NoteLA**            (La / A)  
- **NoteLAdiesis**      (La♯ / A#)  
- **NoteLAb**           (La♭ / Ab)  

- **NoteSI**            (Si / B)  
- **NoteSIdiesis**      (Si♯ – rarely used)  
- **NoteSIb**           (Si♭ / Bb)  

Each table also includes `INSERT` statements populating all chord types up to the 13th.

## Quick Start

1. Create the database:  
   ```sql
   CREATE DATABASE ChordNoteMusic;
   USE ChordNoteMusic;
   ```
2. Apply each table’s DDL (above).  
3. Run the corresponding `INSERT` scripts for each `NoteXY` table.  
4. Query example:  
   ```sql
   -- Find all D9 variants
   SELECT * 
     FROM NoteRE 
    WHERE chord_eng LIKE 'D%9%';
   ```

## Repository & License

This project is open source under the GPL v3 license.  
GitHub: https://github.com/bocaletto-luca/Chords-Note-Music/
