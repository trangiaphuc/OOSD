/*
 Navicat Premium Data Transfer

 Source Server         : OOSD
 Source Server Type    : MySQL
 Source Server Version : 100417
 Source Host           : localhost:3306
 Source Schema         : projectoosd

 Target Server Type    : MySQL
 Target Server Version : 100417
 File Encoding         : 65001

 Date: 08/06/2021 10:13:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `actID` int NOT NULL,
  `actName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cal` float(11, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`actID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of activity
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `catID` int NOT NULL,
  `catName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`catID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Đồ nước');
INSERT INTO `category` VALUES (2, 'Thịt');
INSERT INTO `category` VALUES (3, 'Đồ Khô');
INSERT INTO `category` VALUES (4, 'Trái cây');
INSERT INTO `category` VALUES (5, 'Khác');

-- ----------------------------
-- Table structure for condition
-- ----------------------------
DROP TABLE IF EXISTS `condition`;
CREATE TABLE `condition`  (
  `conID` int NOT NULL,
  `conName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bmiStart` float NULL DEFAULT NULL,
  `bmiEnd` float NULL DEFAULT NULL,
  PRIMARY KEY (`conID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of condition
-- ----------------------------
INSERT INTO `condition` VALUES (1, 'Thiếu cân', 0, 18.5);
INSERT INTO `condition` VALUES (2, 'Bình thường', 18.5, 24.9);
INSERT INTO `condition` VALUES (3, 'Thừa cân', 25, 29.9);
INSERT INTO `condition` VALUES (4, 'Béo phì', 30, 34.9);
INSERT INTO `condition` VALUES (5, 'Cực kì béo phì', 35, 9999);

-- ----------------------------
-- Table structure for custommenu
-- ----------------------------
DROP TABLE IF EXISTS `custommenu`;
CREATE TABLE `custommenu`  (
  `userID` int NOT NULL,
  `foodID` int NOT NULL,
  `datetime` datetime NOT NULL,
  `number` int NULL DEFAULT NULL,
  PRIMARY KEY (`userID`, `foodID`, `datetime`) USING BTREE,
  INDEX `Fk_custommenu_food`(`foodID`) USING BTREE,
  CONSTRAINT `FK_customenu_user` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Fk_custommenu_food` FOREIGN KEY (`foodID`) REFERENCES `food` (`foodID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of custommenu
-- ----------------------------
INSERT INTO `custommenu` VALUES (1, 1, '2021-06-01 13:10:00', 8);
INSERT INTO `custommenu` VALUES (1, 1, '2021-06-02 14:50:00', 9999);
INSERT INTO `custommenu` VALUES (1, 3, '2021-06-02 14:50:00', 100000);
INSERT INTO `custommenu` VALUES (1, 4, '2021-05-12 13:13:00', 4);
INSERT INTO `custommenu` VALUES (1, 4, '2021-05-31 13:10:00', 6);
INSERT INTO `custommenu` VALUES (1, 6, '2021-05-10 16:38:00', 1);
INSERT INTO `custommenu` VALUES (1, 6, '2021-05-12 14:36:00', 3);
INSERT INTO `custommenu` VALUES (1, 7, '2021-05-13 14:48:00', 23);
INSERT INTO `custommenu` VALUES (1, 7, '2021-05-22 09:21:00', 66);
INSERT INTO `custommenu` VALUES (1, 11, '2021-05-22 14:17:00', 1);
INSERT INTO `custommenu` VALUES (1, 12, '2021-05-31 13:10:00', 2);
INSERT INTO `custommenu` VALUES (1, 12, '2021-06-02 19:00:00', 1);
INSERT INTO `custommenu` VALUES (1, 30, '2021-05-13 14:16:00', 3);
INSERT INTO `custommenu` VALUES (1, 30, '2021-05-17 14:17:00', 3);
INSERT INTO `custommenu` VALUES (1, 30, '2021-05-31 22:23:00', 3);
INSERT INTO `custommenu` VALUES (2, 8, '2021-06-09 10:12:00', 1);

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `foodID` int NOT NULL,
  `foodName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `catID` int NOT NULL,
  `glucozo` float NULL DEFAULT NULL,
  `kcal` float NULL DEFAULT NULL,
  `lipit` float NULL DEFAULT NULL,
  `protein` float NULL DEFAULT NULL,
  `vitA` float NULL DEFAULT NULL,
  `vitB` float NULL DEFAULT NULL,
  `vitC` float NULL DEFAULT NULL,
  `vitD` float NULL DEFAULT NULL,
  `vitE` float NULL DEFAULT NULL,
  `kali` float NULL DEFAULT NULL,
  `fe` float NULL DEFAULT NULL,
  `na` float NULL DEFAULT NULL,
  `urlImage` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isDelete` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`foodID`) USING BTREE,
  INDEX `FK_food_category`(`catID`) USING BTREE,
  FULLTEXT INDEX `foodName`(`foodName`),
  CONSTRAINT `FK_food_category` FOREIGN KEY (`catID`) REFERENCES `category` (`catID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES (1, 'Bún bò huế', 1, 56.4, 622, 30.6, 30.2, 26.64, 0, 14.69, 0, 0, 348.9, 5, 670.7, '/Public/Imgs/Food/1.jpg', b'0');
INSERT INTO `food` VALUES (2, 'Trứng cút', 5, 0.1, 17, 1.2, 1.5, 70, NULL, 0, NULL, NULL, 17.6, 0.27, 15.8, '/Public/Imgs/Food/2.jpg', b'0');
INSERT INTO `food` VALUES (3, 'Cơm', 3, 44.2, 200, 0.6, 4.6, NULL, NULL, NULL, NULL, NULL, 139.8, 0.75, 2.9, '/Public/Imgs/Food/3.jpg', b'0');
INSERT INTO `food` VALUES (4, 'Trứng gà', 5, 0.2, 81, 5.7, 7.3, 343, NULL, 0, NULL, NULL, 86.2, 1.32, 77.4, '/Public/Imgs/Food/4.jpg', b'0');
INSERT INTO `food` VALUES (5, 'Bún tươi', 5, NULL, 110, 0, 1.7, NULL, NULL, NULL, NULL, NULL, NULL, 0.2, NULL, '/Public/Imgs/Food/5.jpg', b'0');
INSERT INTO `food` VALUES (6, 'Thịt heo', 2, NULL, 242, 14, 25, 0.021, NULL, NULL, 0.159, NULL, 423, 0.9, 62, '/Public/Imgs/Food/6.jpg', b'0');
INSERT INTO `food` VALUES (7, 'Thịt bò nạc', 2, NULL, 250, 15, 26, 0, NULL, 0, 0.021, NULL, 72, 2.6, 318, '/Public/Imgs/Food/7.jpg', b'0');
INSERT INTO `food` VALUES (8, 'Phở bò tái', 1, 59.3, 413, 11.7, 17.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/Public/Imgs/Food/8.jpg', b'0');
INSERT INTO `food` VALUES (9, 'Bánh phở', 1, 31.7, 143, 0.4, 3.2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/Public/Imgs/Food/9.jpg', b'0');
INSERT INTO `food` VALUES (10, 'Phở gà', 1, 59.3, 458, 16.2, 18.8, 55.8, NULL, 41.52, NULL, NULL, 173.4, 3.6, 255.6, '/Public/Imgs/Food/10.jpg', b'0');
INSERT INTO `food` VALUES (11, 'Thịt gà', 2, 0, 239, 14, 27, 0.483, NULL, NULL, 0.05, NULL, 223, 1.3, 82, '/Public/Imgs/Food/11.jpg', b'0');
INSERT INTO `food` VALUES (12, 'Cam', 4, 15.5, 68, 0, 1.7, NULL, NULL, NULL, 73.6, NULL, 198.7, 0.74, 7.4, '/Public/Imgs/Food/12.jpg', b'0');
INSERT INTO `food` VALUES (13, 'Khế', 4, 1.9, 9, 0, 0.4, 0, NULL, 18.3, NULL, NULL, 0, 0.54, 0, '/Public/Imgs/Food/13.jpg', b'0');
INSERT INTO `food` VALUES (14, 'Chôm Chôm', 4, 3.3, 14, 0, 0.3, NULL, NULL, NULL, NULL, NULL, NULL, 0.1, NULL, '/Public/Imgs/Food/14.jpg', b'0');
INSERT INTO `food` VALUES (15, 'Cóc', 4, 7.4, 34, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0.92, NULL, '/Public/Imgs/Food/15.jpg', b'0');
INSERT INTO `food` VALUES (16, 'Củ sắn', 4, 11.1, 52, 0, 1.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/Public/Imgs/Food/16.jpg', b'0');
INSERT INTO `food` VALUES (17, 'Dâu tây', 4, 2, 11, 0.1, 0.5, NULL, NULL, 15, NULL, NULL, NULL, 0.17, NULL, '/Public/Imgs/Food/17.jpg', b'0');
INSERT INTO `food` VALUES (18, 'Hồng đỏ', 4, 5.6, 25, 0, 0.6, 0, 0, 0, 0, 0, 192.6, 0.18, 3.6, '/Public/Imgs/Food/18.jpg', b'0');
INSERT INTO `food` VALUES (19, 'Lê', 4, 20.6, 91, 0.4, 1.4, NULL, NULL, NULL, NULL, NULL, 177.8, 4.65, 10.1, '/Public/Imgs/Food/19.jpg', b'0');
INSERT INTO `food` VALUES (20, 'Saboche', 4, 11.5, 55, 0.8, 0.6, NULL, NULL, NULL, NULL, NULL, 0, 2.64, 0, '/Public/Imgs/Food/20.jpg', b'0');
INSERT INTO `food` VALUES (21, 'Mận', 4, 2.5, 11, 0, 0.3, NULL, NULL, 21, NULL, NULL, NULL, 0.35, 0, '/Public/Imgs/Food/21.jpg', b'0');
INSERT INTO `food` VALUES (22, 'Nhãn', 4, 0.9, 4, 0, 0.1, NULL, NULL, 4.52, NULL, NULL, 17, 0.03, 1.7, '/Public/Imgs/Food/22.jpg', b'0');
INSERT INTO `food` VALUES (23, 'Ổi', 4, 12.3, 53, 0, 1, NULL, NULL, 99.9, NULL, NULL, 465.6, 2.15, 6.6, '/Public/Imgs/Food/23.jpg', b'0');
INSERT INTO `food` VALUES (24, 'Quýt', 4, 6.4, 28, 0, 0.6, NULL, NULL, 40.7, NULL, NULL, 82.1, 0.3, 3, '/Public/Imgs/Food/24.jpg', b'0');
INSERT INTO `food` VALUES (25, 'Xoài', 4, 41.2, 179, 0.8, 1.6, NULL, NULL, 77.7, NULL, NULL, 295.3, 1.04, 0.8, '/Public/Imgs/Food/25.jpg', b'0');
INSERT INTO `food` VALUES (26, 'Vải', 4, 2.1, 9, 0, 0.1, 0, 0, 7.56, 0, 0, 0, 0.1, 0, '/Public/Imgs/Food/26.jpg', b'0');
INSERT INTO `food` VALUES (27, 'Thanh long', 4, 49, 225, 0, 7.3, NULL, NULL, 54.05, NULL, NULL, NULL, 3.38, NULL, '/Public/Imgs/Food/27.jpg', b'0');
INSERT INTO `food` VALUES (28, 'Vú sữa', 4, 18.5, 83, 0, 2, NULL, NULL, 9.85, NULL, NULL, NULL, 0.79, NULL, '/Public/Imgs/Food/28.jpg', b'0');
INSERT INTO `food` VALUES (29, 'Táo tây', 4, 25.8, 107, 0, 1.1, NULL, NULL, 15.96, NULL, NULL, 232.6, 5.7, 34.2, '/Public/Imgs/Food/29.jpg', b'0');
INSERT INTO `food` VALUES (30, 'Cơm trứng', 3, 44.4, 281, 6.3, 11.9, NULL, NULL, NULL, NULL, NULL, 226, 2.07, 80.3, '/Public/Imgs/Food/30.jpg', b'0');
INSERT INTO `food` VALUES (31, 'Bún thịt nướng', 1, NULL, 352, 14, 26.7, NULL, NULL, NULL, 0.159, NULL, 423, 1.1, 62, '/Public/Imgs/Food/31.jpg', b'0');

-- ----------------------------
-- Table structure for historyuserbmi
-- ----------------------------
DROP TABLE IF EXISTS `historyuserbmi`;
CREATE TABLE `historyuserbmi`  (
  `historyID` int NOT NULL AUTO_INCREMENT,
  `userID` int NULL DEFAULT NULL,
  `weight` double NULL DEFAULT NULL,
  `height` double NULL DEFAULT NULL,
  `dateUpdate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`historyID`) USING BTREE,
  INDEX `FK_historyuserbmi_user`(`userID`) USING BTREE,
  CONSTRAINT `FK_historyuserbmi_user` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of historyuserbmi
-- ----------------------------
INSERT INTO `historyuserbmi` VALUES (8, 1, 555, 555, '2021-05-13 14:38:25');
INSERT INTO `historyuserbmi` VALUES (9, 1, 555, 555, '2021-05-13 14:38:34');
INSERT INTO `historyuserbmi` VALUES (10, 1, 222, 111, '2021-05-13 14:39:14');
INSERT INTO `historyuserbmi` VALUES (11, 1, 999, 999, '2021-05-13 14:46:46');
INSERT INTO `historyuserbmi` VALUES (12, 1, 999, 999, '2021-05-13 14:55:49');
INSERT INTO `historyuserbmi` VALUES (13, 1, 77, 77, '2021-05-13 14:56:19');
INSERT INTO `historyuserbmi` VALUES (14, 1, 99, 99, '2021-05-13 14:56:34');
INSERT INTO `historyuserbmi` VALUES (15, 1, 99, 99, '2021-05-13 14:56:41');
INSERT INTO `historyuserbmi` VALUES (16, 2, 0, 0, '2021-06-08 09:46:00');

-- ----------------------------
-- Table structure for ingredient
-- ----------------------------
DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE `ingredient`  (
  `foodID` int NOT NULL,
  `ingredientID` int NOT NULL,
  `gram` double NULL DEFAULT NULL,
  `ingredientName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`foodID`, `ingredientID`) USING BTREE,
  INDEX `FK_ingredient_food_ingre`(`ingredientID`) USING BTREE,
  CONSTRAINT `FK_ingredient_food` FOREIGN KEY (`foodID`) REFERENCES `food` (`foodID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ingredient_food_ingre` FOREIGN KEY (`ingredientID`) REFERENCES `food` (`foodID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ingredient
-- ----------------------------
INSERT INTO `ingredient` VALUES (30, 3, 300, NULL);
INSERT INTO `ingredient` VALUES (30, 4, 100, NULL);
INSERT INTO `ingredient` VALUES (31, 5, 100, NULL);
INSERT INTO `ingredient` VALUES (31, 6, 100, NULL);

-- ----------------------------
-- Table structure for suggestmenu
-- ----------------------------
DROP TABLE IF EXISTS `suggestmenu`;
CREATE TABLE `suggestmenu`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `conID` int NULL DEFAULT NULL,
  `dayofweek` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `foodName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `number` int NULL DEFAULT NULL,
  `session` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_suggestmenu_condition`(`conID`) USING BTREE,
  CONSTRAINT `FK_suggestmenu_condition` FOREIGN KEY (`conID`) REFERENCES `condition` (`conID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of suggestmenu
-- ----------------------------
INSERT INTO `suggestmenu` VALUES (1, 2, '1', 'Bánh mì', 1, '1');
INSERT INTO `suggestmenu` VALUES (2, 2, '1', 'Cơm tấm', 1, '2');
INSERT INTO `suggestmenu` VALUES (3, 2, '1', 'Nước cam', 1, '2');
INSERT INTO `suggestmenu` VALUES (4, 2, '1', 'Quả táo', 1, '3');
INSERT INTO `suggestmenu` VALUES (5, 2, '1', 'Bún bò huế', 1, '4');
INSERT INTO `suggestmenu` VALUES (6, 2, '2', 'Hủ tiếu thịt', 1, '1');
INSERT INTO `suggestmenu` VALUES (7, 2, '2', 'Bát cơm', 3, '2');
INSERT INTO `suggestmenu` VALUES (8, 2, '2', 'Con tôm rim', 5, '2');
INSERT INTO `suggestmenu` VALUES (9, 2, '2', 'Miếng đậu hũ chiên', 1, '2');
INSERT INTO `suggestmenu` VALUES (10, 2, '2', 'Bát canh rau cải', 1, '2');
INSERT INTO `suggestmenu` VALUES (11, 2, '2', 'Ly chè', 1, '3');
INSERT INTO `suggestmenu` VALUES (12, 2, '2', 'Bún đậu mắm tôm', 1, '4');
INSERT INTO `suggestmenu` VALUES (13, 1, '1', 'Bún bò huế', 1, '1');
INSERT INTO `suggestmenu` VALUES (14, 2, '3', 'Thanh long', 1, '3');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userID` int NOT NULL,
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `role` int NULL DEFAULT NULL,
  `fullName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `height` double NULL DEFAULT NULL,
  `weight` double NULL DEFAULT NULL,
  `sex` bit(1) NULL DEFAULT NULL,
  `urlImage` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isDelete` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`userID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '$2a$12$k7R6T5SFTn5SX5b4ymC3YOLaVr68PidMrbKZEojiOJYWbd6j9ICzi', 0, 'Adminitration', 0, 0, 0, b'0', '/Public/Imgs/Avts/14.jpg', b'0');
INSERT INTO `user` VALUES (2, 'haohao', '$2a$12$ojpT8.k7p13z4UBOCplS9.FLJDVrlGV1dgyDEEPfL6vNaN7sVkbFu', 1, 'Duc Hao', 15, 177, 58, b'0', '', b'0');
INSERT INTO `user` VALUES (3, 'ldthang7410', '$2a$12$qRHqc/Onk/q3hIyvaVAWs.0u.mxKpVlc8kG//jO3x4zBsdFtv8VVO', 1, '123', 21, 0, 0, b'0', NULL, b'0');
INSERT INTO `user` VALUES (4, 'abc', 'sdas', 1, 'zyx', 12, NULL, NULL, b'1', NULL, b'1');
INSERT INTO `user` VALUES (5, 'hshd', '123', 1, 'Anh', 30, NULL, NULL, b'0', NULL, b'1');

-- ----------------------------
-- Procedure structure for add_custom_menu
-- ----------------------------
DROP PROCEDURE IF EXISTS `add_custom_menu`;
delimiter ;;
CREATE PROCEDURE `add_custom_menu`(IN useridd int(11), foodidd int(11), dtpk VARCHAR(50), numbercustom int(11))
BEGIN
	
	IF ((select count(*) from custommenu where userID = useridd and foodID = foodidd and datetime = CONVERT(dtpk,DATETIME))>0)
		THEN UPDATE custommenu set number = number + numbercustom WHERE userID = useridd and foodID = foodidd and datetime = CONVERT(dtpk,DATETIME);
	ELSE
		INSERT into custommenu VALUES(useridd,foodidd,dtpk,numbercustom);
	end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_active_User
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_active_User`;
delimiter ;;
CREATE PROCEDURE `delete_active_User`(IN uname VARCHAR(20))
begin
	IF ((select isDelete from `user` where userName = uname)=true) THEN
	Update `user` set isDelete=FALSE where userName = uname;
ELSE
	Update `user` set isDelete=true where userName = uname;
END IF;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_addNewFood
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_addNewFood`;
delimiter ;;
CREATE PROCEDURE `sp_addNewFood`(in fName varchar(100), cID int, glu FLOAT, calo FLOAT, lip FLOAT, pro FLOAT, A FLOAT, B FLOAT, C FLOAT, D FLOAT, E FLOAT, K FLOAT, F FLOAT, N FLOAT, url VARCHAR(255))
begin
	declare fID int;
	set fID = 1;
	while (exists (select * from food where foodID = fID)) do set fID = fID + 1;
	end while;
	insert into food values(fID, fName, cID, glu, calo, lip, pro, A, B, C, D, E, K, F, N, url, 0);
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_addNewUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_addNewUser`;
delimiter ;;
CREATE PROCEDURE `sp_addNewUser`(in username varchar(20),upassw varchar(255), urole int, ufulln varchar(255), uage int, uheight double, uweight double, usex BIGINT,uurlimage varchar(255))
begin
    declare uID int;
    set uID = 1;
    while (exists (select * from user where userID = uID)) do set uID = uID + 1;
    end while;
    insert into user values(uID, username, upassw, urole, ufulln, uage, uheight, uweight, usex,uurlimage,false);
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_deleteFood
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_deleteFood`;
delimiter ;;
CREATE PROCEDURE `sp_deleteFood`(in fID int)
begin
	delete from ingredient where foodID = fID;
	delete from custommenu where foodID = fID;
	delete from food where foodID = fID;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
