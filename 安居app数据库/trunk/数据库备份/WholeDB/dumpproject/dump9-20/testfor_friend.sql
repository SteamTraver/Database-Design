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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-20 16:15:55
