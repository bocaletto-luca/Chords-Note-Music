-- Autrhor: Bocaletto Luca
-- License: Open Source
-- Web Site: https://www.bocaletto-luca.github.io
-- web site: https://bocalettoluca.altervista.org
-- language: sql

-- VERSIONE “PRODUCTION‐READY” DELLA TABELLA NoteDO
CREATE TABLE NoteDO (
  id                 INT UNSIGNED        NOT NULL AUTO_INCREMENT,
  note_ita           VARCHAR(2)          NOT NULL COMMENT 'es. Do',
  chord_ita          VARCHAR(50)         NOT NULL COMMENT 'es. Do Maggiore 7',
  chord_note_ita     VARCHAR(100)        NOT NULL COMMENT 'es. Do-Mi-Sol-Si',
  note_eng           VARCHAR(2)          NOT NULL COMMENT 'es. C',
  chord_eng          VARCHAR(20)         NOT NULL COMMENT 'es. CMaj7',
  chord_note_eng     VARCHAR(100)        NOT NULL COMMENT 'es. C-E-G-B',
  created_at         TIMESTAMP           NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at         TIMESTAMP           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita  (note_ita, chord_ita),
  UNIQUE KEY uk_eng  (note_eng, chord_eng)
) ENGINE=InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;


-- TUTTI GLI ACCORDI PER DO (C) NELLA TABELA NoteDO
INSERT INTO NoteDO (
  note_ita,   chord_ita,        chord_note_ita,
  note_eng,   chord_eng,        chord_note_eng
) VALUES
  /* --- TRIADI --- */
  ('DO','Do Maggiore',            'Do-Mi-Sol',                 'C','CMaj',   'C-E-G'),
  ('DO','Do Minore',              'Do-Mib-Sol',                'C','Cm',     'C-Eb-G'),
  ('DO','Do Diminuito',           'Do-Mib-Solb',               'C','Cdim',   'C-Eb-Gb'),
  ('DO','Do Aumentato',           'Do-Mi-Sol♯',                'C','Caug',   'C-E-G#'),

  /* --- QUARTE & QUINTE --- */
  ('DO','Do Quarta',              'Do-Fa',                     'C','C4',     'C-F'),
  ('DO','Do Quinta',              'Do-Sol',                    'C','C5',     'C-G'),

  /* --- SOSPESI --- */
  ('DO','Do Sospesa 2',           'Do-Re-Sol',                 'C','Csus2',  'C-D-G'),
  ('DO','Do Sospesa 4',           'Do-Fa-Sol',                 'C','Csus4',  'C-F-G'),
  ('DO','Do sus4 add9',           'Do-Re-Fa-Sol',              'C','Csus4add9','C-D-F-G'),

  /* --- SENZA INTERVALLI --- */
  ('DO','Do senza Terza',         'Do-Sol',                    'C','Cno3',   'C-G'),
  ('DO','Do senza Quinta',        'Do-Mi',                     'C','Cno5',   'C-E'),

  /* --- ADDITIONS --- */
  ('DO','Do add2',                'Do-Mi-Sol-Re',              'C','Cadd2',  'C-E-G-D'),
  ('DO','Do add4',                'Do-Mi-Sol-Fa',              'C','Cadd4',  'C-E-G-F'),
  ('DO','Do add9',                'Do-Mi-Sol-Re',              'C','Cadd9',  'C-E-G-D'),
  ('DO','Do add11',               'Do-Mi-Sol-Fa',              'C','Cadd11', 'C-E-G-F'),

  /* --- SESTE --- */
  ('DO','Do Sesta',               'Do-Mi-Sol-La',              'C','C6',     'C-E-G-A'),
  ('DO','Do Minore 6',            'Do-Mib-Sol-La',             'C','Cm6',    'C-Eb-G-A'),
  ('DO','Do 6/9',                 'Do-Mi-Sol-La-Re',           'C','C6/9',   'C-E-G-A-D'),

  /* --- SETTIME --- */
  ('DO','Do Settima',             'Do-Mi-Sol-Sib',             'C','C7',     'C-E-G-Bb'),
  ('DO','Do Maggiore 7',          'Do-Mi-Sol-Si',              'C','CMaj7',  'C-E-G-B'),
  ('DO','Do Minore 7',            'Do-Mib-Sol-Sib',            'C','Cm7',    'C-Eb-G-Bb'),
  ('DO','Do Semidiminuito',       'Do-Mib-Solb-Sib',           'C','Cm7b5',  'C-Eb-Gb-Bb'),
  ('DO','Do Dim7',                'Do-Mib-Solb-La',            'C','Cdim7',  'C-Eb-Gb-A'),
  ('DO','Do 7♭5',                'Do-Mi-Solb-Sib',            'C','C7b5',   'C-E-Gb-Bb'),
  ('DO','Do 7♯5',                'Do-Mi-Sol♯-Sib',            'C','C7#5',   'C-E-G#-Bb'),
  ('DO','Do 7sus2',              'Do-Re-Sol-Sib',             'C','C7sus2', 'C-D-G-Bb'),
  ('DO','Do 7sus4',              'Do-Fa-Sol-Sib',             'C','C7sus4', 'C-F-G-Bb'),
  ('DO','Do 7add11',             'Do-Mi-Sol-Sib-Fa',          'C','C7add11','C-E-G-Bb-F'),

  /* --- NOVE --- */
  ('DO','Do Nona',               'Do-Mi-Sol-Sib-Re',          'C','C9',     'C-E-G-Bb-D'),
  ('DO','Do Maggiore 9',         'Do-Mi-Sol-Si-Re',           'C','CMaj9',  'C-E-G-B-D'),
  ('DO','Do Minore 9',           'Do-Mib-Sol-Sib-Re',         'C','Cm9',    'C-Eb-G-Bb-D'),
  ('DO','Do 9♭5',               'Do-Mi-Solb-Sib-Re',         'C','C9b5',   'C-E-Gb-Bb-D'),
  ('DO','Do 9♯5',               'Do-Mi-Sol♯-Sib-Re',         'C','C9#5',   'C-E-G#-Bb-D'),
  ('DO','Do 9sus4',             'Do-Fa-Sol-Sib-Re',          'C','C9sus4', 'C-F-G-Bb-D'),
  ('DO','Do 9add11',            'Do-Mi-Sol-Sib-Fa-Re',       'C','C9add11','C-E-G-Bb-F-D'),

  /* --- UNDICI --- */
  ('DO','Do Undicesima',         'Do-Mi-Sol-Sib-Re-Fa',       'C','C11',    'C-E-G-Bb-D-F'),
  ('DO','Do Maggiore 11',        'Do-Mi-Sol-Si-Re-Fa',        'C','CMaj11', 'C-E-G-B-D-F'),
  ('DO','Do Minore 11',          'Do-Mib-Sol-Sib-Re-Fa',      'C','Cm11',   'C-Eb-G-Bb-D-F'),
  ('DO','Do 11♭5',              'Do-Mi-Solb-Sib-Re-Fa',      'C','C11b5',  'C-E-Gb-Bb-D-F'),
  ('DO','Do 11♯5',              'Do-Mi-Sol♯-Sib-Re-Fa',      'C','C11#5',  'C-E-G#-Bb-D-F'),

  /* --- TREDICI --- */
  ('DO','Do Tredicesima',        'Do-Mi-Sol-Sib-Re-Fa-La',    'C','C13',    'C-E-G-Bb-D-F-A'),
  ('DO','Do Maggiore 13',        'Do-Mi-Sol-Si-Re-Fa-La',     'C','CMaj13', 'C-E-G-B-D-F-A'),
  ('DO','Do Minore 13',          'Do-Mib-Sol-Sib-Re-Fa-La',   'C','Cm13',   'C-Eb-G-Bb-D-F-A');

