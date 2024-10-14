/*
 Navicat Premium Dump SQL

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : crowdfunding_db

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 13/10/2024 20:34:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `CATEGORY_ID` int NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'medical treatment');
INSERT INTO `category` VALUES (2, 'education');
INSERT INTO `category` VALUES (3, 'social influence ');

-- ----------------------------
-- Table structure for donation
-- ----------------------------
DROP TABLE IF EXISTS `donation`;
CREATE TABLE `donation`  (
  `DONATION_ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AMOUNT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `GIVER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FUNDRAISER_ID` int NOT NULL,
  PRIMARY KEY (`DONATION_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of donation
-- ----------------------------
INSERT INTO `donation` VALUES (3, '2024-10-10 15:30:31', '50', '白钰', 1);
INSERT INTO `donation` VALUES (4, '2024-10-10 15:30:49', '10', '白钰', 4);
INSERT INTO `donation` VALUES (5, '2024-10-10 15:34:27', '50', '刘福洋', 4);
INSERT INTO `donation` VALUES (6, '2024-10-10 15:34:27', '5', '刘福洋', 4);
INSERT INTO `donation` VALUES (9, '2024-10-13 13:28:28', '17.5', '白钰', 1);

-- ----------------------------
-- Table structure for fund_raiser
-- ----------------------------
DROP TABLE IF EXISTS `fund_raiser`;
CREATE TABLE `fund_raiser`  (
  `FUNDRAISER_ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `TARGET_FUNDING` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `GURRENT_FUNDING` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CITY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CATEGORY_ID` int NULL DEFAULT NULL,
  `ORGANIZER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ACTIVITY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`FUNDRAISER_ID`) USING BTREE,
  INDEX `cheak`(`CATEGORY_ID` ASC) USING BTREE,
  CONSTRAINT `cheak` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fund_raiser
-- ----------------------------
INSERT INTO `fund_raiser` VALUES (1, '800', '50', 'Beijing', 1, 'Aaron', 'Save wild animals', 'suspend');
INSERT INTO `fund_raiser` VALUES (2, '1000', '1000', 'Beijing', 2, 'Health', 'Rescue refugees', 'suspend');
INSERT INTO `fund_raiser` VALUES (3, '2800', '260', 'Zhengzhou', 3, 'Water and habitat', 'Provide refugee housing', 'active');
INSERT INTO `fund_raiser` VALUES (4, '620', '160', 'Hangzhou', 2, 'Reuniting families', 'Provide medical conditions', 'active');
INSERT INTO `fund_raiser` VALUES (5, '80', '10', 'Shenzhen', 2, 'Protecting civilians', 'Provide spiritual assistance', 'active');
INSERT INTO `fund_raiser` VALUES (6, '200', '58', 'Shenzhen', 1, 'Visiting detainees', 'Assisting homeless people', 'active');
INSERT INTO `fund_raiser` VALUES (7, '720', '70', 'Shenzhen', 1, 'Safeguarding health care', 'Rescue Monkey', 'active');
INSERT INTO `fund_raiser` VALUES (8, '788', '75', 'Shenzhen', 2, 'Care', 'Rescue Monkey', 'active');

SET FOREIGN_KEY_CHECKS = 1;
