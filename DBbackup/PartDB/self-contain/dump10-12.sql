CREATE DATABASE  IF NOT EXISTS `testgk` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `testgk`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: testgk
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `anju_user`
--

DROP TABLE IF EXISTS `anju_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anju_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `countname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户。记录账号名，长度限制在15个字符。不唯一。',
  `password` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码，限制长度在15个字符。不唯一。前端需要对密码进行密码强度判断。具体强度规则暂未定下。',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话号码。长度限制在15个字符。唯一。',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户邮件地址。长度限制在20个字符。唯一。',
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。记录用户账户创建时间。类型为datetime，精确到时分秒。',
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。记录用户账号资料更新时间，类型为datetime，精确到时分秒。',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '未知' COMMENT '用户性别（可选信息）。可选字符‘男’，‘女’，‘未知’。',
  `birth` date DEFAULT '1990-01-01' COMMENT '用户生日（可选数据），类型是date，精确到年月日。',
  `useplace` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '家用 室内' COMMENT '添加用户使用场景字段。限制长度为15个字符。',
  `wechatid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'wechatid,记录用户的微信id。用于登录验证。可空，但是唯一。',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `wechatid_UNIQUE` (`wechatid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表。数据库核心表。记录用户的相关各种信息。部分用户可以选填，部分必须填。具体看字段注释。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anju_user`
--

LOCK TABLES `anju_user` WRITE;
/*!40000 ALTER TABLE `anju_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `anju_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `AFTER_anju_user_UPDATE` AFTER UPDATE ON `anju_user` FOR EACH ROW update terminal set terminal.phone=new.phone where terminal.phone=old.phone */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `AFTER_anju_user_DELETE` AFTER DELETE ON `anju_user` FOR EACH ROW begin
        delete from operationlog where operationlog.anju_user_id = old.id;
        delete from user_has_terminal where user_has_terminal.anju_user_id = old.id;
        delete from terminal where terminal.phone=old.phone;
        delete from friend where friend.anju_user_id = old.id or friend.anju_user_id1 = old.id;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备名称，长度限制在15字符。',
  `group` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'null' COMMENT '分组。mysql中只记录设备所在分组名。默认值"null"。',
  `model` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '型号。长度限制在15字符。非空。',
  `serial` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备序列号。长度限制在20个字符。',
  `prop` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备特性。若干表述特性的string存储在这，程序获取之后直接解析。',
  `version` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本号。长度限制在 15字符。',
  `manual` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户指南的url地址，可以为空。',
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。类型为datetime,精确到时分秒。',
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。类型为datetime,精确到时分秒。',
  `anju_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`anju_user_id`),
  KEY `anju_user_id_to_device1_idx` (`anju_user_id`),
  CONSTRAINT `anju_user_id_to_device1` FOREIGN KEY (`anju_user_id`) REFERENCES `anju_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci COMMENT='设备表。记录设备数据。该表和friend_has_device表是一对多的关系，和user表是多对一的关系。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_has_group`
--

DROP TABLE IF EXISTS `device_has_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_has_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `create` datetime DEFAULT CURRENT_TIMESTAMP,
  `update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `device_id_to_device_has_group1_idx` (`device_id`),
  KEY `group_id_to_device_has_group1_idx` (`group_id`),
  CONSTRAINT `device_id_to_device_has_group1` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `group_id_to_device_has_group1` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录分组信息，但是设备与分组之间是Non-identifying relationship.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_has_group`
--

LOCK TABLES `device_has_group` WRITE;
/*!40000 ALTER TABLE `device_has_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_has_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。类型为datetime,精确到时分秒。',
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。类型为datetime,精确到时分秒。',
  `anju_user_id` int(10) unsigned NOT NULL,
  `anju_user_id1` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`anju_user_id`,`anju_user_id1`),
  KEY `anju_user_id_to_friend1_idx` (`anju_user_id`),
  KEY `anju_user_id_to_friend2_idx` (`anju_user_id1`),
  CONSTRAINT `anju_user_id_to_friend1` FOREIGN KEY (`anju_user_id`) REFERENCES `anju_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `anju_user_id_to_friend2` FOREIGN KEY (`anju_user_id1`) REFERENCES `anju_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='好友表。用户添加好友时输入对方手机号，首先在用户表里搜寻其手机号。有则说明是已经注册的用户，无则不是。不管对方有无注册，friend的主键ID一定要被创建。假如有某个用户注销了，frined改对应的用户也要删除。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户设备分组',
  `create` datetime DEFAULT CURRENT_TIMESTAMP,
  `update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分组表，记录用户设备分组。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `living_video`
--

DROP TABLE IF EXISTS `living_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `living_video` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '设备的推流地址。',
  `create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。',
  `update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间.',
  `device_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`device_id`),
  KEY `device_id_to_living_video1_idx` (`device_id`),
  CONSTRAINT `device_id_to_living_video1` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='该表记录用户的设备在推流时相关信息。与设备表是一对一关系。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `living_video`
--

LOCK TABLES `living_video` WRITE;
/*!40000 ALTER TABLE `living_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `living_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operationlog`
--

