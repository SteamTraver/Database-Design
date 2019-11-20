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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-20 16:15:40
