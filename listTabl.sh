#!/bin/bash
clear
dbName=$1

echo  "        *********************************************************"
echo  "        *              ALL DABASE $dbName Tables                *"
echo  "        *********************************************************"

	#LIST ALL TABLES FROM DATABASE
ls "./DATABASES/$dbName/DATA/"
./databaseOptions.sh "$dbName"
