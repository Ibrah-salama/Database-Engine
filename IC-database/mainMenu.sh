#!/bin/bash 

exist_flag="false"
function searchDB  {
        typeset x
                for element in `ls`
                        do
                   echo $element                
	    		   if test $1 == $element
                                then
                                exist_flag="true"
                           fi
                        done
return 0
}

  echo -e "\n+--------Main Menu---------------+"
  echo "| 1. Create DataBase            |"
  echo "| 2. List DataBases             |"
  echo "| 3. Connect to DataBase        |"
  echo "| 4. Drop DataBase              |"
  echo "+-------------------------------+"
  echo -e "Enter Choice: \c"
 
  read input

  case $input in
    1)  echo bash createDB.sh ;;
    2)  ls ;;
    3) echo please enter the DataBase name to connect
	   read dbname
	   searchDB "$dbnam"
		if test $exist_flag == "false"
		then
		echo "DataBase doesn't exist"
		else  echo anything
		fi	;;
    4)  echo please enter the DataBase name to Drop
           read dbname
           searchDB "$dbnam"
	   if test $exist_flag == "false"
                then
                echo "DataBase doesn't exist"
                else echo  rm $dbname
                fi     ;;
    *) echo " not a Choice " ;
 esac





