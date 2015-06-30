#! /bin/bash
TODAY=`date +'%a %b %d'`
TOM=`date -d '+1 day' +'%a %b %d'`
AFTOM=`date -d '+2 day' +'%a %b %d'`
CAL=`gcalcli --calendar main --nocolor agenda 12am 2day | awk -v today="$TODAY" '{gsub(today,"Today:\n------------\n    "); gsub("      ",""); print}' | awk -v tom="$TOM" '{gsub(tom,"Tomorrow:\n------------\n    "); gsub("      ","");  print}' | awk -v aftom="$AFTOM" '{gsub(aftom,aftom":\n------------\n    "); gsub("      ","");  print}' | sed 's/^/   /'`
TODO=`/bin/python ~/.bin/todoistList.py | sed 's/^/   /'`

echo $CAL
echo $TODO
