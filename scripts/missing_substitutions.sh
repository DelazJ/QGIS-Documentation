#This script is used to clean no longer needed images from sources
# Run from repository root

#list of existing images to use as icons 
find ./static/common -type f -regex ".*\.\(png\|PNG\|gif\|jpg\|jpeg\)" -printf "%f\n" | sort -u > all_icons.txt

#list of icons used in the substitutions file
grep -of all_icons.txt source/docs/documentation_guidelines/substitutions.rst | sort -u > previewed.txt

#list of files not found in the substitutions file
#grep -vf previewed.txt all_icons.txt | xargs -I filename find ./static -name filename > not_previewed.txt

#formating 
grep -vf previewed.txt all_icons.txt | xargs -I filename find ./static -name filename | sed -e "s#^\./static#https://github.com/qgis/QGIS-Documentation/tree/master/static#" > not_previewed.txt

#Remove temporary files
rm all_icons.txt
rm previewed.txt
# rm not_previewed.txt
# echo "Done!"
