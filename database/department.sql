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

 Date: 04/05/2019 16:16:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `departmentId` int(11) NOT NULL AUTO_INCREMENT,
  `departmentName` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `departmentDes` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `departmentArea` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`departmentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '牙科2', '测试', 1, '3楼A厅');
INSERT INTO `department` VALUES (2, '妇科2', '测试', 1, '4楼A厅');
INSERT INTO `department` VALUES (3, '儿科3', '测试', 1, '4楼A厅');
INSERT INTO `department` VALUES (4, '口腔科', '测试描述', 1, '4楼B厅');
INSERT INTO `department` VALUES (5, '测试科室', '测试介绍', 1, '4楼A厅');
INSERT INTO `department` VALUES (6, '牙科2', '测试', 1, '4楼A厅');
INSERT INTO `department` VALUES (7, '3楼C厅', '测试', 1, '4楼A厅');
INSERT INTO `department` VALUES (8, '测试科室1', '测试', 1, '测试');
INSERT INTO `department` VALUES (9, '测试科室2', '测试', 1, '测试');
INSERT INTO `department` VALUES (10, '测试科室3', '测试', 1, '测试');
INSERT INTO `department` VALUES (11, '测试科室4', '测试', 1, '测试');
INSERT INTO `department` VALUES (12, '测试科室5', '测试', 1, '测试');
INSERT INTO `department` VALUES (13, '测试科室6', '测试', 1, '测试');
INSERT INTO `department` VALUES (14, '测试科室7', '测试', 1, '测试');
INSERT INTO `department` VALUES (15, '测试', '测试', 1, '测试');
INSERT INTO `department` VALUES (16, '测试', '测试', 1, '测试');
INSERT INTO `department` VALUES (17, '测试', '测试', 1, '测试');
INSERT INTO `department` VALUES (18, '测试', '测试', 1, '测试');
INSERT INTO `department` VALUES (19, '测试', '测试', 1, '测试');

SET FOREIGN_KEY_CHECKS = 1;
