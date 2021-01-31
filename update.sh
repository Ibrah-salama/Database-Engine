#!/bin/bash
dbName=$1
flag="false"
#update function#

function updateTbl {
        echo "enter element you want to update" 
        read element
        
        if grep -q $element "./DATABASES/$dbName/DATA/$tbName.data";then 
        
        echo "enter new element"
        read newelement
        
        IFS=$'\n' read -d '' -r -a tblData < "./DATABASES/$dbName/DATA/$tbName.data" 
        
        for((i=0;i<${#tblData[@]}; i++));do
	
                IFS=$',' read  -r -a  Col <<< "${tblData[$i]}"
                colPK="${Col[0]}"
                
                #if grep -q $colPK "./DATABASES/$dbName/DATA/$tbName.data"; then     #"../DATABASES/$dbName/DATA/$tbName-data"; then
                
                   if test $newelement -eq $colPK 
                   then
                        #echo "Repeated id !"
                        flag="true"
                        #updateTbl 
                    else 
                        flag="false"
                    fi            
              #  fi
         done
         
        if test $flag -eq true
        then   
                echo "Repeated id !"
                updateTbl
        else
                sed -i "s/$element/$newelement/" ./DATABASES/$dbName/DATA/$tbName.data
                echo "Successfully Table $tbName Updated."
        fi    

else 
            echo " element not found !"
            ./update.sh "$dbName"
    fi
}





# function updateTbl {
#         IFS=$'\n' read -d '' -r -a tblData < "./DATABASES/$dbName/DATA/$tbName.data" 
#         if [ ${#tblData[@]} -le 0 ]
#         then 
#                 echo "Table Is Empty.. Please Insert Data "
#                 bash databaseOptions.sh "$dbName"
#         else
#                 echo "enter element you want to update" 
#                 read element
                
#                 if grep -q $element "./DATABASES/$dbName/DATA/$tbName.data";then 
                
#                 echo "enter new element"
#                 read newelement
                
#                 for((i=0;i<${#tblData[@]}; i++));do
                
#                         IFS=$',' read  -r -a  Col <<< "${tblData[$i]}"
#                         colPK="${Col[0]}"
                        
#                         if grep -q $colPK "./DATABASES/$dbName/DATA/$tbName.data"; 
#                         then     #"../DATABASES/$dbName/DATA/$tbName-data"; then
#                                 if [[ $newelement -eq $colPK ]]
#                                 then
#                                 # echo "Repeated id !"
#                                         flag="true"
#                                         #updateTbl 
#                                 else 
#                                         flag="false"
#                                 fi            
#                           fi
#                    done
                
#                 if [[ "$flag" -eq "true" ]]
#                 then   
#                         echo "Repeated id !"
#                         updateTbl
#                 else
#                         sed -i "s/$element/$newelement/" ./DATABASES/$dbName/DATA/$tbName.data
#                         echo "Successfully Table $tbName Updated."
#                 fi    

#         else 
#                 echo " element not found !"
#                 ./update.sh "$dbName"
#         fi
# fi 
# }

echo  "        *********************************************************"
echo  "        *                Update table in DB $dbName             *"
echo  "        *********************************************************"
echo "Please enter Table name : "
read tbName
bash search.sh "$tbName.metadata" "$dbName/METADATA/" #check if table exist
if [ "$?" -eq "0" ]
then
        echo "Table Dose not Exsit !"
        ./databaseOptions.sh "$dbName"
else
        updateTbl #function 
	./databaseOptions.sh "$dbName"
fi