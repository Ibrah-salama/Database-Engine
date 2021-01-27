#!/bin/bash/

#select function#
function selectTbl {
  echo "1. select all"
  echo "2. select by PK" 

read input
  case $input in
    1)  all=`cat ../DATABASES/$dbname/DATA/$tbname-data`
        echo "$all"
        ;;
    2)  echo "Enter rowId you want to select"
        read id
        if grep -q $id "../DATABASES/$dbname/DATA/$tbname-data"; then
            grep $id "../DATABASES/$dbname/DATA/$tbname-data"
        else 
            echo "not found !"
        fi
        ;;
    *) echo " not a Choice " ;
 esac


   
  
}

dbname=$1
echo "------< Select From table in DB $dbname >-------"
echo "Please enter Table name : "
read tbname
bash search.sh "$tbname-meta" "$dbname/METADATA/" #check if table exist
if [ "$?" -eq "0" ]
then
        echo "Table Dosen't Exsit !"
else
        selectTbl #function 
fi

