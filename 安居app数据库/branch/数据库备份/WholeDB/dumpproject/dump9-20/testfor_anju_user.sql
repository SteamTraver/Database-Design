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
  `wechatid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户的微信id，用于微信登录验证。每个用户的wechatid是唯一的。长度经过测试是28，这里给50.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  KEY `phone_email` (`phone`,`email`),
  KEY `email` (`email`),
  KEY `phone_id` (`id`,`phone`) COMMENT '通过手机号查找id是频繁发操作，所以添加index。' /*!80000 INVISIBLE */,
  KEY `phone_wechatid_password_id` (`id`,`password`,`phone`,`wechatid`) COMMENT '新增索引：userid-phone-wechat-password。'
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-20 16:15:52
