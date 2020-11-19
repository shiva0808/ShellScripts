#!/bin/bash
USER_ID=${UID}
USER_NAME=$(whoami)
if [[ ${USER_ID} -ne 0 && "${USER_NAME}" != "root" ]]
then
  echo "you are not root user you can not run this command"
  exit 1
fi
read -p "Enter username of the user : " R_USER_NAME
read -p "Enter name of the user : " R_COMMENT
read -p "Enter password of the user : " R_PASSWORD

useradd -c "${R_COMMENT}" -m "${R_USER_NAME}"
if [[ ${?} -ne 0 ]]         #if exist status of command is not 0 then remove user
then
  echo "deleting user ${R_USER_NAME}"
  userdel -f ${R_USER_NAME}
  exit 1
fi

echo "${R_PASSWORD}" | passwd --stdin "${R_USER_NAME}"
if [[ ${?} -ne 0 ]]
then
  echo "deleting user ${R_USER_NAME}"
  userdel -f ${R_USER_NAME}
  exit 1
fi

passwd -e "$R_USER_NAME"
if [[ ${?} -ne 0 ]]
then
  echo "deleting user ${R_USER_NAME}"
  userdel -f ${R_USER_NAME}
  exit 1
fi
exit 0
