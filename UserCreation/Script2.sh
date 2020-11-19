#!/bin/bash
#This script checks users UID who is running the script and checks user is root or not
echo "user ID is ${UID}"

USER_NAME=$(id -un)
USER_NAME2=`id -un`
echo "User name is ${USER_NAME}"
echo "User name is ${USER_NAME2}"

if [[ "${USER_NAME}"" -eq "root" ]]
then
  echo "You are a root user and user ID is : ${UID}"
else
  echo "you are not a root user and user IS id : ${UID}"
fi
