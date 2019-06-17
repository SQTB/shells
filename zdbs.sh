#!/bin/bash
#$1主机名 $2网卡名 $网段 $ip
if [ $3 -eq  4 ];then
expect << EOF
spawn virsh console $1
expect "]" {send "\r"} 
expect "login:" {send "root\r"}
expect "密码：" {send "123456\r"}
expect "#" {send "nmcli connection modify '$2' ipv4.method manual ipv4.addresses '192.168.'$3'.'$4'/24' connection.autoconnect yes\r"}
expect "#" {send "nmcli connection up $2\r"} 
expect "#" {send "rm -rf /etc/yum.repos.d/*.repo\r"}
expect "#" {send "yum-config-manager --add ftp://192.168.'$3'.254/centos-1804 \r"}
expect "#" {send "echo 'gpgcheck=0' >> /etc/yum.repos.d/192.168.'$3'.254_centos-1804 .repo\r"}
expect "#" {send "exit\r"}
expect "#" {send "exit\r"}
EOF
elif [ $3 -eq 2 ];then
expect << EOF
spawn virsh console $1
expect "]" {send "\r"} 
expect "login:" {send "root\r"}
expect "密码：" {send "123456\r"}
expect "#" {send "nmcli connection add type ethernet con-name $2  ifname  eth1 connection.autoconnect yes\r"}
expect "#" {send "nmcli connection modify '$2' ipv4.method manual ipv4.addresses '192.168.'$3'.'$4'/24' connection.autoconnect yes\r"}
expect "#" {send "nmcli connection up $2\r"} 
expect "#" {send "rm -rf /etc/yum.repos.d/*.repo\r"}
expect "#" {send "yum-config-manager --add ftp://192.168.'$3'.254/centos-1804 \r"}
expect "#" {send "echo gpgcheck=0 >> /etc/yum.repos.d/192.168.'$3'.254_centos-1804 .repo\r"}
expect "#" {send "exit\r"}
expect "#" {send "exit\r"}
EOF
fi

