#!/bin/bash
declare -A ADJ_MAP
while read line
do
	adj_list=${line#* }
	vertex=${line%% *}
	ADJ_MAP[$vertex]="$adj_list"
done < "${1:-/dev/stdin}"


queue=()
visited=" "
queue+=("from")
while [ ${#queue[@]} -ne 0 ]
do
	curr=${queue[0]}
	unset queue[0]
	queue=("${queue[@]}")
	if [[ $visited != *"$curr"* ]]
	then
  		visited+="$curr "
	fi
	for v in ${ADJ_MAP[$curr]}
	do
		if [ "$v" == "to" ]
		then
			echo "YES"
			exit 0
		fi
		if [[ $visited != *" $v "* ]]
		then
  			visited+="$v "
  			queue+=("$v")
		fi
	done
done
echo "NO"
exit 0