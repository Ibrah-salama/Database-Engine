#!/bin/bash
clear
echo  "****************************************************************"
echo  "*                       CONNECTING DATABASE                    *"
echo  "****************************************************************"

###ARRAY FOR LIST OPERATION AFTER CONNECTING TO A DATABASE
operations=("Creat Table" "Insert Into Table" "Select From Table" "Update Table " "Delete From Table" "Drop Table" "List All Tabels") 

#Connect To A Database Script
echo Your Choice Is Connect To A database:
echo Please Enter A Valid Database To Connect With: 

#ASKING FOR AIMED DATABASE
read dbName
#CHECK IF THE DATABASE EXSIST OR NOT 
if [[ -d "./DATABASES/$dbName" ]]
then
	#IF EXISIT 
	echo Successfully Connected To $dbName...
	select oper in "${operations[@]}"
	do
	#Check For The Reply From The User 
	case $REPLY in
		1) ./createTable.sh "$dbName" #[Not FINISHED]
			;;
		2) ./insert.sh "$dbName"	  #[DONE]
			;;
		3) ./select.sh "$dbName"      #[DONE]
			;;
		4) ./update.sh "$dbName"
			;;
		5) . ./delete.sh "$dbName"	
			;;
		6) ./dropTabl.sh "$dbName" #needs edit to delete table from data and metadata
			;;
		7) ./listTable.sh "$dbName"
			;;
		*) echo Please Choose One Of List Options:
	esac
	done
	
else
	echo Failed There Is No Database With $dpName Name.
fi
