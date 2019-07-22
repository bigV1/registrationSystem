/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100134
 Source Host           : localhost:3306
 Source Schema         : registration

 Target Server Type    : MySQL
 Target Server Version : 100134
 File Encoding         : 65001

 Date: 04/05/2019 16:17:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for register
-- ----------------------------
DROP TABLE IF EXISTS `register`;
CREATE TABLE `register`  (
  `registerId` int(11) NOT NULL,
  `doctorName` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生姓名',
  `doctorId` int(11) NULL DEFAULT NULL COMMENT '医生id',
  `hzName` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `hzId` int(11) NULL DEFAULT NULL COMMENT '患者id',
  `deptId` int(11) NULL DEFAULT NULL COMMENT '部门id',
  `deptName` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科室名字',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  `ghStatus` int(11) NULL DEFAULT NULL COMMENT '挂号状态',
  `registerTime` datetime(6) NULL DEFAULT NULL COMMENT '预约时间',
  PRIMARY KEY (`registerId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
