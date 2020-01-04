# essentially idea is that when having 2 sims in the mikrotik cannot use both same time you need two radios, this means needs to switch, this also assumes your APN is the same for both sim cards. However its basically change up/down sim and this helps if one provider is garbage for some reason, client can just press and switchover. neat I think

/system routerboard mode-button
set enabled=yes on-event="{\r\
    \n:log info \"Mode Button has been pressed\"\r\
    \n:global simSlot [/system routerboard sim get sim-slot]\r\
    \n:if (\$simSlot=\"down\") do={\r\
    \n            # If \"down\" (home) slot, check roaming status\r\
    \n            :if (\$isRoaming=true) do={\r\
    \n                /system routerboard sim set sim-slot=up\r\
    \n            } else={\r\
    \n                 # Else \"up\" (roaming) slot, check roaming status\r\
    \n                 :if (!\$isRoaming=true) do={\r\
    \n                     /system routerboard sim set sim-slot=down\r\
    \n            }\r\
    \n        }\r\
    \n    }\r\
    \n}"
