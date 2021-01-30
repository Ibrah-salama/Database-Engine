#!/bin/bash
dbName=$1
#update function#
function updateTbl {
    echo "enter element you want to update"
    read element
    if grep -q $element "./DATABASES/$dbName/DATA/$tbName.data";then 
        echo "enter new element"
        read newelement
    sed -i "s/$element/$newelement/" ./DATABASES/$dbName/DATA/$tbName.data
    else 
            echo " element not found !"
            ./select.sh "$dbName"
    fi
 
 echo "Successfully $tbName Table Updated."
}

echo "------< UPDATE table in DB $dbName >-------"
echo "Please enter Table name : "
read tbName
bash search.sh "$tbName.metadata" "$dbName/METADATA/" #check if table exist
if [ "$?" -eq "0" ]
then
        echo "Table Dose not Exsit !"
        ./select.sh "$dbName"
else
        updateTbl #function 
	./databaseOptions.sh "$dbName"
fi