#!/bin/bash
set -e

mkdir -p html

make_table_4 () {
  input=$1
  output=$2
  title=$3

  echo "<html><head><meta charset='utf-8'></head><body><h1>$title</h1><table border='1'>" > "$output"
  echo "<tr><th>Code</th><th>Département</th><th>Site</th><th>Visiteurs</th></tr>" >> "$output"

  while IFS=";" read -r a b c d; do
    echo "<tr><td>$a</td><td>$b</td><td>$c</td><td>$d</td></tr>" >> "$output"
  done < "$input"

  echo "</table></body></html>" >> "$output"
}

make_table_4 travail/sites_dept.csv html/sites-dept.html "Sites par département"
make_table_4 travail/sites_visites.csv html/sites-visites.html "Sites par nombre de visites"

# Tableau régions (2 colonnes)
echo "<html><head><meta charset='utf-8'></head><body><h1>Visites par région</h1><table border='1'>" > html/sites-regions.html
echo "<tr><th>Région</th><th>Total visiteurs</th></tr>" >> html/sites-regions.html

while IFS=";" read -r a b; do
  echo "<tr><td>$a</td><td>$b</td></tr>" >> html/sites-regions.html
done < travail/sites_regions.csv

echo "</table></body></html>" >> html/sites-regions.html
