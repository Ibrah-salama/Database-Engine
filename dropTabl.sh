#!/bin/bash
dbName=$1
echo "------< your choice is to drop a table >-------"
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
        ./connectDB.sh
else
        echo "Table $tbName Does Not Exisit"
             ./dropTabl.sh "$dbName"
fi
                     
