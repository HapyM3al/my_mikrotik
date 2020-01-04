# some inserts. 

# this is fine for login to router and the varvalue needs to be whatever group name in /user/group

INSERT INTO `radreply` VALUES (1,'username','Mikrotik-Group',':=','full');

# add new username, winbox works with chap and ssh something else however for both to work need cleartext-password yay mikrotik.

INSERT INTO `radcheck` VALUES (1,'username','Cleartext-Password',':=','password');

# the above actually also works for 802.1X auth. brilliant I know. 

# https://wiki.mikrotik.com/wiki/Manual:RADIUS_Client#Supported_RADIUS_Attributes
# you can make data allocations and so on, ill add this at a later stage. 
