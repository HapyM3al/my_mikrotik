# all db tables meeded for freeradius. 

CREATE TABLE `nas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nasname` varchar(128) NOT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT 'other',
  `ports` int(5) DEFAULT NULL,
  `secret` varchar(60) NOT NULL DEFAULT 'secret',
  `community` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT 'RADIUS Client',
  PRIMARY KEY (`id`),
  KEY `nasname` (`nasname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `radacct` (
  `RadAcctId` bigint(21) NOT NULL AUTO_INCREMENT,
  `AcctSessionId` varchar(32) NOT NULL DEFAULT '',
  `AcctUniqueId` varchar(32) NOT NULL DEFAULT '',
  `UserName` varchar(64) NOT NULL DEFAULT '',
  `Realm` varchar(64) DEFAULT '',
  `NASIPAddress` varchar(15) NOT NULL DEFAULT '',
  `NASPortId` int(12) DEFAULT NULL,
  `NASPortType` varchar(32) DEFAULT NULL,
  `AcctStartTime` datetime NOT NULL DEFAULT '2019-01-01 00:00:01',
  `AcctStopTime` datetime NOT NULL DEFAULT '2019-01-01 00:00:01',
  `AcctSessionTime` int(12) DEFAULT NULL,
  `AcctAuthentic` varchar(32) DEFAULT NULL,
  `ConnectInfo_start` varchar(32) DEFAULT NULL,
  `ConnectInfo_stop` varchar(32) DEFAULT NULL,
  `AcctInputOctets` bigint(12) DEFAULT NULL,
  `AcctOutputOctets` bigint(12) DEFAULT NULL,
  `CalledStationId` varchar(50) NOT NULL DEFAULT '',
  `CallingStationId` varchar(50) NOT NULL DEFAULT '',
  `AcctTerminateCause` varchar(32) NOT NULL DEFAULT '',
  `ServiceType` varchar(32) DEFAULT NULL,
  `FramedProtocol` varchar(32) DEFAULT NULL,
  `FramedIPAddress` varchar(15) NOT NULL DEFAULT '',
  `AcctStartDelay` int(12) DEFAULT NULL,
  `AcctStopDelay` int(12) DEFAULT NULL,
  PRIMARY KEY (`RadAcctId`),
  KEY `UserName` (`UserName`),
  KEY `FramedIPAddress` (`FramedIPAddress`),
  KEY `AcctSessionId` (`AcctSessionId`),
  KEY `AcctUniqueId` (`AcctUniqueId`),
  KEY `AcctStartTime` (`AcctStartTime`),
  KEY `AcctStopTime` (`AcctStopTime`),
  KEY `NASIPAddress` (`NASIPAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `radcheck` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `UserName` varchar(64) NOT NULL DEFAULT '',
  `Attribute` varchar(32) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '==',
  `Value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `UserName` (`UserName`(32))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
                  
CREATE TABLE `radgroupcheck` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(64) NOT NULL DEFAULT '',
  `Attribute` varchar(32) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '==',
  `Value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `GroupName` (`GroupName`(32))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
                   
CREATE TABLE `radgroupreply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(64) NOT NULL DEFAULT '',
  `Attribute` varchar(32) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '=',
  `Value` varchar(253) NOT NULL DEFAULT '',
  `prio` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `GroupName` (`GroupName`(32))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
                   
CREATE TABLE `radpostauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(64) NOT NULL DEFAULT '',
  `pass` varchar(64) NOT NULL DEFAULT '',
  `reply` varchar(32) NOT NULL DEFAULT '',
  `date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
                   
CREATE TABLE `radreply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `UserName` varchar(64) NOT NULL DEFAULT '',
  `Attribute` varchar(32) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '=',
  `Value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `UserName` (`UserName`(32))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
                  
CREATE TABLE `usergroup` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `UserName` varchar(64) NOT NULL DEFAULT '',
  `GroupName` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `UserName` (`UserName`(32))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;                  

CREATE TABLE `radusergroup` (
  `username` varchar(64) NOT NULL DEFAULT '',
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '1',
  KEY `username` (`username`(32))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
                  
                  
