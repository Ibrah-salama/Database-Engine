#!/bin/bash
dbName=$1
echo Successfully Connected To $dbName...

###ARRAY FOR LIST OPERATION AFTER CONNECTING TO A DATABASE
operations=("Creat Table" "Insert Into Table" "Select From Table" "Update Table " "Delete From Table" "Drop Table" "List All Tabels") 

select oper in "${operations[@]}"
	do
	#Check For The Reply From The User 
	case $REPLY in
		1) ./createTable.sh "$dbName" #[Not FINISHED]
            echo "\n"
			;;
            
		2) ./insert.sh "$dbName"	  #[DONE]
			echo "\n"
            ;;
		3) ./select.sh "$dbName"      #[DONE]
			;;
		4) ./update.sh "$dbName"
			;;
		5) ./delete.sh "$dbName"	
			;;
		6) ./dropTabl.sh "$dbName"    #[DONE]
			;;
		7) ./listTabl.sh "$dbName"    #[DONE]
			;;
		*) echo Please Choose One Of List Options:
	esac
	done