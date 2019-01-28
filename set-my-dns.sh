#!/bin/bash
if [[ $# -eq 0 ]] ; then
    echo 'USAGE: set-my-dns [on | off]'
    echo 'Current:'
    scutil --dns | grep nameserver
    exit 0
fi

list="1.1.1.1 8.8.8.8 8.8.4.4 208.67.222.222 208.67.220.220"

if [ $1 = "off" ]; then
    #echo "resetting to DHCP"
    networksetup -setdnsservers Wi-Fi empty
    current=$(scutil --dns | grep nameserver)
else
    #echo "setting custom DNS"
    networksetup -setdnsservers Wi-Fi $list
    current=$(networksetup -getdnsservers Wi-Fi)
fi

echo $current

#networksetup -getdnsservers Wi-Fi
#nslookup google.com | grep Server