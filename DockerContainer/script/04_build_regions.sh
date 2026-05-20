#!/bin/bash
set -e

> travail/regions.csv

while IFS=";" read -r region deps; do
  total=0
  IFS="," read -ra liste <<< "$deps"

  for d in "${liste[@]}"; do
    d_sans_zero=$(echo "$d" | sed 's/^0*//')
    if [ -z "$d_sans_zero" ]; then
      d_sans_zero=0
    fi

    v=$(grep "^$d_sans_zero;" travail/sites_final.csv | cut -d";" -f4)

    if [ -n "$v" ]; then
      total=$((total + v))
    fi
  done

  echo "$region;$total" >> travail/regions.csv
done < data/REGIONS
