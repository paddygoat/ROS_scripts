#!/bin/bash
# 
# cd /home/paddy/Desktop/RoboController/ && bash find_computers_on_network.sh

# sudo apt-get install nmap
# nmap -sn 192.168.3.0/24
# ping dog01.local -c 1
# ping nest01.local -c 1
# ping quadrosbot.local -c -1   .... This is the camera streamer.
# echo 192.168.3.{1..254}|xargs -n1 -P0 ping -c1|grep "bytes from"
# ssh -Y pi@192.168.3.103

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo "dog01 ip address:"
dog=$(ping -c 1 dog01.local | grep "64 bytes from " | awk '{print $4}' | cut -d":" -f1)
echo $dog

echo "nest01 ip address:"
nest=$(ping -c 1 nest01.local | grep "64 bytes from " | awk '{print $4}' | cut -d":" -f1)
echo $nest

printf "${GREEN}Now generate some keys .... ${NC}\n"
echo ""

# ssh-keygen -f "/home/paddy/.ssh/known_hosts" -R $dog
# ssh-keygen -f "/home/paddy/.ssh/known_hosts" -R $nest

printf "${GREEN}Now open some more tabs ....${NC}\n"
echo ""

gnome-terminal --geometry=70x35-0+0 -- bash -c "sshpass -p "piratesrus" ssh -Y pi@$nest -o StrictHostKeyChecking=no \
./str2str.sh \
; exec bash"
sleep 2

gnome-terminal --geometry=70x35-800+0 -- bash -c "sshpass -p "piratesrus" ssh -Y pi@$dog -o StrictHostKeyChecking=no \
./str2str.sh \
; exec bash"






# --tab -e "bash -c 'date; read -n1' " \
# --tab -e "bash -c 'sleep 5; date; read -n1' " \
# --tab -e "bash -c 'sleep 5; echo $dog; read -n1' " \
# --tab


# sshpass -p "piratesrus" ssh -Y pi@$nest -o StrictHostKeyChecking=no


# $ ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no <user>@<host>


# echo "Finished"
# for ip in $(seq 1 14); do ping -c 1 172.20.10.$ip>/dev/null; 
    # [ $? -eq 0 ] && echo "172.20.10.$ip UP" || : ;
# done

# 172.20.10.1

# sudo apt-get install nmap

# nmap -sP 172.20.10.0/24

# nmap -sn 192.168.3.0/24

###
# Starting Nmap 7.60 ( https://nmap.org ) at 2021-02-18 09:26 GMT
# Nmap scan report for _gateway (172.20.10.1)
# Host is up (0.010s latency).
# Nmap scan report for nobody (172.20.10.12)
# Host is up (0.00049s latency).
###

# ssh -Y pi@172.20.10.2
# ssh -Y pi@172.20.10.4

# ping 172.20.10.2 -n 1

# ping dog01.local -n 1




# and
# ping nest01.local

# you must have mdns running on your computer..windows probably won't be able to see the by name and
# ping dog01.local will fail. When we get better network router, i can see it to always get the same ip address
# the user is pi@dog01.local and pi@nest01.local

# avahi-browse -at

# paddy@nobody:~$ ssh -Y pi@172.20.10.2
# paddy@nobody:~$ ssh -Y pi@172.20.10.4


