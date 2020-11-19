#!/bin/bash
#check the userID of the user running the script
USER_ID=${UID}
echo "your UID is ${USER_ID}"
TEST_UID="0"
if [[ ${TEST_UID} -ne ${USER_ID} ]]
then
  echo "you ${USER_ID} are not the user to run this program "
  exit 1
fi

USER_NAME=$(id -un)
if [[ ${?} -ne 0 ]]         #most recent command exit status
then
  echo "this user does not have ID associated with it"
  exit 1
fi
echo "your user name is ${USER_NAME}"
T_USER_NAME="root"
if [[ "${T_USER_NAME}" = ${USER_NAME} ]]
then
  echo "you have permission to run this script your username is ${USER_NAME}"
fi

exit 0
