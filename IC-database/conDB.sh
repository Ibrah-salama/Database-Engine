#!/bin/bash 
dbname=$1
#echo $dbname
  echo -e "\n+--------DB "$dbname"---------+"
  echo "| 1. Create Table            |"
  echo "| 2. List Tables             |" 
  echo "| 3. Drop Table              |"
  echo "| 4. Insert into Table       |"
  echo "+-------------------------------+"
  echo -e "Enter Choice: \c"

  read input
  case $input in
    1) echo bash createDB.sh ;;
    2) echo  ls ../DATABASES ;;
    3) bash dropTable.sh "$dbname" ;;   
    4) bash insert.sh "$dbname" ;;
    *) echo " not a Choice " ;
 esac

