#!/usr/bin/env bash

# This script is used to batch replace strings in the repo, either rst or po files
# It can be used to fix e.g. broken or redirected URLs (spotted using linkcheck),
# malformed Sphinx roles.
# With po files, the idea is to replace the strings in the repo at once
# and avoid pushing strings translators would have to fix in their languages.

# Usage: Run from the repository main folder
#   scripts/strings_fixer.sh -- will replace strings in po files in the "locale" folder
#   scripts/strings_fixer.sh docs/about rst -- will replace strings in rst files in the "docs/about" folder

# Harrissou Sant-anna, february 2025

# Folder to browse for text replacement, defaults to locale
SOURCEFILES=${1:-"locale"}
# target file format to update, defaults to po
TARGETFORMAT=${2:-"po"}

declare -A MATCHING_STRINGS

MATCHING_STRINGS=(
       [">\` _"]=">\`_"
       ["> \`_"]=">\`_"
       [":ref: "]=":ref:"
       [": ref: "]=":ref:"
       [":ref : "]=":ref:"
       [": ref :"]=":ref:"
       [":guilabel: "]=":guilabel:"
       [": guilabel: "]=":guilabel:"
       [":guilabel : "]=":guilabel:"
       [": guilabel :"]=":guilabel:"
       [":sup: "]=":sup:"
       [": sup: "]=":sup:"
       [":sup : "]=":sup:"
       [": sup :"]=":sup:"
       [":menuselection: "]=":menuselection:"
       [": menuselection: "]=":menuselection:"
       [":menuselection : "]=":menuselection:"
       [": menuselection :"]=":menuselection:"
       #specific context
       ["targetting"]="targeting"
       ["unuseful"]="useless"
       ["splitted"]="split"
       ["availabe"]="available"
       ["Informations"]="Information"
       ["shoud"]="should"
       ["Tesselated"]="Tessellated"
       ["suppported"]="supported"
       ["autentication"]="authentication"
       ["afer"]="after"
       ["occured"]="occurred"
       ["specifiying"]="specifying"
       ["correspondance"]="correspondence"
       ["addditional"]="additional"
       ["lenght"]="length"
       ["underlaying"]="underlying"
       ["cancelation"]="cancellation"
       ["projets"]="projects"
       ["accross"]="across"
       ["vertexes"]="vertices"
       ["digitalizing"]="digitizing"
       ["appropiate"]="appropriate"
       ["undesireable"]="undesirable"
       ["defering"]="deferring"
       ["suppport"]="support"
       ["algoritm"]="algorithm"
       ["ouput"]="output"
       ["harcoded"]="hardcoded"
       ["wraped"]="wrapped"
       ["Futhermore"]="Furthermore"
       ["particulary"]="particularly"
       ["overrideable"]="overridable"
       [" crypted"]=" encrypted"
       ["Paralell"]="Parallel"
       ["ouputs"]="outputs"
       ["outputed"]="outputted"
       ["breakes"]="breaks"
       ["re-use"]="reuse"
       ["choosen"]="chosen"
       ["draging"]="dragging"
       ["explicitely"]="explicitly"
       ["overlayed"]="overlaid"
       ["approximatively"]="approximately"
       ["futher"]="further"
       ["approriate"]="appropriate"
       ["recommanded"]="recommended"
       ["advertized"]="advertised"
       ["possibe"]="possible"
       ["Succesfully"]="Successfully"
       ["Tripel"]="Triple"
       ["softwares"]="software"
       ["discernable"]="discernible"
       ["refered"]="referred"
       ["accesible"]="accessible"
       ["developping"]="developing"
       ["instanciated"]="instantiated"
       ["everytime"]="every time"
       ["trough"]="through"
       ["scrips"]="scripts"
       ["appopriate"]="appropriate"
       ["Overrride"]="Override"
       ["Tickness"]="Thickness"
       ["miximum"]="maximum"
       ["Ouput"]="Output"
       # complete specific strings to update, e.g., urls from make linkcheck output
       # ["oldstringtoreplace"]="newstringforreplacement"
)

for FILE in `find ${SOURCEFILES} -type f -name "*.${TARGETFORMAT}"`
do
  echo "${FILE}";

  for string in "${!MATCHING_STRINGS[@]}"
  do
    #echo "$string - ${MATCHING_STRINGS[$string]}"
    sed -i -e "s@${string}@${MATCHING_STRINGS[${string}]}@g" "${FILE}"
  done
done
