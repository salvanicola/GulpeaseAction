#!/bin/bash
cd /github/workspace
cd $INPUT_DIRECTORY
mkdir Gulpease
ls *.pdf > Gulpease/pdfList.txt
while IFS= read -r document || [ -n "$document" ]
do
    pdftotext -f 4 $document
    python /gulpease.py ${document%.*}.txt > Gulpease/${document%.*}-eval.txt
done < "Gulpease/pdfList.txt"

rm *.txt
