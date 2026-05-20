#!/bin/bash
set -e

> travail/sites_final.csv

while IFS=";" read -r code nomdept; do

  # Enlève les zéros devant (01 -> 1)
  code_sans_zero=$(echo "$code" | sed 's/^0*//')
  if [ -z "$code_sans_zero" ]; then
    code_sans_zero=0
  fi

  # On cherche dans la colonne 2 du CSV (séparé par virgule)
  ligne=$(awk -F',' -v d="$code_sans_zero" '$2 == d { print }' travail/sites_clean.csv)

  if [ -z "$ligne" ]; then
    echo "$code_sans_zero;$nomdept;;" >> travail/sites_final.csv
  else
    site=$(echo "$ligne" | cut -d',' -f1 | sed 's/^"//;s/"$//')
    visiteurs=$(echo "$ligne" | cut -d',' -f3)
    echo "$code_sans_zero;$nomdept;$site;$visiteurs" >> travail/sites_final.csv
  fi

done < data/DEPTS
