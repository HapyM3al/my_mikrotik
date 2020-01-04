# my_mikrotik
all my mikrotik scripts and guides. 

## messagetoslack

this is based off http://jeremyhall.com.au/mikrotik-routeros-slack-messaging-hack/ however this is outdated, id rather use webhooks and mikrotik fortunately now supports posting data to a url. 

## OSPFint

this is because point to point OSPF with mikrotik seems to be pretty garbage. If interface drops and comes back up interface on OSPF goes to unknown. added script to look for those interfaces for you and add them right. Honestly, just rather use BGP, its easier. 

## ltap mini lte mode button

this is probably my favourite one for some reason. its simple enough, the ltap mini has a mode button, this can be programmed to basically do whatever floats your goat. Mine is sim slot changing, this will change sim slot used every time its pressed, this logs a message and as well. It assumes APN is the same for both sims and as well auth method. 

## ansible 

as it says, this is my ansible config, this works perfect for me. this is using routeros_commands. 

how to run script: 
```
/usr/bin/ansible-playbook setsecurity.yml -e 'ansible_user=username ansible_ssh_pass="password" ansible_ssh_port=port'
git
