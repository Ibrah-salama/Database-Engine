#!/bin/bash
clear
echo  "****************************************************************"
echo  "*                       DROPPING DATABASE                      *"
echo  "****************************************************************"
echo $accept

echo 'Your Choic Is To Drop Database: '
echo 'Please Enter A Database To Drop: '
read dbName
#CHECK FOR EXISTANCE OF THE DATABASE
if [ -d "./DATABASES/$dbName" ]
then
	#REMOVING DATABASE
	rm -r "./DATABASES/$dbName"
	echo SUCCESSFUL DROPPING.
else
	echo "DataBase Not Found Hear Are The List Of Existed Databases"
	ls  ./DATABASES
fi
./mainDbMenu.sh
