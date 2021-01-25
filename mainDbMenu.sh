#!/bin/bash

#Main Menu For The User To Enter The 4 main Choice Of DBengin
option=(" Create Database." " List Databases" " Connect To Databases" " Drop Database");

#Main Menu Fields
select opt in "${option[@]}"
do
	#Check For The Reply From The User 
	case $REPLY in
		1) echo create databse
			;;
		2) echo list database
			;;

		#CONNECTION TO DATABASE
		3) echo Your Choice Is Connect To A database:
		   echo Please Enter A Valid Database To Connect With:
		   read dbName
			;;

		#DROPPING A DATABASE
		4) echo Your Choic Is To Drop Database:
		   echo Please Enter A Database To Drop:
		   read dbName
			#CHECK FOR EXISTANCE OF THE DATABASE
		   if [ -d "./DATABASES/$dbName" ]
			then
				#REMOVING DATABASE
				rm -r "./DATABASES/$dbName"
				echo SUCCESSFUL DROPPING.
			else
				echo database not found 
		   fi
			;;
		*) echo Please Choose One Of List Options:
	esac
done
