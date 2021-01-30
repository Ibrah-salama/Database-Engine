#!/bin/bash
dbName=$1
#select function#
function selectTbl {
  echo "1. select all"
  echo "2. select by element" 

read input
  case $input in
    1)  all=`cat ./DATABASES/$dbName/DATA/$tbName.data`    #`cat ../DATABASES/$dbName/DATA/$tbName-data`
        echo "$all"
        ;;
    2)  echo "Enter Element you want to select"
        read element
        if grep -q $element "./DATABASES/$dbName/DATA/$tbName.data"; then   #"../DATABASES/$dbName/DATA/$tbName-data"; then
            grep $element "./DATABASES/$dbName/DATA/$tbName.data"
        else 
            echo "not found !"
            ./select.sh
        fi
        ;;
    *)  echo "Please Enter A valid Option"
        ./select.sh ;
 esac
  
}
echo "------< Select From table in DB $dbName >-------"
echo "Please enter Table name : "
read tbName
bash search.sh "$tbName.metadata" "$dbName/METADATA/" #check if table exist
if [ "$?" -eq "0" ]
then
        echo "Table Dosen't Exsit !"
        ./select.sh "$dbName"
else
        selectTbl #function 
        echo Successfully $tbName Table Created.
		./databaseOptions.sh "$dbName"
fi