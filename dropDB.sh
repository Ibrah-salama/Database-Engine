#!/bin/bash
clear
echo  "****************************************************************"
echo  "*                       DROPPING DATABASE                      *"
echo  "****************************************************************"

echo 'Your Choic Is To Drop Database: '
echo 'Please Enter A Database To Drop: '
read dbName
#CHECK FOR EXISTANCE OF THE DATABASE
if [ -d "./DATABASES/$dbName" ]
then
	#REMOVING DATABASE
	rm -r "./DATABASES/$dbName"
	echo SUCCESSFUL DROPPING.
	bash mainDbMenu.sh
else
	echo "DataBase Not Found Hear Are The List Of Existed Databases"
	ls  ./DATABASES
	bash mainDbMenu.sh
fi
