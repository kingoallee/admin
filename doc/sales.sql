/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : 192.168.144.128:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-02-01 18:30:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `postid` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `tag_id` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `updatetime` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', '12', '1', '1', '11', '122', '1', '2019-02-01 02:28:43', '2019-02-01 02:29:00', null);

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '2',
  `sort` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('1', 'APP', 'System', '2', '1');

-- ----------------------------
-- Table structure for node
-- ----------------------------
DROP TABLE IF EXISTS `node`;
CREATE TABLE `node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT '1',
  `pid` bigint(20) NOT NULL DEFAULT '0',
  `remark` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of node
-- ----------------------------
INSERT INTO `node` VALUES ('1', 'RBAC', 'rbac', '1', '0', '', '2', '1');
INSERT INTO `node` VALUES ('2', 'Node', 'node/index', '2', '1', '', '2', '1');
INSERT INTO `node` VALUES ('3', 'node list', 'index', '3', '2', '', '2', '1');
INSERT INTO `node` VALUES ('4', 'add or edit', 'AddAndEdit', '3', '2', '', '2', '1');
INSERT INTO `node` VALUES ('5', 'del node', 'DelNode', '3', '2', '', '2', '1');
INSERT INTO `node` VALUES ('6', 'User', 'user/index', '2', '1', '', '2', '1');
INSERT INTO `node` VALUES ('7', 'user list', 'Index', '3', '6', '', '2', '1');
INSERT INTO `node` VALUES ('8', 'add user', 'AddUser', '3', '6', '', '2', '1');
INSERT INTO `node` VALUES ('9', 'update user', 'UpdateUser', '3', '6', '', '2', '1');
INSERT INTO `node` VALUES ('10', 'del user', 'DelUser', '3', '6', '', '2', '1');
INSERT INTO `node` VALUES ('11', 'Group', 'group/index', '2', '1', '', '2', '1');
INSERT INTO `node` VALUES ('12', 'group list', 'index', '3', '11', '', '2', '1');
INSERT INTO `node` VALUES ('13', 'add group', 'AddGroup', '3', '11', '', '2', '1');
INSERT INTO `node` VALUES ('14', 'update group', 'UpdateGroup', '3', '11', '', '2', '1');
INSERT INTO `node` VALUES ('15', 'del group', 'DelGroup', '3', '11', '', '2', '1');
INSERT INTO `node` VALUES ('16', 'Role', 'role/index', '2', '1', '', '2', '1');
INSERT INTO `node` VALUES ('17', 'role list', 'index', '3', '16', '', '2', '1');
INSERT INTO `node` VALUES ('18', 'add or edit', 'AddAndEdit', '3', '16', '', '2', '1');
INSERT INTO `node` VALUES ('19', 'del role', 'DelRole', '3', '16', '', '2', '1');
INSERT INTO `node` VALUES ('20', 'get roles', 'Getlist', '3', '16', '', '2', '1');
INSERT INTO `node` VALUES ('21', 'show access', 'AccessToNode', '3', '16', '', '2', '1');
INSERT INTO `node` VALUES ('22', 'add accsee', 'AddAccess', '3', '16', '', '2', '1');
INSERT INTO `node` VALUES ('23', 'show role to userlist', 'RoleToUserList', '3', '16', '', '2', '1');
INSERT INTO `node` VALUES ('24', 'add role to user', 'AddRoleToUser', '3', '16', '', '2', '1');

-- ----------------------------
-- Table structure for node_roles
-- ----------------------------
DROP TABLE IF EXISTS `node_roles`;
CREATE TABLE `node_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `node_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of node_roles
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `approvalnumber` varchar(255) DEFAULT NULL,
  `production_date` varchar(255) DEFAULT NULL,
  `productionbatch` varchar(255) DEFAULT NULL,
  `shelf_life` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `updatetime` varchar(255) DEFAULT NULL,
  `salespd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '12', '1', '1', '2019-02-01', '1', '1', '1', '2019-02-01 02:09:29', '', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `remark` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'Admin role', 'Admin', 'I\'m a admin role', '2');

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `client` int(11) DEFAULT NULL,
  `sales_phone` varchar(255) DEFAULT NULL,
  `sales_address` varchar(255) DEFAULT NULL,
  `sales_postid` varchar(255) DEFAULT NULL,
  `salespd` varchar(255) DEFAULT NULL,
  `sales_data` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `express` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO `sales` VALUES ('3', '1', '1', '1', '1', '1', '1', '2019-02-01 02:18:52', '成功', '1', '1');
INSERT INTO `sales` VALUES ('4', '2', '2', '2', '2', '2', '2', '2019-02-01 02:18:52', '成功', '2', '2');
INSERT INTO `sales` VALUES ('5', '1', null, '1', '1', '11', null, '2019-02-01 15:59:43', '成功', '', null);
INSERT INTO `sales` VALUES ('6', '1', null, '1', '1', '11', null, '2019-02-01 16:00:36', '成功', '', null);
INSERT INTO `sales` VALUES ('7', '1', null, '1', '1', '11', null, '2019-02-01 16:01:48', '成功', '', null);

-- ----------------------------
-- Table structure for salespd
-- ----------------------------
DROP TABLE IF EXISTS `salespd`;
CREATE TABLE `salespd` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sales_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `unitprice` varchar(255) DEFAULT NULL,
  `totail` varchar(255) DEFAULT NULL,
  `sales_pdname` varchar(255) DEFAULT NULL,
  `sales_pdapnu` varchar(255) DEFAULT NULL,
  `sales_pddate` varchar(255) DEFAULT NULL,
  `sales_pdbatch` varchar(255) DEFAULT NULL,
  `sales_pd_shelflife` varchar(255) DEFAULT NULL,
  `sales_pdmanufacturer` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salespd
-- ----------------------------
INSERT INTO `salespd` VALUES ('7', '1', '1', '1', '123', null, '2019-02-01 02:18:52', '成功', '', null, null, null);
INSERT INTO `salespd` VALUES ('8', '2', '1', '12', '12', '12', '1', '2019-02-01', '1', '1', '1', '1');
INSERT INTO `salespd` VALUES ('9', '5', '1', '12', '12', '12', '1', '2019-02-01', '1', '1', '1', '1');
INSERT INTO `salespd` VALUES ('10', '6', '1', '122', '122', '12', '1', '2019-02-01', '1', '1', '1', '1');
INSERT INTO `salespd` VALUES ('11', '7', '1', '122', '244', '12', '1', '2019-02-01', '1', '1', '1', '2');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', '12', null);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', '3232235905');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `nikename` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(32) NOT NULL DEFAULT '',
  `remark` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `lastlogintime` datetime DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `pwd` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `nickname` (`nikename`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '929c23a0695bd27e0cc160dfbd3837df', '34', 'osgochina@gmail.com', 'I\'m admin', '2', null, '2019-01-31 16:18:59', '', '');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
