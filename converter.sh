#!/bin/bash

# converter.sh
# brief  converts a given file to all uppercase or lowercase characters
# author Grant Mahoney
# lab 6.2
# date 10/13/20

# echoes to the user the proper usage of the script
usage()
{
	echo "$0 usage: [-f input filed] [-c U(upper) or L(lower)"
	exit 1
}

while getopts ":f:c:" options;
do
	case "${options}" in
	f)
	  f=${OPTARG}
	  #TO DO IF FILe IS HERE, YAY! If NOT USAgE
	  if [ -e ${f} ]; then
	    echo "${f} exists"
	  else
	    echo "${f} does not exist"
	    usage
	  fi
 	  ;;
	c)
	  c=${OPTARG}
	  if [[ ${c} == "U" || ${c} == "L" ]]; then
	    echo "${f} - ${c}"
	  else
	    usage
	  fi
	;;
	*)
	usage
	;;
	esac
done

#checks if the input U is used for the -c flag, in which it converts
#lowercase to uppercase. Otherwise, it converts uppercase to lowercase
while read line
do
  if [ ${c} == "U" ]; then
    echo $line | tr [:lower:] [:upper:]
  else
    echo $line | tr [:upper:] [:lower:]
  fi
done < $f

exit 0
