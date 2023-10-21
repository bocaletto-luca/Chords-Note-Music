# ChordNoteMusicDatabase

## Database Description
The "ChordNoteMusicDatabase" is designed to store information about musical chords in different keys. It consists of several tables, each representing a musical note from the chromatic scale (C, C#, D, D#, E, F, F#, G, G#, A, A#, B) and related chord information in both Italian and English.

![Screenshot 2023-10-10 122524](https://github.com/elektronoide/Chords-Note-Music/assets/134635227/6667fcea-87ef-4d6c-b377-d4746c6812e7)

## Tables

### Table "DO" (C)
This table represents the note "DO" (C).
It contains information about chords in Italian and English related to the note "DO."
Each row represents a different type of chord for the note "DO," with details in the following fields:

- `note_ita`: The note in Italian (e.g., "Do").
- `chord_ita`: The chord name in Italian (e.g., "Do Maggiore").
- `chord_note_ita`: The chord composition in Italian (e.g., "Do-Mi-Sol").
- `note_eng`: The note in English (e.g., "C").
- `chord_eng`: The chord name in English (e.g., "CMaj").
- `chord_note_eng`: The chord composition in English (e.g., "C-E-G").

#### Example row:
| note_ita | chord_ita    | chord_note_ita | note_eng | chord_eng | chord_note_eng |
|----------|--------------|-----------------|----------|-----------|----------------|
| Do       | Do Maggiore  | Do-Mi-Sol       | C        | CMaj      | C-E-G          |

### Table "DO#" (C#)
This table represents the note "DO#" (C#).
It contains information about chords in Italian and English related to the note "DO#," with similar details in the specified fields.

# Lingua Italiana

## Descrizione del Database
Il database "Chords Note Music Database" è stato progettato per memorizzare informazioni sugli accordi musicali nelle diverse tonalità. Contiene una serie di tabelle, ognuna delle quali rappresenta una nota musicale della scala cromatica (C, C#, D, D#, E, F, F#, G, G#, A, A#, B) e le relative informazioni sugli accordi in italiano e inglese per quella nota.

## Tabelle

### Tabella "DO"
Questa tabella rappresenta la nota "DO" (C).
Contiene informazioni sugli accordi in italiano e inglese relativi alla nota "DO".
Ogni riga rappresenta un diverso tipo di accordo per la nota "DO", con dettagli sui seguenti campi:

- `note_ita`: La nota in italiano (es. "Do").
- `chord_ita`: Il nome dell'accordo in italiano (es. "Do Maggiore").
- `chord_note_ita`: La composizione dell'accordo in italiano (es. "Do-Mi-Sol").
- `note_eng`: La nota in inglese (es. "C").
- `chord_eng`: Il nome dell'accordo in inglese (es. "CMaj").
- `chord_note_eng`: La composizione dell'accordo in inglese (es. "C-E-G").

#### Esempio di riga:
| note_ita | chord_ita    | chord_note_ita | note_eng | chord_eng | chord_note_eng |
|----------|--------------|-----------------|----------|-----------|----------------|
| Do       | Do Maggiore  | Do-Mi-Sol       | C        | CMaj      | C-E-G          |

### Tabella "DO#" (C#)
Questa tabella rappresenta la nota "DO#" (C#).
Contiene informazioni sugli accordi in italiano e inglese relativi alla nota "DO#".
Ogni riga rappresenta un diverso tipo di accordo per la nota "DO#", con dettagli simili nei campi specificati sopra.
