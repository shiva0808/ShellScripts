#!/bin/bash
x=1
y=10
((x++))       #Increment Operator
echo "${x}"
((x=x+1))     #Increment Operation
echo "${x}"
((y--))       #Decrement operator
echo "${y}"
((y=y-1))     #Decrement operation
echo "${y}"
