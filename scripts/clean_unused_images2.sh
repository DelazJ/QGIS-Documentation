#!/bin/bash

#This script is used to clean no longer needed images from sources
# Run from repository root


#Trouver toutes les icones non utilisées dans le document
# lister les icones ajoutés au projet (en principe dans le dossier static/common)
find ./static/common -type f -regex ".*\.\(png\|PNG\|gif\|jpg\|jpeg\)" -printf "%f\n" | sort -u > all_icons.txt # marche bien

#list of rst files in which icons should be used
#find ./source -type f  -name "*.rst" ! -name "substitutions*" -printf "%f\n" | sort -u > files_to_check.txt

#list of useful icons
grep -r -hof all_icons.txt source/docs --exclude="substitutions.rst" | sort -u > found_useful.txt

#all used icons in docs
grep -r -hof all_icons.txt source/docs | sort -u > found_docs.txt

#Find images that are not yet useful in the manuals
echo "Creating list of NOT used image files..."
grep -vf found_useful.txt all_icons.txt | xargs -I filename find ./static -name filename > not_found_icons.txt

#Find images that are not used at all (including in substitution.rst)
echo "Creating list of NOT used image files at all..."
grep -vf found_docs.txt all_icons.txt | xargs -I filename find ./static -name filename > not_used_icons.txt

#list of icons that are used only in substitutions.rst
echo "Creating list of substitution only used image files..."
grep -vf found_useful.txt found_docs.txt | xargs -I filename find ./static -name filename > only_subst.txt


sed 's/.//' not_used_icons.txt > not_used_icons-alter.txt | grep -f not_used_icons-alter.txt ./source/substitutions.txt



#list of substituted images

#list of substitutions that do not have icons
cut -d: -f3 ./source/substitutions.txt| sed 's:^\ ::' | grep 'static' > static.txt
grep -vf all_icons.txt static.txt

#list of icons that should not have a substitution (.txt) but do
grep -vf found_docs.txt all_icons.txt | grep -n ./source/substitutions.txt

cat not_used_icons.txt | cut -d. -f1 not_used_icons.txt
#list of icons that do not have substitution
gres -name "*.rst" -I "substitutions*" ./source -printf "%f\n" | sort -u > files_to_check.txt

grep -r 'lemot' dossier | cut -d: -f1 | sort | uniq > tri.txt

https://forum.ubuntu-fr.org/viewtopic.php?id=958061

for i in $(not_used_icons.txt);do sed -i "s/$i/d" ./source/substitutions.txt; done
while read; do sed  -i -e "/${REPLY}/d" ./source/substitutions.txt; done < not_used_icons.txt > substitutions2.txt
p -vf all_icons.txt ./source/substitutions.txt | xargs -I filename find ./static/common -name filename > without_substitutions.txt 

# rows of unused icons in substitutions list
grep -nvf not_used_icons.txt ./source/substitutions.txt | cut -d: -f1 > line_numbers.txt 
grep -nf not_used_icons.txt ./source/substitutions.txt | cut -d: -f1 | sed -e "s/chaine 1/`echo $VARIABLE`/g"
uniq ./source/substitutions.txt sans_doublons.txt

cat ./source/substitutions.txt | cut -d: -f3 ./source/substitutions.txt# returns width of icons
# l
while read not_used_icons.txt; do sed -e "/$f/d" ./source/substitutions.txt; done  > substitutions2.txt
for i in $(sed 's/\b/ /g' not_used_icons.txt);do sed -i "s/\b$i\b//g" ./source/substitutions.txt; done#
# grep -r -hof all_icons.txt files_to_check.txt | sort -u > found_icon.txt

# grep -r -hof all_icons.txt source/ | sort -u > found.txt

#Remove images not used
# echo "Removing NOT used files..."
# xargs rm < not_found.txt

# #Remove temporary files
# rm all_images.txt
# rm found.txt
# rm not_found.txt
# echo "Done!"
