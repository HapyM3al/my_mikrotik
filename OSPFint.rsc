
# schedule every 2min. cli at the bottom. 

:delay 5s

:if ([:len [/routing ospf interface find interface=<name1> network-type=point-to-point ]] < 1) do={/routing ospf interface add interface=<name1> network-type=point-to-point}
:if ([:len [/routing ospf interface find interface=<name2> network-type=point-to-point ]] < 1) do={/routing ospf interface add interface=<name2> network-type=point-to-point}
:if ([:len [/routing ospf interface find interface=<name3> network-type=point-to-point ]] < 1) do={/routing ospf interface add interface=<name3> network-type=point-to-point}


###############################
/system script 
add dont-require-permissions=no name=OSPFint owner=admin policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive source="/routing ospf interface set 0 interface=<ovpn-welverdiend>\r\
    \n\r\
    \n:delay 5s\r\
    \n\r\
    \n:if ([:len [/routing ospf interface find interface=<name1> network-type=point-to-point ]] < 1) do={/routing ospf interface add interface=<name1> network-type=point-to-point}\r\
    \n:if ([:len [/routing ospf interface find interface=<name2> network-type=point-to-point ]] < 1) do={/routing ospf interface add interface=<name2> network-type=point-to-point}\r\
    \n:if ([:len [/routing ospf interface find interface=<name3> network-type=point-to-point ]] < 1) do={/routing ospf interface add interface=<name3> network-type=point-to-point}"
/system scheduler
add comment="Set OSPF dynamic interface" interval=2m name=ospfintset on-event=OSPFint policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive start-date=jan/01/1970 start-time=00:00:00
