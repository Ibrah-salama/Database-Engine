#!/bin/bash
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
		#creatDB.sh Script to control databases
		1) ./createDB.sh		#[DONE]
			;;
		#list all databases 		#[DONE]
		2) ./listDB.sh	
			;;
		#CONNECTION TO DATABASE		#[DONE]
		3) ./connectDB.sh
			;;
		#DROPPING A DATABASE		#[DONE]
		4) ./dropDB.sh
			;;
		*) echo "Please Choose One Of List Options: "
			bash mainDbMenu.sh 
			;;
	esac
done
