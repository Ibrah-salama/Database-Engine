#!/bin/bash
shopt -s extglob
shopt -s globasciiranges
dbName=$1
#create table function
# Steps of creating new table
# 1- Validate table name (noSapces, contains at least one letter, does not start with number)     [FINISHED]
# 2- Check if table already exists								   
# 3- Create 2 files Data/tableName and MetaData/tableName.metadata
# 4- Read number of columns from user 
# 5- For each column :
#       5.1- column name :
#           5.1.1- Read column name from user
#           5.1.2- validate column name (noSpaces, contains at least one letter, does not start with number)
#       5.2- Let user choose datatype (String/Number)
#       5.3- Is it primary-key column (Y/N)
#       5.4- create row containing column-info in table.metadata (colName:dataType:PK)


#Functio Create 
row=""
function create { 
	echo "Please Enter Columns Numbers: "
	read colNum
	if [[ $colNum =~ [[:digit:]]+ ]]
	then
		for (( i=0 ; i<$colNum ; i++)); do 
			#cloName
			#colDataType
			#colPK
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
						echo $row
						echo "$row" >> ./DATABASES/$dbName/METADATA/$tbName.metadata
						row=""
							;;
						2) row+="str:pk"
							echo $row
							echo "$row" >> ./DATABASES/$dbName/METADATA/$tbName.metadata
							row=""
							;;
						*) echo "Wrong Input"
							> ./DATABASES/$dbName/METADATA/$tbName.metadata
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
						echo $row
						echo "$row" >> ./DATABASES/$dbName/METADATA/$tbName.metadata
						row=""
							;;
						2) row+="str"
							echo $row
							echo "$row" >> ./DATABASES/$dbName/METADATA/$tbName.metadata
							row=""
							;;
						*) echo "Wrong Input"
							> ./DATABASES/$dbName/METADATA/$tbName.metadata
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
echo "Successfully $dbName Created.."
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
whiteSpaceRex="[\s]+"
re="[[:space:]]+"
#VALIDATE TABLE NAME 
if [[ $tbName =~ ^[0-9] ]]
then
	echo Table Name Must Start With Character
elif [[ $tbName =~ $re ]]
then
	echo Table Name Must Not Start Contain Spaces
elif [[ -z $tbName ]]
then
	echo Table Name Must Not Be Empty
else
	if  [[ -f "./DATABASES/$dbName/DATA/$tbName.data" ]]
	then
		echo Table Already Exisit
	else
		touch ./DATABASES/$dbName/DATA/$tbName.data
		touch ./DATABASES/$dbName/METADATA/$tbName.metadata
		create
		echo Successfully $tbName Table Created.
		./databaseOptions "$dbName"
	fi
	
fi



