#!/bin/bash
echo Welcom: $Name
echo  "****************************************************************"
echo  "*              PLEASE SELECT ONE OF THE OPTION                 *"
echo  "****************************************************************"
#Main Menu For The User To Enter The 4 main Choice Of DBengin
option=(" Create Database." " List Databases" " Connect To Databases" " Drop Database");

#Main Menu Fields

select opt in "${option[@]}"
do
	#Check For The Reply From The User 
	case $REPLY in
		1) ./createDB.sh
			;;
		2) ./listDB.sh
			;;
		#CONNECTION TO DATABASE
		3) ./connectDB.sh
			;;
		#DROPPING A DATABASE
		4) ./dropDB.sh
			;;
		*) echo Please Choose One Of List Options:
	esac
done
