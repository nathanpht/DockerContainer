#!/bin/bash
set -e

docker run --rm -v "$PWD":/data bigpapoo/sae103-excel2csv \
  ssconvert "/data/data/sites_touristiques_france v2.xlsx" /data/travail/sites.csv
