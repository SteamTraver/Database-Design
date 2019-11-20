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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-12 11:07:00
