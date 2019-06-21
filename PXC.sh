#!/bin/bash

for i in 12 ; 
do
scp '/home/student/桌面/PXC.tar.gz'  root@192.168.4.$i:/root;
ssh root@192.168.4.$i "tar -xf /root/PXC.tar.gz"; 
ssh root@192.168.4.$i "rpm -ivh /root/PXC/libev-4.15-1.el6.rf.x86_64.rpm"; 
ssh root@192.168.4.$i "yum -y install /root/PXC/percona-xtrabackup-24-2.4.13-1.el7.x86_64.rpm"; 
ssh root@192.168.4.$i "rpm -ivh /root/PXC/qpress-1.1-14.11.x86_64.rpm"; 
ssh root@192.168.4.$i "tar -xf /root/PXC/Percona-XtraDB-Cluster-5.7.25-31.35-r463-el7-x86_64-bundle.tar"; 
ssh root@192.168.4.$i "yum -y install Percona-XtraDB-Cluster-*.rpm"; 
done
