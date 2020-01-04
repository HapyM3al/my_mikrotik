#logging

/system logging
add action=name topics=critical
add action=name topics=error
add action=name topics=info,!dhcp,!hotspot,!wireless,!script,!pppoe
add action=name topics=warning,!dhcp
