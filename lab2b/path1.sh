#!/bin/sh
i=`cat`
d(){
[ "${v#* $1 }" = "$v" ]&&{
v="$v $1 "
a=`echo "$i"| grep "^$1 "`
for c in $a;do
[ $c = "to" ]&&r="YES"
d $c
done
}
}
r="NO"
d from
echo $r