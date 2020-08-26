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
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data` (
  `state` varchar(40) NOT NULL,
  `confirmed` int(255) DEFAULT NULL,
  `deaths` int(255) DEFAULT NULL,
  PRIMARY KEY (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` VALUES ('Alabama',6137,212),('Alaska',339,9),('American Samoa',0,0),('Arizona',6045,266),('Arkansas',2830,47),('California',41382,1621),('Colorado',12256,674),('Connecticut',23936,1767),('Delaware',3576,112),('District of Columbia',3699,165),('Florida',30839,1055),('Georgia',22695,904),('Grand Princess',103,3),('Guam',141,5),('Hawaii',601,13),('Idaho',1870,54),('Illinois',39658,1795),('Indiana',14395,785),('Iowa',5092,107),('Kansas',2966,119),('Kentucky',3779,200),('Louisiana',26512,1703),('Maine',990,50),('Maryland',17766,875),('Massachusetts',50969,2556),('Michigan',37203,3274),('Minnesota',3446,244),('Mississippi',5718,221),('Missouri',6826,273),('Montana',445,14),('Nebraska',2424,50),('Nevada',4539,204),('New Hampshire',1720,53),('New Jersey',105523,5863),('New Mexico',2521,84),('New York',287245,21728),('North Carolina',8719,304),('North Dakota',803,16),('Northern Mariana Islands',14,2),('Ohio',15587,711),('Oklahoma',3193,194),('Oregon',2253,87),('Pennsylvania',40208,1747),('Puerto Rico',1307,83),('Rhode Island',7129,215),('South Carolina',5070,157),('South Dakota',2040,10),('Tennessee',9189,178),('Texas',23773,623),('TOTAL',948079,53471),('Utah',3948,41),('Vermont',843,46),('Virgin Islands',54,3),('Virginia',12366,436),('Washington',13176,723),('West Virginia',1010,32),('Wisconsin',5687,266),('Wyoming',473,7);
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-25 21:22:01
