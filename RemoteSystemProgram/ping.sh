#!/bin/bash
SERVER_FILE=/opt/temp/server
if [[ ! -e ${SERVER_FILE} ]]
then
  echo " File Does not exist"
  exit 1
fi
for server in $(cat ${SERVER_FILE}) >&2
do
  ping -c 1 "${server}"
  if [[ ${?} -ne 0 ]] >& /dev/null
  then
    echo "${server} is not reachable"
  else
    echo "${server} is reachable"
  fi
done
