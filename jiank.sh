#!/bin/bash
#ps -eo %mem,ucmd | awk '{mem[$2]+=$1}END{for(i in mem)print mem[i],i}' | sort -n |column -t
green="\033[32m"
default="\033[0m"
red="\033[31m"
cpu=`uptime |awk '{print $NF}'` 
echo "本机最近15分钟的负载为:"$cpu"%"
rwk=`ifconfig eth0 | awk '/RX p/{print $5}'`
echo "入站网卡流量为:"$rwk"字节"
cwk=`ifconfig eth0 | awk '/TX p/{print $5}'`
echo "出站网卡流量为:"$cwk"字节"
free=`free | awk 'NR==2{print $4}'`
echo "空闲内存为:"$free"字节"
cipan=`df -h | awk '/\/$/{print $4}'`
echo "磁盘剩余流量为:"$cipan
yonghu=`cat /etc/passwd | wc -l`
echo "计算机用户数量:"$yonghu
delu=`who | awk 'END{print NR}'`
echo "当前登录用户为:"$delu
jc=`ps aux | wc -l`
if [ $jc -gt 300 ];then
echo  -e "总进程数量为:${red}${jc}${default} "
else
echo -e "总进程数量为:${green}${jc}${default}"
fi
azb=`rpm -qa | wc -l`
echo "本机已安装软件包:"$azb"个"
