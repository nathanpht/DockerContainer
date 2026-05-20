#!/bin/bash
set -e

bash script/01_excel_to_csv.sh
bash script/02_clean_csv.sh
bash script/03_merge_depts.sh
bash script/04_build_regions.sh
bash script/05_sort_data.sh
bash script/06_make_html.sh
bash script/07_html_to_pdf.sh

echo "traitement terminée."
