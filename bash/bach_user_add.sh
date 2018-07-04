#!/bin/bash


########################################
##  A script to add user from CSV 
##  Author: jjww
##  E-mail :jiafucmos@gmail.com


## 1, check if user exists
## 2, if exists, add to the new group
## 3, else add user

########################################

#g='oc_linux'
g='oc_python'


groupadd $g


user=`cat ~/Book1.csv |awk -F ',' '{print $1}'`

for u in $user
do
echo $u

#if user no exists

if [ -d /home/$u ]
then

echo "User exists add to new group" 
usermod -a -G $g $u

else
	echo "User not exists, add user"

	/usr/sbin/useradd -g $g $u -m  
	echo $u:123gdut > passwd
	chpasswd <passwd
	pwconv
	rm passwd
fi

#done


done
