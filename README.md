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
```
cron config:
```
0 */5 * * * /usr/bin/ansible-playbook /home/ansible/getrouteros.yml --limit @/home/ansible/getrouteros.retry -e "ansible_user=username ansible_ssh_pass=password"
```

## country block

just blocking stuff here with ip firewall address-list this is mainly just my list of cidr that i feel shouldnt be speaking to me at all. 

## syslog

im using freebsd with syslog-ng and port 8514. full config in file below some other things might want, this rotates for 31 days then deletes it, i have about 30 routers running this already and usage isnt much because filtering garbage syslog that dont want from mikrotik topics facility already. 

location:
```
/usr/local/etc/syslog-ng/conf.d/mikrotik.conf
```
using newsyslog for log rotation:
```
/usr/local/etc/newsyslog.conf.d/mikrotik
```

newsyslog config:
```
/var/log/mikrotik/*.log                 644  31    *    @T00  G
```

## telegraf

my telegraf config for mikrotiks, as well the influxdb sql to get uptime/ram used/temp and interface traffic transmitted. 

## freeradius

some freeradius config and how to manage users better and verify auth. This can be used for 802.1X and hotspot/dhcp etc. Tested with hotspot,login and 802.1X. Works alright.
