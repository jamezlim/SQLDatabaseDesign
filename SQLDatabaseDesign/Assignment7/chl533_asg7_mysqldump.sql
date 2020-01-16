-- MySQL dump 10.14  Distrib 5.5.60-MariaDB, for Linux (x86_64)
--
-- Host: warehouse    Database: chl533_db1
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `channel_ID` int(11) NOT NULL AUTO_INCREMENT,
  `channel_name` varchar(45) DEFAULT NULL,
  `channel_theme` varchar(20) DEFAULT NULL,
  `channel_date` date DEFAULT NULL,
  `channel_creator_name` varchar(45) DEFAULT NULL,
  `channel_views` int(11) DEFAULT NULL,
  PRIMARY KEY (`channel_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` VALUES (11,'Alex Costa ','men\'s fashion ','2011-09-29','alex ',100473000),(12,'BuzzFeedVideo','various topics','2011-08-10','mark',2147483647),(13,'Coop3rdrumm3r','drum','2007-11-20','casey',424329383),(14,'Colm Dowling','drum','2009-10-19','colm',15615126),(15,'Kronten Gaming ','gaming','2018-02-26','Kronten',32892722),(16,'Rizknows','product review','2013-09-10','Riz',96402355),(17,'Raybangfitness','fitness workout','2016-11-05','Wonho Bang',5103556),(18,'CS Dojo','computer science ','2016-02-25','YK',21563053),(19,'Movie RedMonster ','movie review ','2010-05-25','Yoon ',159627907),(20,'Inside Tech ','product review','2017-09-02','Dan',1479729),(21,'Lounge Music ','music','2012-01-08','June',59864257),(22,'Fantastic Music ','music','2017-02-15','Lofi',44789109),(23,'Thomas DeLauer','fitness workout','2009-11-28','Thomas',70519067),(24,'League of Legends','gaming','2009-02-09','Riot',2147483647),(25,'Teaching Men\'s Fashion','men\'s fashion ','2012-09-14','Hose',399691395);
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription` (
  `subscription_ID` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_user_ID` int(11) DEFAULT NULL,
  `subscription_channel_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`subscription_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES (1,57,11),(2,58,25),(3,58,22),(4,58,13),(5,59,11),(6,59,12),(7,59,15),(8,59,18),(9,59,20),(10,59,22),(11,59,25),(12,72,22),(13,72,18),(14,72,17),(15,60,15),(16,60,17),(17,60,19),(18,60,21),(19,60,27),(20,65,22),(21,65,12),(22,65,19),(23,65,24),(24,68,13),(25,68,15),(26,68,17),(27,71,25),(28,71,22),(29,71,11),(30,71,12);
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `user_age` int(11) DEFAULT NULL,
  `user_gender` varchar(6) DEFAULT NULL,
  `user_account` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (57,'jill',23,'female','jillybean'),(58,'jamie',18,'female','jamma'),(59,'peter',25,'male','spiderman'),(60,'jack ',52,'male','beanjack'),(61,'patty',32,'female','pattyburger'),(62,'racheal',5,'female','rachatta'),(63,'richard',10,'male','richyrich'),(64,'jerom',65,'male','jer60'),(65,'zack',38,'male','zackfiles'),(66,'joanne',12,'female','jojo'),(67,'jim',22,'male','jinujang'),(68,'lily',9,'female','gummybears'),(69,'lasputin',30,'male','russian'),(70,'edward',33,'male','pcedward'),(71,'wang',20,'female','wanglaoshi'),(72,'dongwoo',28,'male','ddong');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `video_ID` int(11) NOT NULL AUTO_INCREMENT,
  `video_channel_ID` int(11) DEFAULT NULL,
  `video_like_number` int(11) DEFAULT NULL,
  `video_dislike_number` int(11) DEFAULT NULL,
  `video_title` varchar(45) DEFAULT NULL,
  `video_length` time DEFAULT NULL,
  `video_comment_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`video_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,11,3200,30,'10 Daily Habits to Live a Happier Lifestyle','00:06:47',344),(2,11,8400,451,'7 Items Guys Need to Stop Wearing ','00:06:33',672),(3,13,11900,3600,'Numb - Linkin Park Drum Cover ','00:03:44',4617),(4,14,6600,419,'Toto- Africa Drum Cover ','00:04:17',490),(5,14,9700,157,'Nirvana- Smells Like Teen Spirit Drum Cover ','00:04:54',503),(6,16,1400,32,'Jabra Elite 65T','00:08:36',284),(7,18,2300,70,'Facebook Coding Interview Question ','00:16:35',314),(8,21,1200,75,'Christmas Music','02:03:13',32),(9,21,188,11,'Relaxing Jazz for Work ','02:03:09',9),(10,21,227,7,'Cooking Music','02:06:22',7),(11,25,14000,589,'The 7 Best Fashion Tricks All Men Should Know','00:06:32',1327),(12,25,9200,169,'8 Free and Easy Ways to Upgrade Your Style ','00:06:23',643);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-28  8:51:44
