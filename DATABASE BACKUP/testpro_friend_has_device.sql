CREATE DATABASE  IF NOT EXISTS `testpro` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `testpro`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: testpro
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
-- Table structure for table `friend_has_device`
--

DROP TABLE IF EXISTS `friend_has_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_has_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键。类型为自增。',
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，类型为datetime，精确到时分秒。',
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间，类型为datetime，精确到时分秒。',
  `friend_id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `device_anju_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`friend_id`,`device_id`,`device_anju_user_id`),
  KEY `friend_id_to_friend_has_device1_idx` (`friend_id`),
  KEY `device_id_to_friend_has_device1_idx` (`device_id`,`device_anju_user_id`),
  CONSTRAINT `device_id_to_friend_has_device1` FOREIGN KEY (`device_id`, `device_anju_user_id`) REFERENCES `device` (`id`, `anju_user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `friend_id_to_friend_has_device1` FOREIGN KEY (`friend_id`) REFERENCES `friend` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备共享表。存储设备被共享时的信息表。与好友是多对一的关系，与用户是多对一的关系。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_has_device`
--

LOCK TABLES `friend_has_device` WRITE;
/*!40000 ALTER TABLE `friend_has_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_has_device` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-09 16:34:13
