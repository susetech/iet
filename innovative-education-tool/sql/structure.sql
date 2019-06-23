CREATE TABLE IF NOT EXISTS `menu_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) unsigned DEFAULT NULL,
  `moduleId` int(11) unsigned NOT NULL,
  `displayNameKey` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `pathType` tinyint(1) DEFAULT NULL,
  `path` varchar(500) NOT NULL,
  `menuType` tinyint(1) NOT NULL,
  `targetType` tinyint(1) NOT NULL,
  `targetLocation` tinyint(1) NOT NULL,
  `permission` varchar(150) DEFAULT NULL,
  `sortOrder` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `moduleId` (`moduleId`),
  KEY `parentId` (`parentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu_permission`
--

CREATE TABLE IF NOT EXISTS `menu_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` int(11) unsigned NOT NULL,
  `permission` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menuId` (`menuId`),
  KEY `permission` (`permission`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE IF NOT EXISTS `module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `appCode` varchar(3) NOT NULL,
  `moduleCode` varchar(3) NOT NULL,
  `pkgName` varchar(50) NOT NULL,
  `moduleName` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>Active,0=>Inactive',
  `createdBy` int(11) unsigned DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedBy` int(11) unsigned DEFAULT NULL,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `appCode` (`appCode`,`moduleCode`),
  UNIQUE KEY `pkgName` (`pkgName`),
  UNIQUE KEY `moduleName` (`moduleName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `org`
--

CREATE TABLE IF NOT EXISTS `org` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `orgTypeId` int(11) unsigned NOT NULL,
  `tenantId` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `parentId` int(11) unsigned DEFAULT NULL,
  `currencyCode` varchar(10) NOT NULL,
  `languageCode` varchar(10) NOT NULL,
  `countryCode` varchar(10) NOT NULL,
  `label` varchar(50) NOT NULL,
  `labelIndex` int(11) DEFAULT NULL,
  `address1` varchar(250) NOT NULL,
  `address2` varchar(250) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pinCode` varchar(10) DEFAULT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '0',
  `createdBy` int(11) unsigned DEFAULT NULL,
  `createdDate` timestamp NULL DEFAULT NULL,
  `modifiedBy` int(11) unsigned DEFAULT NULL,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`tenantId`,`name`),
  KEY `countryCode` (`countryCode`),
  KEY `organization_ibfk_1` (`orgTypeId`),
  KEY `organization_ibfk_2` (`currencyCode`),
  KEY `organization_ibfk_4` (`languageCode`),
  KEY `organization_ibfk_5` (`parentId`),
  KEY `name_2` (`name`),
  KEY `valid` (`valid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `org_type`
--

CREATE TABLE IF NOT EXISTS `org_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `hasChildren` tinyint(1) NOT NULL DEFAULT '1',
  `allowUserMembership` tinyint(1) NOT NULL DEFAULT '1',
  `createdBy` int(11) unsigned DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedBy` int(11) unsigned DEFAULT NULL,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `orgId` int(11) unsigned DEFAULT NULL COMMENT 'can be null for standard(not editable) roles',
  `name` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT '',
  `custom` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>custom,0=>standard',
  `createdBy` int(11) unsigned DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedBy` int(11) unsigned DEFAULT NULL,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`orgId`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE IF NOT EXISTS `role_permission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `roleId` int(11) unsigned NOT NULL,
  `permissionId` int(11) unsigned NOT NULL,
  `createdBy` int(11) unsigned DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedBy` int(11) unsigned DEFAULT NULL,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roleId_permission` (`roleId`,`permissionId`),
  KEY `roleId` (`roleId`),
  KEY `role_permission_ibfk_2` (`permissionId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tenant`
--

CREATE TABLE IF NOT EXISTS `tenant` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `currencyCode` varchar(10) NOT NULL,
  `languageCode` varchar(10) NOT NULL,
  `countryCode` varchar(10) NOT NULL,
  `address1` varchar(250) NOT NULL,
  `address2` varchar(250) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pinCode` varchar(10) DEFAULT NULL,
  `createdBy` int(11) unsigned DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedBy` int(11) unsigned DEFAULT NULL,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `currency` (`currencyCode`),
  KEY `languageCode` (`languageCode`),
  KEY `country` (`countryCode`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE IF NOT EXISTS `user_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tenantId` int(11) unsigned NOT NULL,
  `orgId` int(11) unsigned NOT NULL,
  `userType` int(10) unsigned DEFAULT NULL,
  `userName` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `firstName` varchar(100) NOT NULL,
  `middleName` varchar(100) DEFAULT '',
  `lastName` varchar(100) DEFAULT '',
  `dob` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contactNo` varchar(20) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL COMMENT '1-> MALE, 2->FEMALE',
  `activationCode` varchar(250) DEFAULT NULL,
  `confirmationCode` varchar(250) DEFAULT NULL,
  `passwordExpired` tinyint(1) NOT NULL DEFAULT '0',
  `passwordExpiryDate` date DEFAULT NULL,
  `passwordResetLinkSent` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginHostName` varchar(100) DEFAULT NULL,
  `failedAttempts` int(11) NOT NULL DEFAULT '0',
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userName` (`userName`),
  KEY `user_account_ibfk_1` (`tenantId`),
  KEY `user_account_ibfk_2` (`orgId`),
  KEY `passwordExpired` (`passwordExpired`),
  KEY `passwordExpired_2` (`passwordExpired`),
  KEY `passwordExpiryDate` (`passwordExpiryDate`),
  KEY `userType` (`userType`),
  KEY `passwordResetLinkSent` (`passwordResetLinkSent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned NOT NULL,
  `orgId` int(11) unsigned NOT NULL,
  `roleId` int(11) unsigned NOT NULL,
  `createdBy` int(11) unsigned DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedBy` int(11) unsigned DEFAULT NULL,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_org_Id` (`orgId`,`userId`,`roleId`),
  KEY `user_role_ibfk_1` (`userId`),
  KEY `user_role_ibfk_3` (`roleId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE IF NOT EXISTS `user_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu_permission`
--
ALTER TABLE `menu_permission`
  ADD CONSTRAINT `menu_permission_ibfk_1` FOREIGN KEY (`menuId`) REFERENCES `menu_item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `menu_permission_ibfk_2` FOREIGN KEY (`permission`) REFERENCES `permission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `org`
--
ALTER TABLE `org`
  ADD CONSTRAINT `organization_ibfk_1` FOREIGN KEY (`orgTypeId`) REFERENCES `org_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `organization_ibfk_2` FOREIGN KEY (`currencyCode`) REFERENCES `currency` (`isoCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `organization_ibfk_3` FOREIGN KEY (`tenantId`) REFERENCES `tenant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `organization_ibfk_4` FOREIGN KEY (`languageCode`) REFERENCES `language` (`isoCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `organization_ibfk_5` FOREIGN KEY (`parentId`) REFERENCES `org` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `organization_ibfk_6` FOREIGN KEY (`countryCode`) REFERENCES `country` (`isoCode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `role_ibfk_1` FOREIGN KEY (`orgId`) REFERENCES `org` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tenant`
--
ALTER TABLE `tenant`
  ADD CONSTRAINT `tenant_ibfk_1` FOREIGN KEY (`currencyCode`) REFERENCES `currency` (`isoCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tenant_ibfk_2` FOREIGN KEY (`languageCode`) REFERENCES `language` (`isoCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tenant_ibfk_3` FOREIGN KEY (`countryCode`) REFERENCES `country` (`isoCode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `user_account_ibfk_1` FOREIGN KEY (`tenantId`) REFERENCES `tenant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_account_ibfk_2` FOREIGN KEY (`orgId`) REFERENCES `org` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`orgId`) REFERENCES `org` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_role_ibfk_3` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;