# some inserts. 

# this is fine for login to router and the varvalue needs to be whatever group name in /user/group

dump: INSERT INTO `radreply` VALUES (1,'username','Mikrotik-Group',':=','full');

insert into radreply (username,attribute,op,value) VALUES ('usenrame','Mikrotik-Group',':=','full') ;

# add new username, winbox works with chap and ssh something else however for both to work need cleartext-password yay mikrotik.

INSERT INTO `radcheck` VALUES (1,'username','Cleartext-Password',':=','password');

# add nas

dump: INSERT INTO `nas` VALUES (1,'10.50.0.1','name','other',0,'secret',NULL,NULL,'desc'),(2,'127.0.0.1','testing123','other',0,'testing123',NULL,NULL,'localhost'),(3,'10.50.0.20','name','other',0,'ruckustesting',NULL,NULL,'ruckus_ap');

INSERT INTO nas (nasname,shortname,type,ports,secret,server,community,description) values ('10.50.0.20','name','other',0,'ruckustesting',NULL,NULL,'ruckus_ap')
INSERT INTO nas (nasname,shortname,type,ports,secret,server,community,description) VALUES ('10.50.0.1','name','other','0','secret',NULL,NULL,'desc');

# the above actually also works for 802.1X auth. brilliant I know. 

# https://wiki.mikrotik.com/wiki/Manual:RADIUS_Client#Supported_RADIUS_Attributes
# you can make data allocations and so on, ill add this at a later stage. 
