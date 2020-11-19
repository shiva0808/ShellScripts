#!/bin/bash
SCRIPT_NAME=${0}      #this is the argument passed 0 is command name itself
echo "you have execute in $(dirname ${SCRIPT_NAME}) script name $(basename ${SCRIPT_NAME})"
#${1} is argument 1
#${2} is argument 2   and so on
NO_OF_ARGS="${#}"     #this will give number of args passed in SCRIPT
echo "you supplied ${NO_OF_ARGS} arguments"
PASS_ARGS=${@}
echo "Argument passed are ${PASS_ARGS}"
JOIN_ARGUMENTS=${*}     #this will combine all arguments and put in doulbe quotes
echo "Argument in one line ${JOIN_ARGUMENTS}"

if [[ ${NO_OF_ARGS} -lt 1 ]]
then
  echo "No arguments specified .. below method to use the command"
  echo "${0} USER_NAME [USERNAME] ..."
  exit 1
fi

for USER_NAME in ${@}     #arguments seperated by doube quotes
do
  PASSWORD=$(date +%s%n | sha256sum | head -c48)
  echo "${USER_NAME} : ${PASSWORD}"
done
