#!/bin/bash
for i in 50 51 52 53 54 55
do
ssh root@192.168.4.$i 
"scp /linux-soft/03/mysql/mysql-5.7.17.tar;
tar -xf mysql-5.7.17;
yum -y install  mysql-community-*.rpm;
syetemctl restart mysqld
"
done
