#!/usr/bin/env bash
# Author: Bocaletto Luca
# export_to_json.sh
# Imports file.sql, then dumps all NoteXY tables into chords.json
# Requires: mysql client, python3

set -euo pipefail

# —— CONFIGURATION ——  
SQL_FILE="file.sql"               # your dumped schema+data  
DB_NAME="ChordNoteMusic"          # target DB name  
DB_USER="your_mysql_user"         # MySQL user  
DB_PASS="your_mysql_password"     # MySQL password  
DB_HOST="localhost"               # MySQL host  

# list every NoteXY table in your schema  
TABLES=(
  NoteDO NoteDOdiesis NoteDOb
  NoteRE NoteREdiesis NoteREb
  NoteMI NoteMIdiesis NoteMIb
  NoteFA NoteFAdiesis NoteFAb
  NoteSOL NoteSOLdiesis NoteSOLb
  NoteLA NoteLAdiesis NoteLAb
  NoteSI NoteSIdiesis NoteSIb
)

OUTFILE="chords.json"

echo "Dropping & creating database ${DB_NAME}..."
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e \
  "DROP DATABASE IF EXISTS \`${DB_NAME}\`; CREATE DATABASE \`${DB_NAME}\`;"

echo "Importing schema/data from ${SQL_FILE}..."
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < "$SQL_FILE"

echo "Exporting tables to JSON in ${OUTFILE}..."
: > "$OUTFILE"
echo "{" >> "$OUTFILE"

first=true
for tbl in "${TABLES[@]}"; do
  echo " • dumping $tbl…" >&2

  # add comma except before first  
  if $first; then first=false; else echo "," >> "$OUTFILE"; fi

  # JSON key  
  printf '  "%s": ' "$tbl" >> "$OUTFILE"

  # query + tiny Python to convert TSV→JSON  
  mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -B "$DB_NAME" \
        -e "SELECT * FROM \`$tbl\`;" \
  | python3 - "$tbl" <<'PYCODE' >> "$OUTFILE"
import sys, csv, json

# read TSV from stdin
tsv = sys.stdin.read().splitlines()
if not tsv or len(tsv) < 2:
    print("[]", end=""); sys.exit(0)

reader = csv.DictReader(tsv, delimiter="\t")
rows = list(reader)

# cast numeric fields to int
for r in rows:
    for k,v in list(r.items()):
        if v.isdigit():
            r[k] = int(v)

# dump JSON array
print(json.dumps(rows, ensure_ascii=False), end="")
PYCODE

done

echo -e "\n}" >> "$OUTFILE"
echo "Done! See $OUTFILE" >&2
