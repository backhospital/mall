-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.7.3-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- mall2 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `mall2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `mall2`;

-- 테이블 mall2.goods_category 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods_category` (
  `cateName` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `cateCode` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `cateCodeRef` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`cateCode`),
  KEY `cateCodeRef` (`cateCodeRef`),
  CONSTRAINT `goods_category_ibfk_1` FOREIGN KEY (`cateCodeRef`) REFERENCES `goods_category` (`cateCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- 테이블 데이터 mall2.goods_category:~9 rows (대략적) 내보내기
/*!40000 ALTER TABLE `goods_category` DISABLE KEYS */;
INSERT IGNORE INTO `goods_category` (`cateName`, `cateCode`, `cateCodeRef`) VALUES
	('금융상품', '100', NULL),
	('주식', '101', '100'),
	('채권', '102', '100'),
	('부동산', '200', NULL),
	('토지', '201', '200'),
	('아파트', '202', '200'),
	('가상자산', '300', NULL),
	('비트코인', '301', '300'),
	('알트코인', '302', '300');
/*!40000 ALTER TABLE `goods_category` ENABLE KEYS */;

-- 테이블 mall2.tbl_cart 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_cart` (
  `cartNum` int(11) NOT NULL,
  `userId` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `gdsNum` int(11) NOT NULL,
  `cartStock` int(11) NOT NULL,
  `addDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`cartNum`,`userId`),
  KEY `tbl_cart_userId` (`userId`),
  KEY `tbl_cart_gdsNum` (`gdsNum`),
  CONSTRAINT `tbl_cart_gdsNum` FOREIGN KEY (`gdsNum`) REFERENCES `tbl_goods` (`gdsNum`),
  CONSTRAINT `tbl_cart_userId` FOREIGN KEY (`userId`) REFERENCES `tbl_member` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- 테이블 데이터 mall2.tbl_cart:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cart` ENABLE KEYS */;

-- 테이블 mall2.tbl_cart_seq 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_cart_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- 테이블 데이터 mall2.tbl_cart_seq:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_cart_seq` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_cart_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
	(1001, 1, 9223372036854775806, 1, 1, 1000, 0, 0);
/*!40000 ALTER TABLE `tbl_cart_seq` ENABLE KEYS */;

-- 테이블 mall2.tbl_goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_goods` (
  `gdsNum` int(25) NOT NULL,
  `gdsName` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `cateCode` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `gdsPrice` int(25) NOT NULL,
  `gdsStock` int(25) DEFAULT NULL,
  `gdsDes` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `gdsImg` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `gdsDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `gdsThumbImg` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`gdsNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- 테이블 데이터 mall2.tbl_goods:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_goods` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_goods` (`gdsNum`, `gdsName`, `cateCode`, `gdsPrice`, `gdsStock`, `gdsDes`, `gdsImg`, `gdsDate`, `gdsThumbImg`) VALUES
	(25, '배당주', '101', 123456, 123, '123456789', '\\images\\none.png', '2022-04-04 16:55:13', '\\images\\none.png'),
	(28, '123', '201', 123, 123, '123', '\\imgUpload\\2022\\04\\06\\f5771c49-a13b-434e-bdcb-930031726b8c_다운로드 (2).jpg', '2022-04-06 10:14:49', '\\imgUpload\\2022\\04\\06\\s\\s_f5771c49-a13b-434e-bdcb-930031726b8c_다운로드 (2).jpg'),
	(29, '11', '301', 11, 11, '111', '\\imgUpload\\2022\\04\\06\\f0f1b77d-f71e-4943-8ad5-01cf8b50110e_112039458.1.jpg', '2022-04-06 10:18:30', '\\imgUpload\\2022\\04\\06\\s\\s_f0f1b77d-f71e-4943-8ad5-01cf8b50110e_112039458.1.jpg');
/*!40000 ALTER TABLE `tbl_goods` ENABLE KEYS */;

-- 테이블 mall2.tbl_goods_seq 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_goods_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- 테이블 데이터 mall2.tbl_goods_seq:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_goods_seq` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_goods_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
	(1001, 1, 9223372036854775806, 1, 1, 1000, 0, 0);
/*!40000 ALTER TABLE `tbl_goods_seq` ENABLE KEYS */;

-- 테이블 mall2.tbl_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_member` (
  `userId` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `useridx` int(25) NOT NULL,
  `userPass` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `userName` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `userPhon` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `userAddr1` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `userAddr2` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `userAddr3` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `verify` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`,`useridx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- 테이블 데이터 mall2.tbl_member:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_member` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_member` (`userId`, `useridx`, `userPass`, `userName`, `userPhon`, `userAddr1`, `userAddr2`, `userAddr3`, `regDate`, `verify`) VALUES
	('admin@admin.com', 3, '$2a$10$bex3uae/w/lrIc7x8ipd.ue.OHTo/S2jiwqyQDg7pc9sImAOZQ5ya', 'admin', '1234', NULL, NULL, NULL, '2022-04-04 15:29:46', 9),
	('schd@schd.com', 5, '$2a$10$uMUckXEme7WabAUK69J0HubDcQcIkqd4wKYeP7/Bjkx9ws2m.i9Ve', '1234', '1234', NULL, NULL, NULL, '2022-04-04 15:30:29', 0),
	('zzz@zzz.com', 4, '$2a$10$Dd.pAJvqWlsvlQe1z6G/QOvu1S3FzKINDR.QD4XUFtVlKaMi7UUj2', '1234', '1234', NULL, NULL, NULL, '2022-04-04 15:30:15', 0);
/*!40000 ALTER TABLE `tbl_member` ENABLE KEYS */;

-- 테이블 mall2.tbl_member_seq 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_member_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- 테이블 데이터 mall2.tbl_member_seq:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_member_seq` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_member_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
	(1001, 1, 9223372036854775806, 1, 1, 1000, 0, 0);
/*!40000 ALTER TABLE `tbl_member_seq` ENABLE KEYS */;

-- 테이블 mall2.tbl_order 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_order` (
  `orderId` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `userId` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `orderRec` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `userAddr1` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `userAddr2` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `userAddr3` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `orderPhon` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `delivery` varchar(20) COLLATE utf8mb4_bin DEFAULT '배송준비',
  PRIMARY KEY (`orderId`),
  KEY `tbl_order_userId` (`userId`),
  CONSTRAINT `tbl_order_userId` FOREIGN KEY (`userId`) REFERENCES `tbl_member` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- 테이블 데이터 mall2.tbl_order:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_order` ENABLE KEYS */;

-- 테이블 mall2.tbl_order_details 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_order_details` (
  `orderDetailsNum` int(11) NOT NULL,
  `orderId` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `gdsNum` int(11) NOT NULL,
  `cartStock` int(11) NOT NULL,
  PRIMARY KEY (`orderDetailsNum`),
  KEY `tbl_order_details_orderId` (`orderId`),
  CONSTRAINT `tbl_order_details_orderId` FOREIGN KEY (`orderId`) REFERENCES `tbl_order` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- 테이블 데이터 mall2.tbl_order_details:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_order_details` ENABLE KEYS */;

-- 테이블 mall2.tbl_order_details_seq 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_order_details_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- 테이블 데이터 mall2.tbl_order_details_seq:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_order_details_seq` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_order_details_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
	(1, 1, 9223372036854775806, 1, 1, 1000, 0, 0);
/*!40000 ALTER TABLE `tbl_order_details_seq` ENABLE KEYS */;

-- 테이블 mall2.tbl_reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_reply` (
  `gdsNum` int(11) NOT NULL,
  `userId` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `repNum` int(11) NOT NULL,
  `repCon` varchar(2000) COLLATE utf8mb4_bin NOT NULL,
  `repDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`gdsNum`,`repNum`),
  KEY `tbl_reply_userId` (`userId`),
  CONSTRAINT `tbl_reply_gdsNum` FOREIGN KEY (`gdsNum`) REFERENCES `tbl_goods` (`gdsNum`),
  CONSTRAINT `tbl_reply_userId` FOREIGN KEY (`userId`) REFERENCES `tbl_member` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- 테이블 데이터 mall2.tbl_reply:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reply` ENABLE KEYS */;

-- 테이블 mall2.tbl_reply_seq 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_reply_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- 테이블 데이터 mall2.tbl_reply_seq:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_reply_seq` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_reply_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
	(1001, 1, 9223372036854775806, 1, 1, 1000, 0, 0);
/*!40000 ALTER TABLE `tbl_reply_seq` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
