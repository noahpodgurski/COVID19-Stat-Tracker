-- MySQL dump 10.17  Distrib 10.3.22-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: demo
-- ------------------------------------------------------
-- Server version	10.3.22-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `yesterday`
--

DROP TABLE IF EXISTS `yesterday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yesterday` (
  `state` varchar(50) DEFAULT NULL,
  `confirmed` int(255) DEFAULT NULL,
  `deaths` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yesterday`
--

LOCK TABLES `yesterday` WRITE;
/*!40000 ALTER TABLE `yesterday` DISABLE KEYS */;
INSERT INTO `yesterday` VALUES ('Alabama',5832,202),('Alaska',337,9),('American Samoa',0,0),('Arizona',5772,249),('Arkansas',2606,45),('California',39620,1533),('Colorado',11278,552),('Connecticut',23100,1639),('Delaware',3308,92),('District of Columbia',3528,153),('Florida',30174,1012),('Georgia',22147,892),('Grand Princess',103,3),('Guam',139,5),('Hawaii',596,12),('Idaho',1836,54),('Illinois',36937,1688),('Indiana',13680,741),('Iowa',4445,107),('Kansas',2734,113),('Kentucky',3481,191),('Louisiana',25739,1599),('Maine',937,44),('Maryland',16616,798),('Massachusetts',46023,2360),('Michigan',35296,2977),('Minnesota',3185,221),('Mississippi',5434,209),('Missouri',6506,252),('Montana',444,14),('Nebraska',2202,47),('Nevada',4208,195),('New Hampshire',1670,51),('New Jersey',100025,5428),('New Mexico',2379,78),('New York',268581,21283),('North Carolina',8136,284),('North Dakota',748,15),('Northern Mariana Islands',14,2),('Ohio',14694,656),('Oklahoma',3017,179),('Oregon',2127,83),('Pennsylvania',38652,1724),('Puerto Rico',1416,69),('Rhode Island',6699,202),('South Carolina',4917,150),('South Dakota',1956,9),('Tennessee',8266,171),('Texas',22650,603),('TOTAL',894034,50919),('Utah',3612,35),('Vermont',827,44),('Virgin Islands',54,3),('Virginia',11594,410),('Washington',12753,711),('West Virginia',981,31),('Wisconsin',5052,258),('Wyoming',453,7);
/*!40000 ALTER TABLE `yesterday` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-25 21:21:15
