#!/bin/bash
set -e

# Par département 
sort -t";" -k1,1 travail/sites_final.csv > travail/sites_dept.csv

# Par visiteurs 
sort -t";" -k4,4nr -k1,1 travail/sites_final.csv > travail/sites_visites.csv

# Par régions 
sort -t";" -k2,2nr travail/regions.csv > travail/sites_regions.csv
