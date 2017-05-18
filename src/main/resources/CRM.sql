/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50132
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50132
File Encoding         : 65001

Date: 2017-05-18 18:18:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `bid` varchar(32) NOT NULL,
  `uid` int(11) NOT NULL COMMENT 'user id',
  `cid` int(11) DEFAULT NULL COMMENT 'card id',
  `date` datetime DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `appointment` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES ('1', '10', '2', '2017-05-10 17:03:58', '50.00', null, null);
INSERT INTO `business` VALUES ('493D3B413B814970B735035C3943037F', '3', '1', '2017-05-16 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for business_sub
-- ----------------------------
DROP TABLE IF EXISTS `business_sub`;
CREATE TABLE `business_sub` (
  `bsid` int(11) NOT NULL AUTO_INCREMENT,
  `bid` varchar(32) NOT NULL,
  `item_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `appointment` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bsid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_sub
-- ----------------------------
INSERT INTO `business_sub` VALUES ('1', '1', '10000', '1', '2017-05-10 17:03:58', null, null, null);
INSERT INTO `business_sub` VALUES ('2', '1', '10101', '2', '2017-05-10 17:03:58', null, null, null);

-- ----------------------------
-- Table structure for card_category
-- ----------------------------
DROP TABLE IF EXISTS `card_category`;
CREATE TABLE `card_category` (
  `card_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `discount` decimal(10,0) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0-disable;1=enable',
  PRIMARY KEY (`card_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of card_category
-- ----------------------------
INSERT INTO `card_category` VALUES ('1', '金牌卡', '60', '1');
INSERT INTO `card_category` VALUES ('2', '银牌卡', '70', '1');
INSERT INTO `card_category` VALUES ('3', '铜牌卡', '80', '1');
INSERT INTO `card_category` VALUES ('7', 'test card category', '90', '0');

-- ----------------------------
-- Table structure for card_scheme
-- ----------------------------
DROP TABLE IF EXISTS `card_scheme`;
CREATE TABLE `card_scheme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `plus` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `createby` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updateby` varchar(255) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `startfrom` datetime DEFAULT NULL,
  `expireto` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of card_scheme
-- ----------------------------
INSERT INTO `card_scheme` VALUES ('2', 'Name1', '3000.00', '300.00', '3300.00', '80.00', '0', 'admin', '2017-05-18 00:00:00', 'admin1', '2017-05-18 11:38:21', '2017-05-18 11:38:21', '2017-05-18 11:38:21');
INSERT INTO `card_scheme` VALUES ('3', 'setName', '5000.55', '1000.22', '6000.77', '80.00', '1', 'admin', '2017-05-18 00:00:00', null, null, null, '2017-05-18 00:00:00');
INSERT INTO `card_scheme` VALUES ('4', 'setName', '5000.55', '1000.22', '6000.77', null, '1', 'admin', '2017-05-18 00:00:00', null, null, null, '2017-05-18 00:00:00');
INSERT INTO `card_scheme` VALUES ('5', 'scheme1', '2000.00', '1000.00', '3000.00', null, '1', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `rrid` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) DEFAULT NULL,
  `resId` int(11) DEFAULT NULL,
  PRIMARY KEY (`rrid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of role_resource
-- ----------------------------

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `service_id` int(11) NOT NULL,
  `service_pid` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `createby` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updateby` varchar(255) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0-disable;1-enable',
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES ('1', '0', '服务管理', null, null, null, null, null, '1');
INSERT INTO `service` VALUES ('100', '1', '手部', '1.00', null, null, null, null, '1');
INSERT INTO `service` VALUES ('101', '1', '脸部', '2.00', null, null, null, null, '1');
INSERT INTO `service` VALUES ('10000', '100', '手1', '100.00', null, null, null, null, '1');
INSERT INTO `service` VALUES ('10001', '100', '手2', '200.00', null, null, null, null, '1');
INSERT INTO `service` VALUES ('10100', '101', '脸1', '100.00', null, null, null, null, '1');
INSERT INTO `service` VALUES ('10101', '101', '脸2', '200.00', null, null, null, null, '1');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `service_time_id` int(11) DEFAULT NULL,
  `addtional_service` int(11) DEFAULT NULL COMMENT '0-没有附加服务（茶点、停车）；1-有附加服务',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store
-- ----------------------------

-- ----------------------------
-- Table structure for t_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `resId` int(11) NOT NULL AUTO_INCREMENT,
  `resPid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`resId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_resource
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'Admin');
INSERT INTO `t_role` VALUES ('2', 'VIP 1');
INSERT INTO `t_role` VALUES ('3', 'VIP 2');
INSERT INTO `t_role` VALUES ('4', 'VVIP');

-- ----------------------------
-- Table structure for t_set
-- ----------------------------
DROP TABLE IF EXISTS `t_set`;
CREATE TABLE `t_set` (
  `set_id` int(11) NOT NULL AUTO_INCREMENT,
  `set_name` varchar(255) DEFAULT NULL,
  `createby` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updateby` varchar(255) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `iscoupon` int(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `startfrom` datetime DEFAULT NULL,
  `expireto` datetime DEFAULT NULL,
  PRIMARY KEY (`set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_set
-- ----------------------------
INSERT INTO `t_set` VALUES ('1', 'setName1', 'admin', '2017-05-18 00:00:00', 'admin1', '2017-05-18 10:36:07', '0', '1', '11.56', '2017-05-18 10:36:07', '2017-05-18 10:36:07');

-- ----------------------------
-- Table structure for t_set_middle
-- ----------------------------
DROP TABLE IF EXISTS `t_set_middle`;
CREATE TABLE `t_set_middle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `set_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_set_middle
-- ----------------------------
INSERT INTO `t_set_middle` VALUES ('1', '1', '10000');
INSERT INTO `t_set_middle` VALUES ('2', '1', '10101');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountno` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `wechat` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('3', null, 'admin', '21232f297a57a5a743894a0e4a801fc3', '0', '36', '13888888888', '33338888', null, '7', '1');
INSERT INTO `t_user` VALUES ('10', null, 'user1', '24c9e15e52afc47c225b757e7bee1f9d', '1', '33', '321321', '123321', null, '6', '1');
INSERT INTO `t_user` VALUES ('11', null, 'user2', '0192023a7bbd73250516f069df18b500', '0', '35', '33221', '876', null, '5', '1');
INSERT INTO `t_user` VALUES ('12', null, 'user3', '2fa5319fb2333fabb82b3ab68b100a33', '1', '1', '678', '345', null, '7', '0');

-- ----------------------------
-- Table structure for user_card
-- ----------------------------
DROP TABLE IF EXISTS `user_card`;
CREATE TABLE `user_card` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `card_scheme_id` int(11) DEFAULT NULL,
  `card_category_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `plus_amount` decimal(10,2) DEFAULT NULL,
  `remaining` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `card_category_id` (`card_category_id`),
  CONSTRAINT `user_card_ibfk_1` FOREIGN KEY (`card_category_id`) REFERENCES `card_category` (`card_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_card
-- ----------------------------
INSERT INTO `user_card` VALUES ('1', '3', null, '1', 'desc', '100.00', '50.00', '150.00');
INSERT INTO `user_card` VALUES ('2', '10', null, '2', 'desc2-update', '300.55', '30.55', '331.10');
INSERT INTO `user_card` VALUES ('3', '3', null, '3', 'desc2', '200.00', '20.00', '220.00');
INSERT INTO `user_card` VALUES ('4', '11', null, '2', 'desc3-update', '300.55', '30.55', '150.55');
INSERT INTO `user_card` VALUES ('5', '12', null, '2', 'user3\' card', '5000.00', '500.00', '5500.00');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `urid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`urid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES ('1', '3', '1');
INSERT INTO `user_roles` VALUES ('2', '3', '2');
