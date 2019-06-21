#!/bin/bash
for i in 50 51 52 53 54 55
do
scp /linux-soft/03/mysql/mysql-5.7.17.tar root@192.168.4.$i:/root
ssh root@192.168.4.$i "tar -xf mysql-5.7.17.tar;yum -y install  mysql-community-*.rpm;systemctl restart mysqld"
done
