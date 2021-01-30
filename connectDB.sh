#!/bin/bash
clear
echo  "****************************************************************"
echo  "*                       CONNECTING DATABASE                    *"
echo  "****************************************************************"
echo Please Enter A Valid Database To Connect With: 

#ASKING FOR AIMED DATABASE
read dbName
#CHECK IF THE DATABASE EXSIST OR NOT 
if [[ -d "./DATABASES/$dbName" ]]
then
	#IF EXISIT 	
	./databaseOptions.sh "$dbName"
else
	echo Failed There Is No Database With $dpName Name.
	./connectDB.sh
fi
