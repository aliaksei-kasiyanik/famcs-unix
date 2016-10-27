#!/bin/sh

visited=" "

# dfs() 
# {
	# if test "${visited#*$1}" != "$visited"
	# local v
	# v=$1

	# if contains $visited $v
	# then
	# 	visited+="$1 "
	# if [ $1 -le 1 ]
 #        then
 #              return 1

# }

contains() {
    string="$1"
    substring="$2"
    if test "${string#*$substring}" != "$string"
    then
        return 0    # $substring is in $string
    else
        return 1    # $substring is not in $string
    fi
}

visited="adfadsf"
v="a"


# case $line in (*"$PWD"*)
# #    whatever your then block had
# ;;esac


if [ "${visited#*$v}" != "$visited" ]
then 
	echo YES
else 
	visited="$visited $v"
	echo NO
	echo "$visited"
fi


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