DROP TABLE IF EXISTS `operationlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operationlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `log` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作日志文本存档。存储为VARCHAR。最大为20个字符。',
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。',
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。',
  `terminal_id` int(11) unsigned NOT NULL,
  `anju_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`terminal_id`,`anju_user_id`),
  KEY `terminal_id_to_operationlog1_idx` (`terminal_id`),
  KEY `anju_user_id_to_operationlog1_idx` (`anju_user_id`),
  CONSTRAINT `anju_user_id_to_operationlog1` FOREIGN KEY (`anju_user_id`) REFERENCES `anju_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `terminal_id_to_operationlog1` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='操作日志表。表中字段tinytext记录具体的用户操作。tinytext的内容由程序自动生成，记录用户的关键操作。例如登录、注销、解除设备绑定等等。随着时间的推移。此表的大小会越来越大。所以应该对每个用户设定查看日期，只存储N日的操作日志。具体方式还没定下来。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operationlog`
--

LOCK TABLES `operationlog` WRITE;
/*!40000 ALTER TABLE `operationlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `operationlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_device`
--

DROP TABLE IF EXISTS `shared_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shared_device` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。',
  `friend_id` int(10) unsigned NOT NULL,
  `friend_anju_user_id` int(10) unsigned NOT NULL,
  `friend_anju_user_id1` int(10) unsigned NOT NULL,
  `device_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`friend_id`,`friend_anju_user_id`,`friend_anju_user_id1`,`device_id`),
  KEY `friend_id_to_shared_device1_idx` (`friend_id`,`friend_anju_user_id`,`friend_anju_user_id1`),
  KEY `device_id_to_shared_device1_idx` (`device_id`),
  CONSTRAINT `device_id_to_shared_device1` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `friend_id_to_shared_device1` FOREIGN KEY (`friend_id`, `friend_anju_user_id`, `friend_anju_user_id1`) REFERENCES `friend` (`id`, `anju_user_id`, `anju_user_id1`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='这个表记录好友之间的共享设备。该表的更新，不能通过触发器自动更新。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_device`
--

LOCK TABLES `shared_device` WRITE;
/*!40000 ALTER TABLE `shared_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stored_image`
--

DROP TABLE IF EXISTS `stored_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stored_image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片存储在服务器上的位置。长度控制在100个字符。2019/9/18日修改。',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '照片名称。长度控制在25个字符。',
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。',
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更改时间。',
  `format` varchar(5) CHARACTER SET utf32 COLLATE utf32_general_ci DEFAULT NULL COMMENT '照片格式。',
  `size` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件大小。以字符串的形式储存。',
  `anju_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`anju_user_id`),
  KEY `anju_user_id_to_image1_idx` (`anju_user_id`),
  CONSTRAINT `anju_user_id_to_image1` FOREIGN KEY (`anju_user_id`) REFERENCES `anju_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片表。记录两中图片数据：一、用户控制摄像头拍的且存储在云端的照片；二、用户头像。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stored_image`
--

LOCK TABLES `stored_image` WRITE;
/*!40000 ALTER TABLE `stored_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `stored_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stored_image_thumb`
--

DROP TABLE IF EXISTS `stored_image_thumb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stored_image_thumb` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预览图在服务器上的存储位置。9/18日修改长度限制为100.',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件名。',
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。类型为datetime,精确到时分秒。',
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。类型是datetime，精确到时分秒。',
  `type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预览图文件格式。',
  `size` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件大小。以字符串的形式存储。',
  `image_id` int(11) unsigned NOT NULL,
  `image_anju_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`image_id`,`image_anju_user_id`),
  KEY `image_id_to_image_thumb1_idx` (`image_id`,`image_anju_user_id`),
  CONSTRAINT `image_id_to_image_thumb1` FOREIGN KEY (`image_id`, `image_anju_user_id`) REFERENCES `stored_image` (`id`, `anju_user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='照片的预览图表。这里存储两种预览表：用户控制摄像头拍摄的照片的预览图、用户头像的缩略图。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stored_image_thumb`
--

LOCK TABLES `stored_image_thumb` WRITE;
/*!40000 ALTER TABLE `stored_image_thumb` DISABLE KEYS */;
/*!40000 ALTER TABLE `stored_image_thumb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stored_video`
--

DROP TABLE IF EXISTS `stored_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stored_video` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '视频文件存储在服务器上的位置。2019/9/18日修改。',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '视频文件名称。长度限制在25个字符。',
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '视频创建时间。',
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '视频创建时间，精确到时分秒。',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_estonian_ci DEFAULT NULL COMMENT '视频格式。长度限制在5个字符。',
  `length` datetime DEFAULT NULL COMMENT '视频时长。以datetime的形式存储，精确到时分秒。',
  `size` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '视频文件大小，以字符串的形式存储。长度限制为10个字符。',
  `anju_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`anju_user_id`),
  KEY `anju_user_id_to_video1_idx` (`anju_user_id`),
  CONSTRAINT `anju_user_id_to_video1` FOREIGN KEY (`anju_user_id`) REFERENCES `anju_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频表。存储用户录像在服务器上的信息。与用户表是多对一的关系。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stored_video`
--

LOCK TABLES `stored_video` WRITE;
/*!40000 ALTER TABLE `stored_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `stored_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stored_video_thumb`
--

DROP TABLE IF EXISTS `stored_video_thumb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stored_video_thumb` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预览图在服务器上的存储位置。2019/9/18日修改。',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件名。',
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。',
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。类型为datetime，精确到时分秒。',
  `type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预览图文件格式。',
  `size` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件大小。以字符串的形式存储。',
  `video_id` int(11) unsigned NOT NULL,
  `video_anju_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`video_id`,`video_anju_user_id`),
  KEY `video_id_to_video_thumb1_idx` (`video_id`,`video_anju_user_id`),
  CONSTRAINT `video_id_to_video_thumb1` FOREIGN KEY (`video_id`, `video_anju_user_id`) REFERENCES `stored_video` (`id`, `anju_user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频缩略图表。记录用户的录像的缩略图相关信息。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stored_video_thumb`
--

LOCK TABLES `stored_video_thumb` WRITE;
/*!40000 ALTER TABLE `stored_video_thumb` DISABLE KEYS */;
/*!40000 ALTER TABLE `stored_video_thumb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal`
--

DROP TABLE IF EXISTS `terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '终端名称，长度限制15个字符。',
  `mac` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '终端MAC地址。长度限制在20字符。',
  `ip` varchar(16) DEFAULT NULL COMMENT 'IP地址。长度设置为16个字符。',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '加入phone列，让terminal.id和user.id可以被查询，然后插入到user_has_terminal表之中。',
  `using` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '标志当前终端是否被使用。值有两种“Y”与“N”',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='用户终端表。记录用户所用的终端。与用户是多对多的关系。所以存在中间表：user_has_terminal。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal`
--

LOCK TABLES `terminal` WRITE;
/*!40000 ALTER TABLE `terminal` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminal` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `AFTER_terminal_INSERT` AFTER INSERT ON `terminal` FOR EACH ROW insert into user_has_terminal values
    (
    default,default,default,default,
        (select anju_user.id from anju_user where   anju_user.phone=new.phone
        ),new.id
    ) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_has_terminal`
--

DROP TABLE IF EXISTS `user_has_terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_terminal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `create` datetime DEFAULT CURRENT_TIMESTAMP,
  `update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '已绑定' COMMENT '描述终端的状态，假如在终端管理页面发生了对终端的删除，就对其更改状态。',
  `anju_user_id` int(10) unsigned NOT NULL,
  `terminal_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`,`anju_user_id`,`terminal_id`),
  KEY `anju_user_id_to_user_has_terminal1_idx` (`anju_user_id`),
  KEY `terminal_id_to_user_has_terminal1_idx` (`terminal_id`),
  CONSTRAINT `anju_user_id_to_user_has_terminal1` FOREIGN KEY (`anju_user_id`) REFERENCES `anju_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `terminal_id_to_user_has_terminal1` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='作为user表和terminal表的中间表。便于查询。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_terminal`
--

LOCK TABLES `user_has_terminal` WRITE;
/*!40000 ALTER TABLE `user_has_terminal` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_terminal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-12 11:07:28
CREATE DATABASE  IF NOT EXISTS `testfor` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `testfor`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: testfor
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `anju_user`
--

DROP TABLE IF EXISTS `anju_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anju_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `countname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户。记录账号名，长度限制在15个字符。不唯一。',
  `password` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码，限制长度在15个字符。不唯一。前端需要对密码进行密码强度判断。具体强度规则暂未定下。',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话号码。长度限制在15个字符。唯一。',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户邮件地址。长度限制在20个字符。唯一。',
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。记录用户账户创建时间。类型为datetime，精确到时分秒。',
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。记录用户账号资料更新时间，类型为datetime，精确到时分秒。',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '未知' COMMENT '用户性别（可选信息）。可选字符‘男’，‘女’，‘未知’。',
  `birth` date DEFAULT '1990-01-01' COMMENT '用户生日（可选数据），类型是date，精确到年月日。',
  `useplace` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '家用 室内' COMMENT '添加用户使用场景字段。限制长度为15个字符。',
  `wechatid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'wechatid,记录用户的微信id。用于登录验证。可空，但是唯一。',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `wechatid_UNIQUE` (`wechatid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='用户表。数据库核心表。记录用户的相关各种信息。部分用户可以选填，部分必须填。具体看字段注释。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anju_user`
--

LOCK TABLES `anju_user` WRITE;
/*!40000 ALTER TABLE `anju_user` DISABLE KEYS */;
INSERT INTO `anju_user` VALUES (18,'Sppp','123456','15107949156','348199272@qq.com','2019-09-10 11:31:33','2019-09-20 09:42:54','男','1990-01-01','家用 室内',''),(20,'3eAw2zr','123456','18370746404','2420971940@qq.com','2019-09-16 10:04:31','2019-09-20 09:43:38','未知','1990-01-01','家用 室内','otC0lt10QjEjVanCwCLFOECEdD2o');
/*!40000 ALTER TABLE `anju_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `AFTER_anju_user_UPDATE` AFTER UPDATE ON `anju_user` FOR EACH ROW update terminal set terminal.phone=new.phone where terminal.phone=old.phone */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `AFTER_anju_user_DELETE` AFTER DELETE ON `anju_user` FOR EACH ROW BEGIN
		delete from operationlog where operationlog.anju_user_id = old.id;
		delete from user_has_terminal where user_has_terminal.anju_user_id = old.id;
		delete from terminal where terminal.phone=old.phone;
		delete from friend where friend.anju_user_id = old.id or friend.anju_user_id1 = old.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备名称，长度限制在15字符。',
  `group` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'null' COMMENT '分组。mysql中只记录设备所在分组名。默认值"null"。',
  `model` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '型号。长度限制在15字符。非空。',
  `serial` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备序列号。长度限制在20个字符。',
  `prop` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备特性。若干表述特性的string存储在这，程序获取之后直接解析。',
  `version` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本号。长度限制在 15字符。',
  `manual` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户指南的url地址，可以为空。',
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。类型为datetime,精确到时分秒。',
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。类型为datetime,精确到时分秒。',
  `anju_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`anju_user_id`),
  KEY `anju_user_id_to_device1_idx` (`anju_user_id`),
  CONSTRAINT `anju_user_id_to_device1` FOREIGN KEY (`anju_user_id`) REFERENCES `anju_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci COMMENT='设备表。记录设备数据。该表和friend_has_device表是一对多的关系，和user表是多对一的关系。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_has_group`
