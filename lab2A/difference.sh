#/bin/bash

usage ()
{
  echo "Usage: $(basename "$0") [OPTION] FILE1 FILE2"
  echo "Find lines from FILE1 that doesn't exist in FILE2"
  echo ""
  echo "Options:"
  echo "    -n, --line-number   prefix line with line number in file"
  echo "    -h, --help  	display this help and exit"
  exit
}


if [ $# -eq 0 ]; then
    echo "ERROR: You didn't specified filenames."
    usage
fi

LINE_NUM=""
FILENAME1=""
FILENAME2=""

while [ $# -gt 0 ]
do
    case "$1" in
        -n | --line-number )    LINE_NUM="-n"
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     FILENAME1=$1;
				FILENAME2=$2;
                                break;;
    esac
    shift
done

if [ -z $FILENAME2 ]; then
    echo "ERROR: You didn't specified filenames."
    usage
fi

grep -F $LINE_NUM -x -v -f $FILENAME2 $FILENAME1

