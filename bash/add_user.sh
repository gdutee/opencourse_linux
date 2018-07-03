#/bin/bash
groupadd gstu

for i in {1..30}
do
echo useradd$i
useradd -g gstu gstu$i -m 
echo gstu$i:123cmosiki > passwd.txt
chpasswd < passwd.txt
pwconv
rm passwd.txt
done


