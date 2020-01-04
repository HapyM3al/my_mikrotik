# tested on 6.44.6 and 6.45.6

:global lastTime
:global messageencoded ""
:global output
 
:local identity [/system identity get name] 
:local currentIP [:resolve myip.opendns.com server=208.67.222.222];
 
:local currentBuf [ :toarray [ /log find topics~"critical" || message~"login failure" || message~"disabled" || message~"pptp" || message~"sit1" || message~"[Ff]ailure" ] ] ;
:local currentLineCount [ :len $currentBuf ] ;
 
if ($currentLineCount > 0) do={
   :local currentTime "$[ /log get [ :pick $currentBuf ($currentLineCount -1) ] time ]";
 
   :if ([:len $currentTime] = 15 ) do={
      :set currentTime [ :pick $currentTime 7 15 ];
   }
   
   :set output "$currentTime - $[/log get [ :pick $currentBuf ($currentLineCount-1) ] message ]";
 
#replace ASCII characters with URL encoded characters
 
:for i from=0 to=([:len $output] - 1) do={ 
  :local char [:pick $output $i]
  :if ($char = " ") do={
   :set $char "%20"
 }
  :if ($char = "-") do={
    :set $char "%2D"
  }
  :if ($char = "#") do={
    :set $char "%23"
  }
  :if ($char = "+") do={
    :set $char "%2B"
  }
  :set messageencoded ($messageencoded . $char)
}
 
# here is new and improved way to alert to a specific channel. I have added current IP and router identity as we deploy routers in the field and these kinds of things might not be known, so our NOC can see current Public IP and login as needed. 

   :if (([:len $lastTime] < 1) || (([:len $lastTime] > 0) && ($lastTime != $currentTime))) do={
      :set lastTime $currentTime ;
     /tool fetch mode=https url="yourwebhookurlhere" http-method=post http-data="payload={\"attachments\": [ { \"title\": \"$identity Notification!\", \"text\": \":worried: Current IP: $currentIP $messageencoded\",  \"color\": \"warning\" } ] }";
   }
}
