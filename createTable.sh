#!/bin/bash
shopt -s extglob
shopt -s globasciiranges
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
echo "Successfully $dbName Created.."
echo  "************************************************************************"
echo  "                    Creating Table in $dbName Database                "
echo  "************************************************************************"


echo  "                    ***********************************"
echo  "                    Table Name Can not contain Spaces"
echo  "                    Table Name Can not Start With Number"
echo  "                    Table Name Can not Be Empty"
echo  "                    ************************************"
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
		echo Successfully $tbName Table Created.
	fi
	
fi



