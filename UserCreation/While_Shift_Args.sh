#!/bin/bash
echo "you have entered ${#} arguments"
echo "Argument 1 is ${1}"
echo "Argument 2 is ${2}"
echo "Argument 3 is ${3}"
echo "-----------Testing while loop with Shift--------------"
while [[ "${#}" -ne 0 ]]
do
  x=0
  for argu in ${@}
  do
    echo "argument number ${x} : ${argu}"
    ((x=x+1))
  done
  echo "-----------"
  shift
done
