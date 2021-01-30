#!/bin/bash
clear
echo  "    **********************************************************"
echo  "    *                   DELETING OPERATION                   *"
echo  "    **********************************************************"

dbName=$1

#select function#
function delete {
  echo "SELECTOR ELEMENT: "
  read input
        if grep -q $input "./DATABASES/$dbName/DATA/$tbName.data"; then   #"../DATABASES/$dbName/DATA/$tbName-data"; then
            #grep $id "./DATABASES/$dbName/DATA/$tbName.data"
			sed "/$input/d" -i "./DATABASES/$dbName/DATA/$tbName.data"
        else 
            echo "not found !"
            ./select.sh "$dbName"
        fi
}

echo  "        *********************************************************"
echo  "        *             Select From table in DB $dbName           *"
echo  "        *********************************************************"

echo "Please enter Table name : "
read tbName
bash search.sh "$tbName.metadata" "$dbName/METADATA/" #check if table exist
if [ "$?" -eq "0" ]
then
        echo "Table Dosen't Exsit !"
        ./select.sh "$dbName"
else
     	delete #function 
        echo Successfully $tbName Table Created.
		./databaseOptions.sh "$dbName"
fi
