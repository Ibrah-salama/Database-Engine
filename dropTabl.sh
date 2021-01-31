#!/bin/bash
dbName=$1
echo  "        *********************************************************"
echo  "        *                 Drop Table From $dbName               *"
echo  "        *********************************************************"

echo "Please enter Table name : "
read tbName
# echo tbName is $tbName
# echo dbName is $dbName
# bash search.sh "$tbName" "$dbName"
if [ -f "./DATABASES/$dbName/METADATA/$tbName.metadata" ]
then
        rm -r "./DATABASES/$dbName/DATA/$tbName.data"
        rm -r "./DATABASES/$dbName/METADATA/$tbName.metadata"
        echo "SUCCESSFULYY $tbName Dropped.."
        bash databaseOptions.sh "$dbName"
else
        echo "Table $tbName Does Not Exisit"
        bash databaseOptions.sh "$dbName"
fi
                     
