#!/bin/bash

# hostlookup.sh
# brief  looks up host addresses given a file that contains hostnames
# author Grant Mahoney
# lab 6.2
# date 10/13/20

# echoes to user the proper usage of the script
usage()
{
	echo "$0 usage: [-f input file]"
	exit 1
}

# checks if the file exists, if not, calls usage
while getopts ":f:" options;
do
  case "${options}" in
  f)
    f=${OPTARG}
    if [ -e ${f} ]; then
      echo "file ${f} found"
    else
      echo "file $f not found"
      usage
    fi
  ;;
  *)
    usage
  ;;
  esac
done

# reads the given file, cuts the ip address and displays it neatly
while read h
do
  out=$(host -W1 -t A $h)
  if [ $? -eq 0 ]; then
    ip=$(echo $out | cut -d " " -f 4)
    echo ${h} - $ip
  else
    echo "${h} - not found"
  fi
done < $f
exit 0
