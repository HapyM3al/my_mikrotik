# my_mikrotik
all my mikrotik scripts and guides. 

## messagetoslack

this is based off http://jeremyhall.com.au/mikrotik-routeros-slack-messaging-hack/ however this is outdated, id rather use webhooks and mikrotik fortunately now supports posting data to a url. 

## OSPFint

this is because point to point OSPF with mikrotik seems to be pretty garbage. If interface drops and comes back up interface on OSPF goes to unknown. added script to look for those interfaces for you and add them right. Honestly, just rather use BGP, its easier. 
