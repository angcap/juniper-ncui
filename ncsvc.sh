#!/bin/bash

SETTINGS_FILE=.ncsvcrc

echo "** EXECUTE as root this command:
echo 0 > /proc/sys/net/ipv6/conf/default/router_solicitations
** before launch vpn, otherwise no packet will be received!
**
** After connection check the /etc/resolv.conf file, add piemonte.it to search domains (search csi.it piemonte.it)
"

if [ -f $SETTINGS_FILE ];then
    . $SETTINGS_FILE
else
   echo "unable to locate setting file $SETTINGS_FILE"
   exit -1
fi

if [ -z $proxyhost ];then
	echo "connecting without proxy"
	./ncsvc -h $vpnhost -u $vpnuser  -p $vpnpass -r $vpnrealm -f $vpncertfile -U $vpnurl &

else
	echo "connecting using proxy $proxyhost"
	./ncsvc -h $vpnhost -u $vpnuser  -p $vpnpass -r $vpnrealm -f $vpncertfile -U $vpnurl -y $proxyhost -z $proxyport -s $proxyuser -a $proxypass &

fi


