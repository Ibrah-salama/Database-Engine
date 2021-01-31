#!/bin/bash
shopt -s extglob
shopt -s globasciiranges
dbName=$1

#Create Table MetaData
row=""
function create { 
	echo "Please Enter Columns Numbers: "
	read colNum
	if [[ $colNum =~ [[:digit:]]+ ]]
	then
		for (( i=0 ; i<$colNum ; i++)); do 
	#Insert Primary key element in the first column
			if [[ $i -eq 0 ]]
			then 
					echo "Please Enter The PK Column: "
					read pkName
					row+="${pkName}:"
					echo PLease Choose DataType of column $i :
					echo "1) Int"
					echo "2) STRING"
					read dataType
					if [[ $dataType =~ [[:digit:]]+ ]]
					then
						case $dataType in 
						1) row+="int:pk"
						echo "$row" >> ./DATABASES/$dbName/METADATA/$tbName.metadata
						row=""
							;;
						2) row+="str:pk"
							echo "$row" >> ./DATABASES/$dbName/METADATA/$tbName.metadata
							row=""
							;;
						*) echo "Wrong Input"
							> ./DATABASES/$dbName/METADATA/$tbName.metadata
							row=""
							create
							;;
					esac
					fi
				else
					echo PLease Enter column $i Name :  
					read colName
					row+="${colName}:"
					echo PLease Choose DataType of column $i :
					echo "1) Int"
					echo "2) STRING"
					read dataType
					if [[ $dataType =~ [[:digit:]]+ ]]
					then
						case $dataType in 
					
						1) row+="int"
						echo "$row" >> ./DATABASES/$dbName/METADATA/$tbName.metadata
						row=""
							;;
						2) row+="str"
							echo "$row" >> ./DATABASES/$dbName/METADATA/$tbName.metadata
							row=""
							;;
						*) echo "Wrong Input"
							> ./DATABASES/$dbName/METADATA/$tbName.metadata
							row=""
							create 
						;;
				esac
				fi
			fi
		done
	else
		echo "Please Enter Valid Number"
		create
	fi
}
echo  "************************************************************************"
echo  "                   * Creating Table in $dbName Database *               "
echo  "************************************************************************"


echo  "                   *******************************************"
echo  "                   * 1. Table Name Can not contain Spaces    *"
echo  "                   * 2. Table Name Can not Start With Number *"
echo  "                   * 3. Table Name Can not Be Empty          *"
echo  "                   *******************************************"
#READ THE NAME OF THE TABLE FROM THE USER
echo Please Enter Table Name: 
read tbName
re="[[:space:]]+"
#VALIDATE TABLE NAME 
if [[ $tbName =~ ^[0-9] ]]
then
	echo "Table Name Must Start With Character"
	bash databaseOptions.sh "$dbName"
elif [[ $tbName =~ $re ]]
then
	echo "Table Name Must Not Contain Spaces"	
	bash databaseOptions.sh "$dbName"
elif [[ -z $tbName ]]
then
	echo "Table Name Must Not Be Empty"
	bash databaseOptions.sh "$dbName"
else
	if  [[ -f "./DATABASES/$dbName/DATA/$tbName.data" ]]
	then
		echo Table Already Exisit
		bash databaseOptions.sh "$dbName"
	else
		touch ./DATABASES/$dbName/DATA/$tbName.data
		touch ./DATABASES/$dbName/METADATA/$tbName.metadata
		create
		bash databaseOptions.sh "$dbName"
	fi
	
fi



