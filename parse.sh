#!/bin/bash
# Script helps you to download Distrowatch.com Linux database, sorts and saves it locally.
# This script can help you in classifying content on the web
# It's description and information on how to use it is in official github - welcome:
# https://github.com/sxiii/distrowatch-scraper

echo "Getting current quantity of Linux Distributions..." 
q=$(wget -q -O - distrowatch.com/weekly.php?issue=current | grep "all distributions</a> in the database" | awk -F":" '{ print $2 }' | awk -F"<" '{ print $1 }')
echo "There are$q linux distibutions @ $(date +%d.%m.%Y)"

echo "Loading distros list..." 
wget -q -O - distrowatch.com | grep -A $q "height: 20%" | awk -F"<" '{ print $1 }' > linux.list
mkdir $(date +%d.%m.%Y)
cd $(date +%d.%m.%Y)
working="desc"

echo "Loading distros info..."

sed '/^\s*$/d' ../linux.list > ../linux-clean.list
rm ../linux.list


cat ../linux-clean.list | while read line;do

i=$(($i+1))

echo "================================================================================"
echo "$line... ($i /$q)"

fixedline=$(echo $line | tr -d ' ')

wget -q -O "$line.desc" https://distrowatch.com/table.php?distribution=$fixedline

basedon=$(cat "$line.$working" | grep "Based on" | awk -F"Based on:</b>" '{ print $2 }' | awk -F"<br />" '{ print $1 }' | sed -n '/^$/!{s/<[^>]*>//g;p;}')
origin=$(cat "$line.$working" | grep "Origin" | awk -F"Origin:</b>" '{ print $2 }' | awk -F">" '{ print $2 }' | awk -F"<" '{ print $1 }')
arch=$(cat "$line.$working" | grep "Architecture" | awk -F"Architecture:</b>" '{ print $2 }' | awk -F">" '{ print $2 }' | awk -F"<" '{ print $1 }')
desktop=$(cat "$line.$working" | grep "Desktop" | awk -F"Desktop:</b>" '{ print $2 }' | html2text | awk -F"*" '{ print $1 }' | sed '/^\s*$/d' | tr -d '\n' | sed 's/search.php/distrowatch.com/g')
category=$(cat "$line.$working" | grep "Category" | awk -F"Category:</b>" '{ print $2 }' | html2text | awk -F"*" '{ print $1 }' | sed '/^\s*$/d' | tr -d '\n' | sed 's/search.php/distrowatch.com/g')
status=$(cat "$line.$working" | grep "Status" | awk -F"Status:</b>" '{ print $2 }' | awk -F">" '{ print $2 }' | awk -F"<" '{ print $1 }')
desc=$(cat "$line.$working" | grep -B1 -m1 "<br /><br />" | awk -F"<br /><br />" '{ print $1 }' | sed '/^\s*$/d')
web=$(cat "$line.$working" | grep "class=\"Info\">Home Page" -A2 | grep http | awk -F"href=" '{ print $2 }' | awk -F\" '{ print $2 }')
lastv=$(cat "$line.$working" | grep "<td class=\"TablesInvert" -m1 | awk -F">" '{ print $2 }' | awk -F"<" '{ print $1 }')

echo "Based On:$basedon" | tee "$line.results"
echo "Origin: $origin" | tee -a "$line.results"
echo "Architecture: $arch" | tee -a "$line.results"
echo "Desktops: $desktop" | tee -a "$line.results"
echo "Category: $category" | tee -a "$line.results"
echo "Status: $status" | tee -a "$line.results"
echo "Description: $desc" | tee -a "$line.results"
echo "Website: $web" | tee -a "$line.results"
echo "Latest version: $lastv" | tee -a "$line.results"

done
