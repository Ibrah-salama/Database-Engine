#!/bin/bash
clear
echo  "****************************************************************"
echo  "*                         DELETING OPERATION                   *"
echo  "****************************************************************"
dbName=$1
#ASKING USER FOR AIMED TABLE 
echo Please Enter Table To Delete From: 
read tabelName
if [ -f "./DATABASES/$dbName/DATA/$tabelName" ]  
then
		rm -r "./DATABASES/$dbName/DATA/$tabelName.data" 
		rm -r "./DATABASES/$dbName/METADATA/$tabelName.metadata" 
else
		echo Table $tabelName Not Found
fi	
