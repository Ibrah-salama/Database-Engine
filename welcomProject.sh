#!/bin/bash
echo  "*****************************************************************************"
echo  "*                       Welcome To DataBase Engine                          *"
echo  "*               Author Ibrahim Mohamed and Christine George                 *"
echo  "*                        Head Eng: Sherine Bahader                          *"
echo  "*****************************************************************************"
echo "                                             "
echo To Start Please Enter Your Name: 
read Name
if [ $Name ]
then
	echo Welcom: $Name
	. ./mainDbMenu.sh
else
	echo PLease Enter a Name
	./welcomProject.sh
fi

