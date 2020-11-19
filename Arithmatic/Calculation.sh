#!/bin/bash
OP=$((1+2))
echo "${OP}"

OP=$((2-1))
echo "${OP}"

OP=$((3*2))
echo "${OP}"

OP=$((6/2))
echo "${OP}"

OP=$((5/2))       #this will print 2 not 2.5 coz bash does not understand decimal
echo "${OP}"
OP=$(echo "5/2" | bc -l)
echo "${OP}"

REMAINDER=$((5%2))
echo "${REMAINDER}"
