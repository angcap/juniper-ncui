/* Juniper ncui raw package  

This binary not relate or work fork from Juniper network INC. 

thus use with you own risk. i not claim or warranty anything. with an effect 
that happen after use this binary. if you have problem should you talk with 
Juniper Support network or ask expert from  Community instead.


My intendtion from My Ubuntu 11.10 can't connect to network thus i intercept
installation step and copy installation files relate guide from:

http://kb.juniper.net/InfoCenter/index?page=content&id=KB16188

you can get binary package file from 

http://clune.org/juniper_linux.html
*/

VPN works on Ubuntu 19.04 if ipv6 kernel autoconfiguration /proc/sys/net/ipv6/conf/default/router_solicitations is disabled (issuing echo 0 > /proc/sys/net/ipv6/conf/default/router_solicitations as root once before starting the VPN. When the system is restarted the command needs to be reissued, alternatively the configuration can be made permanent in /etc/sysctl.conf).


File detail : 

* getx509certificate.sh  : get X509 authoritie from you site 
  sh getx509certificate.sh <YOUR HOST >  < OUTPUT FILE> 
    - if you are behind a corporate network firewall you need to set up a proxytunnel on port 443: sudo proxytunnel -p proxyhost:proxyport -P proxyuser:proxypass -d vpnhost -a 443
    - then user localhost as YOUR HOST.
    - NOTE: escape special characters in your password with backslash (es. Password$1 must be Password\$1)

* ncdiag : Binary file use to check ncsvc service and relate are install correctly

  usage: ./ncdiag -A [or]
    usage: ./ncdiag -i -s -d -t -h -a -r <hostname> -k -v
         -A : All tests
         -i : installation test
         -s : service test 
         -d : driver tests 
         -t : tunnel test 
         -h : host info 
         -a : adaptor test 
         -r : resolve host 
         -k : kill NC gui 
         -v : version 

* ncLinuxApp.jar : zip package install files

* ncsvc : Binary network connection service
 To properly set permission, change the ownership to root and then give execution e suid permissions:
 - sudo chown root:root ncsvc
 - sudo chmod 6711 ncsvc

* ncsvc.sh: Very simple bash script to start the VPN connection, it fetches properties defined in .ncssvcrc and use them as connection parameters. Use ./ncsvc -K top stop the VPN


* .ncsvcrc: Configuration file used by ncsvc.sh to hold connection parameters, escape password special characters with \ (a backslash).
 - parameters:
vpnhost=
vpnrealm=
vpnuser=
vpnpass=
vpncertfile=
vpnurl=
proxyhost=
proxyport=
proxyuser=
proxypass=

 
* NC.jar : UI use to connect - requires several i686 libs

**NOTE:** from my Ubuntu 11.10 UI not load correctly but connect work fine

Java: 

java version "1.6.0_23"
OpenJDK Runtime Environment (IcedTea6 1.11pre) (6b23~pre11-0ubuntu1.11.10)
OpenJDK 64-Bit Server VM (build 20.0-b11, mixed mode)

ncsvc version: 
Juniper Network Connect Server for Linux.
Version         : 7.1
Release Version : 7.1-0-Build18193
Build Date/time : Apr 25 2011 04:10:28 
Copyright 2001-2010 Juniper Networks

usage: 

1. use getx509certificate.sh to get user authoritie certificate from your site
and save named as what you need

2. create connection properties file .ncsvcrc
3. ./ncsvc.sh

4. optionally check with 'ncdiag' command to verify everything is ok 
5. Joy your work! 

