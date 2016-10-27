#!/bin/sh

wait() {
	read  key
}

input="from 1 2 3
1 from
2 from 4
3 from 4
4 5 2 3
5 4 to
to 5"

curr_adj_list=""

find_adj_list() {
	curr_adj_list=$(echo "$input" | sed -n "/^$1/p")
	# echo "$input" | while read a; do
		# echo "$a"
	# done
}

# echo $(find_adj_list from)
# find_adj_list from
# echo $curr_adj_list

# exit

contains() {
    string="$1"
    substring="$2"
    if test "${string#*$substring}" != "$string"
    then
        return 0
    else
        return 1
    fi
}



dfs() 
(
	# if test "${visited#*$1}" != "$visited"
	
	# local v
	# v=$1

	# echo "DFS $1"
	
	visited="$2"
	if ! contains "$visited" " $1 "; then

		echo "$1 NOT VISITED"
		visited="$visited $1 "
		echo "VISITED NODES $visited"

		
		adj_list=$(echo "$input" | sed -n "/^$1/p")
		echo "CHILDS $adj_list"
		# wait
		# exit
		for child in $adj_list
		do
			# echo $child
			# wait
			dfs $child "$visited"
		done
	# else 
	# 	echo "$1 ALREADY VISITED"
	fi
)

visited=" "
dfs from "$visited"

echo "FINAL VISITED $visited"




# visited="adfadsf"
# v="u"

# dfs $v
# case $line in (*"$PWD"*)
# #    whatever your then block had
# ;;esac

# !!!!!!!!!!!!!!!!!!!!!!
# if [ "${visited#*$v}" != "$visited" ]
# then 
# 	echo YES
# else 
# 	visited="$visited $v"
# 	echo NO
# 	echo "$visited"
# fi


# declare -A ADJ_MAP
# while read line
# do
# 	adj_list=${line#* }
# 	vertex=${line%% *}
# 	ADJ_MAP[$vertex]="$adj_list"
# done < "${1:-/dev/stdin}"
# queue=()
# visited=" "
# queue+=("from")
# while [ ${#queue[@]} -ne 0 ]
# do
# 	curr=${queue[0]}
# 	unset queue[0]
# 	queue=("${queue[@]}")
# 	if [[ $visited != *"$curr"* ]]
# 	then
#   		visited+="$curr "
# 	fi
# 	for v in ${ADJ_MAP[$curr]}
# 	do
# 		if [ "$v" == "to" ]
# 		then
# 			echo "YES"
# 			exit 0
# 		fi
# 		if [[ $visited != *" $v "* ]]
# 		then
#   			visited+="$v "
#   			queue+=("$v")
# 		fi
# 	done
# done
# echo "NO"
# exit 0