-- VERSIONE “PRODUCTION‐READY” DELLA TABELLA NoteDOb
CREATE TABLE NoteDOb (
  id                 INT UNSIGNED NOT NULL AUTO_INCREMENT,
  note_ita           VARCHAR(2)    NOT NULL,    -- es. 'Do♭'
  chord_ita          VARCHAR(50)   NOT NULL,    -- es. 'Do♭ Maggiore 7'
  chord_note_ita     VARCHAR(100)  NOT NULL,    -- es. 'Do♭-Mi♭-Sol♭-Si♭'
  note_eng           VARCHAR(2)    NOT NULL,    -- es. 'Cb'
  chord_eng          VARCHAR(20)   NOT NULL,    -- es. 'CbMaj7'
  chord_note_eng     VARCHAR(100)  NOT NULL,    -- es. 'Cb-Eb-Gb-Bb'
  created_at         TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at         TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

-- TUTTI GLI ACCORDI PER DO♭ (Cb) NELLA TABELA NoteDOb
INSERT INTO NoteDOb (
  note_ita,   chord_ita,        chord_note_ita,
  note_eng,   chord_eng,        chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('DO♭','Do♭ Maggiore',      'Do♭-Mi♭-Sol♭',           'Cb','CbMaj',   'Cb-Eb-Gb'),
  ('DO♭','Do♭ Minore',        'Do♭-Mi♭♭-Sol♭',          'Cb','Cbm',     'Cb-Ebb-Gb'),
  ('DO♭','Do♭ Diminuito',     'Do♭-Mi♭♭-Sol♭♭',         'Cb','Cbdim',   'Cb-Ebb-Gbb'),
  ('DO♭','Do♭ Aumentato',     'Do♭-Mi♭-Sol♭♯',          'Cb','Cbaug',   'Cb-Eb-Gb#'),

  /* --- QUARTE & QUINTE --- */
  ('DO♭','Do♭ Quarta',        'Do♭-Fa♭',                'Cb','Cb4',     'Cb-Fb'),
  ('DO♭','Do♭ Quinta',        'Do♭-Sol♭',               'Cb','Cb5',     'Cb-Gb'),

  /* --- SOSPESI --- */
  ('DO♭','Do♭ Sospesa 2',     'Do♭-Re♭-Sol♭',           'Cb','Cbsus2',    'Cb-Db-Gb'),
  ('DO♭','Do♭ Sospesa 4',     'Do♭-Fa♭-Sol♭',           'Cb','Cbsus4',    'Cb-Fb-Gb'),
  ('DO♭','Do♭ sus4 add9',     'Do♭-Re♭-Fa♭-Sol♭',       'Cb','Cbsus4add9','Cb-Db-Fb-Gb'),

  /* --- SENZA INTERVALLI --- */
  ('DO♭','Do♭ senza Terza',   'Do♭-Sol♭',               'Cb','Cbno3',    'Cb-Gb'),
  ('DO♭','Do♭ senza Quinta',  'Do♭-Mi♭',               'Cb','Cbno5',    'Cb-Eb'),

  /* --- ADDITIONS --- */
  ('DO♭','Do♭ add2',          'Do♭-Mi♭-Sol♭-Re♭',       'Cb','Cbadd2',   'Cb-Eb-Gb-Db'),
  ('DO♭','Do♭ add4',          'Do♭-Mi♭-Sol♭-Fa♭',       'Cb','Cbadd4',   'Cb-Eb-Gb-Fb'),
  ('DO♭','Do♭ add9',          'Do♭-Mi♭-Sol♭-Re♭',       'Cb','Cbadd9',   'Cb-Eb-Gb-Db'),
  ('DO♭','Do♭ add11',         'Do♭-Mi♭-Sol♭-Fa♭',       'Cb','Cbadd11',  'Cb-Eb-Gb-Fb'),

  /* --- SESTE --- */
  ('DO♭','Do♭ Sesta',         'Do♭-Mi♭-Sol♭-La♭',       'Cb','Cb6',      'Cb-Eb-Gb-Ab'),
  ('DO♭','Do♭ Minore 6',      'Do♭-Mi♭♭-Sol♭-La♭',      'Cb','Cbm6',     'Cb-Ebb-Gb-Ab'),
  ('DO♭','Do♭ 6/9',           'Do♭-Mi♭-Sol♭-La♭-Re♭',   'Cb','Cb6/9',    'Cb-Eb-Gb-Ab-Db'),

  /* --- SETTIME --- */
  ('DO♭','Do♭ Settima',       'Do♭-Mi♭-Sol♭-Si♭',       'Cb','Cb7',      'Cb-Eb-Gb-Bb'),
  ('DO♭','Do♭ Maggiore 7',    'Do♭-Mi♭-Sol♭-Si♮',       'Cb','CbMaj7',   'Cb-Eb-Gb-B'),
  ('DO♭','Do♭ Minore 7',      'Do♭-Mi♭♭-Sol♭-Si♭',      'Cb','Cbm7',     'Cb-Ebb-Gb-Bb'),
  ('DO♭','Do♭ Semidiminuito', 'Do♭-Mi♭♭-Sol♭♭-Si♭',     'Cb','Cbm7b5',  'Cb-Ebb-Gbb-Bb'),
  ('DO♭','Do♭ Dim7',          'Do♭-Mi♭♭-Sol♭♭-La',      'Cb','Cbdim7',   'Cb-Ebb-Gbb-A'),
  ('DO♭','Do♭ 7♭5',          'Do♭-Mi♭-Sol♭♭-Si♭',      'Cb','Cb7b5',    'Cb-Eb-Gbb-Bb'),
  ('DO♭','Do♭ 7♯5',          'Do♭-Mi♭-Sol♭♯-Si♭',      'Cb','Cb7#5',    'Cb-Eb-Gb#-Bb'),
  ('DO♭','Do♭ 7sus2',        'Do♭-Re♭-Sol♭-Si♭',       'Cb','Cb7sus2',  'Cb-Db-Gb-Bb'),
  ('DO♭','Do♭ 7sus4',        'Do♭-Fa♭-Sol♭-Si♭',       'Cb','Cb7sus4',  'Cb-Fb-Gb-Bb'),
  ('DO♭','Do♭ 7add11',       'Do♭-Mi♭-Sol♭-Si♭-Fa♭',   'Cb','Cb7add11', 'Cb-Eb-Gb-Bb-Fb'),

  /* --- NOVE --- */
  ('DO♭','Do♭ Nona',         'Do♭-Mi♭-Sol♭-Si♭-Re♭',   'Cb','Cb9',      'Cb-Eb-Gb-Bb-Db'),
  ('DO♭','Do♭ Maggiore 9',   'Do♭-Mi♭-Sol♭-Si♮-Re♭',   'Cb','CbMaj9',   'Cb-Eb-Gb-B-Db'),
  ('DO♭','Do♭ Minore 9',     'Do♭-Mi♭♭-Sol♭-Si♭-Re♭',  'Cb','Cbm9',     'Cb-Ebb-Gb-Bb-Db'),
  ('DO♭','Do♭ 9♭5',         'Do♭-Mi♭-Sol♭♭-Si♭-Re♭',  'Cb','Cb9b5',    'Cb-Eb-Gbb-Bb-Db'),
  ('DO♭','Do♭ 9♯5',         'Do♭-Mi♭-Sol♭♯-Si♭-Re♭',  'Cb','Cb9#5',    'Cb-Eb-Gb#-Bb-Db'),
  ('DO♭','Do♭ 9sus4',       'Do♭-Fa♭-Sol♭-Si♭-Re♭',   'Cb','Cb9sus4',  'Cb-Fb-Gb-Bb-Db'),
  ('DO♭','Do♭ 9add11',      'Do♭-Mi♭-Sol♭-Si♭-Re♭-Fa♭','Cb','Cb9add11', 'Cb-Eb-Gb-Bb-Db-Fb'),

  /* --- UNDICI --- */
  ('DO♭','Do♭ Undicesima',   'Do♭-Mi♭-Sol♭-Si♭-Re♭-Fa♭','Cb','Cb11',     'Cb-Eb-Gb-Bb-Db-Fb'),
  ('DO♭','Do♭ Maggiore 11',  'Do♭-Mi♭-Sol♭-Si♮-Re♭-Fa♭','Cb','CbMaj11',  'Cb-Eb-Gb-B-Db-Fb'),
  ('DO♭','Do♭ Minore 11',    'Do♭-Mi♭♭-Sol♭-Si♭-Re♭-Fa♭','Cb','Cbm11',    'Cb-Ebb-Gb-Bb-Db-Fb'),
  ('DO♭','Do♭ 11♭5',        'Do♭-Mi♭-Sol♭♭-Si♭-Re♭-Fa♭','Cb','Cb11b5',   'Cb-Eb-Gbb-Bb-Db-Fb'),
  ('DO♭','Do♭ 11♯5',        'Do♭-Mi♭-Sol♭♯-Si♭-Re♭-Fa♭','Cb','Cb11#5',   'Cb-Eb-Gb#-Bb-Db-Fb'),

  /* --- TREDICI --- */
  ('DO♭','Do♭ Tredicesima',  'Do♭-Mi♭-Sol♭-Si♭-Re♭-Fa♭-La♭','Cb','Cb13',     'Cb-Eb-Gb-Bb-Db-Fb-Ab'),
  ('DO♭','Do♭ Maggiore 13','Do♭-Mi♭-Sol♭-Si♮-Re♭-Fa♭-La♭','Cb','CbMaj13',  'Cb-Eb-Gb-B-Db-Fb-Ab'),
  ('DO♭','Do♭ Minore 13',    'Do♭-Mi♭♭-Sol♭-Si♭-Re♭-Fa♭-La♭','Cb','Cbm13',    'Cb-Ebb-Gb-Bb-Db-Fb-Ab');


-- Creazione della tabella NoteDOdiesis (Do# / C#)
CREATE TABLE NoteDOdiesis (
  id               INT UNSIGNED NOT NULL AUTO_INCREMENT,
  note_ita         VARCHAR(2)    NOT NULL COMMENT 'es. DO#',
  chord_ita        VARCHAR(50)   NOT NULL COMMENT 'es. DO# Maggiore 7',
  chord_note_ita   VARCHAR(100)  NOT NULL COMMENT 'es. DO#-Fa-La-Si',
  note_eng         VARCHAR(2)    NOT NULL COMMENT 'es. C#',
  chord_eng        VARCHAR(20)   NOT NULL COMMENT 'es. C#Maj7',
  chord_note_eng   VARCHAR(100)  NOT NULL COMMENT 'es. C#-E#-G#-B',
  created_at       TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserimento dei dati per gli accordi di DO# (C#)
INSERT INTO NoteDOdiesis (
  note_ita, chord_ita, chord_note_ita,
  note_eng, chord_eng, chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('DO#','Do# Maggiore',    'Do#-Fa-La#',                   'C#','C#Maj',   'C#-E#-G#'),
  ('DO#','Do# Minore',      'Do#-Fa-La#',                   'C#','C#m',     'C#-E-G#'),
  ('DO#','Do# Diminuito',   'Do#-Fa-La',                    'C#','C#dim',   'C#-E-G'),
  ('DO#','Do# Aumentato',   'Do#-Fa-La##',                  'C#','C#aug',   'C#-E#-G##'),

  /* --- QUARTE & QUINTE --- */
  ('DO#','Do# Quarta',      'Do#-Sol',                      'C#','C#4',     'C#-G#'),
  ('DO#','Do# Quinta',      'Do#-Fa#',                      'C#','C#5',     'C#-Fx'),

  /* --- SOSPESI --- */
  ('DO#','Do# sus2',        'Do#-Re#-Fa#',                  'C#','C#sus2',  'C#-D#-Fx'),
  ('DO#','Do# sus4',        'Do#-Fa-Sol#',                  'C#','C#sus4',  'C#-F#-G#'),
  ('DO#','Do# sus4 add9',   'Do#-Re#-Fa-Sol#',              'C#','C#sus4add9','C#-D#-F#-G#'),

  /* --- SENZA INTERVALLI --- */
  ('DO#','Do# no3',         'Do#-Fa#',                      'C#','C#no3',   'C#-Fx'),
  ('DO#','Do# no5',         'Do#-Mi#',                      'C#','C#no5',   'C#-E#'),

  /* --- ADDITIONS --- */
  ('DO#','Do# add2',        'Do#-Mi#-Fa#-Re#',              'C#','C#add2',  'C#-E#-Fx-D#'),
  ('DO#','Do# add4',        'Do#-Mi#-Sol-Fa',               'C#','C#add4',  'C#-E#-G-F'),
  ('DO#','Do# add9',        'Do#-Fa#-Sol#-Re#',             'C#','C#add9',  'C#-Fx-G#-D#'),
  ('DO#','Do# add11',       'Do#-Fa#-La#-Sol',              'C#','C#add11', 'C#-Fx-A#-G'),

  /* --- SESTE --- */
  ('DO#','Do# 6',           'Do#-Mi#-Sol#-La#',             'C#','C#6',     'C#-E#-G#-A#'),
  ('DO#','Do# m6',          'Do#-Mi-Fa#-La#',               'C#','C#m6',    'C#-E-Fx-A#'),
  ('DO#','Do# 6/9',         'Do#-Mi#-Sol#-La#-Re#',         'C#','C#6/9',   'C#-E#-G#-A#-D#'),

  /* --- SETTIME --- */
  ('DO#','Do# 7',           'Do#-Mi#-Sol#-Si',              'C#','C#7',     'C#-E#-G#-B'),
  ('DO#','Do# Maj7',        'Do#-Mi#-Sol#-Si#',             'C#','C#Maj7',  'C#-E#-G#-B#'),
  ('DO#','Do# m7',          'Do#-Mi-Sol#-Si',               'C#','C#m7',    'C#-E-G#-B'),
  ('DO#','Do# m7b5',        'Do#-Mi-Sol-Si',                'C#','C#m7b5',  'C#-E-G-B'),
  ('DO#','Do# dim7',        'Do#-Mi-Sol-La',                'C#','C#dim7',  'C#-E-G-A'),
  ('DO#','Do# 7b5',         'Do#-Mi#-Sol#-Si',              'C#','C#7b5',   'C#-E#-G#-B'),
  ('DO#','Do# 7#5',         'Do#-Mi#-Sol##-Si',             'C#','C#7#5',   'C#-E#-G##-B'),
  ('DO#','Do# 7sus2',       'Do#-Re#-Sol#-Si',              'C#','C#7sus2', 'C#-D#-G#-B'),
  ('DO#','Do# 7sus4',       'Do#-Fa-Sol#-Si',               'C#','C#7sus4', 'C#-F#-G#-B'),
  ('DO#','Do# 7add11',      'Do#-Mi#-Sol#-Si-Fa',           'C#','C#7add11','C#-E#-G#-B-F'),

  /* --- NOVE --- */
  ('DO#','Do# 9',           'Do#-Mi#-Sol#-Si-Re#',          'C#','C#9',     'C#-E#-G#-B-D#'),
  ('DO#','Do# Maj9',        'Do#-Mi#-Sol#-Si#-Re#',         'C#','C#Maj9',  'C#-E#-G#-B#-D#'),
  ('DO#','Do# m9',          'Do#-Mi-Sol#-Si-Re#',           'C#','C#m9',    'C#-E-G#-B-D#'),
  ('DO#','Do# 9b5',         'Do#-Mi#-Sol-Si-Re#',           'C#','C#9b5',   'C#-E#-G-B-D#'),
  ('DO#','Do# 9#5',         'Do#-Mi#-Sol##-Si-Re#',         'C#','C#9#5',   'C#-E#-G##-B-D#'),
  ('DO#','Do# 9sus4',       'Do#-Fa-Sol#-Si-Re#',           'C#','C#9sus4', 'C#-F#-G#-B-D#'),
  ('DO#','Do# 9add11',      'Do#-Mi#-Sol#-Si-Fa-Re#',       'C#','C#9add11','C#-E#-G#-B-F-D#'),

  /* --- UNDICI --- */
  ('DO#','Do# 11',          'Do#-Mi#-Sol#-Si-Re#-Fa#',      'C#','C#11',    'C#-E#-G#-B-D#-F#'),
  ('DO#','Do# Maj11',       'Do#-Mi#-Sol#-Si#-Re#-Fa#',     'C#','C#Maj11', 'C#-E#-G#-B#-D#-F#'),
  ('DO#','Do# m11',         'Do#-Mi-Sol#-Si-Re#-Fa#',       'C#','C#m11',   'C#-E-G#-B-D#-F#'),
  ('DO#','Do# 11b5',        'Do#-Mi#-Sol-Si-Re#-Fa#',       'C#','C#11b5',  'C#-E#-G-B-D#-F#'),
  ('DO#','Do# 11#5',        'Do#-Mi#-Sol##-Si-Re#-Fa#',      'C#','C#11#5',  'C#-E#-G##-B-D#-F#'),

  /* --- TREDICI --- */
  ('DO#','Do# 13',          'Do#-Mi#-Sol#-Si-Re#-Fa#-La#',   'C#','C#13',    'C#-E#-G#-B-D#-F#-A#'),
  ('DO#','Do# Maj13',       'Do#-Mi#-Sol#-Si#-Re#-Fa#-La#',  'C#','C#Maj13', 'C#-E#-G#-B#-D#-F#-A#'),
  ('DO#','Do# m13',         'Do#-Mi-Sol#-Si-Re#-Fa#-La#',     'C#','C#m13',   'C#-E-G#-B-D#-F#-A#');

-- Creazione della tabella NoteRE (Re / D)
CREATE TABLE NoteRE (
  id                 INT UNSIGNED     NOT NULL AUTO_INCREMENT,
  note_ita           VARCHAR(2)       NOT NULL COMMENT 'es. Re',
  chord_ita          VARCHAR(50)      NOT NULL COMMENT 'es. Re Maggiore 7',
  chord_note_ita     VARCHAR(100)     NOT NULL COMMENT 'es. Re-Fa♯-La-Do',
  note_eng           VARCHAR(2)       NOT NULL COMMENT 'es. D',
  chord_eng          VARCHAR(20)      NOT NULL COMMENT 'es. DMaj7',
  chord_note_eng     VARCHAR(100)     NOT NULL COMMENT 'es. D-F#-A-C#',
  created_at         TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at         TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

-- Inserimento di tutti gli accordi per Re (D)
INSERT INTO NoteRE (
  note_ita, chord_ita, chord_note_ita,
  note_eng, chord_eng, chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('Re','Re Maggiore',     'Re-Fa♯-La',          'D','DMaj',   'D-F#-A'),
  ('Re','Re Minore',       'Re-Fa-La',           'D','Dm',     'D-F-A'),
  ('Re','Re Diminuito',    'Re-Fa-La♭',          'D','Ddim',   'D-F-Ab'),
  ('Re','Re Aumentato',    'Re-Fa♯-La♯',         'D','Daug',   'D-F#-A#'),

  /* --- QUARTE & QUINTE --- */
  ('Re','Re Quarta',       'Re-Sol',             'D','D4',     'D-G'),
  ('Re','Re Quinta',       'Re-La',              'D','D5',     'D-A'),

  /* --- SOSPESI --- */
  ('Re','Re Sospesa 2',    'Re-Mi-La',           'D','Dsus2',  'D-E-A'),
  ('Re','Re Sospesa 4',    'Re-Sol-La',          'D','Dsus4',  'D-G-A'),
  ('Re','Re sus4 add9',    'Re-Mi-Sol-La',       'D','Dsus4add9','D-E-G-A'),

  /* --- SENZA INTERVALLI --- */
  ('Re','Re senza Terza',  'Re-La',              'D','Dno3',   'D-A'),
  ('Re','Re senza Quinta', 'Re-Fa♯',             'D','Dno5',   'D-F#'),

  /* --- ADDITIONS --- */
  ('Re','Re add2',         'Re-Fa♯-La-Mi',       'D','Dadd2',  'D-F#-A-E'),
  ('Re','Re add4',         'Re-Fa♯-La-Sol',      'D','Dadd4',  'D-F#-A-G'),
  ('Re','Re add9',         'Re-Fa♯-La-Mi',       'D','Dadd9',  'D-F#-A-E'),
  ('Re','Re add11',        'Re-Fa♯-La-Sol',      'D','Dadd11', 'D-F#-A-G'),

  /* --- SESTE --- */
  ('Re','Re Sesta',        'Re-Fa♯-La-Si',       'D','D6',     'D-F#-A-B'),
  ('Re','Re Minore 6',     'Re-Fa-La-Si',        'D','Dm6',    'D-F-A-B'),
  ('Re','Re 6/9',          'Re-Fa♯-La-Si-Mi',    'D','D6/9',   'D-F#-A-B-E'),

  /* --- SETTIME --- */
  ('Re','Re Settima',      'Re-Fa♯-La-Do',       'D','D7',     'D-F#-A-C'),
  ('Re','Re Maggiore 7',   'Re-Fa♯-La-Do♯',      'D','DMaj7',  'D-F#-A-C#'),
  ('Re','Re Minore 7',     'Re-Fa-La-Do',        'D','Dm7',    'D-F-A-C'),
  ('Re','Re Semidiminuito','Re-Fa-La♭-Do',      'D','Dm7b5',  'D-F-Ab-C'),
  ('Re','Re Dim7',         'Re-Fa-La♭-Do♭',      'D','Ddim7',  'D-F-Ab-Cb'),
  ('Re','Re 7♭5',          'Re-Fa♯-La♭-Do',      'D','D7b5',   'D-F#-Ab-C'),
  ('Re','Re 7♯5',          'Re-Fa♯-La♯-Do',      'D','D7#5',   'D-F#-A#-C'),
  ('Re','Re 7sus2',        'Re-Mi-La-Do',        'D','D7sus2', 'D-E-A-C'),
  ('Re','Re 7sus4',        'Re-Sol-La-Do',       'D','D7sus4', 'D-G-A-C'),
  ('Re','Re 7add11',       'Re-Fa♯-La-Do-Sol',   'D','D7add11','D-F#-A-C-G'),

  /* --- NOVE --- */
  ('Re','Re Nona',         'Re-Fa♯-La-Do-Mi',    'D','D9',     'D-F#-A-C-E'),
  ('Re','Re Maggiore 9',   'Re-Fa♯-La-Do♯-Mi',   'D','DMaj9',  'D-F#-A-C#-E'),
  ('Re','Re Minore 9',     'Re-Fa-La-Do-Mi',     'D','Dm9',    'D-F-A-C-E'),
  ('Re','Re 9♭5',         'Re-Fa♯-La♭-Do-Mi',   'D','D9b5',   'D-F#-Ab-C-E'),
  ('Re','Re 9♯5',         'Re-Fa♯-La♯-Do-Mi',   'D','D9#5',   'D-F#-A#-C-E'),
  ('Re','Re 9sus4',       'Re-Sol-La-Do-Mi',    'D','D9sus4', 'D-G-A-C-E'),
  ('Re','Re 9add11',      'Re-Fa♯-La-Do-Sol-Mi','D','D9add11','D-F#-A-C-G-E'),

  /* --- UNDICI --- */
  ('Re','Re Undicesima',   'Re-Fa♯-La-Do-Mi-Sol','D','D11',    'D-F#-A-C-E-G'),
  ('Re','Re Maggiore 11',  'Re-Fa♯-La-Do♯-Mi-Sol','D','DMaj11', 'D-F#-A-C#-E-G'),
  ('Re','Re Minore 11',    'Re-Fa-La-Do-Mi-Sol',  'D','Dm11',   'D-F-A-C-E-G'),
  ('Re','Re 11♭5',        'Re-Fa♯-La♭-Do-Mi-Sol','D','D11b5',  'D-F#-Ab-C-E-G'),
  ('Re','Re 11♯5',        'Re-Fa♯-La♯-Do-Mi-Sol','D','D11#5',  'D-F#-A#-C-E-G'),

  /* --- TREDICI --- */
  ('Re','Re Tredicesima',  'Re-Fa♯-La-Do-Mi-Sol-Si','D','D13',    'D-F#-A-C-E-G-B'),
  ('Re','Re Maggiore 13','Re-Fa♯-La-Do♯-Mi-Sol-Si','D','DMaj13', 'D-F#-A-C#-E-G-B'),
  ('Re','Re Minore 13',    'Re-Fa-La-Do-Mi-Sol-Si','D','Dm13',   'D-F-A-C-E-G-B');

-- Creazione della tabella NoteREb (Re♭ / Db)
CREATE TABLE NoteREb (
  id               INT UNSIGNED    NOT NULL AUTO_INCREMENT,
  note_ita         VARCHAR(2)      NOT NULL COMMENT 'es. Re♭',
  chord_ita        VARCHAR(50)     NOT NULL COMMENT 'es. Re♭ Maggiore 7',
  chord_note_ita   VARCHAR(100)    NOT NULL COMMENT 'es. Re♭-Fa-La♭-Do♭',
  note_eng         VARCHAR(2)      NOT NULL COMMENT 'es. Db',
  chord_eng        VARCHAR(20)     NOT NULL COMMENT 'es. DbMaj7',
  chord_note_eng   VARCHAR(100)    NOT NULL COMMENT 'es. Db-F-Ab-C',
  created_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tutti gli accordi per Re♭ (Db)
INSERT INTO NoteREb (
  note_ita, chord_ita, chord_note_ita,
  note_eng, chord_eng, chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('Re♭','Re♭ Maggiore',      'Re♭-Fa-La♭',             'Db','DbMaj',   'Db-F-Ab'),
  ('Re♭','Re♭ Minore',        'Re♭-Fa♭-La♭',            'Db','Dbm',     'Db-Fb-Ab'),
  ('Re♭','Re♭ Diminuito',     'Re♭-Fa♭-La♭♭',           'Db','Dbdim',   'Db-Fb-Abb'),
  ('Re♭','Re♭ Aumentato',     'Re♭-Fa-La',              'Db','Dbaug',   'Db-F-A'),

  /* --- QUARTE & QUINTE --- */
  ('Re♭','Re♭ Quarta',        'Re♭-Sol♭',               'Db','Db4',     'Db-Gb'),
  ('Re♭','Re♭ Quinta',        'Re♭-La♭',                'Db','Db5',     'Db-Ab'),

  /* --- SOSPESI --- */
  ('Re♭','Re♭ sus2',          'Re♭-Mi♭-La♭',            'Db','Dbsus2',  'Db-Eb-Ab'),
  ('Re♭','Re♭ sus4',          'Re♭-Sol♭-La♭',           'Db','Dbsus4',  'Db-Gb-Ab'),
  ('Re♭','Re♭ sus4 add9',     'Re♭-Mi♭-Sol♭-La♭',       'Db','Dbsus4add9','Db-Eb-Gb-Ab'),

  /* --- SENZA INTERVALLI --- */
  ('Re♭','Re♭ no3',           'Re♭-La♭',                'Db','Dbno3',   'Db-Ab'),
  ('Re♭','Re♭ no5',           'Re♭-Fa',                 'Db','Dbno5',   'Db-F'),

  /* --- ADDITIONS --- */
  ('Re♭','Re♭ add2',          'Re♭-Fa-La♭-Mi♭',         'Db','Dbadd2',  'Db-F-Ab-Eb'),
  ('Re♭','Re♭ add4',          'Re♭-Fa-La♭-Sol♭',        'Db','Dbadd4',  'Db-F-Ab-Gb'),
  ('Re♭','Re♭ add9',          'Re♭-Fa-La♭-Mi♭',         'Db','Dbadd9',  'Db-F-Ab-Eb'),
  ('Re♭','Re♭ add11',         'Re♭-Fa-La♭-Sol♭',        'Db','Dbadd11', 'Db-F-Ab-Gb'),

  /* --- SESTE --- */
  ('Re♭','Re♭ 6',             'Re♭-Fa-La♭-Si♭',         'Db','Db6',     'Db-F-Ab-Bb'),
  ('Re♭','Re♭ m6',            'Re♭-Fa♭-La♭-Si♭',        'Db','Dbm6',    'Db-Fb-Ab-Bb'),
  ('Re♭','Re♭ 6/9',           'Re♭-Fa-La♭-Si♭-Mi♭',     'Db','Db6/9',   'Db-F-Ab-Bb-Eb'),

  /* --- SETTIME --- */
  ('Re♭','Re♭ 7',             'Re♭-Fa-La♭-Do♭',         'Db','Db7',     'Db-F-Ab-Cb'),
  ('Re♭','Re♭ Maj7',          'Re♭-Fa-La♭-Do',          'Db','DbMaj7',  'Db-F-Ab-C'),
  ('Re♭','Re♭ m7',            'Re♭-Fa♭-La♭-Do♭',        'Db','Dbm7',    'Db-Fb-Ab-Cb'),
  ('Re♭','Re♭ m7b5',          'Re♭-Fa♭-La♭-Do♭',        'Db','Dbm7b5',  'Db-Fb-Ab-Cb'),
  ('Re♭','Re♭ dim7',          'Re♭-Fa♭-La♭♭-Do♭',       'Db','Dbdim7',  'Db-Fb-Abb-Cb'),
  ('Re♭','Re♭ 7b5',           'Re♭-Fa-La♭-Do♭',         'Db','Db7b5',   'Db-F-Ab-Cb'),
  ('Re♭','Re♭ 7#5',           'Re♭-Fa-La-Do♭',          'Db','Db7#5',   'Db-F-A-Cb'),
  ('Re♭','Re♭ 7sus2',         'Re♭-Mi♭-La♭-Do♭',        'Db','Db7sus2', 'Db-Eb-Ab-Cb'),
  ('Re♭','Re♭ 7sus4',         'Re♭-Sol♭-La♭-Do♭',       'Db','Db7sus4', 'Db-Gb-Ab-Cb'),
  ('Re♭','Re♭ 7add11',        'Re♭-Fa-La♭-Do♭-Sol♭',    'Db','Db7add11','Db-F-Ab-Cb-Gb'),

  /* --- NOVE --- */
  ('Re♭','Re♭ 9',             'Re♭-Fa-La♭-Do♭-Mi♭',     'Db','Db9',     'Db-F-Ab-Cb-Eb'),
  ('Re♭','Re♭ Maj9',          'Re♭-Fa-La♭-Do♭-Mi',      'Db','DbMaj9',  'Db-F-Ab-Cb-E'),
  ('Re♭','Re♭ m9',            'Re♭-Fa♭-La♭-Do♭-Mi♭',     'Db','Dbm9',    'Db-Fb-Ab-Cb-Eb'),
  ('Re♭','Re♭ 9b5',           'Re♭-Fa-La-Do♭-Mi♭',      'Db','Db9b5',   'Db-F-Ab-Cb-Eb'),
  ('Re♭','Re♭ 9#5',           'Re♭-Fa-La-Do♭-Mi♭',      'Db','Db9#5',   'Db-F-A-Cb-Eb'),
  ('Re♭','Re♭ 9sus4',         'Re♭-Sol-La♭-Do♭-Mi♭',     'Db','Db9sus4', 'Db-Gb-Ab-Cb-Eb'),
  ('Re♭','Re♭ 9add11',        'Re♭-Fa-La♭-Do♭-Sol♭-Mi♭', 'Db','Db9add11','Db-F-Ab-Cb-Gb-Eb'),

  /* --- UNDICI --- */
  ('Re♭','Re♭ 11',            'Re♭-Fa-La♭-Do♭-Mi♭-Sol♭',  'Db','Db11',    'Db-F-Ab-Cb-Eb-Gb'),
  ('Re♭','Re♭ Maj11',         'Re♭-Fa-La♭-Do♭-Mi-Sol♭',    'Db','DbMaj11', 'Db-F-Ab-Cb-E-Gb'),
  ('Re♭','Re♭ m11',           'Re♭-Fa♭-La♭-Do♭-Mi♭-Sol♭',  'Db','Dbm11',   'Db-Fb-Ab-Cb-Eb-Gb'),
  ('Re♭','Re♭ 11b5',          'Re♭-Fa-La♭-Do♭-Mi♭-Sol♭',  'Db','Db11b5',  'Db-F-Ab-Cb-Eb-Gb'),
  ('Re♭','Re♭ 11#5',          'Re♭-Fa-La-Do♭-Mi♭-Sol♭',   'Db','Db11#5',  'Db-F-A-Cb-Eb-Gb'),

  /* --- TREDICI --- */
  ('Re♭','Re♭ 13',            'Re♭-Fa-La♭-Do♭-Mi♭-Sol♭-Si♭','Db','Db13',    'Db-F-Ab-Cb-Eb-Gb-Bb'),
  ('Re♭','Re♭ Maj13',         'Re♭-Fa-La♭-Do♭-Mi-Sol♭-Si♭','Db','DbMaj13', 'Db-F-Ab-Cb-E-Gb-Bb'),
  ('Re♭','Re♭ m13',           'Re♭-Fa♭-La♭-Do♭-Mi♭-Sol♭-Si♭','Db','Dbm13',   'Db-Fb-Ab-Cb-Eb-Gb-Bb');

-- Creazione della tabella NoteREdiesis (Re♯ / D#)
CREATE TABLE NoteREdiesis (
  id               INT UNSIGNED    NOT NULL AUTO_INCREMENT,
  note_ita         VARCHAR(3)      NOT NULL COMMENT 'es. Re♯',
  chord_ita        VARCHAR(50)     NOT NULL COMMENT 'es. Re♯ Maggiore 7',
  chord_note_ita   VARCHAR(100)    NOT NULL COMMENT 'es. Re♯-Fa♯♯-La♯-Do♯',
  note_eng         VARCHAR(2)      NOT NULL COMMENT 'es. D#',
  chord_eng        VARCHAR(20)     NOT NULL COMMENT 'es. D#Maj7',
  chord_note_eng   VARCHAR(100)    NOT NULL COMMENT 'es. D#-G##-A#-C#',
  created_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

-- Inserimento di tutti gli accordi per Re♯ (D#)
INSERT INTO NoteREdiesis (
  note_ita, chord_ita, chord_note_ita,
  note_eng, chord_eng, chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('Re♯','Re♯ Maggiore',      'Re♯-Fa♯♯-La♯',            'D#','D#Maj',   'D#-G##-A#'),
  ('Re♯','Re♯ Minore',        'Re♯-Fa♯-La♯',             'D#','D#m',     'D#-F#-A#'),
  ('Re♯','Re♯ Diminuito',     'Re♯-Fa♯-La',              'D#','D#dim',   'D#-F#-A'),
  ('Re♯','Re♯ Aumentato',     'Re♯-Fa♯♯-La♯♯',           'D#','D#aug',   'D#-G##-A##'),

  /* --- QUARTE & QUINTE --- */
  ('Re♯','Re♯ Quarta',        'Re♯-Sol♯',                'D#','D#4',     'D#-G#'),
  ('Re♯','Re♯ Quinta',        'Re♯-La♯',                 'D#','D#5',     'D#-A#'),

  /* --- SOSPESI --- */
  ('Re♯','Re♯ sus2',          'Re♯-Mi♯-La♯',             'D#','D#sus2',  'D#-E#-A#'),
  ('Re♯','Re♯ sus4',          'Re♯-Sol♯-La♯',            'D#','D#sus4',  'D#-G#-A#'),
  ('Re♯','Re♯ sus4 add9',     'Re♯-Mi♯-Sol♯-La♯',        'D#','D#sus4add9','D#-E#-G#-A#'),

  /* --- SENZA INTERVALLI --- */
  ('Re♯','Re♯ no3',           'Re♯-La♯',                 'D#','D#no3',   'D#-A#'),
  ('Re♯','Re♯ no5',           'Re♯-Fa♯♯',                'D#','D#no5',   'D#-G##'),

  /* --- ADDIZIONI --- */
  ('Re♯','Re♯ add2',          'Re♯-Fa♯♯-La♯-Mi♯',         'D#','D#add2',  'D#-G##-A#-E#'),
  ('Re♯','Re♯ add4',          'Re♯-Fa♯♯-La♯-Sol♯',        'D#','D#add4',  'D#-G##-A#-G#'),
  ('Re♯','Re♯ add9',          'Re♯-Fa♯♯-La♯-Mi♯',         'D#','D#add9',  'D#-G##-A#-E#'),
  ('Re♯','Re♯ add11',         'Re♯-Fa♯♯-La♯-Sol♯',        'D#','D#add11', 'D#-G##-A#-G#'),

  /* --- SESTE --- */
  ('Re♯','Re♯ 6',             'Re♯-Fa♯♯-La♯-Si♯',         'D#','D#6',     'D#-G##-A#-B#'),
  ('Re♯','Re♯ m6',            'Re♯-Fa♯-La♯-Si♯',          'D#','D#m6',    'D#-F#-A#-B#'),
  ('Re♯','Re♯ 6/9',           'Re♯-Fa♯♯-La♯-Si♯-Mi♯',      'D#','D#6/9',   'D#-G##-A#-B#-E#'),

  /* --- SETTIME --- */
  ('Re♯','Re♯ 7',             'Re♯-Fa♯♯-La♯-Do♯',         'D#','D#7',     'D#-G##-A#-C#'),
  ('Re♯','Re♯ Maj7',          'Re♯-Fa♯♯-La♯-Do♯♯',        'D#','D#Maj7',  'D#-G##-A#-C##'),
  ('Re♯','Re♯ m7',            'Re♯-Fa♯-La♯-Do♯',          'D#','D#m7',    'D#-F#-A#-C#'),
  ('Re♯','Re♯ m7b5',          'Re♯-Fa♯-La-Do♯',           'D#','D#m7b5',  'D#-F#-A-C#'),
  ('Re♯','Re♯ dim7',          'Re♯-Fa♯-La-Do',            'D#','D#dim7',  'D#-F#-A-C'),
  ('Re♯','Re♯ 7b5',           'Re♯-Fa♯♯-La-Do♯',          'D#','D#7b5',   'D#-G##-A-C#'),
  ('Re♯','Re♯ 7#5',           'Re♯-Fa♯♯-La♯♯-Do♯',         'D#','D#7#5',   'D#-G##-A##-C#'),
  ('Re♯','Re♯ 7sus2',         'Re♯-Mi♯-La♯-Do♯',          'D#','D#7sus2', 'D#-E#-A#-C#'),
  ('Re♯','Re♯ 7sus4',         'Re♯-Sol♯-La♯-Do♯',         'D#','D#7sus4', 'D#-G#-A#-C#'),
  ('Re♯','Re♯ 7add11',        'Re♯-Fa♯♯-La♯-Do♯-Sol♯',     'D#','D#7add11','D#-G##-A#-C#-G#'),

  /* --- NOVE --- */
  ('Re♯','Re♯ 9',             'Re♯-Fa♯♯-La♯-Do♯-Mi♯',      'D#','D#9',     'D#-G##-A#-C#-E#'),
  ('Re♯','Re♯ Maj9',          'Re♯-Fa♯♯-La♯-Do♯♯-Mi♯',     'D#','D#Maj9',  'D#-G##-A#-C##-E#'),
  ('Re♯','Re♯ m9',            'Re♯-Fa♯-La♯-Do♯-Mi♯',       'D#','D#m9',    'D#-F#-A#-C#-E#'),
  ('Re♯','Re♯ 9b5',           'Re♯-Fa♯♯-La-Do♯-Mi♯',       'D#','D#9b5',   'D#-G##-A-C#-E#'),
  ('Re♯','Re♯ 9#5',           'Re♯-Fa♯♯-La♯♯-Do♯-Mi♯',      'D#','D#9#5',   'D#-G##-A##-C#-E#'),
  ('Re♯','Re♯ 9sus4',         'Re♯-Sol♯-La♯-Do♯-Mi♯',       'D#','D#9sus4', 'D#-G#-A#-C#-E#'),
  ('Re♯','Re♯ 9add11',        'Re♯-Fa♯♯-La♯-Do♯-Sol♯-Mi♯','D#','D#9add11','D#-G##-A#-C#-G#-E#'),

  /* --- UNDICI --- */
  ('Re♯','Re♯ 11',            'Re♯-Fa♯♯-La♯-Do♯-Mi♯-Sol♯',  'D#','D#11',    'D#-G##-A#-C#-E#-G#'),
  ('Re♯','Re♯ Maj11',         'Re♯-Fa♯♯-La♯-Do♯♯-Mi♯-Sol♯','D#','D#Maj11', 'D#-G##-A#-C##-E#-G#'),
  ('Re♯','Re♯ m11',           'Re♯-Fa♯-La♯-Do♯-Mi♯-Sol♯',   'D#','D#m11',   'D#-F#-A#-C#-E#-G#'),
  ('Re♯','Re♯ 11b5',          'Re♯-Fa♯♯-La-Do♯-Mi♯-Sol♯',   'D#','D#11b5',  'D#-G##-A-C#-E#-G#'),
  ('Re♯','Re♯ 11#5',          'Re♯-Fa♯♯-La♯♯-Do♯-Mi♯-Sol♯','D#','D#11#5',  'D#-G##-A##-C#-E#-G#'),

  /* --- TREDICI --- */
  ('Re♯','Re♯ 13',            'Re♯-Fa♯♯-La♯-Do♯-Mi♯-Sol♯-Si♯','D#','D#13',    'D#-G##-A#-C#-E#-G#-B#'),
  ('Re♯','Re♯ Maj13',         'Re♯-Fa♯♯-La♯-Do♯♯-Mi♯-Sol♯-Si♯','D#','D#Maj13','D#-G##-A#-C##-E#-G#-B#'),
  ('Re♯','Re♯ m13',           'Re♯-Fa♯-La♯-Do♯-Mi♯-Sol♯-Si♯',  'D#','D#m13',   'D#-F#-A#-C#-E#-G#-B#');

-- Creazione della tabella NoteMI (Mi / E)
CREATE TABLE NoteMI (
  id               INT UNSIGNED    NOT NULL AUTO_INCREMENT,
  note_ita         VARCHAR(2)      NOT NULL COMMENT 'es. Mi',
  chord_ita        VARCHAR(50)     NOT NULL COMMENT 'es. Mi Maggiore 7',
  chord_note_ita   VARCHAR(100)    NOT NULL COMMENT 'es. Mi-Sol♯-Si-Re',
  note_eng         VARCHAR(2)      NOT NULL COMMENT 'es. E',
  chord_eng        VARCHAR(20)     NOT NULL COMMENT 'es. EMaj7',
  chord_note_eng   VARCHAR(100)    NOT NULL COMMENT 'es. E-G#-B-D',
  created_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserimento di tutti gli accordi per Mi (E)
INSERT INTO NoteMI (
  note_ita, chord_ita, chord_note_ita,
  note_eng, chord_eng, chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('MI','Mi Maggiore',        'Mi-Sol♯-Si',             'E','EMaj',     'E-G#-B'),
  ('MI','Mi Minore',          'Mi-Sol-Si',              'E','Em',       'E-G-B'),
  ('MI','Mi Diminuito',       'Mi-Sol-Si♭',             'E','Edim',     'E-G-Bb'),
  ('MI','Mi Aumentato',       'Mi-Sol♯-Si♯',            'E','Eaug',     'E-G#-B#'),

  /* --- QUARTE & QUINTE --- */
  ('MI','Mi Quarta',          'Mi-La',                  'E','E4',       'E-A'),
  ('MI','Mi Quinta',          'Mi-Si',                  'E','E5',       'E-B'),

  /* --- SOSPESI --- */
  ('MI','Mi sus2',            'Mi-Re-Si',               'E','Esus2',    'E-D-B'),
  ('MI','Mi sus4',            'Mi-La-Si',               'E','Esus4',    'E-A-B'),
  ('MI','Mi sus4 add9',       'Mi-Re-La-Si',            'E','Esus4add9','E-D-A-B'),

  /* --- SENZA INTERVALLI --- */
  ('MI','Mi no3',             'Mi-Si',                  'E','Eno3',     'E-B'),
  ('MI','Mi no5',             'Mi-Sol♯',                'E','Eno5',     'E-G#'),

  /* --- ADDITIONS --- */
  ('MI','Mi add2',            'Mi-Sol♯-Si-Re',          'E','Eadd2',    'E-G#-B-D'),
  ('MI','Mi add4',            'Mi-Sol♯-Si-La',          'E','Eadd4',    'E-G#-B-A'),
  ('MI','Mi add9',            'Mi-Sol♯-Si-Re',          'E','Eadd9',    'E-G#-B-D'),
  ('MI','Mi add11',           'Mi-Sol♯-Si-La',          'E','Eadd11',   'E-G#-B-A'),

  /* --- SESTE --- */
  ('MI','Mi 6',               'Mi-Sol♯-Si-Do♯',         'E','E6',       'E-G#-B-C#'),
  ('MI','Mi m6',              'Mi-Sol-Si-Do♯',          'E','Em6',      'E-G-B-C#'),
  ('MI','Mi 6/9',             'Mi-Sol♯-Si-Do♯-Fa♯',      'E','E6/9',     'E-G#-B-C#-F#'),

  /* --- SETTIME --- */
  ('MI','Mi Settima',         'Mi-Sol♯-Si-Re',          'E','E7',       'E-G#-B-D'),
  ('MI','Mi Maggiore 7',      'Mi-Sol♯-Si-Re♯',         'E','EMaj7',    'E-G#-B-D#'),
  ('MI','Mi Minore 7',        'Mi-Sol-Si-Re',           'E','Em7',      'E-G-B-D'),
  ('MI','Mi Semidiminuito',   'Mi-Sol-Si♭-Re',          'E','Em7b5',    'E-G-Bb-D'),
  ('MI','Mi Dim7',            'Mi-Sol-Si♭-Re♭',         'E','Edim7',    'E-G-Bb-Db'),
  ('MI','Mi 7♭5',             'Mi-Sol♯-Si♭-Re',         'E','E7b5',     'E-G#-Bb-D'),
  ('MI','Mi 7♯5',             'Mi-Sol♯-Si♯-Re',         'E','E7#5',     'E-G#-B#-D'),
  ('MI','Mi 7sus2',           'Mi-Fa♯-Si-Re',          'E','E7sus2',   'E-F#-B-D'),
  ('MI','Mi 7sus4',           'Mi-La-Si-Re',           'E','E7sus4',   'E-A-B-D'),
  ('MI','Mi 7add11',          'Mi-Sol♯-Si-Re-La',       'E','E7add11',  'E-G#-B-D-A'),

  /* --- NOVE --- */
  ('MI','Mi Nona',            'Mi-Sol♯-Si-Re-Fa♯',      'E','E9',       'E-G#-B-D-F#'),
  ('MI','Mi Maggiore 9',      'Mi-Sol♯-Si-Re♯-Fa♯',     'E','EMaj9',    'E-G#-B-D#-F#'),
  ('MI','Mi Minore 9',        'Mi-Sol-Si-Re-Fa♯',       'E','Em9',      'E-G-B-D-F#'),
  ('MI','Mi 9♭5',             'Mi-Sol♯-Si♭-Re-Fa♯',     'E','E9b5',     'E-G#-Bb-D-F#'),
  ('MI','Mi 9♯5',             'Mi-Sol♯-Si♯-Re-Fa♯',     'E','E9#5',     'E-G#-B#-D-F#'),
  ('MI','Mi 9sus4',           'Mi-La-Si-Re-Fa♯',        'E','E9sus4',   'E-A-B-D-F#'),
  ('MI','Mi 9add11',          'Mi-Sol♯-Si-Re-Fa♯-La',    'E','E9add11',  'E-G#-B-D-F#-A'),

  /* --- UNDICI --- */
  ('MI','Mi Undicesima',      'Mi-Sol♯-Si-Re-Fa♯-La',    'E','E11',      'E-G#-B-D-F#-A'),
  ('MI','Mi Maggiore 11',     'Mi-Sol♯-Si-Re♯-Fa♯-La',   'E','EMaj11',   'E-G#-B-D#-F#-A'),
  ('MI','Mi Minore 11',       'Mi-Sol-Si-Re-Fa♯-La',     'E','Em11',     'E-G-B-D-F#-A'),
  ('MI','Mi 11♭5',            'Mi-Sol♯-Si♭-Re-Fa♯-La',   'E','E11b5',    'E-G#-Bb-D-F#-A'),
  ('MI','Mi 11♯5',            'Mi-Sol♯-Si♯-Re-Fa♯-La',   'E','E11#5',    'E-G#-B#-D-F#-A'),

  /* --- TREDICI --- */
  ('MI','Mi Tredicesima',     'Mi-Sol♯-Si-Re-Fa♯-La-Do♯','E','E13',      'E-G#-B-D-F#-A-C#'),
  ('MI','Mi Maggiore 13',     'Mi-Sol♯-Si-Re♯-Fa♯-La-Do♯','E','EMaj13',   'E-G#-B-D#-F#-A-C#'),
  ('MI','Mi Minore 13',       'Mi-Sol-Si-Re-Fa♯-La-Do♯', 'E','Em13',     'E-G-B-D-F#-A-C#');

-- Creazione della tabella NoteMIb (Mi♭ / Eb)
CREATE TABLE NoteMIb (
  id               INT UNSIGNED    NOT NULL AUTO_INCREMENT,
  note_ita         VARCHAR(3)      NOT NULL COMMENT 'es. Mi♭',
  chord_ita        VARCHAR(50)     NOT NULL COMMENT 'es. Mi♭ Maggiore 7',
  chord_note_ita   VARCHAR(100)    NOT NULL COMMENT 'es. Mi♭-Sol-La♭-Re♭',
  note_eng         VARCHAR(2)      NOT NULL COMMENT 'es. Eb',
  chord_eng        VARCHAR(20)     NOT NULL COMMENT 'es. EbMaj7',
  chord_note_eng   VARCHAR(100)    NOT NULL COMMENT 'es. Eb-G-Bb-D',
  created_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tutti gli accordi per Mi♭ (Eb)
INSERT INTO NoteMIb (
  note_ita, chord_ita, chord_note_ita,
  note_eng, chord_eng, chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('Mi♭','Mi♭ Maggiore',     'Mi♭-Sol-Si♭',           'Eb','EbMaj',   'Eb-G-Bb'),
  ('Mi♭','Mi♭ Minore',       'Mi♭-Sol♭-Si♭',          'Eb','Ebm',     'Eb-Gb-Bb'),
  ('Mi♭','Mi♭ Diminuito',    'Mi♭-Sol♭-Si♭♭',         'Eb','Ebdim',   'Eb-Gb-Bbb'),
  ('Mi♭','Mi♭ Aumentato',    'Mi♭-Sol-Si',            'Eb','Ebaug',   'Eb-G-B'),

  /* --- QUARTE & QUINTE --- */
  ('Mi♭','Mi♭ Quarta',       'Mi♭-La♭',               'Eb','Eb4',     'Eb-Ab'),
  ('Mi♭','Mi♭ Quinta',       'Mi♭-Si♭',               'Eb','Eb5',     'Eb-Bb'),

  /* --- SOSPESI --- */
  ('Mi♭','Mi♭ sus2',         'Mi♭-Fa-Si♭',            'Eb','Ebsus2',  'Eb-F-Bb'),
  ('Mi♭','Mi♭ sus4',         'Mi♭-La♭-Si♭',           'Eb','Ebsus4',  'Eb-Ab-Bb'),
  ('Mi♭','Mi♭ sus4 add9',    'Mi♭-Fa-La♭-Si♭',        'Eb','Ebsus4add9','Eb-F-Ab-Bb'),

  /* --- SENZA INTERVALLI --- */
  ('Mi♭','Mi♭ no3',          'Mi♭-Si♭',               'Eb','Ebno3',   'Eb-Bb'),
  ('Mi♭','Mi♭ no5',          'Mi♭-Sol',               'Eb','Ebno5',   'Eb-G'),

  /* --- ADDIZIONI --- */
  ('Mi♭','Mi♭ add2',         'Mi♭-Sol-Si♭-Fa',        'Eb','Ebadd2',  'Eb-G-Bb-F'),
  ('Mi♭','Mi♭ add4',         'Mi♭-Sol-Si♭-La♭',       'Eb','Ebadd4',  'Eb-G-Bb-Ab'),
  ('Mi♭','Mi♭ add9',         'Mi♭-Sol-Si♭-Fa',        'Eb','Ebadd9',  'Eb-G-Bb-F'),
  ('Mi♭','Mi♭ add11',        'Mi♭-Sol-Si♭-La♭',       'Eb','Ebadd11', 'Eb-G-Bb-Ab'),

  /* --- SESTE --- */
  ('Mi♭','Mi♭ 6',            'Mi♭-Sol-Si♭-Do',        'Eb','Eb6',     'Eb-G-Bb-C'),
  ('Mi♭','Mi♭ m6',           'Mi♭-Sol♭-Si♭-Do',       'Eb','Ebm6',    'Eb-Gb-Bb-C'),
  ('Mi♭','Mi♭ 6/9',          'Mi♭-Sol-Si♭-Do-Fa',     'Eb','Eb6/9',   'Eb-G-Bb-C-F'),

  /* --- SETTIME --- */
  ('Mi♭','Mi♭ 7',            'Mi♭-Sol-Si♭-Re♭',       'Eb','Eb7',     'Eb-G-Bb-Db'),
  ('Mi♭','Mi♭ Maj7',         'Mi♭-Sol-Si♭-Re',        'Eb','EbMaj7',  'Eb-G-Bb-D'),
  ('Mi♭','Mi♭ m7',           'Mi♭-Sol♭-Si♭-Re♭',      'Eb','Ebm7',    'Eb-Gb-Bb-Db'),
  ('Mi♭','Mi♭ m7b5',         'Mi♭-Sol♭-Si♭♭-Re♭',     'Eb','Ebm7b5',  'Eb-Gb-Bbb-Db'),
  ('Mi♭','Mi♭ dim7',         'Mi♭-Sol♭-Si♭♭-Re♭♭',    'Eb','Ebdim7',  'Eb-Gb-Bbb-Dbb'),
  ('Mi♭','Mi♭ 7b5',          'Mi♭-Sol-Si♭♭-Re♭',      'Eb','Eb7b5',   'Eb-G-Bbb-Db'),
  ('Mi♭','Mi♭ 7#5',          'Mi♭-Sol-Si-Re♭',        'Eb','Eb7#5',   'Eb-G-B-Db'),
  ('Mi♭','Mi♭ 7sus2',        'Mi♭-Fa-Si♭-Re♭',        'Eb','Eb7sus2', 'Eb-F-Bb-Db'),
  ('Mi♭','Mi♭ 7sus4',        'Mi♭-La♭-Si♭-Re♭',       'Eb','Eb7sus4', 'Eb-Ab-Bb-Db'),
  ('Mi♭','Mi♭ 7add11',       'Mi♭-Sol-Si♭-Re♭-La♭',   'Eb','Eb7add11','Eb-G-Bb-Db-Ab'),

  /* --- NOVE --- */
  ('Mi♭','Mi♭ 9',            'Mi♭-Sol-Si♭-Re♭-Fa',    'Eb','Eb9',     'Eb-G-Bb-Db-F'),
  ('Mi♭','Mi♭ Maj9',         'Mi♭-Sol-Si♭-Re-Fa',     'Eb','EbMaj9',  'Eb-G-Bb-D-F'),
  ('Mi♭','Mi♭ m9',           'Mi♭-Sol♭-Si♭-Re♭-Fa',   'Eb','Ebm9',    'Eb-Gb-Bb-Db-F'),
  ('Mi♭','Mi♭ 9b5',          'Mi♭-Sol-Si♭♭-Re♭-Fa',   'Eb','Eb9b5',   'Eb-G-Bbb-Db-F'),
  ('Mi♭','Mi♭ 9#5',          'Mi♭-Sol-Si-Re♭-Fa',     'Eb','Eb9#5',   'Eb-G-B-Db-F'),
  ('Mi♭','Mi♭ 9sus4',        'Mi♭-La♭-Si♭-Re♭-Fa',    'Eb','Eb9sus4', 'Eb-Ab-Bb-Db-F'),
  ('Mi♭','Mi♭ 9add11',       'Mi♭-Sol-Si♭-Re♭-La♭-Fa','Eb','Eb9add11','Eb-G-Bb-Db-Ab-F'),

  /* --- UNDICI --- */
  ('Mi♭','Mi♭ 11',           'Mi♭-Sol-Si♭-Re♭-Fa-La♭', 'Eb','Eb11',    'Eb-G-Bb-Db-F-Ab'),
  ('Mi♭','Mi♭ Maj11',        'Mi♭-Sol-Si♭-Re-Fa-La♭',  'Eb','EbMaj11', 'Eb-G-Bb-D-F-Ab'),
  ('Mi♭','Mi♭ m11',          'Mi♭-Sol♭-Si♭-Re♭-Fa-La♭','Eb','Ebm11',   'Eb-Gb-Bb-Db-F-Ab'),
  ('Mi♭','Mi♭ 11b5',        'Mi♭-Sol-Si♭♭-Re♭-Fa-La♭','Eb','Eb11b5',  'Eb-G-Bbb-Db-F-Ab'),
  ('Mi♭','Mi♭ 11#5',        'Mi♭-Sol-Si-Re♭-Fa-La♭',  'Eb','Eb11#5',  'Eb-G-B-Db-F-Ab'),

  /* --- TREDICI --- */
  ('Mi♭','Mi♭ 13',          'Mi♭-Sol-Si♭-Re♭-Fa-La-Do','Eb','Eb13',    'Eb-G-Bb-Db-F-A-C'),
  ('Mi♭','Mi♭ Maj13',       'Mi♭-Sol-Si♭-Re-Fa-La-Do','Eb','EbMaj13', 'Eb-G-Bb-D-F-A-C'),
  ('Mi♭','Mi♭ m13',         'Mi♭-Sol♭-Si♭-Re♭-Fa-La-Do','Eb','Ebm13',  'Eb-Gb-Bb-Db-F-A-C');


-- Creazione della tabella NoteMIdiesis (Mi♯ / E#)
CREATE TABLE NoteMIdiesis (
  id               INT UNSIGNED    NOT NULL AUTO_INCREMENT,
  note_ita         VARCHAR(3)      NOT NULL COMMENT 'es. Mi♯',
  chord_ita        VARCHAR(50)     NOT NULL COMMENT 'es. Mi♯ Maggiore 7',
  chord_note_ita   VARCHAR(100)    NOT NULL COMMENT 'es. Mi♯-Sol♯♯-Si♯-Re♯',
  note_eng         VARCHAR(2)      NOT NULL COMMENT 'es. E#',
  chord_eng        VARCHAR(20)     NOT NULL COMMENT 'es. E#Maj7',
  chord_note_eng   VARCHAR(100)    NOT NULL COMMENT 'es. E#-G##-B#-D##',
  created_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserimento di tutti gli accordi per Mi♯ (E#)
INSERT INTO NoteMIdiesis (
  note_ita, chord_ita, chord_note_ita,
  note_eng, chord_eng, chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('Mi♯','Mi♯ Maggiore',     'Mi♯-Sol♯♯-Si♯',        'E#','E#Maj',   'E#-G##-B#'),
  ('Mi♯','Mi♯ Minore',       'Mi♯-Sol♯-Si♯',         'E#','E#m',     'E#-G#-B#'),
  ('Mi♯','Mi♯ Diminuito',    'Mi♯-Sol♯-Si',          'E#','E#dim',   'E#-G#-B'),
  ('Mi♯','Mi♯ Aumentato',    'Mi♯-Sol♯♯-Si♯♯',       'E#','E#aug',   'E#-G##-B##'),

  /* --- QUARTE & QUINTE --- */
  ('Mi♯','Mi♯ Quarta',       'Mi♯-La♯',              'E#','E#4',     'E#-A#'),
  ('Mi♯','Mi♯ Quinta',       'Mi♯-Si♯',              'E#','E#5',     'E#-B#'),

  /* --- SOSPESI --- */
  ('Mi♯','Mi♯ sus2',         'Mi♯-Fa♯♯-Si♯',         'E#','E#sus2',  'E#-F##-B#'),
  ('Mi♯','Mi♯ sus4',         'Mi♯-La♯-Si♯',          'E#','E#sus4',  'E#-A#-B#'),
  ('Mi♯','Mi♯ sus4 add9',    'Mi♯-Fa♯♯-La♯-Si♯',     'E#','E#sus4add9','E#-F##-A#-B#'),

  /* --- SENZA INTERVALLI --- */
  ('Mi♯','Mi♯ no3',          'Mi♯-La♯',              'E#','E#no3',   'E#-A#'),
  ('Mi♯','Mi♯ no5',          'Mi♯-Sol♯♯',            'E#','E#no5',   'E#-G##'),

  /* --- ADDITIONS --- */
  ('Mi♯','Mi♯ add2',         'Mi♯-Sol♯♯-Si♯-Fa♯♯',    'E#','E#add2',  'E#-G##-B#-F##'),
  ('Mi♯','Mi♯ add4',         'Mi♯-La♯-Si♯-Do',       'E#','E#add4',  'E#-A#-B#-C'),
  ('Mi♯','Mi♯ add9',         'Mi♯-Sol♯♯-Si♯-Fa♯♯',    'E#','E#add9',  'E#-G##-B#-F##'),
  ('Mi♯','Mi♯ add11',        'Mi♯-La♯-Si♯-Re',       'E#','E#add11', 'E#-A#-B#-D'),

  /* --- SESTE --- */
  ('Mi♯','Mi♯ 6',            'Mi♯-Sol♯♯-Si♯-Do♯♯',    'E#','E#6',     'E#-G##-B#-C##'),
  ('Mi♯','Mi♯ m6',           'Mi♯-Sol♯-Si♯-Do♯♯',     'E#','E#m6',    'E#-G#-B#-C##'),
  ('Mi♯','Mi♯ 6/9',          'Mi♯-Sol♯♯-Si♯-Do♯♯-Fa♯♯','E#','E#6/9',   'E#-G##-B#-C##-F##'),

  /* --- SETTIME --- */
  ('Mi♯','Mi♯ 7',            'Mi♯-Sol♯♯-Si♯-Re♯',     'E#','E#7',     'E#-G##-B#-D#'),
  ('Mi♯','Mi♯ Maj7',         'Mi♯-Sol♯♯-Si♯-Re♯♯',    'E#','E#Maj7',  'E#-G##-B#-D##'),
  ('Mi♯','Mi♯ m7',           'Mi♯-Sol♯-Si♯-Re♯',      'E#','E#m7',    'E#-G#-B#-D#'),
  ('Mi♯','Mi♯ m7b5',         'Mi♯-Sol♯-Si-Re♯',       'E#','E#m7b5',  'E#-G#-B-D#'),
  ('Mi♯','Mi♯ dim7',         'Mi♯-Sol♯-Si-Do',        'E#','E#dim7',  'E#-G#-B-C'),
  ('Mi♯','Mi♯ 7b5',          'Mi♯-Sol♯♯-Si-Re♯',      'E#','E#7b5',   'E#-G##-B-D#'),
  ('Mi♯','Mi♯ 7#5',          'Mi♯-Sol♯♯-Si♯♯-Re♯',    'E#','E#7#5',   'E#-G##-B##-D#'),
  ('Mi♯','Mi♯ 7sus2',        'Mi♯-Fa♯♯-Si♯-Re♯',     'E#','E#7sus2', 'E#-F##-B#-D#'),
  ('Mi♯','Mi♯ 7sus4',        'Mi♯-La♯-Si♯-Re♯',      'E#','E#7sus4', 'E#-A#-B#-D#'),
  ('Mi♯','Mi♯ 7add11',       'Mi♯-Sol♯♯-Si♯-Re♯-La♯','E#','E#7add11','E#-G##-B#-D#-A#'),

  /* --- NOVE --- */
  ('Mi♯','Mi♯ 9',            'Mi♯-Sol♯♯-Si♯-Re♯-Fa♯♯','E#','E#9',     'E#-G##-B#-D#-F##'),
  ('Mi♯','Mi♯ Maj9',         'Mi♯-Sol♯♯-Si♯-Re♯♯-Fa♯♯','E#','E#Maj9',  'E#-G##-B#-D##-F##'),
  ('Mi♯','Mi♯ m9',           'Mi♯-Sol♯-Si♯-Re♯-Fa♯♯',  'E#','E#m9',    'E#-G#-B#-D#-F##'),
  ('Mi♯','Mi♯ 9b5',          'Mi♯-Sol♯♯-Si-Re♯-Fa♯♯','E#','E#9b5',   'E#-G##-B-D#-F##'),
  ('Mi♯','Mi♯ 9#5',          'Mi♯-Sol♯♯-Si♯♯-Re♯-Fa♯♯','E#','E#9#5',   'E#-G##-B##-D#-F##'),
  ('Mi♯','Mi♯ 9sus4',        'Mi♯-La♯-Si♯-Re♯-Fa♯♯',  'E#','E#9sus4', 'E#-A#-B#-D#-F##'),
  ('Mi♯','Mi♯ 9add11',       'Mi♯-Sol♯♯-Si♯-Re♯-La♯-Fa♯♯','E#','E#9add11','E#-G##-B#-D#-A#-F##'),

  /* --- UNDICI --- */
  ('Mi♯','Mi♯ 11',           'Mi♯-Sol♯♯-Si♯-Re♯-Fa♯♯-La♯','E#','E#11',    'E#-G##-B#-D#-F##-A#'),
  ('Mi♯','Mi♯ Maj11',        'Mi♯-Sol♯♯-Si♯-Re♯♯-Fa♯♯-La♯','E#','E#Maj11', 'E#-G##-B#-D##-F##-A#'),
  ('Mi♯','Mi♯ m11',          'Mi♯-Sol♯-Si♯-Re♯-Fa♯♯-La♯','E#','E#m11',   'E#-G#-B#-D#-F##-A#'),
  ('Mi♯','Mi♯ 11b5',         'Mi♯-Sol♯♯-Si-Re♯-Fa♯♯-La♯','E#','E#11b5',  'E#-G##-B-D#-F##-A#'),
  ('Mi♯','Mi♯ 11#5',         'Mi♯-Sol♯♯-Si♯♯-Re♯-Fa♯♯-La♯','E#','E#11#5',  'E#-G##-B##-D#-F##-A#'),

  /* --- TREDICI --- */
  ('Mi♯','Mi♯ 13',           'Mi♯-Sol♯♯-Si♯-Re♯-Fa♯♯-La♯-Do♯♯','E#','E#13',    'E#-G##-B#-D#-F##-A#-C##'),
  ('Mi♯','Mi♯ Maj13',        'Mi♯-Sol♯♯-Si♯-Re♯♯-Fa♯♯-La♯-Do♯♯','E#','E#Maj13', 'E#-G##-B#-D##-F##-A#-C##'),
  ('Mi♯','Mi♯ m13',          'Mi♯-Sol♯-Si♯-Re♯-Fa♯♯-La♯-Do♯♯','E#','E#m13',   'E#-G#-B#-D#-F##-A#-C##');


-- Creazione della tabella NoteFA (Fa / F)
CREATE TABLE NoteFA (
  id               INT UNSIGNED    NOT NULL AUTO_INCREMENT,
  note_ita         VARCHAR(2)      NOT NULL COMMENT 'es. Fa',
  chord_ita        VARCHAR(50)     NOT NULL COMMENT 'es. Fa Maggiore 7',
  chord_note_ita   VARCHAR(100)    NOT NULL COMMENT 'es. Fa-La-Do-Mi',
  note_eng         VARCHAR(2)      NOT NULL COMMENT 'es. F',
  chord_eng        VARCHAR(20)     NOT NULL COMMENT 'es. FMaj7',
  chord_note_eng   VARCHAR(100)    NOT NULL COMMENT 'es. F-A-C-E',
  created_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tutti gli accordi per Fa (F)
INSERT INTO NoteFA (
  note_ita, chord_ita, chord_note_ita,
  note_eng, chord_eng, chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('FA','Fa Maggiore',        'Fa-La-Do',                  'F','FMaj',   'F-A-C'),
  ('FA','Fa Minore',          'Fa-Lab-Do',                 'F','Fm',     'F-Ab-C'),
  ('FA','Fa Diminuito',       'Fa-Lab-Do♭',                'F','Fdim',   'F-Ab-Cb'),
  ('FA','Fa Aumentato',       'Fa-La-Do♯',                 'F','Faug',   'F-A-C#'),

  /* --- QUARTE & QUINTE --- */
  ('FA','Fa Quarta',          'Fa-Sib',                    'F','F4',     'F-Bb'),
  ('FA','Fa Quinta',          'Fa-Do',                     'F','F5',     'F-C'),

  /* --- SOSPESI --- */
  ('FA','Fa sus2',            'Fa-Sol-Do',                 'F','Fsus2',  'F-G-C'),
  ('FA','Fa sus4',            'Fa-Sib-Do',                 'F','Fsus4',  'F-Bb-C'),
  ('FA','Fa sus4 add9',       'Fa-Sol-Sib-Do',             'F','Fsus4add9','F-G-Bb-C'),

  /* --- SENZA INTERVALLI --- */
  ('FA','Fa no3',             'Fa-Do',                     'F','Fno3',   'F-C'),
  ('FA','Fa no5',             'Fa-La',                     'F','Fno5',   'F-A'),

  /* --- ADDITIONS --- */
  ('FA','Fa add2',            'Fa-La-Do-Re',               'F','Fadd2',  'F-A-C-D'),
  ('FA','Fa add4',            'Fa-La-Do-Sib',              'F','Fadd4',  'F-A-C-Bb'),
  ('FA','Fa add9',            'Fa-La-Do-Sol',              'F','Fadd9',  'F-A-C-G'),
  ('FA','Fa add11',           'Fa-La-Do-Sib',              'F','Fadd11', 'F-A-C-Bb'),

  /* --- SESTE --- */
  ('FA','Fa 6',               'Fa-La-Do-Re',               'F','F6',     'F-A-C-D'),
  ('FA','Fa Minore 6',        'Fa-Lab-Do-Re',              'F','Fm6',    'F-Ab-C-D'),
  ('FA','Fa 6/9',             'Fa-La-Do-Re-Sol',           'F','F6/9',   'F-A-C-D-G'),

  /* --- SETTIME --- */
  ('FA','Fa Settima',         'Fa-La-Do-Mib',              'F','F7',     'F-A-C-Eb'),
  ('FA','Fa Maggiore 7',      'Fa-La-Do-Mi',               'F','FMaj7',  'F-A-C-E'),
  ('FA','Fa Minore 7',        'Fa-Lab-Do-Mib',             'F','Fm7',    'F-Ab-C-Eb'),
  ('FA','Fa Semidiminuito',   'Fa-Lab-Do♭-Mib',           'F','Fm7b5',  'F-Ab-Cb-Eb'),
  ('FA','Fa Dim7',            'Fa-Lab-Do♭-Re♭',           'F','Fdim7',  'F-Ab-Cb-Db'),
  ('FA','Fa 7♭5',            'Fa-La-Do♭-Mib',            'F','F7b5',   'F-A-Cb-Eb'),
  ('FA','Fa 7♯5',            'Fa-La-Do♯-Mib',            'F','F7#5',   'F-A-C#-Eb'),
  ('FA','Fa 7sus2',          'Fa-Sol-Do-Mib',            'F','F7sus2', 'F-G-C-Eb'),
  ('FA','Fa 7sus4',          'Fa-Sib-Do-Mib',            'F','F7sus4', 'F-Bb-C-Eb'),
  ('FA','Fa 7add11',         'Fa-La-Do-Mib-Sib',         'F','F7add11','F-A-C-Eb-Bb'),

  /* --- NOVE --- */
  ('FA','Fa 9',               'Fa-La-Do-Mib-Sol',          'F','F9',     'F-A-C-Eb-G'),
  ('FA','Fa Maggiore 9',      'Fa-La-Do-Mi-Sol',           'F','FMaj9',  'F-A-C-E-G'),
  ('FA','Fa Minore 9',        'Fa-Lab-Do-Mib-Sol',         'F','Fm9',    'F-Ab-C-Eb-G'),
  ('FA','Fa 9♭5',            'Fa-La-Do♭-Mib-Sol',         'F','F9b5',   'F-A-Cb-Eb-G'),
  ('FA','Fa 9♯5',            'Fa-La-Do♯-Mib-Sol',         'F','F9#5',   'F-A-C#-Eb-G'),
  ('FA','Fa 9sus4',          'Fa-Sib-Do-Mib-Sol',         'F','F9sus4', 'F-Bb-C-Eb-G'),
  ('FA','Fa 9add11',         'Fa-La-Do-Mib-Sib-Sol',      'F','F9add11','F-A-C-Eb-Bb-G'),

  /* --- UNDICI --- */
  ('FA','Fa 11',              'Fa-La-Do-Mib-Sol-Sib',      'F','F11',    'F-A-C-Eb-G-Bb'),
  ('FA','Fa Maggiore 11',     'Fa-La-Do-Mi-Sol-Sib',       'F','FMaj11', 'F-A-C-E-G-Bb'),
  ('FA','Fa Minore 11',       'Fa-Lab-Do-Mib-Sol-Sib',     'F','Fm11',   'F-Ab-C-Eb-G-Bb'),
  ('FA','Fa 11♭5',           'Fa-La-Do♭-Mib-Sol-Sib',     'F','F11b5',  'F-A-Cb-Eb-G-Bb'),
  ('FA','Fa 11♯5',           'Fa-La-Do♯-Mib-Sol-Sib',     'F','F11#5',  'F-A-C#-Eb-G-Bb'),

  /* --- TREDICI --- */
  ('FA','Fa 13',             'Fa-La-Do-Mib-Sol-Sib-Re',   'F','F13',    'F-A-C-Eb-G-Bb-D'),
  ('FA','Fa Maggiore 13',    'Fa-La-Do-Mi-Sol-Sib-Re',    'F','FMaj13', 'F-A-C-E-G-Bb-D'),
  ('FA','Fa Minore 13',      'Fa-Lab-Do-Mib-Sol-Sib-Re',  'F','Fm13',   'F-Ab-C-Eb-G-Bb-D');

-- Creazione della tabella FAb
CREATE TABLE NoteFAb (
    id INT AUTO_INCREMENT PRIMARY KEY,
    note_ita VARCHAR(255),
    chord_ita VARCHAR(255),
    chord_note_ita VARCHAR(255),
    note_eng VARCHAR(255),
    chord_eng VARCHAR(255),
    chord_note_eng VARCHAR(255)
);

-- Creazione della tabella NoteFAb (Fa♭ / Fb)
CREATE TABLE NoteFAb (
  id               INT UNSIGNED    NOT NULL AUTO_INCREMENT,
  note_ita         VARCHAR(3)      NOT NULL COMMENT 'es. Fa♭',
  chord_ita        VARCHAR(50)     NOT NULL COMMENT 'es. Fa♭ Maggiore 7',
  chord_note_ita   VARCHAR(100)    NOT NULL COMMENT 'es. Fa♭-La♭-Do♭-Mi♭',
  note_eng         VARCHAR(2)      NOT NULL COMMENT 'es. Fb',
  chord_eng        VARCHAR(20)     NOT NULL COMMENT 'es. FbMaj7',
  chord_note_eng   VARCHAR(100)    NOT NULL COMMENT 'es. Fb-Ab-Cb-Eb',
  created_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tutti gli accordi per Fa♭ (Fb)
INSERT INTO NoteFAb (
  note_ita, chord_ita, chord_note_ita,
  note_eng, chord_eng, chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('Fa♭','Fa♭ Maggiore',     'Fa♭-La♭-Do♭',           'Fb','FbMaj',   'Fb-Ab-Cb'),
  ('Fa♭','Fa♭ Minore',       'Fa♭-La♭♭-Do♭',          'Fb','Fbm',     'Fb-Abb-Cb'),
  ('Fa♭','Fa♭ Diminuito',    'Fa♭-La♭♭-Do♭♭',         'Fb','Fbdim',   'Fb-Abb-Cbb'),
  ('Fa♭','Fa♭ Aumentato',    'Fa♭-La♭-Do',            'Fb','Fbaug',   'Fb-Ab-C'),

  /* --- QUARTE & QUINTE --- */
  ('Fa♭','Fa♭ Quarta',       'Fa♭-Si♭♭',              'Fb','Fb4',     'Fb-Bbb'),
  ('Fa♭','Fa♭ Quinta',       'Fa♭-Do♭',               'Fb','Fb5',     'Fb-Cb'),

  /* --- SOSPESI --- */
  ('Fa♭','Fa♭ sus2',         'Fa♭-Sol♭-Do♭',          'Fb','Fbsus2',  'Fb-Gb-Cb'),
  ('Fa♭','Fa♭ sus4',         'Fa♭-Si♭♭-Do♭',          'Fb','Fbsus4',  'Fb-Bbb-Cb'),
  ('Fa♭','Fa♭ sus4 add9',    'Fa♭-Sol♭-Si♭♭-Do♭',      'Fb','Fbsus4add9','Fb-Gb-Bbb-Cb'),

  /* --- SENZA INTERVALLI --- */
  ('Fa♭','Fa♭ no3',          'Fa♭-Do♭',               'Fb','Fbno3',   'Fb-Cb'),
  ('Fa♭','Fa♭ no5',          'Fa♭-La♭',               'Fb','Fbno5',   'Fb-Ab'),

  /* --- ADDITIONS --- */
  ('Fa♭','Fa♭ add2',         'Fa♭-La♭-Do♭-Sol♭',      'Fb','Fbadd2',  'Fb-Ab-Cb-Gb'),
  ('Fa♭','Fa♭ add4',         'Fa♭-La♭-Si♭♭-Do♭',      'Fb','Fbadd4',  'Fb-Ab-Bbb-Cb'),
  ('Fa♭','Fa♭ add9',         'Fa♭-La♭-Do♭-Sol♭',      'Fb','Fbadd9',  'Fb-Ab-Cb-Gb'),
  ('Fa♭','Fa♭ add11',        'Fa♭-La♭-Si♭♭-Do♭',      'Fb','Fbadd11', 'Fb-Ab-Bbb-Cb'),

  /* --- SESTE --- */
  ('Fa♭','Fa♭ 6',            'Fa♭-La♭-Do♭-Re♭',       'Fb','Fb6',     'Fb-Ab-Cb-Db'),
  ('Fa♭','Fa♭ m6',           'Fa♭-La♭♭-Do♭-Re♭',      'Fb','Fbm6',    'Fb-Abb-Cb-Db'),
  ('Fa♭','Fa♭ 6/9',          'Fa♭-La♭-Do♭-Re♭-Sol♭',  'Fb','Fb6/9',   'Fb-Ab-Cb-Db-Gb'),

  /* --- SETTIME --- */
  ('Fa♭','Fa♭ 7',            'Fa♭-La♭-Do♭-Mi♭',       'Fb','Fb7',     'Fb-Ab-Cb-Eb'),
  ('Fa♭','Fa♭ Maj7',         'Fa♭-La♭-Do♭-Mi',        'Fb','FbMaj7',  'Fb-Ab-Cb-E'),
  ('Fa♭','Fa♭ m7',           'Fa♭-La♭♭-Do♭-Mi♭',      'Fb','Fbm7',    'Fb-Abb-Cb-Eb'),
  ('Fa♭','Fa♭ m7b5',         'Fa♭-La♭♭-Do♭♭-Mi♭',     'Fb','Fbm7b5',  'Fb-Abb-Cbb-Eb'),
  ('Fa♭','Fa♭ dim7',         'Fa♭-La♭♭-Do♭♭-Re♭',      'Fb','Fbdim7',  'Fb-Abb-Cbb-Db'),
  ('Fa♭','Fa♭ 7b5',          'Fa♭-La♭-Do♭♭-Mi♭',      'Fb','Fb7b5',   'Fb-Ab-Cbb-Eb'),
  ('Fa♭','Fa♭ 7#5',          'Fa♭-La♭-Do- Mi♭',       'Fb','Fb7#5',   'Fb-Ab-C-Eb'),
  ('Fa♭','Fa♭ 7sus2',        'Fa♭-Sol♭-Do♭-Mi♭',      'Fb','Fb7sus2', 'Fb-Gb-Cb-Eb'),
  ('Fa♭','Fa♭ 7sus4',        'Fa♭-Si♭♭-Do♭-Mi♭',      'Fb','Fb7sus4', 'Fb-Bbb-Cb-Eb'),
  ('Fa♭','Fa♭ 7add11',       'Fa♭-La♭-Do♭-Mi♭-Si♭♭',   'Fb','Fb7add11','Fb-Ab-Cb-Eb-Bbb'),

  /* --- NOVE --- */
  ('Fa♭','Fa♭ 9',            'Fa♭-La♭-Do♭-Mi♭-Sol♭',   'Fb','Fb9',     'Fb-Ab-Cb-Eb-Gb'),
  ('Fa♭','Fa♭ Maj9',         'Fa♭-La♭-Do♭-Mi-Sol♭',    'Fb','FbMaj9',  'Fb-Ab-Cb-E-Gb'),
  ('Fa♭','Fa♭ m9',           'Fa♭-La♭♭-Do♭-Mi♭-Sol♭',   'Fb','Fbm9',    'Fb-Abb-Cb-Eb-Gb'),
  ('Fa♭','Fa♭ 9b5',          'Fa♭-La♭-Do♭♭-Mi♭-Sol♭',   'Fb','Fb9b5',   'Fb-Ab-Cbb-Eb-Gb'),
  ('Fa♭','Fa♭ 9#5',          'Fa♭-La♭-Do- Mi♭-Sol♭',    'Fb','Fb9#5',   'Fb-Ab-C-Eb-Gb'),
  ('Fa♭','Fa♭ 9sus4',        'Fa♭-Si♭♭-Do♭-Mi♭-Sol♭',   'Fb','Fb9sus4', 'Fb-Bbb-Cb-Eb-Gb'),
  ('Fa♭','Fa♭ 9add11',       'Fa♭-La♭-Do♭-Mi♭-Si♭♭-Sol♭','Fb','Fb9add11','Fb-Ab-Cb-Eb-Bbb-Gb'),

  /* --- UNDICI --- */
  ('Fa♭','Fa♭ 11',           'Fa♭-La♭-Do♭-Mi♭-Sol♭-Si♭♭','Fb','Fb11',    'Fb-Ab-Cb-Eb-Gb-Bbb'),
  ('Fa♭','Fa♭ Maj11',        'Fa♭-La♭-Do♭-Mi-Sol♭-Si♭♭','Fb','FbMaj11', 'Fb-Ab-Cb-E-Gb-Bbb'),
  ('Fa♭','Fa♭ m11',          'Fa♭-La♭♭-Do♭-Mi♭-Sol♭-Si♭♭','Fb','Fbm11',   'Fb-Abb-Cb-Eb-Gb-Bbb'),
  ('Fa♭','Fa♭ 11b5',         'Fa♭-La♭-Do♭♭-Mi♭-Sol♭-Si♭♭','Fb','Fb11b5',  'Fb-Ab-Cbb-Eb-Gb-Bbb'),
  ('Fa♭','Fa♭ 11#5',         'Fa♭-La♭-Do- Mi♭-Sol♭-Si♭♭','Fb','Fb11#5',  'Fb-Ab-C-Eb-Gb-Bbb'),

  /* --- TREDICI --- */
  ('Fa♭','Fa♭ 13',           'Fa♭-La♭-Do♭-Mi♭-Sol♭-Si♭♭-Re♭','Fb','Fb13',    'Fb-Ab-Cb-Eb-Gb-Bbb-Db'),
  ('Fa♭','Fa♭ Maj13',        'Fa♭-La♭-Do♭-Mi-Sol♭-Si♭♭-Re♭','Fb','FbMaj13', 'Fb-Ab-Cb-E-Gb-Bbb-Db'),
  ('Fa♭','Fa♭ m13',          'Fa♭-La♭♭-Do♭-Mi♭-Sol♭-Si♭♭-Re♭','Fb','Fbm13',   'Fb-Abb-Cb-Eb-Gb-Bbb-Db');

-- Creazione della tabella NoteFAdiesis (Fa♯ / F#)
CREATE TABLE NoteFAdiesis (
  id               INT UNSIGNED    NOT NULL AUTO_INCREMENT,
  note_ita         VARCHAR(3)      NOT NULL COMMENT 'es. Fa♯',
  chord_ita        VARCHAR(50)     NOT NULL COMMENT 'es. Fa♯ Maggiore 7',
  chord_note_ita   VARCHAR(100)    NOT NULL COMMENT 'es. Fa♯-La♯-Do♯-Mi♯',
  note_eng         VARCHAR(2)      NOT NULL COMMENT 'es. F#',
  chord_eng        VARCHAR(20)     NOT NULL COMMENT 'es. F#Maj7',
  chord_note_eng   VARCHAR(100)    NOT NULL COMMENT 'es. F#-A#-C#-E#',
  created_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB 
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_unicode_ci;

-- Tutti gli accordi per Fa♯ (F#)
INSERT INTO NoteFAdiesis (
  note_ita, chord_ita, chord_note_ita,
  note_eng, chord_eng, chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('Fa♯','Fa♯ Maggiore',    'Fa♯-La♯-Do♯',              'F#','F#Maj',   'F#-A#-C#'),
  ('Fa♯','Fa♯ Minore',      'Fa♯-La-Do♯',               'F#','F#m',     'F#-A-C#'),
  ('Fa♯','Fa♯ Diminuito',   'Fa♯-La-Do',                'F#','F#dim',   'F#-A-C'),
  ('Fa♯','Fa♯ Aumentato',   'Fa♯-La♯-Do♯♯',             'F#','F#aug',   'F#-A#-Cx'),

  /* --- QUARTE & QUINTE --- */
  ('Fa♯','Fa♯ Quarta',      'Fa♯-Si',                   'F#','F#4',     'F#-B'),
  ('Fa♯','Fa♯ Quinta',      'Fa♯-Do♯',                  'F#','F#5',     'F#-C#'),

  /* --- SOSPESI --- */
  ('Fa♯','Fa♯ sus2',        'Fa♯-Sol♯-Do♯',             'F#','F#sus2',  'F#-G#-C#'),
  ('Fa♯','Fa♯ sus4',        'Fa♯-Si-Do♯',               'F#','F#sus4',  'F#-B-C#'),
  ('Fa♯','Fa♯ sus4 add9',   'Fa♯-Sol♯-Si-Do♯',          'F#','F#sus4add9','F#-G#-B-C#'),

  /* --- SENZA INTERVALLI --- */
  ('Fa♯','Fa♯ no3',         'Fa♯-Do♯',                  'F#','F#no3',   'F#-C#'),
  ('Fa♯','Fa♯ no5',         'Fa♯-La♯',                  'F#','F#no5',   'F#-A#'),

  /* --- ADDITIONS --- */
  ('Fa♯','Fa♯ add2',        'Fa♯-La♯-Do♯-Re♯',          'F#','F#add2',  'F#-A#-C#-D#'),
  ('Fa♯','Fa♯ add4',        'Fa♯-La♯-Do♯-Si',           'F#','F#add4',  'F#-A#-C#-B'),
  ('Fa♯','Fa♯ add9',        'Fa♯-La♯-Do♯-Re♯',          'F#','F#add9',  'F#-A#-C#-D#'),
  ('Fa♯','Fa♯ add11',       'Fa♯-La♯-Do♯-Si',           'F#','F#add11', 'F#-A#-C#-B'),

  /* --- SESTE --- */
  ('Fa♯','Fa♯ 6',           'Fa♯-La♯-Do♯-Re♯',          'F#','F#6',     'F#-A#-C#-D#'),
  ('Fa♯','Fa♯ Minore 6',    'Fa♯-La-Do♯-Re♯',           'F#','F#m6',    'F#-A-C#-D#'),
  ('Fa♯','Fa♯ 6/9',         'Fa♯-La♯-Do♯-Re♯-Sol♯',     'F#','F#6/9',   'F#-A#-C#-D#-G#'),

  /* --- SETTIME --- */
  ('Fa♯','Fa♯ 7',           'Fa♯-La♯-Do♯-Mi',           'F#','F#7',     'F#-A#-C#-E'),
  ('Fa♯','Fa♯ Maggiore 7',  'Fa♯-La♯-Do♯-Mi♯',          'F#','F#Maj7',  'F#-A#-C#-E#'),
  ('Fa♯','Fa♯ Minore 7',    'Fa♯-La-Do♯-Mi',            'F#','F#m7',    'F#-A-C#-E'),
  ('Fa♯','Fa♯ Semidiminuito','Fa♯-La-Do-Mi',            'F#','F#m7b5',  'F#-A-C-E'),
  ('Fa♯','Fa♯ Dim7',        'Fa♯-La-Do-Mi♭',           'F#','F#dim7',  'F#-A-C-Eb'),
  ('Fa♯','Fa♯ 7♭5',         'Fa♯-La♯-Do-Mi',           'F#','F#7b5',   'F#-A#-C#-E'),
  ('Fa♯','Fa♯ 7♯5',         'Fa♯-La♯-Do♯♯-Mi',         'F#','F#7#5',   'F#-A#-Cx-E'),
  ('Fa♯','Fa♯ 7sus2',       'Fa♯-Sol♯-Do♯-Mi',         'F#','F#7sus2', 'F#-G#-C#-E'),
  ('Fa♯','Fa♯ 7sus4',       'Fa♯-Si-Do♯-Mi',           'F#','F#7sus4', 'F#-B-C#-E'),
  ('Fa♯','Fa♯ 7add11',      'Fa♯-La♯-Do♯-Mi-Si',       'F#','F#7add11','F#-A#-C#-E-B'),

  /* --- NOVE --- */
  ('Fa♯','Fa♯ 9',           'Fa♯-La♯-Do♯-Mi-Sol♯',      'F#','F#9',     'F#-A#-C#-E-G#'),
  ('Fa♯','Fa♯ Maggiore 9',  'Fa♯-La♯-Do♯-Mi♯-Sol♯',     'F#','F#Maj9',  'F#-A#-C#-E#-G#'),
  ('Fa♯','Fa♯ Minore 9',    'Fa♯-La-Do♯-Mi-Sol♯',       'F#','F#m9',    'F#-A-C#-E-G#'),
  ('Fa♯','Fa♯ 9♭5',         'Fa♯-La♯-Do-Mi-Sol♯',       'F#','F#9b5',   'F#-A#-C-E-G#'),
  ('Fa♯','Fa♯ 9♯5',         'Fa♯-La♯-Do♯♯-Mi-Sol♯',     'F#','F#9#5',   'F#-A#-Cx-E-G#'),
  ('Fa♯','Fa♯ 9sus4',       'Fa♯-Si-Do♯-Mi-Sol♯',       'F#','F#9sus4', 'F#-B-C#-E-G#'),
  ('Fa♯','Fa♯ 9add11',      'Fa♯-La♯-Do♯-Mi-Si-Sol♯',    'F#','F#9add11','F#-A#-C#-E-B-G#'),

  /* --- UNDICI --- */
  ('Fa♯','Fa♯ 11',          'Fa♯-La♯-Do♯-Mi-Sol♯-Si',   'F#','F#11',    'F#-A#-C#-E-G#-B'),
  ('Fa♯','Fa♯ Maggiore 11', 'Fa♯-La♯-Do♯-Mi♯-Sol♯-Si',  'F#','F#Maj11', 'F#-A#-C#-E#-G#-B'),
  ('Fa♯','Fa♯ Minore 11',   'Fa♯-La-Do♯-Mi-Sol♯-Si',    'F#','F#m11',   'F#-A-C#-E-G#-B'),
  ('Fa♯','Fa♯ 11♭5',       'Fa♯-La♯-Do-Mi-Sol♯-Si',     'F#','F#11b5',  'F#-A#-C-E-G#-B'),
  ('Fa♯','Fa♯ 11♯5',       'Fa♯-La♯-Do♯♯-Mi-Sol♯-Si',   'F#','F#11#5',  'F#-A#-Cx-E-G#-B'),

  /* --- TREDICI --- */
  ('Fa♯','Fa♯ 13',          'Fa♯-La♯-Do♯-Mi-Sol♯-Si-Re♯','F#','F#13',    'F#-A#-C#-E-G#-B-D#'),
  ('Fa♯','Fa♯ Maggiore 13','Fa♯-La♯-Do♯-Mi♯-Sol♯-Si-Re♯','F#','F#Maj13', 'F#-A#-C#-E#-G#-B-D#'),
  ('Fa♯','Fa♯ Minore 13',  'Fa♯-La-Do♯-Mi-Sol♯-Si-Re♯','F#','F#m13',   'F#-A-C#-E-G#-B-D#');


-- Creazione della tabella NoteSOL (Sol / G)
CREATE TABLE NoteSOL (
  id               INT UNSIGNED    NOT NULL AUTO_INCREMENT,
  note_ita         VARCHAR(3)      NOT NULL COMMENT 'es. Sol',
  chord_ita        VARCHAR(50)     NOT NULL COMMENT 'es. Sol Maggiore 7',
  chord_note_ita   VARCHAR(100)    NOT NULL COMMENT 'es. Sol-Si-Re-Fa',
  note_eng         VARCHAR(2)      NOT NULL COMMENT 'es. G',
  chord_eng        VARCHAR(20)     NOT NULL COMMENT 'es. GMaj7',
  chord_note_eng   VARCHAR(100)    NOT NULL COMMENT 'es. G-B-D-F#',
  created_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB 
  DEFAULT CHARSET=utf8mb4 
  COLLATE=utf8mb4_unicode_ci;

-- Tutti gli accordi per Sol (G)
INSERT INTO NoteSOL (
  note_ita, chord_ita, chord_note_ita,
  note_eng, chord_eng, chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('Sol','Sol Maggiore',    'Sol-Si-Re',               'G','GMaj',   'G-B-D'),
  ('Sol','Sol Minore',      'Sol-Si♭-Re',              'G','Gm',     'G-Bb-D'),
  ('Sol','Sol Diminuito',   'Sol-Si♭-Re♭',             'G','Gdim',   'G-Bb-Db'),
  ('Sol','Sol Aumentato',   'Sol-Si-Re♯',              'G','Gaug',   'G-B-D#'),

  /* --- QUARTE & QUINTE --- */
  ('Sol','Sol Quarta',      'Sol-Do',                  'G','G4',     'G-C'),
  ('Sol','Sol Quinta',      'Sol-Re',                  'G','G5',     'G-D'),

  /* --- SOSPESI --- */
  ('Sol','Sol sus2',        'Sol-La-Re',               'G','Gsus2',  'G-A-D'),
  ('Sol','Sol sus4',        'Sol-Do-Re',               'G','Gsus4',  'G-C-D'),
  ('Sol','Sol sus4 add9',   'Sol-La-Do-Re',            'G','Gsus4add9','G-A-C-D'),

  /* --- SENZA INTERVALLI --- */
  ('Sol','Sol no3',         'Sol-Re',                  'G','Gno3',   'G-D'),
  ('Sol','Sol no5',         'Sol-Si',                  'G','Gno5',   'G-B'),

  /* --- ADDITIONS --- */
  ('Sol','Sol add2',        'Sol-Si-Re-La',            'G','Gadd2',  'G-B-D-A'),
  ('Sol','Sol add4',        'Sol-Si-Re-Do',            'G','Gadd4',  'G-B-D-C'),
  ('Sol','Sol add9',        'Sol-Si-Re-La',            'G','Gadd9',  'G-B-D-A'),
  ('Sol','Sol add11',       'Sol-Si-Re-Do',            'G','Gadd11', 'G-B-D-C'),

  /* --- SESTE --- */
  ('Sol','Sol 6',           'Sol-Si-Re-Mi',            'G','G6',     'G-B-D-E'),
  ('Sol','Sol Minore 6',    'Sol-Si♭-Re-Mi',           'G','Gm6',    'G-Bb-D-E'),
  ('Sol','Sol 6/9',         'Sol-Si-Re-Mi-La',         'G','G6/9',   'G-B-D-E-A'),

  /* --- SETTIME --- */
  ('Sol','Sol 7',           'Sol-Si-Re-Fa',            'G','G7',     'G-B-D-F'),
  ('Sol','Sol Maggiore 7',  'Sol-Si-Re-Fa♯',           'G','GMaj7',  'G-B-D-F#'),
  ('Sol','Sol Minore 7',    'Sol-Si♭-Re-Fa',           'G','Gm7',    'G-Bb-D-F'),
  ('Sol','Sol m7b5',        'Sol-Si♭-Re♭-Fa',          'G','Gm7b5',  'G-Bb-Db-F'),
  ('Sol','Sol Dim7',        'Sol-Si♭-Re♭-Fa♭',         'G','Gdim7',  'G-Bb-Db-Fb'),
  ('Sol','Sol 7♭5',         'Sol-Si-Re♭-Fa',           'G','G7b5',   'G-B-Db-F'),
  ('Sol','Sol 7♯5',         'Sol-Si-Re♯-Fa',           'G','G7#5',   'G-B-D#-F'),
  ('Sol','Sol 7sus2',       'Sol-La-Re-Fa',            'G','G7sus2', 'G-A-D-F'),
  ('Sol','Sol 7sus4',       'Sol-Do-Re-Fa',            'G','G7sus4', 'G-C-D-F'),
  ('Sol','Sol 7add11',      'Sol-Si-Re-Fa-Do',         'G','G7add11','G-B-D-F-C'),

  /* --- NOVE --- */
  ('Sol','Sol 9',           'Sol-Si-Re-Fa-La',         'G','G9',     'G-B-D-F-A'),
  ('Sol','Sol Maggiore 9',  'Sol-Si-Re-Fa♯-La',        'G','GMaj9',  'G-B-D-F#-A'),
  ('Sol','Sol Minore 9',    'Sol-Si♭-Re-Fa-La',        'G','Gm9',    'G-Bb-D-F-A'),
  ('Sol','Sol 9♭5',         'Sol-Si-Re♭-Fa-La',        'G','G9b5',   'G-B-Db-F-A'),
  ('Sol','Sol 9♯5',         'Sol-Si-Re♯-Fa-La',        'G','G9#5',   'G-B-D#-F-A'),
  ('Sol','Sol 9sus4',       'Sol-Do-Re-Fa-La',         'G','G9sus4', 'G-C-D-F-A'),
  ('Sol','Sol 9add11',      'Sol-Si-Re-Fa-La-Do',      'G','G9add11','G-B-D-F-A-C'),

  /* --- UNDICI --- */
  ('Sol','Sol 11',          'Sol-Si-Re-Fa-La-Do',      'G','G11',    'G-B-D-F-A-C'),
  ('Sol','Sol Maggiore 11', 'Sol-Si-Re-Fa♯-La-Do',     'G','GMaj11', 'G-B-D-F#-A-C'),
  ('Sol','Sol Minore 11',   'Sol-Si♭-Re-Fa-La-Do',     'G','Gm11',   'G-Bb-D-F-A-C'),
  ('Sol','Sol 11♭5',        'Sol-Si-Re♭-Fa-La-Do',     'G','G11b5',  'G-B-Db-F-A-C'),
  ('Sol','Sol 11♯5',        'Sol-Si-Re♯-Fa-La-Do',     'G','G11#5',  'G-B-D#-F-A-C'),

  /* --- TREDICI --- */
  ('Sol','Sol 13',          'Sol-Si-Re-Fa-La-Do-Mi',   'G','G13',    'G-B-D-F-A-C-E'),
  ('Sol','Sol Maggiore 13', 'Sol-Si-Re-Fa♯-La-Do-Mi',  'G','GMaj13', 'G-B-D-F#-A-C-E'),
  ('Sol','Sol Minore 13',   'Sol-Si♭-Re-Fa-La-Do-Mi',  'G','Gm13',   'G-Bb-D-F-A-C-E');

-- Creazione della tabella NoteSOLb (Sol♭ / Gb)
CREATE TABLE NoteSOLb (
  id               INT UNSIGNED    NOT NULL AUTO_INCREMENT,
  note_ita         VARCHAR(3)      NOT NULL COMMENT 'es. Sol♭',
  chord_ita        VARCHAR(50)     NOT NULL COMMENT 'es. Sol♭ Maggiore 7',
  chord_note_ita   VARCHAR(100)    NOT NULL COMMENT 'es. Sol♭-Si♭-Re♭-Fa♭',
  note_eng         VARCHAR(2)      NOT NULL COMMENT 'es. Gb',
  chord_eng        VARCHAR(20)     NOT NULL COMMENT 'es. GbMaj7',
  chord_note_eng   VARCHAR(100)    NOT NULL COMMENT 'es. Gb-Bb-Db-Fb',
  created_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tutti gli accordi per Sol♭ (Gb)
INSERT INTO NoteSOLb (
  note_ita, chord_ita, chord_note_ita,
  note_eng, chord_eng, chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('Sol♭','Sol♭ Maggiore',    'Sol♭-Si♭-Re♭',              'Gb','GbMaj',   'Gb-Bb-Db'),
  ('Sol♭','Sol♭ Minore',      'Sol♭-Si♭♭-Re♭',             'Gb','Gbm',     'Gb-Bbb-Db'),
  ('Sol♭','Sol♭ Diminuito',   'Sol♭-Si♭♭-Re♭♭',            'Gb','Gbdim',   'Gb-Bbb-Dbb'),
  ('Sol♭','Sol♭ Aumentato',   'Sol♭-Si♭-Re',               'Gb','Gbaug',   'Gb-Bb-D'),

  /* --- QUARTE & QUINTE --- */
  ('Sol♭','Sol♭ Quarta',      'Sol♭-Do♭',                  'Gb','Gb4',     'Gb-Cb'),
  ('Sol♭','Sol♭ Quinta',      'Sol♭-Re♭',                  'Gb','Gb5',     'Gb-Db'),

  /* --- SOSPESI --- */
  ('Sol♭','Sol♭ sus2',        'Sol♭-La♭-Re♭',              'Gb','Gbsus2',  'Gb-Ab-Db'),
  ('Sol♭','Sol♭ sus4',        'Sol♭-Do♭-Re♭',              'Gb','Gbsus4',  'Gb-Cb-Db'),
  ('Sol♭','Sol♭ sus4 add9',   'Sol♭-La♭-Do♭-Re♭',          'Gb','Gbsus4add9','Gb-Ab-Cb-Db'),

  /* --- SENZA INTERVALLI --- */
  ('Sol♭','Sol♭ no3',         'Sol♭-Re♭',                  'Gb','Gbno3',   'Gb-Db'),
  ('Sol♭','Sol♭ no5',         'Sol♭-Si♭',                  'Gb','Gbno5',   'Gb-Bb'),

  /* --- ADDITIONS --- */
  ('Sol♭','Sol♭ add2',        'Sol♭-Si♭-Re♭-La♭',          'Gb','Gbadd2',  'Gb-Bb-Db-Ab'),
  ('Sol♭','Sol♭ add4',        'Sol♭-Si♭-Re♭-Do♭',          'Gb','Gbadd4',  'Gb-Bb-Db-Cb'),
  ('Sol♭','Sol♭ add9',        'Sol♭-Si♭-Re♭-La♭',          'Gb','Gbadd9',  'Gb-Bb-Db-Ab'),
  ('Sol♭','Sol♭ add11',       'Sol♭-Si♭-Re♭-Do♭',          'Gb','Gbadd11', 'Gb-Bb-Db-Cb'),

  /* --- SESTE --- */
  ('Sol♭','Sol♭ 6',           'Sol♭-Si♭-Re♭-Mi♭',          'Gb','Gb6',     'Gb-Bb-Db-Eb'),
  ('Sol♭','Sol♭ Minore 6',    'Sol♭-Si♭♭-Re♭-Mi♭',         'Gb','Gbm6',    'Gb-Bbb-Db-Eb'),
  ('Sol♭','Sol♭ 6/9',         'Sol♭-Si♭-Re♭-Mi♭-La♭',      'Gb','Gb6/9',   'Gb-Bb-Db-Eb-Ab'),

  /* --- SETTIME --- */
  ('Sol♭','Sol♭ 7',           'Sol♭-Si♭-Re♭-Fa♭',          'Gb','Gb7',     'Gb-Bb-Db-Fb'),
  ('Sol♭','Sol♭ Maggiore 7',  'Sol♭-Si♭-Re♭-Fa',           'Gb','GbMaj7',  'Gb-Bb-Db-F'),
  ('Sol♭','Sol♭ Minore 7',    'Sol♭-Si♭♭-Re♭-Fa♭',         'Gb','Gbm7',    'Gb-Bbb-Db-Fb'),
  ('Sol♭','Sol♭ m7b5',        'Sol♭-Si♭♭-Re♭♭-Fa♭',        'Gb','Gbm7b5',  'Gb-Bbb-Dbb-Fb'),
  ('Sol♭','Sol♭ Dim7',        'Sol♭-Si♭♭-Re♭♭-Mi♭♭',       'Gb','Gbdim7',  'Gb-Bbb-Dbb-Ebb'),
  ('Sol♭','Sol♭ 7♭5',         'Sol♭-Si♭-Re♭♭-Fa♭',         'Gb','Gb7b5',   'Gb-Bb-Dbb-Fb'),
  ('Sol♭','Sol♭ 7♯5',         'Sol♭-Si♭-Re-Fa♭',           'Gb','Gb7#5',   'Gb-Bb-D-Fb'),
  ('Sol♭','Sol♭ 7sus2',       'Sol♭-La♭-Re♭-Fa♭',          'Gb','Gb7sus2', 'Gb-Ab-Db-Fb'),
  ('Sol♭','Sol♭ 7sus4',       'Sol♭-Do♭-Re♭-Fa♭',          'Gb','Gb7sus4', 'Gb-Cb-Db-Fb'),
  ('Sol♭','Sol♭ 7add11',      'Sol♭-Si♭-Re♭-Fa♭-Do♭',      'Gb','Gb7add11','Gb-Bb-Db-Fb-Cb'),

  /* --- NOVE --- */
  ('Sol♭','Sol♭ 9',           'Sol♭-Si♭-Re♭-Fa♭-La♭',      'Gb','Gb9',     'Gb-Bb-Db-Fb-Ab'),
  ('Sol♭','Sol♭ Maggiore 9',  'Sol♭-Si♭-Re♭-Fa- La♭',      'Gb','GbMaj9',  'Gb-Bb-Db-F-Ab'),
  ('Sol♭','Sol♭ Minore 9',    'Sol♭-Si♭♭-Re♭-Fa♭-La♭',      'Gb','Gbm9',    'Gb-Bbb-Db-Fb-Ab'),
  ('Sol♭','Sol♭ 9♭5',         'Sol♭-Si♭-Re♭♭-Fa♭-La♭',      'Gb','Gb9b5',   'Gb-Bb-Dbb-Fb-Ab'),
  ('Sol♭','Sol♭ 9♯5',         'Sol♭-Si♭-Re-Fa♭-La♭',        'Gb','Gb9#5',   'Gb-Bb-D-Fb-Ab'),
  ('Sol♭','Sol♭ 9sus4',       'Sol♭-Do♭-Re♭-Fa♭-La♭',       'Gb','Gb9sus4', 'Gb-Cb-Db-Fb-Ab'),
  ('Sol♭','Sol♭ 9add11',      'Sol♭-Si♭-Re♭-Fa♭-La♭-Do♭',   'Gb','Gb9add11','Gb-Bb-Db-Fb-Ab-Cb'),

  /* --- UNDICI --- */
  ('Sol♭','Sol♭ 11',          'Sol♭-Si♭-Re♭-Fa♭-La♭-Do♭',   'Gb','Gb11',    'Gb-Bb-Db-Fb-Ab-Cb'),
  ('Sol♭','Sol♭ Maggiore 11', 'Sol♭-Si♭-Re♭-Fa- La♭-Do♭',    'Gb','GbMaj11', 'Gb-Bb-Db-F-Ab-Cb'),
  ('Sol♭','Sol♭ Minore 11',   'Sol♭-Si♭♭-Re♭-Fa♭-La♭-Do♭',   'Gb','Gbm11',   'Gb-Bbb-Db-Fb-Ab-Cb'),
  ('Sol♭','Sol♭ 11♭5',        'Sol♭-Si♭-Re♭♭-Fa♭-La♭-Do♭',  'Gb','Gb11b5',  'Gb-Bb-Dbb-Fb-Ab-Cb'),
  ('Sol♭','Sol♭ 11#5',        'Sol♭-Si♭-Re-Fa♭-La♭-Do♭',    'Gb','Gb11#5',  'Gb-Bb-D-Fb-Ab-Cb'),

  /* --- TREDICI --- */
  ('Sol♭','Sol♭ 13',          'Sol♭-Si♭-Re♭-Fa♭-La♭-Do♭-Mi♭','Gb','Gb13',    'Gb-Bb-Db-Fb-Ab-Cb-Eb'),
  ('Sol♭','Sol♭ Maggiore 13','Sol♭-Si♭-Re♭-Fa- La♭-Do♭-Mi♭','Gb','GbMaj13', 'Gb-Bb-Db-F-Ab-Cb-Eb'),
  ('Sol♭','Sol♭ Minore 13',   'Sol♭-Si♭♭-Re♭-Fa♭-La♭-Do♭-Mi♭','Gb','Gbm13',   'Gb-Bbb-Db-Fb-Ab-Cb-Eb');

-- Creazione della tabella NoteSOLdiesis (Sol♯ / G#)
CREATE TABLE NoteSOLdiesis (
  id               INT UNSIGNED    NOT NULL AUTO_INCREMENT,
  note_ita         VARCHAR(3)      NOT NULL COMMENT 'es. Sol♯',
  chord_ita        VARCHAR(50)     NOT NULL COMMENT 'es. Sol♯ Maggiore 7',
  chord_note_ita   VARCHAR(100)    NOT NULL COMMENT 'es. Sol♯-Si♯-Re♯-Fa♯',
  note_eng         VARCHAR(2)      NOT NULL COMMENT 'es. G#',
  chord_eng        VARCHAR(20)     NOT NULL COMMENT 'es. G#Maj7',
  chord_note_eng   VARCHAR(100)    NOT NULL COMMENT 'es. G#-B#-D#-F#',
  created_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

-- Inserimento di tutti gli accordi per Sol♯ (G#)
INSERT INTO NoteSOLdiesis (
  note_ita, chord_ita, chord_note_ita,
  note_eng, chord_eng, chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('Sol♯','Sol♯ Maggiore',      'Sol♯-Si♯-Re♯',           'G#','G#Maj',   'G#-B#-D#'),
  ('Sol♯','Sol♯ Minore',        'Sol♯-Si-Re♯',            'G#','G#m',     'G#-B-D#'),
  ('Sol♯','Sol♯ Diminuito',     'Sol♯-Si-Re',             'G#','G#dim',   'G#-B-D'),
  ('Sol♯','Sol♯ Aumentato',     'Sol♯-Si♯-Re♯♯',          'G#','G#aug',   'G#-B#-D##'),

  /* --- QUARTE & QUINTE --- */
  ('Sol♯','Sol♯ Quarta',        'Sol♯-Do♯',               'G#','G#4',     'G#-C#'),
  ('Sol♯','Sol♯ Quinta',        'Sol♯-Re♯',               'G#','G#5',     'G#-D#'),

  /* --- SOSPESI --- */
  ('Sol♯','Sol♯ sus2',          'Sol♯-La♯-Re♯',           'G#','G#sus2',  'G#-A#-D#'),
  ('Sol♯','Sol♯ sus4',          'Sol♯-Do♯-Re♯',           'G#','G#sus4',  'G#-C#-D#'),
  ('Sol♯','Sol♯ sus4 add9',     'Sol♯-La♯-Do♯-Re♯',       'G#','G#sus4add9','G#-A#-C#-D#'),

  /* --- SENZA INTERVALLI --- */
  ('Sol♯','Sol♯ no3',           'Sol♯-Re♯',               'G#','G#no3',   'G#-D#'),
  ('Sol♯','Sol♯ no5',           'Sol♯-Si♯',               'G#','G#no5',   'G#-B#'),

  /* --- ADDITIONS --- */
  ('Sol♯','Sol♯ add2',          'Sol♯-Si♯-Re♯-La♯',       'G#','G#add2',  'G#-B#-D#-A#'),
  ('Sol♯','Sol♯ add4',          'Sol♯-Si♯-Re♯-Do♯',       'G#','G#add4',  'G#-B#-D#-C#'),
  ('Sol♯','Sol♯ add9',          'Sol♯-Si♯-Re♯-La♯',       'G#','G#add9',  'G#-B#-D#-A#'),
  ('Sol♯','Sol♯ add11',         'Sol♯-Si♯-Re♯-Do♯',       'G#','G#add11', 'G#-B#-D#-C#'),

  /* --- SESTE --- */
  ('Sol♯','Sol♯ 6',             'Sol♯-Si♯-Re♯-Mi♯',       'G#','G#6',     'G#-B#-D#-E#'),
  ('Sol♯','Sol♯ Minore 6',      'Sol♯-Si-Re♯-Mi♯',        'G#','G#m6',    'G#-B-D#-E#'),
  ('Sol♯','Sol♯ 6/9',           'Sol♯-Si♯-Re♯-Mi♯-La♯',   'G#','G#6/9',   'G#-B#-D#-E#-A#'),

  /* --- SETTIME --- */
  ('Sol♯','Sol♯ 7',             'Sol♯-Si♯-Re♯-Fa♯',       'G#','G#7',     'G#-B#-D#-F#'),
  ('Sol♯','Sol♯ Maggiore 7',    'Sol♯-Si♯-Re♯-Fa♯♯',      'G#','G#Maj7',  'G#-B#-D#-F##'),
  ('Sol♯','Sol♯ Minore 7',      'Sol♯-Si-Re♯-Fa♯',        'G#','G#m7',    'G#-B-D#-F#'),
  ('Sol♯','Sol♯ semidiminuito', 'Sol♯-Si-Re-Fa♯',         'G#','G#m7b5',  'G#-B-D-F#'),
  ('Sol♯','Sol♯ dim7',          'Sol♯-Si-Re-Fa',          'G#','G#dim7',  'G#-B-D-F'),
  ('Sol♯','Sol♯ 7♭5',          'Sol♯-Si♯-Re-Fa♯',        'G#','G#7b5',   'G#-B#-D-F#'),
  ('Sol♯','Sol♯ 7♯5',          'Sol♯-Si♯-Re♯♯-Fa♯',       'G#','G#7#5',   'G#-B#-D##-F#'),
  ('Sol♯','Sol♯ 7sus2',        'Sol♯-La♯-Re♯-Fa♯',       'G#','G#7sus2', 'G#-A#-D#-F#'),
  ('Sol♯','Sol♯ 7sus4',        'Sol♯-Do♯-Re♯-Fa♯',       'G#','G#7sus4', 'G#-C#-D#-F#'),
  ('Sol♯','Sol♯ 7add11',       'Sol♯-Si♯-Re♯-Fa♯-Do♯',   'G#','G#7add11','G#-B#-D#-F#-C#'),

  /* --- NOVE --- */
  ('Sol♯','Sol♯ 9',            'Sol♯-Si♯-Re♯-Fa♯-La♯',    'G#','G#9',     'G#-B#-D#-F#-A#'),
  ('Sol♯','Sol♯ Maggiore 9',    'Sol♯-Si♯-Re♯-Fa♯♯-La♯',   'G#','G#Maj9',  'G#-B#-D#-F##-A#'),
  ('Sol♯','Sol♯ Minore 9',      'Sol♯-Si-Re♯-Fa♯-La♯',     'G#','G#m9',    'G#-B-D#-F#-A#'),
  ('Sol♯','Sol♯ 9♭5',          'Sol♯-Si♯-Re-Fa♯-La♯',     'G#','G#9b5',   'G#-B#-D-F#-A#'),
  ('Sol♯','Sol♯ 9♯5',          'Sol♯-Si♯-Re♯♯-Fa♯-La♯',    'G#','G#9#5',   'G#-B#-D##-F#-A#'),
  ('Sol♯','Sol♯ 9sus4',        'Sol♯-Do♯-Re♯-Fa♯-La♯',    'G#','G#9sus4', 'G#-C#-D#-F#-A#'),
  ('Sol♯','Sol♯ 9add11',       'Sol♯-Si♯-Re♯-Fa♯-Do♯-La♯','G#','G#9add11','G#-B#-D#-F#-C#-A#'),

  /* --- UNDICI --- */
  ('Sol♯','Sol♯ 11',           'Sol♯-Si♯-Re♯-Fa♯-La♯-Do♯','G#','G#11',    'G#-B#-D#-F#-A#-C#'),
  ('Sol♯','Sol♯ Maggiore 11',  'Sol♯-Si♯-Re♯-Fa♯♯-La♯-Do♯','G#','G#Maj11', 'G#-B#-D#-F##-A#-C#'),
  ('Sol♯','Sol♯ Minore 11',    'Sol♯-Si-Re♯-Fa♯-La♯-Do♯','G#','G#m11',   'G#-B-D#-F#-A#-C#'),
  ('Sol♯','Sol♯ 11♭5',         'Sol♯-Si♯-Re-Fa♯-La♯-Do♯','G#','G#11b5',  'G#-B#-D-F#-A#-C#'),
  ('Sol♯','Sol♯ 11#5',         'Sol♯-Si♯-Re♯♯-Fa♯-La♯-Do♯','G#','G#11#5',  'G#-B#-D##-F#-A#-C#'),

  /* --- TREDICI --- */
  ('Sol♯','Sol♯ 13',           'Sol♯-Si♯-Re♯-Fa♯-La♯-Do♯-Mi♯','G#','G#13',    'G#-B#-D#-F#-A#-C#-E#'),
  ('Sol♯','Sol♯ Maggiore 13',  'Sol♯-Si♯-Re♯-Fa♯♯-La♯-Do♯-Mi♯','G#','G#Maj13', 'G#-B#-D#-F##-A#-C#-E#'),
  ('Sol♯','Sol♯ Minore 13',    'Sol♯-Si-Re♯-Fa♯-La♯-Do♯-Mi♯','G#','G#m13',   'G#-B-D#-F#-A#-C#-E#');

-- Creazione della tabella NoteLA (La / A)
CREATE TABLE NoteLA (
  id               INT UNSIGNED    NOT NULL AUTO_INCREMENT,
  note_ita         VARCHAR(2)      NOT NULL COMMENT 'es. La',
  chord_ita        VARCHAR(50)     NOT NULL COMMENT 'es. La Maggiore 7',
  chord_note_ita   VARCHAR(100)    NOT NULL COMMENT 'es. La-Do#-Mi-Sol',
  note_eng         VARCHAR(2)      NOT NULL COMMENT 'es. A',
  chord_eng        VARCHAR(20)     NOT NULL COMMENT 'es. AMaj7',
  chord_note_eng   VARCHAR(100)    NOT NULL COMMENT 'es. A-C#-E-G#',
  created_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

-- Tutti gli accordi per La (A)
INSERT INTO NoteLA (
  note_ita, chord_ita, chord_note_ita,
  note_eng, chord_eng, chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('La','La Maggiore',    'La-Do♯-Mi',         'A','AMaj',   'A-C#-E'),
  ('La','La Minore',      'La-Do-Mi',           'A','Am',     'A-C-E'),
  ('La','La Diminuito',   'La-Do-Mi♭',          'A','Adim',   'A-C-Eb'),
  ('La','La Aumentato',   'La-Do♯-Mi♯',         'A','Aaug',   'A-C#-E#'),

  /* --- QUARTE & QUINTE --- */
  ('La','La Quarta',      'La-Re',              'A','A4',     'A-D'),
  ('La','La Quinta',      'La-Mi',              'A','A5',     'A-E'),

  /* --- SOSPESI --- */
  ('La','La sus2',        'La-Si-Mi',            'A','Asus2',  'A-B-E'),
  ('La','La sus4',        'La-Re-Mi',            'A','Asus4',  'A-D-E'),
  ('La','La sus4 add9',   'La-Si-Re-Mi',         'A','Asus4add9','A-B-D-E'),

  /* --- SENZA INTERVALLI --- */
  ('La','La no3',         'La-Mi',               'A','Ano3',   'A-E'),
  ('La','La no5',         'La-Do♯',              'A','Ano5',   'A-C#'),

  /* --- ADDITIONS --- */
  ('La','La add2',        'La-Do♯-Mi-Si',        'A','Aadd2',  'A-C#-E-B'),
  ('La','La add4',        'La-Do♯-Mi-Re',        'A','Aadd4',  'A-C#-E-D'),
  ('La','La add9',        'La-Do♯-Mi-Si',        'A','Aadd9',  'A-C#-E-B'),
  ('La','La add11',       'La-Do♯-Mi-Re',        'A','Aadd11', 'A-C#-E-D'),

  /* --- SESTE --- */
  ('La','La 6',           'La-Do♯-Mi-Fa♯',       'A','A6',     'A-C#-E-F#'),
  ('La','La Minore 6',    'La-Do-Mi-Fa♯',        'A','Am6',    'A-C-E-F#'),
  ('La','La 6/9',         'La-Do♯-Mi-Fa♯-Si',    'A','A6/9',   'A-C#-E-F#-B'),

  /* --- SETTIME --- */
  ('La','La 7',           'La-Do♯-Mi-Sol',       'A','A7',     'A-C#-E-G'),
  ('La','La Maggiore 7',  'La-Do♯-Mi-Sol♯',      'A','AMaj7',  'A-C#-E-G#'),
  ('La','La Minore 7',    'La-Do-Mi-Sol',        'A','Am7',    'A-C-E-G'),
  ('La','La m7♭5',        'La-Do-Mi♭-Sol',       'A','Am7b5',  'A-C-Eb-G'),
  ('La','La Dim7',        'La-Do-Mi♭-Sol♭',      'A','Adim7',  'A-C-Eb-Gb'),
  ('La','La 7♭5',         'La-Do♯-Mi♭-Sol',      'A','A7b5',   'A-C#-Eb-G'),
  ('La','La 7♯5',         'La-Do♯-Mi♯-Sol',      'A','A7#5',   'A-C#-E#-G'),
  ('La','La 7sus2',       'La-Si-Mi-Sol',        'A','A7sus2', 'A-B-E-G'),
  ('La','La 7sus4',       'La-Re-Mi-Sol',        'A','A7sus4', 'A-D-E-G'),
  ('La','La 7add11',      'La-Do♯-Mi-Sol-Re',    'A','A7add11','A-C#-E-G-D'),

  /* --- NOVE --- */
  ('La','La 9',           'La-Do♯-Mi-Sol-Si',    'A','A9',     'A-C#-E-G-B'),
  ('La','La Maggiore 9',  'La-Do♯-Mi-Sol♯-Si',   'A','AMaj9',  'A-C#-E-G#-B'),
  ('La','La Minore 9',    'La-Do-Mi-Sol-Si',     'A','Am9',    'A-C-E-G-B'),
  ('La','La 9♭5',         'La-Do♯-Mi♭-Sol-Si',   'A','A9b5',   'A-C#-Eb-G-B'),
  ('La','La 9♯5',         'La-Do♯-Mi♯-Sol-Si',   'A','A9#5',   'A-C#-E#-G-B'),
  ('La','La 9sus4',       'La-Re-Mi-Sol-Si',     'A','A9sus4', 'A-D-E-G-B'),
  ('La','La 9add11',      'La-Do♯-Mi-Sol-Re-Si', 'A','A9add11','A-C#-E-G-D-B'),

  /* --- UNDICI --- */
  ('La','La 11',          'La-Do♯-Mi-Sol-Si-Re', 'A','A11',    'A-C#-E-G-B-D'),
  ('La','La Maggiore 11', 'La-Do♯-Mi-Sol♯-Si-Re','A','AMaj11', 'A-C#-E-G#-B-D'),
  ('La','La Minore 11',   'La-Do-Mi-Sol-Si-Re',  'A','Am11',   'A-C-E-G-B-D'),
  ('La','La 11♭5',        'La-Do♯-Mi♭-Sol-Si-Re','A','A11b5',  'A-C#-Eb-G-B-D'),
  ('La','La 11♯5',        'La-Do♯-Mi♯-Sol-Si-Re','A','A11#5',  'A-C#-E#-G-B-D'),

  /* --- TREDICI --- */
  ('La','La 13',          'La-Do♯-Mi-Sol-Si-Re-Fa♯','A','A13',    'A-C#-E-G-B-D-F#'),
  ('La','La Maggiore 13','La-Do♯-Mi-Sol♯-Si-Re-Fa♯','A','AMaj13', 'A-C#-E-G#-B-D-F#'),
  ('La','La Minore 13',   'La-Do-Mi-Sol-Si-Re-Fa♯','A','Am13',   'A-C-E-G-B-D-F#');

-- Creazione della tabella NoteLAb (La♭ / Ab)
CREATE TABLE NoteLAb (
  id               INT UNSIGNED    NOT NULL AUTO_INCREMENT,
  note_ita         VARCHAR(3)      NOT NULL COMMENT 'es. La♭',
  chord_ita        VARCHAR(50)     NOT NULL COMMENT 'es. La♭ Maggiore 7',
  chord_note_ita   VARCHAR(100)    NOT NULL COMMENT 'es. La♭-Do-Mi♭-Sol♭',
  note_eng         VARCHAR(2)      NOT NULL COMMENT 'es. Ab',
  chord_eng        VARCHAR(20)     NOT NULL COMMENT 'es. AbMaj7',
  chord_note_eng   VARCHAR(100)    NOT NULL COMMENT 'es. Ab-C-Eb-G',
  created_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

-- Tutti gli accordi per La♭ (Ab)
INSERT INTO NoteLAb (
  note_ita, chord_ita, chord_note_ita,
  note_eng, chord_eng, chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('La♭','La♭ Maggiore',    'La♭-Do-Mi♭',            'Ab','AbMaj',   'Ab-C-Eb'),
  ('La♭','La♭ Minore',      'La♭-Do♭-Mi♭',           'Ab','Abm',     'Ab-Cb-Eb'),
  ('La♭','La♭ Diminuito',   'La♭-Do♭-Mi♭♭',          'Ab','Abdim',   'Ab-Cb-Dbb'),
  ('La♭','La♭ Aumentato',   'La♭-Do-Mi',             'Ab','Abaug',   'Ab-C-E'),

  /* --- QUARTE & QUINTE --- */
  ('La♭','La♭ Quarta',      'La♭-Re♭',               'Ab','Ab4',     'Ab-Db'),
  ('La♭','La♭ Quinta',      'La♭-Mi♭',               'Ab','Ab5',     'Ab-Eb'),

  /* --- SOSPESI --- */
  ('La♭','La♭ sus2',        'La♭-Si♭-Mi♭',           'Ab','Absus2',  'Ab-Bb-Eb'),
  ('La♭','La♭ sus4',        'La♭-Re♭-Mi♭',           'Ab','Absus4',  'Ab-Db-Eb'),
  ('La♭','La♭ sus4 add9',   'La♭-Si♭-Re♭-Mi♭',       'Ab','Absus4add9','Ab-Bb-Db-Eb'),

  /* --- SENZA INTERVALLI --- */
  ('La♭','La♭ no3',         'La♭-Mi♭',               'Ab','Abno3',   'Ab-Eb'),
  ('La♭','La♭ no5',         'La♭-Do',                'Ab','Abno5',   'Ab-C'),

  /* --- ADDIZIONI --- */
  ('La♭','La♭ add2',        'La♭-Do-Mi♭-Si♭',        'Ab','Abadd2',  'Ab-C-Eb-Bb'),
  ('La♭','La♭ add4',        'La♭-Do-Mi♭-Re♭',        'Ab','Abadd4',  'Ab-C-Eb-Db'),
  ('La♭','La♭ add9',        'La♭-Do-Mi♭-Si♭',        'Ab','Abadd9',  'Ab-C-Eb-Bb'),
  ('La♭','La♭ add11',       'La♭-Do-Mi♭-Re♭',        'Ab','Abadd11', 'Ab-C-Eb-Db'),

  /* --- SESTE --- */
  ('La♭','La♭ 6',           'La♭-Do-Mi♭-Fa',         'Ab','Ab6',     'Ab-C-Eb-F'),
  ('La♭','La♭ m6',          'La♭-Do♭-Mi♭-Fa',        'Ab','Abm6',    'Ab-Cb-Eb-F'),
  ('La♭','La♭ 6/9',         'La♭-Do-Mi♭-Fa-Si♭',     'Ab','Ab6/9',   'Ab-C-Eb-F-Bb'),

  /* --- SETTIME --- */
  ('La♭','La♭ 7',           'La♭-Do-Mi♭-Sol♭',       'Ab','Ab7',     'Ab-C-Eb-Gb'),
  ('La♭','La♭ Maj7',        'La♭-Do-Mi♭-Sol',        'Ab','AbMaj7',  'Ab-C-Eb-G'),
  ('La♭','La♭ m7',          'La♭-Do♭-Mi♭-Sol♭',      'Ab','Abm7',    'Ab-Cb-Eb-Gb'),
  ('La♭','La♭ m7b5',        'La♭-Do♭-Mi♭♭-Sol♭',     'Ab','Abm7b5',  'Ab-Cb-Dbb-Gb'),
  ('La♭','La♭ dim7',        'La♭-Do♭-Mi♭♭-Fa',       'Ab','Abdim7',  'Ab-Cb-Dbb-F'),
  ('La♭','La♭ 7b5',         'La♭-Do-Mi♭♭-Sol♭',      'Ab','Ab7b5',   'Ab-C-Ebb-Gb'),
  ('La♭','La♭ 7#5',         'La♭-Do-Mi-Sol♭',        'Ab','Ab7#5',   'Ab-C-E-Gb'),
  ('La♭','La♭ 7sus2',       'La♭-Si♭-Mi♭-Sol♭',      'Ab','Ab7sus2', 'Ab-Bb-Eb-Gb'),
  ('La♭','La♭ 7sus4',       'La♭-Re♭-Mi♭-Sol♭',      'Ab','Ab7sus4', 'Ab-Db-Eb-Gb'),
  ('La♭','La♭ 7add11',      'La♭-Do-Mi♭-Sol♭-Re♭',   'Ab','Ab7add11','Ab-C-Eb-Gb-Db'),

  /* --- NOVE --- */
  ('La♭','La♭ 9',           'La♭-Do-Mi♭-Sol♭-Si♭',   'Ab','Ab9',     'Ab-C-Eb-Gb-Bb'),
  ('La♭','La♭ Maj9',        'La♭-Do-Mi♭-Sol-Si♭',    'Ab','AbMaj9',  'Ab-C-Eb-G-Bb'),
  ('La♭','La♭ m9',          'La♭-Do♭-Mi♭-Sol♭-Si♭',   'Ab','Abm9',    'Ab-Cb-Eb-Gb-Bb'),
  ('La♭','La♭ 9b5',         'La♭-Do-Mi♭♭-Sol♭-Si♭',   'Ab','Ab9b5',   'Ab-C-Ebb-Gb-Bb'),
  ('La♭','La♭ 9#5',         'La♭-Do-Mi-Sol♭-Si♭',     'Ab','Ab9#5',   'Ab-C-E-Gb-Bb'),
  ('La♭','La♭ 9sus4',       'La♭-Re♭-Mi♭-Sol♭-Si♭',   'Ab','Ab9sus4', 'Ab-Db-Eb-Gb-Bb'),
  ('La♭','La♭ 9add11',      'La♭-Do-Mi♭-Sol♭-Si♭-Re♭','Ab','Ab9add11','Ab-C-Eb-Gb-Bb-Db'),

  /* --- UNDICI --- */
  ('La♭','La♭ 11',          'La♭-Do-Mi♭-Sol♭-Si♭-Re♭','Ab','Ab11',    'Ab-C-Eb-Gb-Bb-Db'),
  ('La♭','La♭ Maj11',       'La♭-Do-Mi♭-Sol-Re♭',    'Ab','AbMaj11', 'Ab-C-Eb-G-Bb-Db'),
  ('La♭','La♭ m11',         'La♭-Do♭-Mi♭-Sol♭-Si♭-Re♭','Ab','Abm11',   'Ab-Cb-Eb-Gb-Bb-Db'),
  ('La♭','La♭ 11b5',        'La♭-Do-Mi♭♭-Sol♭-Si♭-Re♭','Ab','Ab11b5',  'Ab-C-Ebb-Gb-Bb-Db'),
  ('La♭','La♭ 11#5',        'La♭-Do-Mi-Sol♭-Si♭-Re♭',  'Ab','Ab11#5',  'Ab-C-E-Gb-Bb-Db'),

  /* --- TREDICI --- */
  ('La♭','La♭ 13',          'La♭-Do-Mi♭-Sol♭-Si♭-Re♭-Fa','Ab','Ab13',    'Ab-C-Eb-Gb-Bb-Db-F'),
  ('La♭','La♭ Maj13',       'La♭-Do-Mi♭-Sol-Re♭-Fa','Ab','AbMaj13', 'Ab-C-Eb-G-Bb-Db-F'),
  ('La♭','La♭ m13',         'La♭-Do♭-Mi♭-Sol♭-Si♭-Re♭-Fa','Ab','Abm13',   'Ab-Cb-Eb-Gb-Bb-Db-F');

-- Creazione della tabella NoteLAdiesis (La♯ / A#)
CREATE TABLE NoteLAdiesis (
  id               INT UNSIGNED    NOT NULL AUTO_INCREMENT,
  note_ita         VARCHAR(3)      NOT NULL COMMENT 'es. La♯',
  chord_ita        VARCHAR(50)     NOT NULL COMMENT 'es. La♯ Maggiore 7',
  chord_note_ita   VARCHAR(100)    NOT NULL COMMENT 'es. La♯-Do♯♯-Mi♯♯-Fa♯',
  note_eng         VARCHAR(2)      NOT NULL COMMENT 'es. A#',
  chord_eng        VARCHAR(20)     NOT NULL COMMENT 'es. A#Maj7',
  chord_note_eng   VARCHAR(100)    NOT NULL COMMENT 'es. A#-C##-E##-F#',
  created_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP
                        ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

-- Inserimento dei dati per gli accordi di La♯ (A#) fino alla 9°
INSERT INTO NoteLAdiesis (
  note_ita, chord_ita, chord_note_ita,
  note_eng, chord_eng, chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('La♯','La♯ Maggiore',      'La♯-Do♯♯-Mi♯♯',       'A#','A#Maj',   'A#-C##-E##'),
  ('La♯','La♯ Minore',        'La♯-Do♯-Mi♯',         'A#','A#m',     'A#-C#-E#'),
  ('La♯','La♯ Diminuito',     'La♯-Do♯-Mi♯',         'A#','A#dim',   'A#-C#-E'),
  ('La♯','La♯ Aumentato',     'La♯-Do♯♯-Mi♯',        'A#','A#aug',   'A#-C##-E#'),

  /* --- QUARTE & QUINTE --- */
  ('La♯','La♯ Quarta',        'La♯-Re♯',             'A#','A#4',     'A#-D#'),
  ('La♯','La♯ Quinta',        'La♯-Mi♯',             'A#','A#5',     'A#-E#'),

  /* --- SOSPESI --- */
  ('La♯','La♯ sus2',         'La♯-Si♯-Mi♯',         'A#','A#sus2',  'A#-B#-E#'),
  ('La♯','La♯ sus4',         'La♯-Re♯-Mi♯',         'A#','A#sus4',  'A#-D#-E#'),
  ('La♯','La♯ sus4 add9',    'La♯-Si♯-Re♯-Mi♯',     'A#','A#sus4add9','A#-B#-D#-E#'),

  /* --- SENZA INTERVALLI --- */
  ('La♯','La♯ no3',          'La♯-Mi♯',             'A#','A#no3',   'A#-E#'),
  ('La♯','La♯ no5',          'La♯-Do♯♯',            'A#','A#no5',   'A#-C##'),

  /* --- ADDITIONS --- */
  ('La♯','La♯ add2',         'La♯-Do♯♯-Mi♯♯-Si♯',    'A#','A#add2',  'A#-C##-E##-B#'),
  ('La♯','La♯ add4',         'La♯-Do♯♯-Mi♯♯-Re♯',    'A#','A#add4',  'A#-C##-E##-D#'),
  ('La♯','La♯ add9',         'La♯-Do♯♯-Mi♯♯-Si♯',    'A#','A#add9',  'A#-C##-E##-B#'),
  ('La♯','La♯ add11',        'La♯-Do♯♯-Mi♯♯-Re♯',    'A#','A#add11', 'A#-C##-E##-D#'),

  /* --- SESTE --- */
  ('La♯','La♯ 6',            'La♯-Do♯♯-Mi♯♯-Fa♯♯',   'A#','A#6',     'A#-C##-E##-F##'),
  ('La♯','La♯ Minore 6',     'La♯-Do♯-Mi♯-Fa♯♯',     'A#','A#m6',    'A#-C#-E#-F##'),
  ('La♯','La♯ 6/9',          'La♯-Do♯♯-Mi♯♯-Fa♯♯-Si♯','A#','A#6/9',   'A#-C##-E##-F##-B#'),

  /* --- SETTIME --- */
  ('La♯','La♯ 7',            'La♯-Do♯♯-Mi♯♯-Fa♯',    'A#','A#7',     'A#-C##-E##-F#'),
  ('La♯','La♯ Maggiore 7',   'La♯-Do♯♯-Mi♯♯-Sol♯',   'A#','A#Maj7',  'A#-C##-E##-G#'),
  ('La♯','La♯ Minore 7',     'La♯-Do♯-Mi♯-Fa♯',      'A#','A#m7',    'A#-C#-E#-F#'),
  ('La♯','La♯ m7b5',        'La♯-Do♯-Mi♯-Fa♯',      'A#','A#m7b5',  'A#-C#-E#-F#'),
  ('La♯','La♯ Dim7',         'La♯-Do♯-Mi♯-Sol',      'A#','A#dim7',  'A#-C#-E#-G'),
  ('La♯','La♯ 7b5',         'La♯-Do♯♯-Mi♯♯-Fa♯',    'A#','A#7b5',   'A#-C##-E##-F#'),
  ('La♯','La♯ 7#5',         'La♯-Do♯♯-Mi♯-Fa♯',     'A#','A#7#5',   'A#-C##-E##-F#'),
  ('La♯','La♯ 7sus2',       'La♯-Si♯-Mi♯-Fa♯',      'A#','A#7sus2', 'A#-B#-E#-F#'),
  ('La♯','La♯ 7sus4',       'La♯-Re♯-Mi♯-Fa♯',      'A#','A#7sus4', 'A#-D#-E#-F#'),
  ('La♯','La♯ 7add11',      'La♯-Do♯♯-Mi♯♯-Fa♯-Re♯','A#','A#7add11','A#-C##-E##-F#-D#'),

  /* --- NOVE --- */
  ('La♯','La♯ 9',            'La♯-Do♯♯-Mi♯♯-Fa♯-Si♯','A#','A#9',     'A#-C##-E##-F#-B#'),
  ('La♯','La♯ Maggiore 9',   'La♯-Do♯♯-Mi♯♯-Sol♯-Si♯','A#','A#Maj9',  'A#-C##-E##-G#-B#'),
  ('La♯','La♯ Minore 9',     'La♯-Do♯-Mi♯-Fa♯-Si♯',  'A#','A#m9',    'A#-C#-E#-F#-B#'),
  ('La♯','La♯ 9b5',          'La♯-Do♯♯-Mi♯-Fa♯-Si♯','A#','A#9b5',   'A#-C##-E##-F#-B#'),
  ('La♯','La♯ 9#5',          'La♯-Do♯♯-Mi♯♯-Fa♯-Si♯','A#','A#9#5',   'A#-C##-E##-F#-B#'),
  ('La♯','La♯ 9sus4',        'La♯-Re♯-Mi♯-Fa♯-Si♯',  'A#','A#9sus4', 'A#-D#-E#-F#-B#'),
  ('La♯','La♯ 9add11',       'La♯-Do♯♯-Mi♯♯-Fa♯-Re♯-Si♯','A#','A#9add11','A#-C##-E##-F#-D#-B#');

 /* --- UNDICI --- */
  ('La♯','La♯ 11',          'La♯-Do♯♯-Mi♯♯-Sol♯-Si♯-Re♯',  'A#','A#11',     'A#-C##-E##-G#-B#-D#'),
  ('La♯','La♯ Maggiore 11', 'La♯-Do♯♯-Mi♯♯-Sol♯♯-Si♯-Re♯','A#','A#Maj11',  'A#-C##-E##-G##-B#-D#'),
  ('La♯','La♯ Minore 11',   'La♯-Do♯-Mi♯-Sol♯-Si♯-Re♯',    'A#','A#m11',    'A#-C#-E#-G#-B#-D#'),
  ('La♯','La♯ 11♭5',       'La♯-Do♯♯-Mi♯-Sol♯-Si♯-Re♯',   'A#','A#11b5',   'A#-C##-E#-G#-B#-D#'),
  ('La♯','La♯ 11#5',       'La♯-Do♯♯-Mi♯♯♯-Sol♯-Si♯-Re♯','A#','A#11#5',   'A#-C##-E###-G#-B#-D#'),

  /* --- TREDICI --- */
  ('La♯','La♯ 13',          'La♯-Do♯♯-Mi♯♯-Sol♯-Si♯-Re♯-Fa♯',        'A#','A#13',     'A#-C##-E##-G#-B#-D#-F#'),
  ('La♯','La♯ Maggiore 13', 'La♯-Do♯♯-Mi♯♯-Sol♯♯-Si♯-Re♯-Fa♯',      'A#','A#Maj13',  'A#-C##-E##-G##-B#-D#-F#'),
  ('La♯','La♯ Minore 13',   'La♯-Do♯-Mi♯-Sol♯-Si♯-Re♯-Fa♯',          'A#','A#m13',    'A#-C#-E#-G#-B#-D#-F#');


-- Creazione della tabella NoteSI (Si / B)
CREATE TABLE NoteSI (
  id               INT UNSIGNED    NOT NULL AUTO_INCREMENT,
  note_ita         VARCHAR(2)      NOT NULL COMMENT 'es. Si',
  chord_ita        VARCHAR(50)     NOT NULL COMMENT 'es. Si Maggiore 7',
  chord_note_ita   VARCHAR(100)    NOT NULL COMMENT 'es. Si-Re#-Fa#-La',
  note_eng         VARCHAR(2)      NOT NULL COMMENT 'es. B',
  chord_eng        VARCHAR(20)     NOT NULL COMMENT 'es. BMaj7',
  chord_note_eng   VARCHAR(100)    NOT NULL COMMENT 'es. B-D#-F#-A#',
  created_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

-- Inserimento di tutti gli accordi per Si (B) fino al 13°
INSERT INTO NoteSI (
  note_ita, chord_ita, chord_note_ita,
  note_eng, chord_eng, chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('Si','Si Maggiore',        'Si-Re#-Fa#',           'B','BMaj',    'B-D#-F#'),
  ('Si','Si Minore',          'Si-Re-Fa#',            'B','Bm',      'B-D-F#'),
  ('Si','Si Diminuito',       'Si-Re-Fa',             'B','Bdim',    'B-D-F'),
  ('Si','Si Aumentato',       'Si-Re#-Fa##',          'B','Baug',    'B-D#-G'),

  /* --- QUARTE & QUINTE --- */
  ('Si','Si Quarta',          'Si-Mi',                'B','B4',      'B-E'),
  ('Si','Si Quinta',          'Si-Fa#',               'B','B5',      'B-F#'),

  /* --- SOSPESI --- */
  ('Si','Si sus2',            'Si-Do#-Fa#',           'B','Bsus2',   'B-C#-F#'),
  ('Si','Si sus4',            'Si-Mi-Fa#',            'B','Bsus4',   'B-E-F#'),
  ('Si','Si sus4 add9',       'Si-Do#-Mi-Fa#',        'B','Bsus4add9','B-C#-E-F#'),

  /* --- SENZA INTERVALLI --- */
  ('Si','Si no3',             'Si-Fa#',               'B','Bno3',    'B-F#'),
  ('Si','Si no5',             'Si-Re#',               'B','Bno5',    'B-D#'),

  /* --- ADDIZIONI --- */
  ('Si','Si add2',            'Si-Re#-Fa#-Do#',       'B','Badd2',   'B-D#-F#-C#'),
  ('Si','Si add4',            'Si-Re#-Fa#-Mi',        'B','Badd4',   'B-D#-F#-E'),
  ('Si','Si add9',            'Si-Re#-Fa#-Do#',       'B','Badd9',   'B-D#-F#-C#'),
  ('Si','Si add11',           'Si-Re#-Fa#-Mi',        'B','Badd11',  'B-D#-F#-E'),

  /* --- SESTE --- */
  ('Si','Si 6',               'Si-Re#-Fa#-Sol#',      'B','B6',      'B-D#-F#-G#'),
  ('Si','Si Minore 6',        'Si-Re-Fa#-Sol#',       'B','Bm6',     'B-D-F#-G#'),
  ('Si','Si 6/9',             'Si-Re#-Fa#-Sol#-Do#',  'B','B6/9',    'B-D#-F#-G#-C#'),

  /* --- SETTIME --- */
  ('Si','Si 7',               'Si-Re#-Fa#-La',        'B','B7',      'B-D#-F#-A'),
  ('Si','Si Maggiore 7',      'Si-Re#-Fa#-La#',       'B','BMaj7',   'B-D#-F#-A#'),
  ('Si','Si Minore 7',        'Si-Re-Fa#-La',         'B','Bm7',     'B-D-F#-A'),
  ('Si','Si m7b5',           'Si-Re-Fa-La',          'B','Bm7b5',   'B-D-F-A'),
  ('Si','Si dim7',           'Si-Re-Fa-La♭',         'B','Bdim7',   'B-D-F-Ab'),
  ('Si','Si 7b5',            'Si-Re#-Fa-La',         'B','B7b5',    'B-D#-F-A'),
  ('Si','Si 7#5',            'Si-Re#-Fa##-La',       'B','B7#5',    'B-D#-G-A'),
  ('Si','Si 7sus2',          'Si-Do#-Fa#-La',        'B','B7sus2',  'B-C#-F#-A'),
  ('Si','Si 7sus4',          'Si-Mi-Fa#-La',         'B','B7sus4',  'B-E-F#-A'),
  ('Si','Si 7add11',         'Si-Re#-Fa#-La-Mi',     'B','B7add11', 'B-D#-F#-A-E'),

  /* --- NOVE --- */
  ('Si','Si 9',               'Si-Re#-Fa#-La-Do#',    'B','B9',      'B-D#-F#-A-C#'),
  ('Si','Si Maggiore 9',      'Si-Re#-Fa#-La#-Do#',    'B','BMaj9',   'B-D#-F#-A#-C#'),
  ('Si','Si Minore 9',        'Si-Re-Fa#-La-Do#',      'B','Bm9',     'B-D-F#-A-C#'),
  ('Si','Si 9b5',             'Si-Re#-Fa-La-Do#',      'B','B9b5',    'B-D#-F-A-C#'),
  ('Si','Si 9#5',             'Si-Re#-Fa##-La-Do#',    'B','B9#5',    'B-D#-G-A-C#'),
  ('Si','Si 9sus4',           'Si-Mi-Fa#-La-Do#',      'B','B9sus4',  'B-E-F#-A-C#'),
  ('Si','Si 9add11',          'Si-Re#-Fa#-La-Mi-Do#',  'B','B9add11', 'B-D#-F#-A-E-C#'),

  /* --- UNDICI --- */
  ('Si','Si 11',              'Si-Re#-Fa#-La-Do#-Mi',  'B','B11',     'B-D#-F#-A-C#-E'),
  ('Si','Si Maggiore 11',     'Si-Re#-Fa#-La#-Do#-Mi',  'B','BMaj11',  'B-D#-F#-A#-C#-E'),
  ('Si','Si Minore 11',       'Si-Re-Fa#-La-Do#-Mi',    'B','Bm11',    'B-D-F#-A-C#-E'),
  ('Si','Si 11b5',            'Si-Re#-Fa-La-Do#-Mi',    'B','B11b5',   'B-D#-F-A-C#-E'),
  ('Si','Si 11#5',            'Si-Re#-Fa##-La-Do#-Mi',  'B','B11#5',   'B-D#-G-A-C#-E'),

  /* --- TREDICI --- */
  ('Si','Si 13',              'Si-Re#-Fa#-La-Do#-Mi-Sol#',    'B','B13',     'B-D#-F#-A-C#-E-G#'),
  ('Si','Si Maggiore 13',     'Si-Re#-Fa#-La#-Do#-Mi-Sol#',    'B','BMaj13',  'B-D#-F#-A#-C#-E-G#'),
  ('Si','Si Minore 13',       'Si-Re-Fa#-La-Do#-Mi-Sol#',      'B','Bm13',    'B-D-F#-A-C#-E-G#');

-- Creazione della tabella NoteSIb (Si♭ / Bb)
CREATE TABLE NoteSIb (
  id               INT UNSIGNED    NOT NULL AUTO_INCREMENT,
  note_ita         VARCHAR(3)      NOT NULL COMMENT 'es. Si♭',
  chord_ita        VARCHAR(50)     NOT NULL COMMENT 'es. Si♭ Maggiore 7',
  chord_note_ita   VARCHAR(100)    NOT NULL COMMENT 'es. Si♭-Re-Fa-Lab',
  note_eng         VARCHAR(2)      NOT NULL COMMENT 'es. Bb',
  chord_eng        VARCHAR(20)     NOT NULL COMMENT 'es. BbMaj7',
  chord_note_eng   VARCHAR(100)    NOT NULL COMMENT 'es. Bb-D-F-A♭',
  created_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ita (note_ita, chord_ita),
  UNIQUE KEY uk_eng (note_eng, chord_eng)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserimento di tutti gli accordi per Si♭ (Bb) fino al 13°
INSERT INTO NoteSIb (
  note_ita, chord_ita, chord_note_ita,
  note_eng, chord_eng, chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('Si♭','Si♭ Maggiore',       'Si♭-Re-Fa',              'Bb','BbMaj',    'Bb-D-F'),
  ('Si♭','Si♭ Minore',         'Si♭-Re♭-Fa',             'Bb','Bbm',      'Bb-Db-F'),
  ('Si♭','Si♭ Diminuito',      'Si♭-Re♭-Fa♭',            'Bb','Bbdim',    'Bb-Db-Fb'),
  ('Si♭','Si♭ Aumentato',      'Si♭-Re-Fa♯',             'Bb','Bbaug',    'Bb-D-F#'),

  /* --- QUARTE & QUINTE --- */
  ('Si♭','Si♭ Quarta',         'Si♭-Mi♭',               'Bb','Bb4',      'Bb-Eb'),
  ('Si♭','Si♭ Quinta',         'Si♭-Fa',                'Bb','Bb5',      'Bb-F'),

  /* --- SOSPESI --- */
  ('Si♭','Si♭ sus2',           'Si♭-Do-Fa',             'Bb','Bbsus2',   'Bb-C-F'),
  ('Si♭','Si♭ sus4',           'Si♭-Mi♭-Fa',            'Bb','Bbsus4',   'Bb-Eb-F'),
  ('Si♭','Si♭ sus4 add9',      'Si♭-Do-Mi♭-Fa',         'Bb','Bbsus4add9','Bb-C-Eb-F'),

  /* --- SENZA INTERVALLI --- */
  ('Si♭','Si♭ no3',            'Si♭-Fa',                'Bb','Bbno3',    'Bb-F'),
  ('Si♭','Si♭ no5',            'Si♭-Re',                'Bb','Bbno5',    'Bb-D'),

  /* --- ADDIZIONI --- */
  ('Si♭','Si♭ add2',           'Si♭-Re-Fa-Do',          'Bb','Bbadd2',   'Bb-D-F-C'),
  ('Si♭','Si♭ add4',           'Si♭-Re-Fa-Mi♭',         'Bb','Bbadd4',   'Bb-D-F-Eb'),
  ('Si♭','Si♭ add9',           'Si♭-Re-Fa-Do',          'Bb','Bbadd9',   'Bb-D-F-C'),
  ('Si♭','Si♭ add11',          'Si♭-Re-Fa-Mi♭',         'Bb','Bbadd11',  'Bb-D-F-Eb'),

  /* --- SESTE --- */
  ('Si♭','Si♭ 6',              'Si♭-Re-Fa-Sol',         'Bb','Bb6',      'Bb-D-F-G'),
  ('Si♭','Si♭ Minore 6',       'Si♭-Re♭-Fa-Sol',        'Bb','Bbm6',     'Bb-Db-F-G'),
  ('Si♭','Si♭ 6/9',            'Si♭-Re-Fa-Sol-Do',      'Bb','Bb6/9',    'Bb-D-F-G-C'),

  /* --- SETTIME --- */
  ('Si♭','Si♭ 7',              'Si♭-Re-Fa-Lab',         'Bb','Bb7',      'Bb-D-F-Ab'),
  ('Si♭','Si♭ Maggiore 7',     'Si♭-Re-Fa-La',          'Bb','BbMaj7',   'Bb-D-F-A'),
  ('Si♭','Si♭ Minore 7',       'Si♭-Re♭-Fa-Lab',        'Bb','Bbm7',     'Bb-Db-F-Ab'),
  ('Si♭','Si♭ Semidiminuito',  'Si♭-Re♭-Fa♭-Lab',       'Bb','Bbm7b5',   'Bb-Db-Fb-Ab'),
  ('Si♭','Si♭ Dim7',           'Si♭-Re♭-Fa♭-Lab♭',      'Bb','Bbdim7',   'Bb-Db-Fb-Gbb'),
  ('Si♭','Si♭ 7♭5',            'Si♭-Re-Fa♭-Lab',        'Bb','Bb7b5',    'Bb-D-Fb-Ab'),
  ('Si♭','Si♭ 7♯5',            'Si♭-Re-Fa♯-Lab',        'Bb','Bb7#5',    'Bb-D-F#-Ab'),
  ('Si♭','Si♭ 7sus2',          'Si♭-Do-Fa-Lab',         'Bb','Bb7sus2',  'Bb-C-F-Ab'),
  ('Si♭','Si♭ 7sus4',          'Si♭-Mi♭-Fa-Lab',        'Bb','Bb7sus4',  'Bb-Eb-F-Ab'),
  ('Si♭','Si♭ 7add11',         'Si♭-Re-Fa-Lab-Mi♭',     'Bb','Bb7add11','Bb-D-F-Ab-Eb'),

  /* --- NOVE --- */
  ('Si♭','Si♭ 9',              'Si♭-Re-Fa-Lab-Do',      'Bb','Bb9',      'Bb-D-F-Ab-C'),
  ('Si♭','Si♭ Maggiore 9',     'Si♭-Re-Fa-La-Do',       'Bb','BbMaj9',   'Bb-D-F-A-C'),
  ('Si♭','Si♭ Minore 9',       'Si♭-Re♭-Fa-Lab-Do',     'Bb','Bbm9',     'Bb-Db-F-Ab-C'),
  ('Si♭','Si♭ 9♭5',           'Si♭-Re-Fa♭-Lab-Do',      'Bb','Bb9b5',    'Bb-D-Fb-Ab-C'),
  ('Si♭','Si♭ 9♯5',           'Si♭-Re-Fa♯-Lab-Do',     'Bb','Bb9#5',    'Bb-D-F#-Ab-C'),
  ('Si♭','Si♭ 9sus4',         'Si♭-Mi♭-Fa-Lab-Do',     'Bb','Bb9sus4',  'Bb-Eb-F-Ab-C'),
  ('Si♭','Si♭ 9add11',        'Si♭-Re-Fa-Lab-Mi♭-Do',   'Bb','Bb9add11','Bb-D-F-Ab-Eb-C'),

  /* --- UNDICI --- */
  ('Si♭','Si♭ 11',            'Si♭-Re-Fa-Lab-Do-Mi♭',   'Bb','Bb11',     'Bb-D-F-Ab-C-Eb'),
  ('Si♭','Si♭ Maggiore 11',   'Si♭-Re-Fa-La-Do-Mi♭',    'Bb','BbMaj11',  'Bb-D-F-A-C-Eb'),
  ('Si♭','Si♭ Minore 11',     'Si♭-Re♭-Fa-Lab-Do-Mi♭',  'Bb','Bbm11',    'Bb-Db-F-Ab-C-Eb'),
  ('Si♭','Si♭ 11♭5',         'Si♭-Re-Fa♭-Lab-Do-Mi♭',  'Bb','Bb11b5',   'Bb-D-Fb-Ab-C-Eb'),
  ('Si♭','Si♭ 11#5',         'Si♭-Re-Fa♯-Lab-Do-Mi♭',  'Bb','Bb11#5',   'Bb-D-F#-Ab-C-Eb'),

  /* --- TREDICI --- */
  ('Si♭','Si♭ 13',            'Si♭-Re-Fa-Lab-Do-Mi♭-Sol','Bb','Bb13',     'Bb-D-F-Ab-C-Eb-G'),
  ('Si♭','Si♭ Maggiore 13',   'Si♭-Re-Fa-La-Do-Mi♭-Sol','Bb','BbMaj13',  'Bb-D-F-A-C-Eb-G'),
  ('Si♭','Si♭ Minore 13',     'Si♭-Re♭-Fa-Lab-Do-Mi♭-Sol','Bb','Bbm13',   'Bb-Db-F-Ab-C-Eb-G');

-- Creazione della tabella SIdiesis
CREATE TABLE NoteLA (
    id INT AUTO_INCREMENT PRIMARY KEY,
    note_ita VARCHAR(255),
    chord_ita VARCHAR(255),
    chord_note_ita VARCHAR(255),
    note_eng VARCHAR(255),
    chord_eng VARCHAR(255),
    chord_note_eng VARCHAR(255)
);
-- TUTTI GLI ACCORDI PER SI# (B#) NELLA TABELLA NoteSI#
INSERT INTO NoteSI# (
  note_ita,   chord_ita,        chord_note_ita,
  note_eng,   chord_eng,        chord_note_eng
) VALUES

  /* --- TRIADI --- */
  ('SI#','Si# Maggiore',      'Si#-Re♯♯-Fa♯♯',        'B#','B#Maj',  'B#-Dx-Fx'),
  ('SI#','Si# Minore',        'Si#-Re♯-Fa♯♯',         'B#','B#m',    'B#-Dx-Fx'),
  ('SI#','Si# Diminuito',     'Si#-Re♯-Fa♯',          'B#','B#dim',  'B#-Dx-F'),
  ('SI#','Si# Aumentato',     'Si#-Re♯♯-Fa♯♯♯',       'B#','B#aug',  'B#-Dx-Fxx'),

  /* --- QUARTE E QUINTE --- */
  ('SI#','Si# Quarta',        'Si#-Mi♯',              'B#','B#4',    'B#-Ex'),
  ('SI#','Si# Quinta',        'Si#-Fa♯♯',             'B#','B#5',    'B#-Fx'),

  /* --- SOSPESI --- */
  ('SI#','Si# Sospesa 2',     'Si#-Do♯♯-Fa♯♯',        'B#','B#sus2',      'B#-Cx-Fx'),
  ('SI#','Si# Sospesa 4',     'Si#-Re♯♯-Fa♯♯',        'B#','B#sus4',      'B#-Dx-Fx'),
  ('SI#','Si# sus4 add9',     'Si#-Re♯♯-Do♯♯-Fa♯♯',   'B#','B#sus4add9',  'B#-Dx-Cx-Fx'),

  /* --- SENZA INTERVALLI --- */
  ('SI#','Si# senza Terza',   'Si#-Fa♯♯-La♯',         'B#','B#no3',      'B#-Fx-A#'),
  ('SI#','Si# senza Quinta',  'Si#-Re♯♯-La♯',         'B#','B#no5',      'B#-Dx-A#'),

  /* --- ADDITIONS --- */
  ('SI#','Si# add2',          'Si#-Do♯♯-Re♯♯-Fa♯♯', 'B#','B#add2',     'B#-Cx-Dx-Fx'),
  ('SI#','Si# add4',          'Si#-Mi♯-Re♯♯-Fa♯♯',   'B#','B#add4',     'B#-Ex-Dx-Fx'),
  ('SI#','Si# add9',          'Si#-Re♯♯-Fa♯♯-Do♯♯',  'B#','B#add9',     'B#-Dx-Fx-Cx'),
  ('SI#','Si# add11',         'Si#-Re♯♯-Fa♯♯-Sol♯♯', 'B#','B#add11',    'B#-Dx-Fx-Gx'),

  /* --- SESTE --- */
  ('SI#','Si# Sesta',         'Si#-Re♯♯-Fa♯♯-La♯♯',    'B#','B#6',       'B#-Dx-Fx-Ax'),
  ('SI#','Si# Minore 6',      'Si#-Re♯-Fa♯♯-La♯♯',     'B#','B#m6',      'B#-Dx-Fx-Ax'),
  ('SI#','Si# 6/9',           'Si#-Re♯♯-Fa♯♯-La♯♯-Do♯♯','B#','B#6/9',     'B#-Dx-Fx-Ax-Cx'),

  /* --- SETTIME --- */
  ('SI#','Si# Settima',       'Si#-Re♯♯-Fa♯♯-La♯',     'B#','B#7',      'B#-Dx-Fx-A#'),
  ('SI#','Si# Maggiore 7',    'Si#-Re♯♯-Fa♯♯-La♯♯',   'B#','B#Maj7',   'B#-Dx-Fx-Ax'),
  ('SI#','Si# Minore 7',      'Si#-Re♯-Fa♯♯-La♯',     'B#','B#m7',     'B#-Dx-Fx-A#'),
  ('SI#','Si# Semidiminuito', 'Si#-Re♯-Fa♯-La♯',      'B#','B#m7b5',  'B#-Dx-F-A#'),
  ('SI#','Si# Dim7',          'Si#-Re♯-Fa♯-La♯♯♯',    'B#','B#dim7',   'B#-Dx-F-A#'),
  ('SI#','Si# 7♭5',          'Si#-Re♯♯-Fa♯-La♯',     'B#','B#7b5',    'B#-Dx-F-A#'),
  ('SI#','Si# 7♯5',          'Si#-Re♯♯-Fa♯♯♯-La♯',    'B#','B#7#5',    'B#-Dx-G#-A#'),
  ('SI#','Si# 7sus2',        'Si#-Do♯♯-Fa♯♯-La♯',    'B#','B#7sus2',  'B#-Cx-Fx-A#'),
  ('SI#','Si# 7sus4',        'Si#-Re♯♯-Sol♯♯-La♯',    'B#','B#7sus4',  'B#-Dx-Gx-A#'),
  ('SI#','Si# 7add11',       'Si#-Re♯♯-Fa♯♯-Sol♯♯-La♯','B#','B#7add11','B#-Dx-Fx-Gx-A#'),

  /* --- NOVE --- */
  ('SI#','Si# Nona',         'Si#-Re♯♯-Fa♯♯-La♯-Do♯♯',    'B#','B#9',      'B#-Dx-Fx-A#-Cx'),
  ('SI#','Si# Maggiore 9',   'Si#-Re♯♯-Fa♯♯-La♯♯-Do♯♯',  'B#','B#Maj9',   'B#-Dx-Fx-Ax-Cx'),
  ('SI#','Si# Minore 9',     'Si#-Re♯-Fa♯♯-La♯-Do♯♯',     'B#','B#m9',     'B#-Dx-Fx-A#-Cx'),
  ('SI#','Si# 9♭5',         'Si#-Re♯♯-Fa♯-La♯-Do♯♯',      'B#','B#9b5',    'B#-Dx-F-A#-Cx'),
  ('SI#','Si# 9♯5',         'Si#-Re♯♯-Fa♯♯♯-La♯-Do♯♯',   'B#','B#9#5',    'B#-Dx-G#-A#-Cx'),
  ('SI#','Si# 9sus4',       'Si#-Re♯♯-Fa♯♯-La♯-Sol♯♯',    'B#','B#9sus4',  'B#-Dx-Fx-A#-Gx'),
  ('SI#','Si# 9add11',      'Si#-Re♯♯-Fa♯♯-La♯-Sol♯♯-Do♯♯','B#','B#9add11','B#-Dx-Fx-A#-Gx-Cx'),

  /* --- UNDICI --- */
  ('SI#','Si# Undicesima',   'Si#-Re♯♯-Fa♯♯-La♯-Sol♯♯-Do♯♯',   'B#','B#11',     'B#-Dx-Fx-A#-Gx-Cx'),
  ('SI#','Si# Maggiore 11',  'Si#-Re♯♯-Fa♯♯-La♯♯-Sol♯♯-Do♯♯','B#','B#Maj11','B#-Dx-Fx-Ax-Gx-Cx'),
  ('SI#','Si# Minore 11',    'Si#-Re♯-Fa♯♯-La♯-Sol♯♯-Do♯♯',    'B#','B#m11',   'B#-Dx-Fx-A#-Gx-Cx'),
  ('SI#','Si# 11♭5',       'Si#-Re♯♯-Fa♯-Sol♯♯-Do♯♯',          'B#','B#11b5',  'B#-Dx-Fx-Gx-Cx'),
  ('SI#','Si# 11♯5',       'Si#-Re♯♯-Fa♯♯♯-Sol♯♯-Do♯♯',       'B#','B#11#5',  'B#-Dx-G#-Gx-Cx'),

  /* --- TREDICI --- */
  ('SI#','Si# Tredicesima', 'Si#-Re♯♯-Fa♯♯-La♯-Do♯♯-Mi♯-Sol♯♯',   'B#','B#13',     'B#-Dx-Fx-A#-Cx-Ex-Gx'),
  ('SI#','Si# Maggiore 13','Si#-Re♯♯-Fa♯♯-La♯♯-Do♯♯-Mi♯-Sol♯♯','B#','B#Maj13','B#-Dx-Fx-Ax-Cx-Ex-Gx'),
  ('SI#','Si# Minore 13',  'Si#-Re♯-Fa♯♯-La♯-Do♯♯-Mi♯-Sol♯♯','B#','B#m13',   'B#-Dx-Fx-A#-Cx-Ex-Gx');

