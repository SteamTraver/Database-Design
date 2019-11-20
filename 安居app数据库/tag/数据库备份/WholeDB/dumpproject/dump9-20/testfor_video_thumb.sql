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
-- Table structure for table `video_thumb`
--

DROP TABLE IF EXISTS `video_thumb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_thumb` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键。类型为int auto increament usigned',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预览图在服务器上的存储位置。',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件名。',
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。',
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。类型为datetime，精确到时分秒。',
  `type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预览图文件格式。',
  `size` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件大小。以字符串的形式存储。',
  `video_id` int(11) unsigned NOT NULL,
  `video_anju_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`video_id`,`video_anju_user_id`),
  KEY `video_id_to_video_thumb1_idx` (`video_id`,`video_anju_user_id`),
  KEY `url` (`url`),
  CONSTRAINT `video_id_to_video_thumb1` FOREIGN KEY (`video_id`, `video_anju_user_id`) REFERENCES `video` (`id`, `anju_user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频缩略图表。记录用户的录像的缩略图相关信息。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_thumb`
--

LOCK TABLES `video_thumb` WRITE;
/*!40000 ALTER TABLE `video_thumb` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_thumb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-20 16:15:50
