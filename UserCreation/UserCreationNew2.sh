#!/bin/bash
#this program will create multiple user given in username name pair
RUNNER_ID=${uid}
RUNNER_USER=$(whoami)
if [[ ${RUNNER_ID} -ne 0 && ${RUNNER_NAME} != "root" ]]
then
  echo "you are not a root user"
  exit 1
fi
echo "Creating user from command line arguments"
USER_NAME=${1}
shift
U_NAME=${*}
echo ${U_NAME}
while [[ ${#} -ne 0 ]]
do
  U_USERNAME=${1}
  shift
  U_NAME=${1}
  shift
  useradd -c ${U_NAME} -m ${U_USERNAME}
  if [[ ${?} -ne 0 ]]
  then
    echo 'error in creating user .. exiting'
    exit 1
  fi
  U_PASSWORD=$($(date +%s%n)${random} | sha256sum | head -c8)
  echo ${U_PASSWORD} | passwd ${U_USERNAME} --stdin
  if [[ ${?} -ne 0 ]]
  then
    echo "error in setting password ... exiting"
    exit 1
  fi
  passwd -e ${U_USERNAME}
  if [[ ${?} -ne 0 ]]
  then
    echo "error in setting password expiry... exiting"
    exit 1
  fi
  echo "usnrname is : ${U_USERNAME}"
  echo "password is : ${U_PASSWORD}"
  echo "created by : " $(whoami)
done
