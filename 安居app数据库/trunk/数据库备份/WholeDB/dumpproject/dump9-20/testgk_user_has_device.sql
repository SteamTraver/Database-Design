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
-- Table structure for table `user_has_device`
--

DROP TABLE IF EXISTS `user_has_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_device` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT ' 主键，unsigned int AI',
  `anju_user_id` int(10) unsigned NOT NULL,
  `device_id` int(10) unsigned NOT NULL,
  `create` datetime DEFAULT CURRENT_TIMESTAMP,
  `update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`anju_user_id`,`device_id`),
  KEY `anju_user_id_to_user_has_device1_idx` (`anju_user_id`),
  KEY `device_id_to_user_has_device1_idx` (`device_id`),
  CONSTRAINT `anju_user_id_to_user_has_device1` FOREIGN KEY (`anju_user_id`) REFERENCES `anju_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `device_id_to_user_has_device1` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备与用户之间是多对多的关系-由于共享设备的存在';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_device`
--

LOCK TABLES `user_has_device` WRITE;
/*!40000 ALTER TABLE `user_has_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_device` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-20 16:15:43
