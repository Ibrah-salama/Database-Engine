#!/bin/bash
clear
echo  "************************************************************************"
echo  "*                       Creating New DataBase                          *"
echo  "************************************************************************"

#ASKS THE USER FOR THE NAME OF NEW DATABASE
echo Please Enter The Database Name: 
read dbName

#CHECKS IF THE DATABASE EXISITS OR NOT
if [ -d "./DATABASES/$dbName" ]
then
	echo Database $dbName Already Exsist
	
else
	mkdir ./DATABASES/$dbName
	mkdir ./DATABASES/$dbName/DATA
	mkdir ./DATABASES/$dbName/METADATA
	. ./createTable.sh
fi

