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
-- Table structure for table `operationlog`
--

DROP TABLE IF EXISTS `operationlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operationlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键。类型为自增。',
  `log` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作日志文本存档。存储为VARCHAR。最大为20个字符。',
  `create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间。',
  `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间。',
  `anju_user_id` int(11) NOT NULL,
  `terminal_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`anju_user_id`,`terminal_id`),
  KEY `anju_user_id_to_operationlog1_idx` (`anju_user_id`),
  KEY `terminal_id_to_operationlog1_idx` (`terminal_id`),
  CONSTRAINT `anju_user_id_to_operationlog1` FOREIGN KEY (`anju_user_id`) REFERENCES `anju_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `terminal_id_to_operationlog1` FOREIGN KEY (`terminal_id`) REFERENCES `terminal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COMMENT='操作日志表。表中字段tinytext记录具体的用户操作。tinytext的内容由程序自动生成，记录用户的关键操作。例如登录、注销、解除设备绑定等等。随着时间的推移。此表的大小会越来越大。所以应该对每个用户设定查看日期，只存储N日的操作日志。具体方式还没定下来。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operationlog`
--

LOCK TABLES `operationlog` WRITE;
/*!40000 ALTER TABLE `operationlog` DISABLE KEYS */;
INSERT INTO `operationlog` VALUES (89,'登录账号','2019-09-07 15:18:07','2019-09-07 15:18:07',3,24),(90,'退出账号','2019-09-07 15:18:22','2019-09-07 15:18:22',3,24),(91,'登录账号','2019-09-07 15:18:29','2019-09-07 15:18:29',3,24),(92,'退出账号','2019-09-07 15:19:51','2019-09-07 15:19:51',3,24),(93,'更换号码','2019-09-07 15:20:11','2019-09-07 15:20:11',3,24),(110,'退出账号','2019-09-09 11:01:45','2019-09-09 11:01:45',5,26),(111,'登录账号','2019-09-09 11:01:52','2019-09-09 11:01:52',5,26),(178,'退出账号','2019-09-09 15:26:47','2019-09-09 15:26:47',8,31),(191,'退出账号','2019-09-09 15:41:31','2019-09-09 15:41:31',10,30),(192,'退出账号','2019-09-09 15:41:31','2019-09-09 15:41:31',10,33),(194,'登录账号','2019-09-09 15:41:39','2019-09-09 15:41:39',10,30),(195,'登录账号','2019-09-09 15:41:39','2019-09-09 15:41:39',10,33),(197,'退出账号','2019-09-09 15:42:07','2019-09-09 15:42:07',10,30),(198,'退出账号','2019-09-09 15:42:07','2019-09-09 15:42:07',10,33),(200,'登录账号','2019-09-09 15:42:17','2019-09-09 15:42:17',10,32);
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

-- Dump completed on 2019-09-09 16:34:16
