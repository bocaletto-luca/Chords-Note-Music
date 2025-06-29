#!/usr/bin/env python3
# Author: Bocaletto Luca
"""
sql_to_json.py

Convert a MySQL dump (.sql) containing NoteXY DDL + INSERTs into a single JSON file.

Optional dependency:
  pip install sqlparse          # only if you choose to use sqlparse for more robust parsing

Usage:
  python3 sql_to_json.py file.sql [output.json]
"""

import re
import json
import sys

def split_values(s: str):
    """Split a parenthesized SQL VALUES tuple into its comma-separated fields,
    respecting single-quoted strings and escaped quotes."""
    vals, cur, in_str, i = [], "", False, 0
    while i < len(s):
        c = s[i]
        if c == "'" and (i == 0 or s[i-1] != "\\"):
            in_str = not in_str
            cur += c
        elif c == "," and not in_str:
            vals.append(cur.strip())
            cur = ""
        else:
            cur += c
        i += 1
    if cur:
        vals.append(cur.strip())
    return vals

def parse_sql_file(sql_path):
    content = open(sql_path, encoding='utf8').read()
    # match: INSERT INTO `Table` (col1,col2,...) VALUES (v1,v2,...),(v1b,v2b,...);
    insert_re = re.compile(
        r"INSERT\s+INTO\s+`?(\w+)`?\s*\(([^)]+)\)\s+VALUES\s*(.*?);",
        re.S | re.IGNORECASE
    )

    out = {}
    for m in insert_re.finditer(content):
        table, cols_txt, vals_txt = m.group(1), m.group(2), m.group(3)
        cols = [c.strip().strip('`') for c in cols_txt.split(',')]
        tuples = re.findall(r"\([^\)]*\)", vals_txt)
        rows = out.setdefault(table, [])
        for tup in tuples:
            fields = split_values(tup.strip("()"))
            row = {}
            for col, val in zip(cols, fields):
                if val.upper() == "NULL":
                    v = None
                elif val.startswith("'") and val.endswith("'"):
                    v = val[1:-1].replace("\\'", "'")
                elif re.fullmatch(r"-?\d+", val):
                    v = int(val)
                else:
                    v = val
                row[col] = v
            rows.append(row)
    return out

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 sql_to_json.py file.sql [output.json]")
        sys.exit(1)
    input_sql = sys.argv[1]
    output_json = sys.argv[2] if len(sys.argv) > 2 else "chords.json"

    data = parse_sql_file(input_sql)
    with open(output_json, "w", encoding="utf8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)

    print(f"✅ Written JSON to {output_json}")

if __name__ == "__main__":
    main()
