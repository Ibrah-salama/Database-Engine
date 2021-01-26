#!/bin/bash/
dbname=$1
echo "------< your choice is to drop a table >-------"
echo "Please enter Table name : "
read tbname
echo tbname is $tbname
echo dbname is $dbname
bash search.sh "$tbname" "$dbname"
if [ "$?" -eq "0" ]
then
        echo "Table Dosen't Exsit !"
else
        rm ../DATABASES/$dbname/$tbname
	echo your table $tbname is deleted sucecsfully
fi
~                        

