#!/bin/bash
dbName=$1
#select function#
function selectTbl {

IFS=$'\n' read -d '' -r -a tblData < "./DATABASES/$dbName/DATA/$tbName.data" 
        if [ ${#tblData[@]} -le 0 ]
        then 
                echo "Table Is Empty.. Please Insert Data "
                bash databaseOptions.sh "$dbName"
        else


    echo "1. select all"
    echo "2. select by element" 

    read input
    case $input in
        1)  all=`cat ./DATABASES/$dbName/DATA/$tbName.data`    #`cat ../DATABASES/$dbName/DATA/$tbName-data`
            echo "$all"
            ;;
        2)  echo "Enter Element you want to select"
            read element
            if grep -q $element "./DATABASES/$dbName/DATA/$tbName.data"; then   #"../DATABASES/$dbName/DATA/$tbName-data"; then
                grep $element "./DATABASES/$dbName/DATA/$tbName.data"
            else 
                echo "not found !"
                ./select.sh "$dbName"
            fi
            ;;
        *)  echo "Please Enter A valid Option"
            ./select.sh "$dbName"
            ;;
    esac
    fi
    }

    echo  "        *********************************************************"
    echo  "        *             Select From table in DB $dbName           *"
    echo  "        *********************************************************"

    echo "Please enter Table name : "
    read tbName
    bash search.sh "$tbName.metadata" "$dbName/METADATA/" #check if table exist
    if [ "$?" -eq "0" ]
    then
            echo "Table Dosen't Exsit !"
            bash  databaseOptions.sh "$dbName"
    else
            selectTbl #function 
            bash databaseOptions.sh "$dbName"
    fi

