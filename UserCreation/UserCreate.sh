#!/bin/bash
echo "This program is for automatic user addition"
read -p "Enter username : " USER_NAME
read -p "Enter name of the user : " COMMENT
read -p "Enter password of the user : " P_PASSWORD

echo "Creating a user"
useradd -c "${COMMENT}" -m "${USER_NAME}"
echo "Setting up password"
echo "${P_PASSWORD}" | passwd --stdin "${USER_NAME}"
echo "setting up password policy"
passwd -e "${USER_NAME}"
