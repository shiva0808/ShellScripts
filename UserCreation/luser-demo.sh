#!/bin/bash
#this is for printing a random line
echo 'Hello There'
WORD='script'
echo "$WORD"
echo '$WORD'
echo "This is a shell $WORD"
echo "This is a shell  ${WORD}"
echo "${WORD}ing is fun"
ENDING='ed'
echo "This is ${WORD}${ENDING}"
ENDING='ing'
echo "${WORD}${ENDING} is fun"
ENDING='s'
echo "you are going to write many ${WORD}${ENDING} in this class"
