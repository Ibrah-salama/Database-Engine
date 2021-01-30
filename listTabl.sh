#!/bin/bash
clear
dbName=$1
echo  "        *********************************************************"
echo  "        *              ALL DABASE $dbName Tables                *"
echo  "        *********************************************************"
ls "./DATABASES/$dbName/DATA/"
./databaseOptions.sh "$dbName"
