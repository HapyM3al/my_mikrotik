# Here is basic bgp ive done for a ovpn clients from my router

# my end: 
/routing bgp instance
set default router-id=192.168.252.1
/routing bgp peer
add name=namehere remote-address=192.168.252.222 remote-as=65530 ttl=default

# client side

/routing bgp instance
set default router-id=192.168.252.222
/routing bgp network
add network=192.168.200.0/23 synchronize=no
add network=10.100.12.0/29 synchronize=no
add network=10.100.0.0/24 synchronize=no
/routing bgp peer
add name=namehere remote-address=192.168.252.1 remote-as=65530 ttl=default


# my route table:

35 ADb  10.100.0.0/24                      192.168.252.222         200
36 ADb  10.100.12.0/29                     192.168.252.222         200
55  Db  192.168.200.0/23                   192.168.252.222         200
