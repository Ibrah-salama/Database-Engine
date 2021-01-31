#!/bin/bash
clear
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
            bash databaseOptions.sh "$dbName"
        fi
}

echo  "        *********************************************************"
echo  "        *             Delete From table in DB $dbName           *"
echo  "        *********************************************************"

echo "Please enter Table name : "
read tbName
bash search.sh "$tbName.metadata" "$dbName/METADATA/" #check if table exist
if [ "$?" -eq "0" ]
then
        echo "Table Dosen't Exsit !"
        bash databaseOptions.sh  "$dbName"
else
     	delete #function 
        echo "Successfully Deleted"
		bash databaseOptions.sh "$dbName"
fi
