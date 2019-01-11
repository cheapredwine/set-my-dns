#!/bin/bash

if [ $1 = "off" ]; then
    echo "resetting to DHCP"
    networksetup -setdnsservers Wi-Fi empty
else
    echo "setting custom DNS"
    networksetup -setdnsservers Wi-Fi 1.1.1.1 8.8.8.8 8.8.4.4
fi

networksetup -getdnsservers Wi-Fi
echo "testing:"
nslookup google.com | grep Server