--

DROP TABLE IF EXISTS `device_has_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_has_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `create` datetime DEFAULT CURRENT_TIMESTAMP,
  `update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `device_id_to_device_has_group1_idx` (`device_id`),
  KEY `group_id_to_device_has_group1_idx` (`group_id`),
  CONSTRAINT `device_id_to_device_has_group1` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `group_id_to_device_has_group1` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录分组信息，但是设备与分组之间是Non-identifying relationship.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_has_group`
--

LOCK TABLES `device_has_group` WRITE;
/*!40000 ALTER TABLE `device_has_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_has_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。类型为datetime,精确到时分秒。',
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。类型为datetime,精确到时分秒。',
  `anju_user_id` int(10) unsigned NOT NULL,
  `anju_user_id1` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`anju_user_id`,`anju_user_id1`),
  KEY `anju_user_id_to_friend1_idx` (`anju_user_id`),
  KEY `anju_user_id_to_friend2_idx` (`anju_user_id1`),
  CONSTRAINT `anju_user_id_to_friend1` FOREIGN KEY (`anju_user_id`) REFERENCES `anju_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `anju_user_id_to_friend2` FOREIGN KEY (`anju_user_id1`) REFERENCES `anju_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='好友表。用户添加好友时输入对方手机号，首先在用户表里搜寻其手机号。有则说明是已经注册的用户，无则不是。不管对方有无注册，friend的主键ID一定要被创建。假如有某个用户注销了，frined改对应的用户也要删除。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户设备分组',
  `create` datetime DEFAULT CURRENT_TIMESTAMP,
  `update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分组表，记录用户设备分组。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `living_video`
--

DROP TABLE IF EXISTS `living_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `living_video` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '设备的推流地址。',
  `create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。',
  `update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间.',
  `device_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`device_id`),
  KEY `device_id_to_living_video1_idx` (`device_id`),
  CONSTRAINT `device_id_to_living_video1` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='该表记录用户的设备在推流时相关信息。与设备表是一对一关系。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `living_video`
--

LOCK TABLES `living_video` WRITE;
/*!40000 ALTER TABLE `living_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `living_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operationlog`
--

