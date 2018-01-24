-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: trivia
-- ------------------------------------------------------
-- Server version	5.7.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `JBOSS_EJB_TIMER`
--

DROP TABLE IF EXISTS `JBOSS_EJB_TIMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBOSS_EJB_TIMER` (
  `ID` varchar(255) NOT NULL,
  `TIMED_OBJECT_ID` varchar(255) NOT NULL,
  `INITIAL_DATE` datetime DEFAULT NULL,
  `REPEAT_INTERVAL` bigint(20) DEFAULT NULL,
  `NEXT_DATE` datetime DEFAULT NULL,
  `PREVIOUS_RUN` datetime DEFAULT NULL,
  `PRIMARY_KEY` varchar(255) DEFAULT NULL,
  `INFO` text,
  `TIMER_STATE` varchar(32) DEFAULT NULL,
  `SCHEDULE_EXPR_SECOND` varchar(100) DEFAULT NULL,
  `SCHEDULE_EXPR_MINUTE` varchar(100) DEFAULT NULL,
  `SCHEDULE_EXPR_HOUR` varchar(100) DEFAULT NULL,
  `SCHEDULE_EXPR_DAY_OF_WEEK` varchar(100) DEFAULT NULL,
  `SCHEDULE_EXPR_DAY_OF_MONTH` varchar(100) DEFAULT NULL,
  `SCHEDULE_EXPR_MONTH` varchar(100) DEFAULT NULL,
  `SCHEDULE_EXPR_YEAR` varchar(100) DEFAULT NULL,
  `SCHEDULE_EXPR_START_DATE` varchar(100) DEFAULT NULL,
  `SCHEDULE_EXPR_END_DATE` varchar(100) DEFAULT NULL,
  `SCHEDULE_EXPR_TIMEZONE` varchar(100) DEFAULT NULL,
  `AUTO_TIMER` tinyint(1) DEFAULT NULL,
  `TIMEOUT_METHOD_NAME` varchar(100) DEFAULT NULL,
  `TIMEOUT_METHOD_DECLARING_CLASS` varchar(255) DEFAULT NULL,
  `TIMEOUT_METHOD_DESCRIPTOR` varchar(255) DEFAULT NULL,
  `CALENDAR_TIMER` tinyint(1) DEFAULT NULL,
  `PARTITION_NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `JBOSS_EJB_TIMER_IDENX` (`PARTITION_NAME`,`TIMED_OBJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBOSS_EJB_TIMER`
--

LOCK TABLES `JBOSS_EJB_TIMER` WRITE;
/*!40000 ALTER TABLE `JBOSS_EJB_TIMER` DISABLE KEYS */;
/*!40000 ALTER TABLE `JBOSS_EJB_TIMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JBossTSTxTable`
--

DROP TABLE IF EXISTS `JBossTSTxTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JBossTSTxTable` (
  `StateType` int(11) NOT NULL,
  `Hidden` int(11) NOT NULL,
  `TypeName` varchar(255) NOT NULL,
  `UidString` varchar(255) NOT NULL,
  `ObjectState` blob,
  PRIMARY KEY (`UidString`,`TypeName`,`StateType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JBossTSTxTable`
--

LOCK TABLES `JBossTSTxTable` WRITE;
/*!40000 ALTER TABLE `JBossTSTxTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `JBossTSTxTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ask`
--

DROP TABLE IF EXISTS `ask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ask` (
  `ask_id` bigint(20) NOT NULL,
  `asked` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `scheduled_question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ask_id`),
  KEY `FK_8gmq0h530e33yq7i2a2ifkpwm` (`scheduled_question_id`),
  KEY `FK_bbvy96peu3wmc6y3butawpg2x` (`user_id`),
  CONSTRAINT `FK_8gmq0h530e33yq7i2a2ifkpwm` FOREIGN KEY (`scheduled_question_id`) REFERENCES `scheduled_question` (`scheduled_question_id`),
  CONSTRAINT `FK_bbvy96peu3wmc6y3butawpg2x` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ask`
--

LOCK TABLES `ask` WRITE;
/*!40000 ALTER TABLE `ask` DISABLE KEYS */;
INSERT INTO `ask` VALUES (1,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',1,30),(2,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',1,5),(3,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',1,6),(5,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',1,12),(6,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',1,15),(7,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',1,16),(9,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',1,18),(10,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',1,21),(11,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',1,22),(12,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',1,25),(13,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',1,26),(14,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',1,28),(15,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',1,1),(16,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',1,36),(17,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',1,37),(18,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',1,38),(19,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',2,30),(20,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',2,5),(21,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',2,6),(23,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',2,12),(24,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',2,15),(25,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',2,16),(27,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',2,18),(28,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',2,21),(29,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',2,22),(30,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',1,39),(31,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',1,40),(32,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',2,28),(33,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',2,1),(34,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',2,36),(35,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',2,37),(36,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',2,38),(44,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',2,25),(45,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',2,26),(46,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',2,39),(47,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',2,40),(58,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,30),(59,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,5),(60,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,6),(61,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,12),(62,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,15),(63,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,16),(64,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,18),(65,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,21),(66,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,22),(67,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,25),(68,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,26),(69,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,28),(70,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,1),(71,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,36),(72,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,37),(73,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,38),(74,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,39),(75,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,40),(92,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,35),(93,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,14),(94,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,3),(95,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',3,11),(100,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,30),(101,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,5),(102,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,6),(103,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,12),(104,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,15),(105,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,16),(106,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,18),(107,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,21),(108,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,22),(109,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,25),(110,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,26),(111,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,28),(112,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,1),(113,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,36),(114,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,37),(115,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,38),(116,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,39),(117,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,40),(118,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,35),(119,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,14),(120,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,3),(121,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',4,11),(139,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,30),(140,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,5),(141,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,6),(142,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,12),(143,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,15),(144,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,16),(145,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,18),(146,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,21),(147,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,22),(148,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,25),(149,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,26),(150,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,28),(151,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,1),(152,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,36),(153,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,37),(154,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,38),(155,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,39),(156,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,40),(157,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,35),(158,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,14),(159,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,3),(160,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',5,11),(172,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,30),(173,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,5),(174,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,6),(175,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,12),(176,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,15),(177,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,16),(178,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,18),(179,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,21),(180,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,22),(181,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,25),(182,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,26),(183,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,28),(184,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,1),(185,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,36),(186,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,37),(187,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,38),(188,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,39),(189,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,40),(190,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,35),(191,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,14),(192,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,3),(193,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',6,11),(211,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,30),(212,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,5),(213,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,6),(214,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,12),(215,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,15),(216,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,16),(217,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,18),(218,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,21),(219,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,22),(220,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,25),(221,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,26),(222,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,28),(223,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,1),(224,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,36),(225,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,37),(226,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,38),(227,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,39),(228,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,40),(229,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,35),(230,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,14),(231,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,3),(232,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',7,11),(248,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,30),(249,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,5),(250,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,6),(251,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,12),(252,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,15),(253,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,16),(254,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,18),(255,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,21),(256,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,22),(257,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,25),(258,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,26),(259,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,28),(260,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,1),(261,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,36),(262,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,37),(263,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,38),(264,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,39),(265,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,40),(266,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,35),(267,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,14),(268,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,3),(269,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',8,11),(283,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,30),(284,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,5),(285,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,6),(286,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,12),(287,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,15),(288,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,16),(289,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,18),(290,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,21),(291,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,22),(292,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,25),(293,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,26),(294,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,28),(295,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,1),(296,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,36),(297,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,37),(298,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,38),(299,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,39),(300,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,40),(301,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,35),(302,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,14),(303,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,3),(304,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',9,11),(320,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,30),(321,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,5),(322,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,6),(323,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,12),(324,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,15),(325,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,16),(326,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,18),(327,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,21),(328,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,22),(329,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,25),(330,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,26),(331,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,28),(332,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,1),(333,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,36),(334,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,37),(335,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,38),(336,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,39),(337,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,40),(338,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,35),(339,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,14),(340,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,3),(341,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',10,11),(355,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,30),(356,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,5),(357,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,6),(358,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,12),(359,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,15),(360,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,16),(361,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,18),(362,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,21),(363,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,22),(364,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,25),(365,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,26),(366,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,28),(367,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,1),(368,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,36),(369,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,37),(370,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,38),(371,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,39),(372,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,40),(373,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,35),(374,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,14),(375,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,3),(376,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',11,11),(390,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,30),(391,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,5),(392,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,6),(393,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,12),(394,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,15),(395,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,16),(396,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,18),(397,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,21),(398,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,22),(399,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,25),(400,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,26),(401,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,28),(402,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,1),(403,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,36),(404,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,37),(405,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,38),(406,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,39),(407,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,40),(408,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,35),(409,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,14),(410,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,3),(411,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',13,11),(424,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,30),(425,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,5),(426,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,6),(427,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,12),(428,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,15),(429,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,16),(430,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,18),(431,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,21),(432,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,22),(433,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,25),(434,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,26),(435,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,28),(436,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,1),(437,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,36),(438,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,37),(439,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,38),(440,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,39),(441,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,40),(442,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,35),(443,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,14),(444,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,3),(445,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',14,11),(460,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,30),(461,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,5),(462,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,6),(463,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,12),(464,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,15),(465,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,16),(466,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,18),(467,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,21),(468,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,22),(469,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,25),(470,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,26),(471,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,28),(472,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,1),(473,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,36),(474,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,37),(475,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,38),(476,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,39),(477,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,40),(478,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,35),(479,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,14),(480,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,3),(481,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',15,11);
/*!40000 ALTER TABLE `ask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choice`
--

DROP TABLE IF EXISTS `choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choice` (
  `choice_id` int(11) NOT NULL,
  `choice_text` varchar(5000) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choice`
--

LOCK TABLES `choice` WRITE;
/*!40000 ALTER TABLE `choice` DISABLE KEYS */;
INSERT INTO `choice` VALUES (1,'Red Hat sponsors numerous communities to act as development and testing grounds for what goes into its products.',NULL,NULL),(2,'Red Hat purchases software bug fixes from individuals and groups.',NULL,NULL),(3,'Red Hat offers creative licensing options for developers.',NULL,NULL),(4,'Red Hat develops proprietary software.',NULL,NULL),(5,'Licensing agreements',NULL,NULL),(6,'Free downloads',NULL,NULL),(7,'Subscriptions',NULL,NULL),(8,'Over-the-counter purchases',NULL,NULL),(9,'It ensures all your administrators are properly trained.',NULL,NULL),(10,'It ensures that hardware, applications, and Red Hat products will work together.',NULL,NULL),(11,'It ensures that bugs are fixed within 72 hours.',NULL,NULL),(12,'It ensures year-over-year cost savings.',NULL,NULL),(13,'To reduce the cost of supporting partners.',NULL,NULL),(14,'To reduce the number of partners so there is less competition in each region.',NULL,NULL),(15,'To focus their investment on enabling a talented, capable, and specialized group of partners.',NULL,NULL),(16,'To focus their efforts on the smallest specialized partners who are the only people likely to promote open source solutions.',NULL,NULL),(17,'Identify security vulnerabilities and work with Red Hat Engineering to develop appropriate patches.',NULL,NULL),(18,'Contact your customers when their subscriptions are due for renewal.',NULL,NULL),(19,'Perform remote software fixes.',NULL,NULL),(20,'Protect you and your customers from legal liability.',NULL,NULL),(21,'True',NULL,NULL),(22,'False',NULL,NULL),(23,'It offers hardware and software certifications.',NULL,NULL),(24,'It provides access to security patches and bug fixes.',NULL,NULL),(25,'It provides access to Red Hat&apos;s customer portal.',NULL,NULL),(26,'All of the above',NULL,NULL),(27,'Unlimited for the first six months, 50 for the remainder of the year.',NULL,NULL),(28,'Unlimited, but only with an extended support plan.',NULL,NULL),(29,'50 support calls annually.',NULL,NULL),(30,'Unlimited support incidents or calls.',NULL,NULL),(31,'Customer portal',NULL,NULL),(32,'Red Hat Satellite',NULL,NULL),(33,'www.redhat.com',NULL,NULL),(34,'All of these choices',NULL,NULL),(35,'With a single subscription, customers can run as many instances of Red Hat software as they want.',NULL,NULL),(36,'With the same subscription, customers can upgrade or downgrade to any supported software version and deploy on physical servers, virtual machines, or in the cloud.',NULL,NULL),(37,'Customer can choose how much to pay for subscriptions each year, with a flexible pricing plan so they can spread the subscription cost over any duration.',NULL,NULL),(38,'A subscription provides everything a customer needs to operate a Red Hat solution in their environment',NULL,NULL),(39,'A subscription model allows customers to pay for a full-version upgrades.',NULL,NULL),(40,'A Red Hat subscription provides a per-incident support fee structure.',NULL,NULL),(41,'A Red Hat subscription offers a single, high up-front cost that provides the solution for seven years.',NULL,NULL),(42,'The Subscription Terms of Service',NULL,NULL),(43,'The Customer Agreement',NULL,NULL),(44,'Open Source Assurance',NULL,NULL),(45,'The Enterprise Agreement',NULL,NULL),(46,'The Enterprise Agreement Education Plan (EAEP)',NULL,NULL),(47,'The Subscription Awareness Initiative (SAI)',NULL,NULL),(48,'The Subscription Education and Awareness Program (SEAP)',NULL,NULL),(49,'The Subscription Rights and Responsibilities Center (SRRC)',NULL,NULL),(50,'It streamlines the subscription renewal process.',NULL,NULL),(51,'It provides renewal education to partners.',NULL,NULL),(52,'It migrates subscription control to Red Hat after the initial year.',NULL,NULL),(53,'It provides technical support during the renewal process.',NULL,NULL),(54,'It represents an opportunity to upgrade customers from Self-support subscriptions or Standard subscriptions to Premium subscriptions.',NULL,NULL),(55,'It is an annual model offering recurring revenue.',NULL,NULL),(56,'It helps you communicate with a proven pool of customers to generate additional sales.',NULL,NULL),(57,'Red Hat provides partners with an ecosystem to support the delivery of Red Hat solutions.',NULL,NULL),(58,'Red Hat invests in and enables its partners.',NULL,NULL),(59,'Red Hat is the commercial open source leader.',NULL,NULL),(60,'It takes advantage of a collaborative, community-based development program allowing rapid innovation and higher quality.',NULL,NULL),(61,'It provides free software to a wider audience who can promote the solution to their peers, thereby increasing the size of the user base.',NULL,NULL),(62,'The source code is not available to anybody but Red Hat engineers, so Red Hat maintains 100% control over all development.',NULL,NULL),(63,'A bug fix for any problem is guaranteed to occur within an hour.',NULL,NULL),(64,'Nothing, as open source software is generally secure and ready to be used immediately upon release in any large organization.',NULL,NULL),(65,'Red Hat takes open source software and hardens, test, and certifies it for use in mission-critical computing.',NULL,NULL),(66,'Red Hat hires third-party experts to ensure that open source software contains no bugs and is secure.',NULL,NULL),(67,'Red Hat contracts with the open source community to develop specific software applications and upgrades.',NULL,NULL);
/*!40000 ALTER TABLE `choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest`
--

DROP TABLE IF EXISTS `contest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contest` (
  `contest_id` int(11) NOT NULL,
  `contest_title` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`contest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest`
--

LOCK TABLES `contest` WRITE;
/*!40000 ALTER TABLE `contest` DISABLE KEYS */;
INSERT INTO `contest` VALUES (1,'Red Hat',NULL,NULL);
/*!40000 ALTER TABLE `contest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contestant`
--

DROP TABLE IF EXISTS `contestant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contestant` (
  `contestant_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `contest_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`contestant_id`),
  KEY `FK_h87l5i8edfr86av5uqxio49nc` (`contest_id`),
  KEY `FK_egjqpqk6wnqa2bj6tyqm7awyl` (`user_id`),
  CONSTRAINT `FK_egjqpqk6wnqa2bj6tyqm7awyl` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_h87l5i8edfr86av5uqxio49nc` FOREIGN KEY (`contest_id`) REFERENCES `contest` (`contest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contestant`
--

LOCK TABLES `contestant` WRITE;
/*!40000 ALTER TABLE `contestant` DISABLE KEYS */;
INSERT INTO `contestant` VALUES (1,NULL,NULL,1,30),(2,NULL,NULL,1,5),(3,NULL,NULL,1,6),(5,NULL,NULL,1,12),(6,NULL,NULL,1,15),(7,NULL,NULL,1,16),(9,NULL,NULL,1,18),(10,NULL,NULL,1,21),(11,NULL,NULL,1,22),(12,NULL,NULL,1,25),(13,NULL,NULL,1,26),(14,NULL,NULL,1,28),(15,NULL,NULL,1,1),(16,NULL,NULL,1,36),(17,NULL,NULL,1,37),(18,NULL,NULL,1,38),(19,NULL,NULL,1,39),(20,NULL,NULL,1,40),(21,NULL,NULL,1,35),(22,NULL,NULL,1,14),(23,NULL,NULL,1,3),(24,NULL,NULL,1,11);
/*!40000 ALTER TABLE `contestant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (487),(487),(487),(5),(487);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `question_id` int(11) NOT NULL,
  `answer_text` varchar(5000) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `question_text` varchar(5000) DEFAULT NULL,
  `question_value` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'Open source is a development model that takes advantage of a collaborative and community-based development paradigm. Thousands of developers build and share code, and among those contributors you will find developers representing huge organizations like IBM and Intel. This level of collaboration is one reason for the incredible quality of open source.<br>The open source development model is fueled by a community of developers around the world, each working on different projects for different purposes, whereas proprietary models are limited by budget constraints and the vision of a select few individuals. This community effort allows for rapid innovation and higher quality software as the open source model permits developers to fix the bugs where they occur, as soon as they occur.<br>Red Hat continues to acquire effective technology companies to extend our range of solutions into new fields and to strengthen our product portfolio. In the open source model, the source code is accessible. You would not want to buy a car with the hood welded shut; you would want to see the engine so that you know what you are working with. But this freedom is not available in most proprietary models. If you notice a bug in a proprietary model, at best you can document the problem, or you can create aworkaround in your own code. The workaround is not a correct fix, but it might give you the behavior you need. Unfortunately, you cannot know for sure because you cannot see the original problem, only the shadows that it casts. The cumulative result is that open source software is considered to be significantly higher quality than proprietary software.<br> Because open source is a collaborative environment, thousands of developers have contributed hundreds of thousands of lines of code to thousands of open source projects and more are being created every day.<br>Red Hat takes the best code from the community base and make it usable in enterprise environments by hardening, testing, certifying, stabilizing, and supporting it. We take the code and invest a significant portion of our revenue into making it suitable for mission-critical environments.<br> Red Hat sponsors numerous communities to act as testing grounds for what ultimately goes into our products.<br>For example, Fedora is the open source community base for Red Hat Enterprise Linux, JBoss.org is the open source base for JBoss Middleware, Gluster.org is the open source base for Red Hat Storage, and oVirt is the upstream of Red Hat Enterprise Virtualization. The Linux Foundation said it would take 11 billion dollars to create what Fedora represents today, and Fedora continues to evolve and improve.',NULL,'How does Red Hat work collaboratively with the open source community?',1,NULL),(2,'A Red Hat subscription moves available financial resources away from expensive upfront software license fees, making those resources available for consulting, other services, and additional sales on projects that may have otherwise been ignored. Explain to customers that any savings can be used to innovate with their IT budget to meet business needs.<br>A subscription also demonstrates Red Hat&apos;s commitment to our customers and partners. It provides the back-end engineering, development, and testing necessary to create an enterprise-ready product. Every subscription supports an ecosystem of co-development where Red Hat and partners collaborate to certify hardware, software, and cloud provider solutions. The result of this certification program is that customers have access to the largest hardware and software ecosystem in the open source market. This is one of the most important components of the Red Hat model, as it certifies that customers can, in most cases, deploy Red Hat solutions on their existing hardware, eliminating the need for hardware upgrades.',NULL,'Red Hat products provide real value through:',1,NULL),(3,'A priority for IT departments is that the application and hardware solutions deployed will function correctly. By collaborating with relevant companies, the Red Hat Certification Program ensures that applications and hardware will work together. Our support plan will also help customers solve any problem that they may encounter.',NULL,'What does Red Hat Certification program ensure?',1,NULL),(4,'Red Hat has adopted a &apos;less is more&apos; strategy. By investing in a small number of high-quality partners like you, we can commit and spend a lot more on providing you with the support and enablement services that will help you succeed. As we broaden our platform portfolio, we need specialized partners with specific integration, development, and systems management skills. The best partners participate in open source communities, which leads to tighter integration with Red Hat, better solutions for customers, and an improved reputation with customers. To support this &apos;less is more&apos; strategy, we have strict selection criteria for choosing partners; which means we only work with strong, skilled, and committed organizations.<br>Red Hat has a model that enables partners to sell more products or services by offering and implementing cost-effective Red Hat solutions, often starting with an open source operating system. An attractive partnership exists when both the partner and Red Hat can help each other succeed.',NULL,'Why is Red Hat investing in a limited number of high-quality partners as part of their &apos;less is more&apos; strategy?',1,NULL),(5,'To date, Red Hat has discovered fixes for more than 98 percent of critical vulnerabilities within one calendar day of being identified. Subscribers also get access to our industryleading Security Response Team, or SRT. SRT is in constant contact with our customers, partners, security watchdog groups, and the global open source community to identify security vulnerabilities. SRT and Red Hat Engineering develop appropriate patches so that our customers can eliminate security threats.',NULL,'What is the task of the Security Response Team (SRT)?',1,NULL),(6,'The growing market demand cannot be met without our partners, and we are taking major steps to help our partners leverage this growth. Our goal is simple: continuous growth with roughly 70 percent of our business delivered through our partners.',NULL,'Partners are important to Red Hat because Red Hat cannot address all the market opportunities.',1,NULL),(7,'A Red Hat subscription provides ongoing delivery. It helps customers get the latest software faster because a subscription includes unlimited access to all updates and upgrades in both binary and source code form. It also provides critical security updates to keep your customers&apos; systems stable and secure by offering the latest, extensively tested security patches through the web-based Customer Portal. This also improves performance because a system running the latest updates performs better and makes issue resolution easier.',NULL,'How does a Red Hat subscription benefit a customer?',1,NULL),(8,'A Red Hat subscription also provides access to technical support so that customers can deploy solutions confidently with the support of Red Hat experts. Customers get access to award-winning, 24-hour technical support with no limit on the number of support incidents.<br>Red Hat will take ownership of any incident so there is no confusion about who owns the problem.',NULL,'What is the limit on the number of customer support incidents or calls allowed with a valid subscription?',1,NULL),(9,'A Red Hat subscription provides ongoing delivery. It helps customers get the latest software faster because a subscription includes unlimited access to all updates and upgrades in both binary and source code form. It also provides critical security updates to keep your customers&apos; systems stable and secure by offering the latest, extensively tested security patches through the web-based Customer Portal.',NULL,'Where do customers go to access all of the features of their Red Hat subscription?',1,NULL),(10,'With Red Hat subscriptions, customers do not have to upgrade to the latest version and each release is supported for up to 10 years, depending on the solution. Subscriptions are flexible and transferable, allowing customers to upgrade their system hardware with no penalty.<br>All these ongoing delivery features provide cost certainty to customers. Once a customer has purchased an appropriate subscription for each instance running, there is nothing else to pay and no hidden costs.',NULL,'Why are Red Hat subscriptions sometimes called &apos;flexible&apos;?',1,NULL),(11,'With Red Hat subscriptions, customers do not have to upgrade to the latest version and each release is supported for up to 10 years, depending on the solution. Subscriptions are flexible and transferable, allowing customers to upgrade their system hardware with no penalty.<br>All these ongoing delivery features provide cost certainty to customers. Once a customer has purchased an appropriate subscription for each instance running, there is nothing else to pay and no hidden costs.',NULL,'Customers are able to transfer a subscription when they upgrade their hardware.',1,NULL),(12,'There are fundamental differences between Red Hat&apos;s subscription model and the licensing models that are typical of most proprietary software vendors.<br>Perhaps the greatest difference is that a subscription provides everything a customer needs to operate Red Hat&apos;s enterprise-ready, open source technology in their environment with no other maintenance costs or fees.<br>In contrast, licensing models often have expensive and unpredictable additions to software costs, such as user access licenses or per-incident support fees.',NULL,'What is the key advantage of a Red Hat subscription over traditional licensing agreements?',1,NULL),(13,'The Red Hat Enterprise Agreement governs the terms under which Red Hat delivers subscriptions. The Enterprise Agreement applies any time an active subscription exists within the customer&apos;s environment.<br>Specifically, it outlines the rights and responsibilities of both Red Hat and the customer. This includes the customer&apos;s right to access the full value of our development model,including all tested and certified software, maintenance, documentation, support, and indemnification, and the responsibility to maintain one subscription for each resource running Red Hat software.',NULL,'Which document governs the relationship between Red Hat and its customers?',1,NULL),(14,'The subscription model is a powerful consumption model, but some customers may not be familiar with their responsibilities under their subscription agreement or are not aware of the rapid rate of adoption of Red Hat software.<br>Red Hat has addressed this need through the Subscription Education and Awareness Program, or SEAP, which is a resource to assist customers and partners in understanding and adhering to the subscription model.<br>In addition, you can always reach out to your Red Hat account manager to address your questions or concerns.<br>The most basic types of non-compliance you will see are non-renewals, overdeployment, third-party support, and redistribution without rights.<br>If you spot non-compliance in your customer base, you should expose this to Red Hat; and we will help you convert it to a deal that you retain and get credit for. Note that customers who go through the SEAP process better understand the value of their subscriptions, which leads to broader adoption and more consistent renewals.',NULL,'Which Red Hat resource assists customers and partners with understanding Red Hat&apos;s subscription model?',1,NULL),(15,'The Red Hat Renewals Program streamlines the subscription renewal process.<br>A dedicated team at Red Hat will handle all upfront interaction with your customers. This includes contacting your customers to remind them of upcoming subscription expirations. It also includes discussing compliance issues and identifying up-sell opportunities.',NULL,'What is the purpose of the Red Hat Renewals Program?',1,NULL),(16,'The Red Hat Renewals Program is not only advantageous to your customer; there are also many benefits to you, our partner. Every existing customer is a renewal candidate. You can dip into a proven pool of customers to generate additional sales.<br>Renewals present an opportunity to upgrade customers from Self-support subscriptions or Standard subscriptions to Premium subscriptions.<br>Customers that understand the Red Hat subscription value are good candidates for additional revenue by selling them other Red Hat products such as Red Hat Satellite or consultancy services that you, as a partner, might provide.<br>By educating customers on how subscriptions facilitate regulatory and industry compliance, Red Hat and partners can encourage renewals.<br>You can use renewal time to connect with customers and maintain account control. Retention through renewal provides an opportunity to increase customer satisfaction and position yourself for follow-on sales or expansion.',NULL,'What are the benefits of the Renewal Program for Red Hat partners?',1,NULL),(17,'One of the most asked questions by our partners is if all customer systems that are running Red Hat products require a subscription.<br>Red Hats business model is a one-for-one concept, meaning that a customer is required to purchase a subscription for each instance of Red Hat Enterprise Linux or JBoss Middleware that is installed for as long as there are any active subscriptions within their organization.<br>Red Hat subscriptions provide access to tested and certified solutions, unlimited maintenance, upgrades, and support; all as part of a subscription. This makes our solutions ready for mission-critical use.<br>Red Hat understands that different machines have different technological and support needs; therefore, we have a full range of subscription offerings that can be mixed and matched within customers&apos; environments to meet those needs. ',NULL,'While a customer maintains at least one active subscription, each system running Red Hat products requires a subscription.',1,NULL),(18,'Why are partners so important to Red Hat? The partner ecosystem supports our intention to deliver solutions to our customers. One of the pillars of Red Hat&apos;s strategy is continued investment and enablement of our partners. Red Hat understands the reality that we simply cannot address the available market opportunities without the assistance of our partners. We need you more than you need us! Our goal is to establish a strong, unified partner base for the enterprise with a business model that is predictable, reliable, and best of all, profitable. As a result of our investment over the last several years, we continue to see great success in our partnership ecosystem.<br>And of course, Red Hat is a trusted market leader in open source with the power to provide value to your customers more easily. The key is that you can drive the value of the investment to the customer much easier by partnering with Red Hat.',NULL,'What are some of the benefits of partnering with Red Hat?',1,NULL),(19,'Open source is a development model that takes advantage of a collaborative and community-based development paradigm. Thousands of developers build and share code, and among those contributors you will find developers representing huge organizations like IBM and Intel. This level of collaboration is one reason for the incredible quality of open source.<br>The open source development model is fueled by a community of developers around the world, each working on different projects for different purposes, whereas proprietary models are limited by budget constraints and the vision of a select few individuals. This community effort allows for rapid innovation and higher quality software as the open source model permits developers to fix the bugs where they occur, as soon as they occur. Red Hat continues to acquire effective technology companies to extend our range of solutions into new fields and to strengthen our product portfolio.',NULL,'What is the main advantage of the open source development model?',1,NULL),(20,'As the trusted open source leader, Red Hat collaborates in communities to create better technology and then delivers solutions to our customers that offer the highest levels of performance and reliability at a reasonable cost. Value is paramount for Red Hat.<br>We take the best open source technology and we harden it, test it, and certify it for use in mission-critical computing. It is absolutely enterprise-ready. Once hardened, Red Hat gives the open source technology back to the open source community.',NULL,'How does Red Hat ensure that software developed by the open source community is safe in a mission-critical environment?',1,NULL);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_choice`
--

DROP TABLE IF EXISTS `question_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_choice` (
  `question_choice_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `choice_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`question_choice_id`),
  KEY `FK_2066ml8tr2wpf0o0aagsry6gx` (`choice_id`),
  KEY `FK_drrr6mb7k16ao25w6txc41pdd` (`question_id`),
  CONSTRAINT `FK_2066ml8tr2wpf0o0aagsry6gx` FOREIGN KEY (`choice_id`) REFERENCES `choice` (`choice_id`),
  CONSTRAINT `FK_drrr6mb7k16ao25w6txc41pdd` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_choice`
--

LOCK TABLES `question_choice` WRITE;
/*!40000 ALTER TABLE `question_choice` DISABLE KEYS */;
INSERT INTO `question_choice` VALUES (1,NULL,1,NULL,1,1),(2,NULL,0,NULL,2,1),(3,NULL,0,NULL,3,1),(4,NULL,0,NULL,4,1),(5,NULL,0,NULL,5,2),(6,NULL,0,NULL,6,2),(7,NULL,1,NULL,7,2),(8,NULL,0,NULL,8,2),(9,NULL,0,NULL,9,3),(10,NULL,1,NULL,10,3),(11,NULL,0,NULL,11,3),(12,NULL,0,NULL,12,3),(13,NULL,0,NULL,13,4),(14,NULL,0,NULL,14,4),(15,NULL,1,NULL,15,4),(16,NULL,0,NULL,16,4),(17,NULL,1,NULL,17,5),(18,NULL,0,NULL,18,5),(19,NULL,0,NULL,19,5),(20,NULL,0,NULL,20,5),(21,NULL,1,NULL,21,6),(22,NULL,0,NULL,22,6),(23,NULL,0,NULL,23,7),(24,NULL,0,NULL,24,7),(25,NULL,0,NULL,25,7),(26,NULL,1,NULL,26,7),(27,NULL,0,NULL,27,8),(28,NULL,0,NULL,28,8),(29,NULL,0,NULL,29,8),(30,NULL,1,NULL,30,8),(31,NULL,0,NULL,31,9),(32,NULL,0,NULL,32,9),(33,NULL,0,NULL,33,9),(34,NULL,1,NULL,34,9),(35,NULL,0,NULL,35,10),(36,NULL,1,NULL,36,10),(37,NULL,0,NULL,37,10),(38,NULL,0,NULL,34,10),(39,NULL,1,NULL,21,11),(40,NULL,0,NULL,22,11),(41,NULL,1,NULL,38,12),(42,NULL,0,NULL,39,12),(43,NULL,0,NULL,40,12),(44,NULL,0,NULL,41,12),(45,NULL,0,NULL,42,13),(46,NULL,0,NULL,43,13),(47,NULL,0,NULL,44,13),(48,NULL,1,NULL,45,13),(49,NULL,0,NULL,46,14),(50,NULL,0,NULL,47,14),(51,NULL,1,NULL,48,14),(52,NULL,0,NULL,49,14),(53,NULL,1,NULL,50,15),(54,NULL,0,NULL,51,15),(55,NULL,0,NULL,52,15),(56,NULL,0,NULL,53,15),(57,NULL,0,NULL,54,16),(58,NULL,0,NULL,55,16),(59,NULL,0,NULL,56,16),(60,NULL,1,NULL,34,16),(61,NULL,1,NULL,21,17),(62,NULL,0,NULL,22,17),(63,NULL,0,NULL,57,18),(64,NULL,0,NULL,58,18),(65,NULL,0,NULL,59,18),(66,NULL,1,NULL,34,18),(67,NULL,1,NULL,60,19),(68,NULL,0,NULL,61,19),(69,NULL,0,NULL,62,19),(70,NULL,0,NULL,63,19),(71,NULL,0,NULL,64,20),(72,NULL,1,NULL,65,20),(73,NULL,0,NULL,66,20),(74,NULL,0,NULL,67,20);
/*!40000 ALTER TABLE `question_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_tag`
--

DROP TABLE IF EXISTS `question_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_tag` (
  `question_tag_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`question_tag_id`),
  KEY `FK_nohinfm7r87x757nhj9sf4ef2` (`question_id`),
  KEY `FK_mgv05gh8lk2eghrvcgakd4oqs` (`tag_id`),
  CONSTRAINT `FK_mgv05gh8lk2eghrvcgakd4oqs` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`),
  CONSTRAINT `FK_nohinfm7r87x757nhj9sf4ef2` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_tag`
--

LOCK TABLES `question_tag` WRITE;
/*!40000 ALTER TABLE `question_tag` DISABLE KEYS */;
INSERT INTO `question_tag` VALUES (1,NULL,NULL,1,1),(2,NULL,NULL,1,2),(3,NULL,NULL,1,3),(4,NULL,NULL,1,4),(5,NULL,NULL,2,1),(6,NULL,NULL,2,2),(7,NULL,NULL,2,3),(8,NULL,NULL,2,4),(9,NULL,NULL,3,1),(10,NULL,NULL,3,2),(11,NULL,NULL,3,3),(12,NULL,NULL,3,4),(13,NULL,NULL,4,1),(14,NULL,NULL,4,2),(15,NULL,NULL,4,3),(16,NULL,NULL,4,4),(17,NULL,NULL,5,1),(18,NULL,NULL,5,2),(19,NULL,NULL,5,3),(20,NULL,NULL,5,4),(21,NULL,NULL,6,1),(22,NULL,NULL,6,2),(23,NULL,NULL,6,3),(24,NULL,NULL,6,4),(25,NULL,NULL,7,1),(26,NULL,NULL,7,2),(27,NULL,NULL,7,3),(28,NULL,NULL,7,4),(29,NULL,NULL,8,1),(30,NULL,NULL,8,2),(31,NULL,NULL,8,3),(32,NULL,NULL,8,4),(33,NULL,NULL,9,1),(34,NULL,NULL,9,2),(35,NULL,NULL,9,3),(36,NULL,NULL,9,4),(37,NULL,NULL,10,1),(38,NULL,NULL,10,2),(39,NULL,NULL,10,3),(40,NULL,NULL,10,4),(41,NULL,NULL,11,1),(42,NULL,NULL,11,2),(43,NULL,NULL,11,3),(44,NULL,NULL,11,4),(45,NULL,NULL,12,1),(46,NULL,NULL,12,2),(47,NULL,NULL,12,3),(48,NULL,NULL,12,4),(49,NULL,NULL,13,1),(50,NULL,NULL,13,2),(51,NULL,NULL,13,3),(52,NULL,NULL,13,4),(53,NULL,NULL,14,1),(54,NULL,NULL,14,2),(55,NULL,NULL,14,3),(56,NULL,NULL,14,4),(57,NULL,NULL,15,1),(58,NULL,NULL,15,2),(59,NULL,NULL,15,3),(60,NULL,NULL,15,4),(61,NULL,NULL,16,1),(62,NULL,NULL,16,2),(63,NULL,NULL,16,3),(64,NULL,NULL,16,4),(65,NULL,NULL,17,1),(66,NULL,NULL,17,2),(67,NULL,NULL,17,3),(68,NULL,NULL,17,4),(69,NULL,NULL,18,1),(70,NULL,NULL,18,2),(71,NULL,NULL,18,3),(72,NULL,NULL,18,4),(73,NULL,NULL,19,1),(74,NULL,NULL,19,2),(75,NULL,NULL,19,3),(76,NULL,NULL,19,4),(77,NULL,NULL,20,1),(78,NULL,NULL,20,2),(79,NULL,NULL,20,3),(80,NULL,NULL,20,4);
/*!40000 ALTER TABLE `question_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `response`
--

DROP TABLE IF EXISTS `response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `response` (
  `response_id` bigint(20) NOT NULL,
  `created` datetime DEFAULT NULL,
  `responded` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `ask_id` bigint(20) DEFAULT NULL,
  `choice_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`response_id`),
  KEY `FK_svwd55jmd2kjcbhorcwa070e5` (`ask_id`),
  KEY `FK_40erndvig0uosjs8h44u9b81i` (`choice_id`),
  CONSTRAINT `FK_40erndvig0uosjs8h44u9b81i` FOREIGN KEY (`choice_id`) REFERENCES `choice` (`choice_id`),
  CONSTRAINT `FK_svwd55jmd2kjcbhorcwa070e5` FOREIGN KEY (`ask_id`) REFERENCES `ask` (`ask_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `response`
--

LOCK TABLES `response` WRITE;
/*!40000 ALTER TABLE `response` DISABLE KEYS */;
INSERT INTO `response` VALUES (1,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',11,1),(2,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',3,1),(3,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',2,1),(4,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',30,1),(19,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',10,1),(20,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',16,1),(21,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',6,1),(22,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',15,1),(23,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',18,1),(24,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',13,1),(25,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',5,1),(26,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',7,1),(27,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',14,1),(28,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',17,1),(29,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',1,1),(32,'2018-01-04 00:00:00','2018-01-04 00:00:00','2018-01-04 00:00:00',9,1),(37,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',25,7),(38,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',28,7),(39,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',35,7),(40,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',33,7),(41,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',29,7),(42,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',32,7),(43,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',21,7),(48,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',19,7),(49,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',36,7),(50,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',24,7),(51,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',34,7),(52,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',20,7),(53,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',47,7),(54,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',45,7),(55,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',23,7),(56,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',46,7),(57,'2018-01-05 00:00:00','2018-01-05 00:00:00','2018-01-05 00:00:00',27,7),(76,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',62,10),(77,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',75,10),(78,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',65,9),(79,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',69,9),(80,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',58,9),(81,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',70,10),(82,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',61,9),(83,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',66,9),(84,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',73,10),(85,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',72,9),(86,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',68,10),(87,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',63,10),(88,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',59,10),(89,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',71,9),(90,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',64,9),(91,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',60,9),(96,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',95,10),(97,'2018-01-08 00:00:00','2018-01-08 00:00:00','2018-01-08 00:00:00',93,9),(98,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',92,9),(99,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',94,9),(122,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',103,15),(123,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',114,16),(124,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',110,15),(125,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',119,15),(126,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',112,15),(127,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',116,15),(128,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',102,15),(129,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',111,15),(130,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',113,15),(131,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',104,15),(132,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',121,15),(133,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',107,15),(134,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',118,15),(135,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',105,15),(136,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',108,15),(137,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',120,16),(138,'2018-01-09 00:00:00','2018-01-09 00:00:00','2018-01-09 00:00:00',115,15),(161,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',157,17),(162,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',143,17),(163,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',152,17),(164,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',156,17),(165,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',158,17),(166,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',147,17),(167,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',146,17),(168,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',139,17),(169,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',151,17),(170,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',154,17),(171,'2018-01-10 00:00:00','2018-01-10 00:00:00','2018-01-10 00:00:00',141,17),(194,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',190,21),(195,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',183,21),(196,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',185,21),(197,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',184,21),(198,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',179,21),(199,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',176,21),(200,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',189,21),(201,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',180,21),(202,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',175,21),(203,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',191,21),(204,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',177,21),(205,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',182,21),(206,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',186,21),(207,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',172,21),(208,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',192,21),(209,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',187,21),(210,'2018-01-11 00:00:00','2018-01-11 00:00:00','2018-01-11 00:00:00',174,21),(233,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',221,26),(234,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',222,26),(235,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',224,26),(236,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',211,26),(237,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',226,26),(238,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',215,24),(239,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',218,26),(240,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',219,24),(241,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',214,26),(242,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',230,26),(243,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',216,26),(244,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',212,26),(245,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',227,26),(246,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',159,17),(247,'2018-01-12 00:00:00','2018-01-12 00:00:00','2018-01-12 00:00:00',231,26),(270,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',268,30),(271,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',260,30),(272,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',261,30),(273,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',259,30),(274,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',267,30),(275,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',252,30),(276,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',251,30),(277,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',263,30),(278,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',253,30),(279,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',249,30),(280,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',250,27),(281,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',258,30),(282,'2018-01-15 00:00:00','2018-01-15 00:00:00','2018-01-15 00:00:00',266,30),(305,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',283,34),(306,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',290,31),(307,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',296,34),(308,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',295,31),(309,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',293,34),(310,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',291,31),(311,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',287,34),(312,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',299,31),(313,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',284,32),(314,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',300,31),(315,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',304,34),(316,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',285,34),(317,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',288,31),(318,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',303,31),(319,'2018-01-17 00:00:00','2018-01-17 00:00:00','2018-01-17 00:00:00',298,31),(342,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',320,36),(343,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',333,36),(344,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',339,36),(345,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',327,36),(346,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',335,36),(347,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',332,36),(348,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',323,36),(349,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',324,36),(350,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',322,36),(351,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',337,36),(352,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',321,34),(353,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',328,36),(354,'2018-01-18 00:00:00','2018-01-18 00:00:00','2018-01-18 00:00:00',325,36),(377,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',373,21),(378,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',369,21),(379,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',355,21),(380,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',363,21),(381,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',372,21),(382,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',356,21),(383,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',368,21),(384,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',360,21),(385,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',367,21),(386,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',357,21),(387,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',359,21),(388,'2018-01-19 00:00:00','2018-01-19 00:00:00','2018-01-19 00:00:00',365,21),(389,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',366,22),(412,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',390,42),(413,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',401,45),(414,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',410,42),(415,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',400,45),(416,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',402,45),(417,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',391,45),(418,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',403,43),(419,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',397,45),(420,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',394,42),(421,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',395,45),(422,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',398,42),(423,'2018-01-22 00:00:00','2018-01-22 00:00:00','2018-01-22 00:00:00',405,45),(446,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',431,48),(447,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',437,48),(448,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',434,48),(449,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',432,48),(450,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',429,48),(451,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',435,48),(452,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',426,48),(453,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',428,48),(454,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',439,49),(455,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',436,48),(456,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',407,45),(457,'2018-01-23 00:00:00','2018-01-23 00:00:00','2018-01-23 00:00:00',444,48),(458,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',424,48),(459,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',443,48),(482,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',472,50),(483,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',464,51),(484,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',479,50),(485,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',460,50),(486,'2018-01-24 00:00:00','2018-01-24 00:00:00','2018-01-24 00:00:00',467,50);
/*!40000 ALTER TABLE `response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_question`
--

DROP TABLE IF EXISTS `scheduled_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduled_question` (
  `scheduled_question_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `has_been_asked` tinyint(1) DEFAULT NULL,
  `scheduled` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `contest_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`scheduled_question_id`),
  KEY `FK_l221rhde01clq1437ulg46ws2` (`contest_id`),
  KEY `FK_3mcppq39ysbv4dold1b1gq2ib` (`question_id`),
  CONSTRAINT `FK_3mcppq39ysbv4dold1b1gq2ib` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`),
  CONSTRAINT `FK_l221rhde01clq1437ulg46ws2` FOREIGN KEY (`contest_id`) REFERENCES `contest` (`contest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_question`
--

LOCK TABLES `scheduled_question` WRITE;
/*!40000 ALTER TABLE `scheduled_question` DISABLE KEYS */;
INSERT INTO `scheduled_question` VALUES (1,NULL,1,'2018-01-04 00:00:00',NULL,0,1,1),(2,NULL,1,'2018-01-05 00:00:00',NULL,0,1,2),(3,NULL,1,'2018-01-08 00:00:00',NULL,0,1,3),(4,NULL,0,'2018-01-09 00:00:00',NULL,0,1,4),(5,NULL,0,'2018-01-10 00:00:00',NULL,0,1,5),(6,NULL,0,'2018-01-11 00:00:00',NULL,0,1,6),(7,NULL,0,'2018-01-12 00:00:00',NULL,0,1,7),(8,NULL,0,'2018-01-16 00:00:00',NULL,0,1,8),(9,NULL,0,'2018-01-17 00:00:00',NULL,0,1,9),(10,NULL,0,'2018-01-18 00:00:00',NULL,0,1,10),(11,NULL,0,'2018-01-19 00:00:00',NULL,0,1,11),(12,NULL,0,'2018-01-20 00:00:00',NULL,0,1,12),(13,NULL,0,'2018-01-22 00:00:00',NULL,0,1,13),(14,NULL,0,'2018-01-23 00:00:00',NULL,0,1,14),(15,NULL,0,'2018-01-24 00:00:00',NULL,0,1,15),(16,NULL,0,'2018-01-25 00:00:00',NULL,0,1,16),(17,NULL,0,'2018-01-26 00:00:00',NULL,0,1,17),(18,NULL,0,'2018-01-29 00:00:00',NULL,0,1,18),(19,NULL,0,'2018-01-30 00:00:00',NULL,0,1,19),(20,NULL,0,'2018-01-31 00:00:00',NULL,0,1,20);
/*!40000 ALTER TABLE `scheduled_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `tag_text` varchar(255) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,NULL,'Subscription',NULL),(2,NULL,'Red Hat',NULL),(3,NULL,'Partner',NULL),(4,NULL,'Open Source',NULL);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'rick.stewart@dlt.com','Rick','Stewart',1),(2,'matt.micene@dlt.com','Matt','Micene',0),(3,'jason.quinn@dlt.com','Jason','Quinn',1),(4,'jake.wasser@dlt.com','Jake','Wasser',0),(5,'tyler.price@dlt.com','Tyler','Price',1),(6,'jonathan.bowe@dlt.com','Jonathan','Bowe',1),(7,'jennifer.triplett@dlt.com','Jennifer','Triplett',1),(8,'klint.simpson@dlt.com','Klint','Simpson',0),(9,'joe.perrino@dlt.com','Joe','Perrino',0),(10,'jim.propps@dlt.com','Jim','Propps',0),(11,'jason.schmidt@dlt.com','Jason','Schmidt',1),(12,'kyle.petrosino@dlt.com','Kyle','Petrosino',1),(13,'dana.suarez@dlt.com','Dana','Suarez',0),(14,'erica.gallagher@dlt.com','Erica','Gallagher',1),(15,'jason.erickson@dlt.com','Jason','Erickson',1),(16,'kevin.corey@dlt.com','Kevin','Corey',1),(17,'samantha.hartle@dlt.com','Samantha','Hartle',1),(18,'justin.robinson@dlt.com','Justin','Robinson',1),(19,'michelle.meadows@dlt.com','Michelle','Meadows',0),(20,'kevin.pence@dlt.com','Kevin','Pence',0),(21,'sam.biesenbach@dlt.com','Sam','Biesenbach',1),(22,'chad.austin@dlt.com','Chad','Austin',1),(23,'james.kovach@dlt.com','James','Kovach',0),(24,'david.tootle@dlt.com','David','Tootle',0),(25,'amanda.truong@dlt.com','Amanda','Truong',1),(26,'matt.ludeman@dlt.com','Matt','Ludeman',1),(27,'lakeisha.thomas@dlt.com','Lakeisha','Thomas',0),(28,'patrick.gavin@dlt.com','Patrick','Gavin',1),(29,'greg.agana@dlt.com','Greg','Agana',0),(30,'michael.fitzurka@dlt.com','Mike','Fitzurka',1),(31,'doug.logar@dlt.com','Doug','Logar',1),(32,'seth.anderson@dlt.com','Seth','Anderson',1),(33,'thy.williams@dlt.com','Thy','Williams',1),(34,'bryan.little@dlt.com','Bryan','Little',0),(35,'danny.climo@dlt.com','Danny','Climo',1),(36,'sean.macdonald@dlt.com','Sean','Macdonald',1),(37,'jacqueline.cybulski@dlt.com','Jacqueline','Cybulski',1),(38,'gary.shaffer@dlt.com','Gary','Shaffer',1),(39,'victoria.negron@dlt.com','Victoria','Negron',1),(40,'esiu@redhat.com','Ed','Siu',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-24 16:37:00
