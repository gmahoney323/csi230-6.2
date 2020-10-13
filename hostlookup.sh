#!/bin/bash
#comments go here

usage()
{
	echo "$0 usage: [-f input file]"
	exit 1
}

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
#for h in champlain.edu uvm.edu umd.edu doesnotexist.edu
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