DROP TABLE IF EXISTS `operationlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operationlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `log` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作日志文本存档。存储为VARCHAR。最大为20个字符。',
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。',
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。',
  `terminal_id` int(11) unsigned NOT NULL,
  `anju_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`terminal_id`,`anju_user_id`),
  KEY `terminal_id_to_operationlog1_idx` (`terminal_id`),
  KEY `anju_user_id_to_operationlog1_idx` (`anju_user_id`),
  CONSTRAINT `anju_user_id_to_operationlog1` FOREIGN KEY (`anju_user_id`) REFERENCES `anju_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `terminal_id_to_operationlog1` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=utf8 COMMENT='操作日志表。表中字段tinytext记录具体的用户操作。tinytext的内容由程序自动生成，记录用户的关键操作。例如登录、注销、解除设备绑定等等。随着时间的推移。此表的大小会越来越大。所以应该对每个用户设定查看日期，只存储N日的操作日志。具体方式还没定下来。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operationlog`
--

LOCK TABLES `operationlog` WRITE;
/*!40000 ALTER TABLE `operationlog` DISABLE KEYS */;
INSERT INTO `operationlog` VALUES (400,'退出账号','2019-09-20 09:39:44','2019-09-20 09:39:44',59,18),(401,'登录账号','2019-09-20 09:39:48','2019-09-20 09:39:48',59,18),(402,'退出账号','2019-09-20 09:40:52','2019-09-20 09:40:52',59,18),(403,'登录账号','2019-09-20 09:41:32','2019-09-20 09:41:32',59,18),(404,'退出账号','2019-09-20 09:42:58','2019-09-20 09:42:58',59,18),(419,'退出账号','2019-09-20 18:14:46','2019-09-20 18:14:46',64,20),(420,'登录账号','2019-09-20 18:14:50','2019-09-20 18:14:50',64,20),(421,'退出账号','2019-09-21 10:35:48','2019-09-21 10:35:48',64,20),(422,'登录账号','2019-09-21 10:35:52','2019-09-21 10:35:52',64,20),(423,'退出账号','2019-09-21 10:35:59','2019-09-21 10:35:59',64,20),(424,'登录账号','2019-09-21 10:36:02','2019-09-21 10:36:02',64,20),(425,'退出账号','2019-09-21 10:38:01','2019-09-21 10:38:01',64,20),(426,'登录账号','2019-09-21 10:38:04','2019-09-21 10:38:04',64,20);
/*!40000 ALTER TABLE `operationlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_device`
--

DROP TABLE IF EXISTS `shared_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shared_device` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。',
  `friend_id` int(10) unsigned NOT NULL,
  `friend_anju_user_id` int(10) unsigned NOT NULL,
  `friend_anju_user_id1` int(10) unsigned NOT NULL,
  `device_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`friend_id`,`friend_anju_user_id`,`friend_anju_user_id1`,`device_id`),
  KEY `friend_id_to_shared_device1_idx` (`friend_id`,`friend_anju_user_id`,`friend_anju_user_id1`),
  KEY `device_id_to_shared_device1_idx` (`device_id`),
  CONSTRAINT `device_id_to_shared_device1` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `friend_id_to_shared_device1` FOREIGN KEY (`friend_id`, `friend_anju_user_id`, `friend_anju_user_id1`) REFERENCES `friend` (`id`, `anju_user_id`, `anju_user_id1`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='这个表记录好友之间的共享设备。该表的更新，不能通过触发器自动更新。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_device`
--

LOCK TABLES `shared_device` WRITE;
/*!40000 ALTER TABLE `shared_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stored_image`
--

DROP TABLE IF EXISTS `stored_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stored_image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片存储在服务器上的位置。长度控制在100个字符。2019/9/18日修改。',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '照片名称。长度控制在25个字符。',
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。',
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更改时间。',
  `format` varchar(5) CHARACTER SET utf32 COLLATE utf32_general_ci DEFAULT NULL COMMENT '照片格式。',
  `size` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件大小。以字符串的形式储存。',
  `anju_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`anju_user_id`),
  KEY `anju_user_id_to_image1_idx` (`anju_user_id`),
  CONSTRAINT `anju_user_id_to_image1` FOREIGN KEY (`anju_user_id`) REFERENCES `anju_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片表。记录两中图片数据：一、用户控制摄像头拍的且存储在云端的照片；二、用户头像。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stored_image`
--

LOCK TABLES `stored_image` WRITE;
/*!40000 ALTER TABLE `stored_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `stored_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stored_image_thumb`
--

DROP TABLE IF EXISTS `stored_image_thumb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stored_image_thumb` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预览图在服务器上的存储位置。9/18日修改长度限制为100.',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件名。',
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。类型为datetime,精确到时分秒。',
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。类型是datetime，精确到时分秒。',
  `type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预览图文件格式。',
  `size` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件大小。以字符串的形式存储。',
  `image_id` int(11) unsigned NOT NULL,
  `image_anju_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`image_id`,`image_anju_user_id`),
  KEY `image_id_to_image_thumb1_idx` (`image_id`,`image_anju_user_id`),
  CONSTRAINT `image_id_to_image_thumb1` FOREIGN KEY (`image_id`, `image_anju_user_id`) REFERENCES `stored_image` (`id`, `anju_user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='照片的预览图表。这里存储两种预览表：用户控制摄像头拍摄的照片的预览图、用户头像的缩略图。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stored_image_thumb`
--

LOCK TABLES `stored_image_thumb` WRITE;
/*!40000 ALTER TABLE `stored_image_thumb` DISABLE KEYS */;
/*!40000 ALTER TABLE `stored_image_thumb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stored_video`
--

DROP TABLE IF EXISTS `stored_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stored_video` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '视频文件存储在服务器上的位置。2019/9/18日修改。',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '视频文件名称。长度限制在25个字符。',
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '视频创建时间。',
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '视频创建时间，精确到时分秒。',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_estonian_ci DEFAULT NULL COMMENT '视频格式。长度限制在5个字符。',
  `length` datetime DEFAULT NULL COMMENT '视频时长。以datetime的形式存储，精确到时分秒。',
  `size` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '视频文件大小，以字符串的形式存储。长度限制为10个字符。',
  `anju_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`anju_user_id`),
  KEY `anju_user_id_to_video1_idx` (`anju_user_id`),
  CONSTRAINT `anju_user_id_to_video1` FOREIGN KEY (`anju_user_id`) REFERENCES `anju_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频表。存储用户录像在服务器上的信息。与用户表是多对一的关系。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stored_video`
--

LOCK TABLES `stored_video` WRITE;
/*!40000 ALTER TABLE `stored_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `stored_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stored_video_thumb`
--

DROP TABLE IF EXISTS `stored_video_thumb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stored_video_thumb` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预览图在服务器上的存储位置。2019/9/18日修改。',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件名。',
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。',
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。类型为datetime，精确到时分秒。',
  `type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预览图文件格式。',
  `size` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件大小。以字符串的形式存储。',
  `video_id` int(11) unsigned NOT NULL,
  `video_anju_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`video_id`,`video_anju_user_id`),
  KEY `video_id_to_video_thumb1_idx` (`video_id`,`video_anju_user_id`),
  CONSTRAINT `video_id_to_video_thumb1` FOREIGN KEY (`video_id`, `video_anju_user_id`) REFERENCES `stored_video` (`id`, `anju_user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频缩略图表。记录用户的录像的缩略图相关信息。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stored_video_thumb`
--

LOCK TABLES `stored_video_thumb` WRITE;
/*!40000 ALTER TABLE `stored_video_thumb` DISABLE KEYS */;
/*!40000 ALTER TABLE `stored_video_thumb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal`
--

DROP TABLE IF EXISTS `terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '终端名称，长度限制15个字符。',
  `mac` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '终端MAC地址。长度限制在20字符。',
  `ip` varchar(16) DEFAULT NULL COMMENT 'IP地址。长度设置为16个字符。',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '加入phone列，让terminal.id和user.id可以被查询，然后插入到user_has_terminal表之中。',
  `using` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '标志当前终端是否被使用。值有两种“Y”与“N”',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='用户终端表。记录用户所用的终端。与用户是多对多的关系。所以存在中间表：user_has_terminal。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal`
--

LOCK TABLES `terminal` WRITE;
/*!40000 ALTER TABLE `terminal` DISABLE KEYS */;
INSERT INTO `terminal` VALUES (59,'PCGM00','C0:2E:25:D9:CE:23','192.168.137.185','15107949156','N'),(61,'GM1900','48:01:C5:17:B4:69','192.168.137.37','15107949156','N'),(63,'GM1900','48:01:C5:17:B4:69','192.168.137.160','18370746404','N'),(64,'PCGM00','C0:2E:25:D9:CE:23','192.168.137.170','18370746404','Y');
/*!40000 ALTER TABLE `terminal` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `AFTER_terminal_INSERT` AFTER INSERT ON `terminal` FOR EACH ROW insert into user_has_terminal
		set terminal_id = new.id,
		anju_user_id = (select id from anju_user where anju_user.phone=new.phone) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_has_terminal`
--

DROP TABLE IF EXISTS `user_has_terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_terminal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `create` datetime DEFAULT CURRENT_TIMESTAMP,
  `update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '已绑定' COMMENT '描述终端的状态，假如在终端管理页面发生了对终端的删除，就对其更改状态。',
  `anju_user_id` int(10) unsigned NOT NULL,
  `terminal_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`,`anju_user_id`,`terminal_id`),
  KEY `anju_user_id_to_user_has_terminal1_idx` (`anju_user_id`),
  KEY `terminal_id_to_user_has_terminal1_idx` (`terminal_id`),
  CONSTRAINT `anju_user_id_to_user_has_terminal1` FOREIGN KEY (`anju_user_id`) REFERENCES `anju_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `terminal_id_to_user_has_terminal1` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COMMENT='作为user表和terminal表的中间表。便于查询。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_terminal`
--

LOCK TABLES `user_has_terminal` WRITE;
/*!40000 ALTER TABLE `user_has_terminal` DISABLE KEYS */;
INSERT INTO `user_has_terminal` VALUES (124,'2019-09-10 11:31:33','2019-09-10 11:31:33','已绑定',18,59),(126,'2019-09-12 09:52:43','2019-09-12 09:52:43','已绑定',18,61),(128,'2019-09-16 10:04:31','2019-09-16 10:04:31','已绑定',20,63),(129,'2019-09-20 09:43:41','2019-09-20 09:43:41','已绑定',20,64);
/*!40000 ALTER TABLE `user_has_terminal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-12 11:07:29
