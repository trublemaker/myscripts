#!/bin/sh

### Custom user script
### Called after internal WAN up/down action
### $1 - WAN action (up/down)
### $2 - WAN interface name (e.g. eth3 or ppp0)
### $3 - WAN IPv4 address

echo "`date` $1 $2 $3" >> /tmp/wan.log

if [ "up" = "$1" ]
then
    udpxy=`ps | grep udpxy| grep -v grep` 
    if [ "" = "$udpxy" ]                  
    then                                  
        udpxy -p 4000 -c 10 -m eth3.9
        cd /etc/storage/xupnpd
        ./xupnpd
    fi
fi

if [ "$1" = "down" ]
then

fi
