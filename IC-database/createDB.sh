#!/bin/bash/
echo "--------< your choice is to create DataBase>-------- " 
echo "Please enter DataBase name : "
read dbname
bash search.sh "$dbname"
if [ "$?" -eq "1" ]
then
	echo "DataBase Already Exsit !"
else
	mkdir ../DATABASES/$dbname
fi
echo your DB is $dbname
