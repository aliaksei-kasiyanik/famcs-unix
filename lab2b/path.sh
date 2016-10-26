#!/bin/bash

GRAPH_from=("1" "2" "3")
GRAPH_1=("from")
GRAPH_2=("from" "4")
GRAPH_3=("from" "4")
GRAPH_4=("2" "3")
GRAPH_5=("to")
GRAPH_to=("5")

# str=a:b:c:d:e
# arr=(${str//:/ })


queue=()
visited=" "


queue+=("from")

while [ ${#queue[@]} -ne 0 ]
do
	curr=${queue[0]}
	unset queue[0]
	queue=("${queue[@]}")

	echo "CURR ${curr}"


	if [[ $visited != *"$curr"* ]]
	then
  		visited+="$curr "
	fi

	arr_name="GRAPH_$curr"
	array="${arr_name}[@]"

	for i in "${!array}"
	do
		echo " ${i} "
		# read -n1 -r -p "Press space to continue..." key
		# echo " ${visited} "
		if [ "$i" == "to" ]
		then
			echo "YES"
			exit 0
		fi

		if [[ $visited != *" $i "* ]]
		then
  			visited+="$i "
  			queue+=("$i")
		fi
	done
done

echo "NO"
exit 0