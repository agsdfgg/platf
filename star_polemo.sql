/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50716
 Source Host           : localhost:3306
 Source Schema         : star_polemo

 Target Server Type    : MySQL
 Target Server Version : 50716
 File Encoding         : 65001

 Date: 18/07/2018 10:28:58
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_activity
-- ----------------------------
DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '活动名称',
  `address` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '活动地址',
  `icon` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '活动头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_contact
-- ----------------------------
DROP TABLE IF EXISTS `t_contact`;
CREATE TABLE `t_contact`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT -1 COMMENT '用户id',
  `message_body` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发送消息内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '联系我们表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_game
-- ----------------------------
DROP TABLE IF EXISTS `t_game`;
CREATE TABLE `t_game`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '游戏名称',
  `icon` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '游戏头像',
  `details` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '游戏详情',
  `address` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '游戏地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10000 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_gift
-- ----------------------------
DROP TABLE IF EXISTS `t_gift`;
CREATE TABLE `t_gift`  (
  `id` int(11) NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '礼包名称',
  `details` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '礼包详情',
  `icon` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '礼包头像',
  `number` int(10) NOT NULL DEFAULT 0 COMMENT '礼包数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '礼包表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `head` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '消息头',
  `content` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '消息体',
  `date` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '发送日期',
  `status` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '-1' COMMENT '消息状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_prize
-- ----------------------------
DROP TABLE IF EXISTS `t_prize`;
CREATE TABLE `t_prize`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '礼品名称',
  `date` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '礼品日期',
  `expiry_date` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '到期日',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '礼品状态',
  `details` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '礼品详情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '礼品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_thirdparty
-- ----------------------------
DROP TABLE IF EXISTS `t_thirdparty`;
CREATE TABLE `t_thirdparty`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登陆来源',
  `user_id` int(11) NOT NULL DEFAULT -1 COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '第三方登陆表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `sex` int(5) NOT NULL COMMENT '性别',
  `phone` bigint(20) NOT NULL COMMENT '手机号',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `level` int(10) NOT NULL DEFAULT 1 COMMENT '等级',
  `property` int(10) NOT NULL DEFAULT 0 COMMENT '资产',
  `experience` int(10) NOT NULL DEFAULT 0 COMMENT '经验',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000000 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
