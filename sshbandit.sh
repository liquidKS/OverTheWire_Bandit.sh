#!/bin/bash

#---------Bandit level passwords--------------
password_file="bandit_passwords.txt"
#---------Bandit level passwords--------------

#---------Read the file into an array---------
level_passwords=()
while IFS= read -r line; do
    level_passwords+=("$line")
done < "$password_file"

#---------Read the file into an array---------

#---------Append new password-----------------

echo "Would you like to append a new password to the array? y/n"
read appendAnswer

#append to the array
if [[ "$appendAnswer" == "y" ]]; then

   echo "Enter the new password you want to append: "
   read new_password
   level_passwords+=("$new_password")
   echo "$new_password" >> "$password_file"
   echo "Password appended!"
fi

#---------Append new password-----------------

#---------Ask for the level-------------------

#prompt the user for a number
echo "what bandit level are you on? "

read user_num

#---------Ask for the level-------------------

#---------Ask if they want the pswd-----------

#ask if they know the password
echo "Would you like the password for the level? y/n"

read passwordAnswer

if [[ "$passwordAnswer" == "y" ]]; then

   echo "Here is the password for Bandit level $user_num : ${level_passwords[user_num]}"
else
   ssh bandit$user_num@bandit.labs.overthewire.org -p 2220
fi

#---------Ask if they want the pswd-----------
sleep 1
echo "PLEASE REMEMBER TO APPEND A NEW PASSWORD AFTER FINISHING A LEVEL!!!"

#ssh using the num variable
ssh bandit$user_num@bandit.labs.overthewire.org -p 2220
