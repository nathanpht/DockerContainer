#!/bin/bash
set -e

mkdir -p pdf

docker run --rm -v "$PWD":/data bigpapoo/sae103-html2pdf \
  weasyprint /data/html/sites-dept.html /data/pdf/sites-dept.pdf

docker run --rm -v "$PWD":/data bigpapoo/sae103-html2pdf \
  weasyprint /data/html/sites-visites.html /data/pdf/sites-visites.pdf

docker run --rm -v "$PWD":/data bigpapoo/sae103-html2pdf \
  weasyprint /data/html/sites-regions.html /data/pdf/sites-regions.pdf
