#!/bin/bash

usage ()
{
  echo "Usage: $(basename "$0") [OPTION]"
  echo "Read from stdin definition of undirected graph like: "
  echo "----------"
  echo "from 1 2 3"
  echo "1 from"
  echo "2 from 4"
  echo "3 from 4"
  echo "4 5 2 3"
  echo "5 4 to"
  echo "to 5"
  echo "----------"
  echo "and print 'YES' if nodes 'from' and 'to' are connected, otherwise print 'NO'"
  echo "Options:"
  echo "    -h, --help  	display this help and exit"
}

case "$1" in
	-h | --help )           usage
                            exit 0
esac

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