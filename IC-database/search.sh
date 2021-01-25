#echo fffffffff
exist_flag="false"
item=$1
pos=$2
function searchDB  {
  #echo seeeaaaarrrccchhhhh

	for element in `ls ../DATABASES/"$pos"`
                        do              
                           if test "$item" == "$element"
                                then
                                exist_flag="true"
				#echo $exist_flag
                                return 1
                        else 
                                exist_flag="false"
				#echo $exist_flag
                           fi
                        done
		return 0	
}
searchDB "$item" "$pos"
