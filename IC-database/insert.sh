#!/bin/bash/

row="" #var collect row to insert

#insert function#
function insert {
	# read from file metadata and store each row as array element #
IFS=$'\n' read -d '' -r -a tblMeta < "../DATABASES/$dbname/METADATA/$tbname-meta"
	# loop on that array #
for((i=0;i<${#tblMeta[@]}; i++));do
		#every time i take every line and make it array of elements seprated by ":"#
	IFS=$':' read  -r -a  metaCol <<< "${tblMeta[$i]}"
	#that array contains 3 elements describe every table"
	colName="${metaCol[0]}"	
	colDataType="${metaCol[1]}"
	colPK="${metaCol[2]}"
#ask user to insert element 
echo "insert into coulmn number <"$i"> "$colName" "
read input

#check if user's first elment(which is the id )is repeated or not
if grep -q $input "../DATABASES/$dbname/DATA/$tbname-data"; then
#if repeated then break the loop
echo "Repeated id !"
break 
fi
#otherwise check on the datatype that the user insert and the metadata stored
case $colDataType in
	"int") if [[ "$input" =~ ^-?[0-9]+$ ]];then
	#if true then concate that input to the row
		row+="${input},"
	else
	 echo "wrong data type"
	       fi ;;
	"str") if [[ "$input" =~ [^a-zA-Z0-9] ]];then
	echo "wrong data type !"    
	else 
		    row+="${input},"
              fi ;;

	*) echo "Wrong" ;

esac
done
#at the end insert that row in the data file  
	echo "$row" >> ../DATABASES/$dbname/DATA/$tbname-data
}

dbname=$1
echo "------< Insert into table in DB $dbname >-------"
echo "Please enter Table name : "
read tbname
bash search.sh "$tbname-meta" "$dbname/METADATA/" #check if table exist
if [ "$?" -eq "0" ]
then
        echo "Table Dosen't Exsit !"
else
        insert  #function 
fi

