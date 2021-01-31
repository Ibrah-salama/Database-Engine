#!/bin/bash
shopt -s nullglob dotglob
clear
dbName=$1

echo  "        *********************************************************"
echo  "        *              ALL DABASE $dbName Tables                *"
echo  "        *********************************************************"

files=(./DATABASES/$dbName/DATA/*)
if [ ${#files[@]} -gt 0 ];
	#LIST ALL TABLES FROM DATABASE
	#if [ -f "./DATABASES/$dbName/DATA/" ]
then 
	ls "./DATABASES/$dbName/DATA/"
	bash databaseOptions.sh "$dbName"
else
	echo "Database Does Not Have Tables.."
	bash databaseOptions.sh "$dbName"
fi
