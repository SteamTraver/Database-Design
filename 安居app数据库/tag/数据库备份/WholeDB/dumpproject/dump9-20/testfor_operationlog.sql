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
  KEY `A_id_T_id_create` (`anju_user_id`,`terminal_id`,`create`),
  CONSTRAINT `anju_user_id_to_operationlog1` FOREIGN KEY (`anju_user_id`) REFERENCES `anju_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `terminal_id_to_operationlog1` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=408 DEFAULT CHARSET=utf8 COMMENT='操作日志表。表中字段tinytext记录具体的用户操作。tinytext的内容由程序自动生成，记录用户的关键操作。例如登录、注销、解除设备绑定等等。随着时间的推移。此表的大小会越来越大。所以应该对每个用户设定查看日期，只存储N日的操作日志。具体方式还没定下来。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operationlog`
--

LOCK TABLES `operationlog` WRITE;
/*!40000 ALTER TABLE `operationlog` DISABLE KEYS */;
INSERT INTO `operationlog` VALUES (364,'退出账号','2019-09-19 16:08:19','2019-09-19 16:08:19',63,20),(368,'登录账号','2019-09-19 16:14:51','2019-09-19 16:14:51',63,20),(377,'退出账号','2019-09-19 16:47:01','2019-09-19 16:47:01',63,20),(378,'登录账号','2019-09-19 16:48:28','2019-09-19 16:48:28',63,20),(379,'退出账号','2019-09-19 16:48:36','2019-09-19 16:48:36',63,20),(380,'登录账号','2019-09-19 16:48:43','2019-09-19 16:48:43',63,20),(400,'退出账号','2019-09-20 09:39:44','2019-09-20 09:39:44',59,18),(401,'登录账号','2019-09-20 09:39:48','2019-09-20 09:39:48',59,18),(402,'退出账号','2019-09-20 09:40:52','2019-09-20 09:40:52',59,18),(403,'登录账号','2019-09-20 09:41:32','2019-09-20 09:41:32',59,18),(404,'退出账号','2019-09-20 09:42:58','2019-09-20 09:42:58',59,18),(405,'登录账号','2019-09-20 09:43:41','2019-09-20 09:43:41',63,20),(406,'登录账号','2019-09-20 09:43:41','2019-09-20 09:43:41',64,20);
/*!40000 ALTER TABLE `operationlog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-20 16:15:55
