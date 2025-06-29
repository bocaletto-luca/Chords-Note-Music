#!/usr/bin/env bash
# Author: Bocaletto Luca
# export_to_json.sh
# Dump all NoteXY tables into one JSON file (chords.json)
# Requires: mysql client, python3

# —— CONFIGURE these ——
DB_NAME="ChordNoteMusic"
DB_USER="your_mysql_user"
DB_PASS="your_mysql_password"
HOST="localhost"      # or your host
# list ALL your tables here:
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
TMPFILE=$(mktemp)

echo "{" > "$OUTFILE"

first=true
for tbl in "${TABLES[@]}"; do
  echo "Dumping table $tbl…" >&2

  # comma between entries
  if $first; then
    first=false
  else
    echo "," >> "$OUTFILE"
  fi

  # write key
  printf '  "%s": ' "$tbl" >> "$OUTFILE"

  # dump table as TSV with header, convert to JSON via python3
  mysql -h "$HOST" -u "$DB_USER" -p"$DB_PASS" -D "$DB_NAME" \
        -B -e "SELECT * FROM \`$tbl\`;" \
  | python3 - "$TMPFILE" <<'PYCODE' >> "$OUTFILE"
import sys, csv, json

data = sys.stdin.read().splitlines()
if not data:
    print("[]", end=""); sys.exit(0)

reader = csv.DictReader(data, delimiter="\t")
rows   = list(reader)
# convert all numeric fields from string to int if possible
for r in rows:
    for k,v in r.items():
        if v.isdigit():
            r[k] = int(v)
print(json.dumps(rows, ensure_ascii=False), end="")
PYCODE

done

echo -e "\n}" >> "$OUTFILE"
echo "JSON dump complete: $OUTFILE" >&2
