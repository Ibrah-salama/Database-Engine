#!/bin/bash 
  echo -e "\n+--------Main Menu-------------+"
  echo "| 1. Create DataBase            |"
  echo "| 2. List DataBases             |"
  echo "| 3. Connect to DataBase        |"
  echo "| 4. Drop DataBase              |"
  echo "+-------------------------------+"
  echo -e "Enter Choice: \c"
 
  read input
  case $input in
    1)  bash createDB.sh ;;
    2)  ls ../DATABASES ;;
    3) echo please enter the DataBase name to connect
	   read dbname
	   bash search.sh "$dbname" 
		if [ "$?" -eq "0" ]
		then
		echo "DataBase doesn't exist"
		else  bash conDB.sh "$dbname"
		fi	;;
    4)  echo please enter the DataBase name to Drop
           read dbname
           bash search.sh "$dbname"
		if [ "$?" -eq "0" ]
                then
                echo "DataBase doesn't exist"
                else echo  rm $
			dbname
                fi     ;;
    *) echo " not a Choice " ;
 esac





