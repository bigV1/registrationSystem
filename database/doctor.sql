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

 Date: 04/05/2019 16:16:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `doctorId` int(11) NOT NULL AUTO_INCREMENT,
  `doctorName` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deptId` int(11) NULL DEFAULT NULL COMMENT '科室id',
  `deptName` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科室名字',
  `workTime` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值班时间',
  `workStatus` tinyint(1) NULL DEFAULT NULL COMMENT '上班状态 0请假 1正常',
  `doctorDes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生介绍',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`doctorId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (1, '测试2', 1, '科室1', '星期一,星期二,星期三', 0, '测试', 1);
INSERT INTO `doctor` VALUES (2, '测试2', 3, '科室2', '星期二,星期四,星期五', 1, '测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍测试介绍', 1);
INSERT INTO `doctor` VALUES (3, '测试3', 4, '科室4', '星期二,星期三,星期四,星期五', 1, '测试', 1);

SET FOREIGN_KEY_CHECKS = 1;
