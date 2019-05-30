#!/bin/bash


for i in `cat /tmp/userlist`
do
useradd $i
mkdir -p /home/$i/.ssh/
chown -R $i:$i /home/$i/
ssh-keygen -t rsa -f /home/$i/.ssh/$i -q -P ""
chown -R $i:$i /home/$i/
mv /home/$i/.ssh/$i.pub /home/$i/.ssh/authorized_keys
cp /home/$i/.ssh/$i /tmp/
echo " Private key is available here /tmp "
su $i -c "google-authenticator -t -d -f -r 3 -R 30 -w 17 " > /tmp/$i.auth
done

