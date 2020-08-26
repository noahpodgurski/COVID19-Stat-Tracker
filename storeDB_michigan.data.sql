-- MySQL dump 10.17  Distrib 10.3.22-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: michigan
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
  `county` varchar(50) NOT NULL,
  `confirmed` int(255) DEFAULT NULL,
  `deaths` int(255) DEFAULT NULL,
  PRIMARY KEY (`county`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` VALUES ('Alcona',4,0),('Allegan',60,1),('Alpena',60,2),('Antrim',9,0),('Arenac',16,1),('Barry',29,1),('Bay',107,2),('Benzie',4,0),('Berrien',210,11),('Branch',46,2),('Calhoun',190,10),('Cass',25,2),('Charlevoix',13,1),('Cheboygan',15,1),('Chippewa',2,0),('Clare',10,1),('Clinton',106,9),('Crawford',46,3),('Delta',12,2),('Detroit City',8473,830),('Dickinson',3,2),('Eaton',114,5),('Emmet',21,2),('FCI**',68,0),('Genesee',1434,151),('Gladwin',10,1),('Gogebic',4,1),('Grand Traverse',19,5),('Gratiot',8,1),('Hillsdale',109,12),('Houghton',2,0),('Huron',10,0),('Ingham',391,9),('Ionia',37,2),('Iosco',29,4),('Isabella',55,7),('Jackson',313,15),('Kalamazoo',266,11),('Kalkaska',17,2),('Kent',906,29),('Lake',2,0),('Lapeer',163,23),('Leelanau',8,0),('Lenawee',80,0),('Livingston',312,11),('Luce',1,0),('Mackinac',5,0),('Macomb',5022,504),('Manistee',12,0),('Marquette',39,6),('Mason',5,0),('MDOC*',973,28),('Mecosta',14,1),('Menominee',2,0),('Midland',50,3),('Missaukee',14,1),('Monroe',262,11),('Montcalm',28,1),('Montmorency',6,0),('Muskegon',204,13),('Newaygo',13,0),('Oakland',6804,585),('Oceana',4,1),('Ogemaw',8,0),('Osceola',8,0),('Oscoda',4,0),('Otsego',84,7),('Ottawa',167,8),('Out of State',14,1),('Presque Isle',9,0),('Roscommon',12,0),('Saginaw',534,40),('Sanilac',34,4),('Schoolcraft',3,0),('Shiawassee',130,6),('St Clair',294,16),('St Joseph',27,1),('Totals',36641,3085),('Tuscola',78,12),('Unknown',9,1),('Van Buren',34,2),('Washtenaw',974,47),('Wayne',6934,613),('Wexford',8,1);
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

-- Dump completed on 2020-04-25 21:21:41
