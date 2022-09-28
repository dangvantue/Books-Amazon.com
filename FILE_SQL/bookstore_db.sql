CREATE DATABASE  IF NOT EXISTS `bookstore_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bookstore_db`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstore_db
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(64) NOT NULL,
  `address_line_2` varchar(64) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `state` varchar(45) NOT NULL,
  `country_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `default_address` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn3sth7s3kur1rafwbbrqqnswt` (`country_id`),
  KEY `FKhrpf5e8dwasvdc5cticysrt2k` (`customer_id`),
  CONSTRAINT `FKhrpf5e8dwasvdc5cticysrt2k` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FKn3sth7s3kur1rafwbbrqqnswt` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'8 W Cerritos Ave #54','Benton, John B Jr','Queensland','James','Butt','0987774191','','British Columbia',39,2,_binary '\0');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_categories`
--

DROP TABLE IF EXISTS `author_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_categories` (
  `author_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`author_id`,`category_id`),
  KEY `FKbrp2qeo8y3wtex9nvu1kx4gsc` (`category_id`),
  CONSTRAINT `FKbrp2qeo8y3wtex9nvu1kx4gsc` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FKsu8t5dxlu6twy9bsjtixtn8rl` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_categories`
--

LOCK TABLES `author_categories` WRITE;
/*!40000 ALTER TABLE `author_categories` DISABLE KEYS */;
INSERT INTO `author_categories` VALUES (1,1),(3,1),(4,2),(12,3),(15,3),(1,4),(3,5),(3,6),(1,7),(1,8),(3,9),(3,10),(1,11),(4,12),(6,12),(4,13),(6,13),(4,14),(6,14),(5,15),(12,15),(5,16),(6,16),(4,17),(6,17),(5,18),(12,18),(5,19),(12,19),(8,20),(17,20),(8,21),(9,21),(11,21),(14,21),(16,21),(7,22),(13,22),(7,23),(13,23),(7,24),(10,24),(13,24),(8,25),(16,25),(9,26),(10,26),(11,26),(13,26),(14,26),(8,27),(15,27),(9,28),(10,28),(11,28),(13,28),(15,35),(15,36),(15,37),(15,38),(15,39),(15,40),(17,41),(17,42),(17,43),(16,44),(16,45),(14,46),(16,46),(14,47),(16,47),(13,48),(14,48),(13,49),(13,50),(13,51),(13,52);
/*!40000 ALTER TABLE `author_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(128) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9mhkwvnfaarcalo4noabrin5j` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'2.jpg','Adam Nayman'),(3,'1.jpg','Adrian Kulp'),(4,'5.jpg','Caroline Kepnes'),(5,'6.jpg','Darlene Deibler Rose'),(6,'9.jpg','Fred S. Kleiner'),(7,'10.jpg','Gardner R. Dozois'),(8,'15.jpg','Lewis Thomas'),(9,'13.jpg','J. Robin Albertson-W'),(10,'14.jpg','Kate Clifford Larson'),(11,'12.jpg','Isadora Montrose'),(12,'11.jpg','Hal B. Gregersen'),(13,'301452958_1167511907142779_5036832019196282730_n (1).jpg','Trí Quang'),(14,'Warren_Buffett_KU_Visit.jpg','Warren Buffett'),(15,'Elon_Musk_Royal_Society_(crop1).jpg','Elon Musk'),(16,'download.jpg','Einstein'),(17,'daymond-john.jpeg','Daymond John');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_details`
--

DROP TABLE IF EXISTS `book_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `book_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKoa7sqrtgxwg066s9521udtvpv` (`book_id`),
  CONSTRAINT `FKoa7sqrtgxwg066s9521udtvpv` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_details`
--

LOCK TABLES `book_details` WRITE;
/*!40000 ALTER TABLE `book_details` DISABLE KEYS */;
INSERT INTO `book_details` VALUES (2,'Print length','336 pages',2),(3,'Language','English',2),(4,'Publisher','Simon & Schuster',2),(5,'Dimensions','7.38 x 1 x 9.13 inches',2),(6,'ISBN-10','9781476744872',2),(7,'Print length','288 pages',3),(8,'Language','English',3),(9,'Publisher','Rand McNally',3),(10,'Dimensions',' Dimensions 11 x 0.5 x 15 inches',3),(11,'ISBN-13','978-0528026348',3),(12,'Print length','78 pages',4),(13,'Language','English',4),(14,'Publisher','Clarkson Potter',4),(15,'Dimensions','4.83 x 1.9 x 6.31 inches',4),(16,'ISBN-10','0593135148',4),(17,'Language','English',5),(18,'Print length','464 pages',5),(19,'Publisher','Abrams',5),(20,'Dimensions','10.55 x 1.6 x 13.45 inches',5),(21,'ISBN-10','1419733338',5),(22,'Print length','352 pages',6),(23,'Language','English',6),(24,'Publisher','Abbeville Press',6),(25,'Dimensions','8.4 x 0.9 x 11.7 inches',6),(26,'ISBN-13','978-0789214263',6),(27,'Print length','200 pages',7),(28,'Language','English',7),(29,'Publisher','Bloomsbury Visual Arts',7),(30,'Dimensions','6.15 x 0.6 x 9.15 inches',7),(31,'ISBN-10','1350035335',7),(32,'Print length','160 pages',8),(33,'Language','English',8),(34,'Publisher','Welbeck Publishing',8),(35,'Dimensions','5.25 x 0.75 x 7.5 inches',8),(36,'ISBN-13','978-1802790115',8),(37,'Listening Length','10 hours and 35 minutes',9),(38,'Narrator','Dave Grohl',9),(39,'Language','English',9),(40,'Publisher','HarperAudio',9),(41,'ASIN','B091WVM1JD',9),(42,'Version','Unabridged',9),(43,'Listening Length','15 hours and 1 minute',10),(44,'Narrator','Phil Thron',10),(45,'Language','English',10),(46,'Publisher','Simon & Schuster Audio',10),(47,'ASIN','B08X9Y1VMY',10),(48,'Program Type','Audiobook',10),(49,'Listening Length','13 hours and 37 minutes',11),(50,'Language','English',11),(51,'Narrator','David',11),(52,'Publisher','Lioncrest Publishing',11),(53,'ASIN','B07KKP62FW',11),(54,'Program Type','Audiobook',11),(55,'Print length','488 pages',12),(56,'Language','English',12),(57,'Publisher','Atlantic Monthly Press',12),(58,'File size','8433 KB',12),(59,'Page Flip','Enabled',12),(60,'Print length','592 pages',13),(61,'Language','English',13),(62,'Publisher','W. W. Norton & Company',13),(63,'File size','43316 KB',13),(64,'Word Wise','Enabled',13),(65,'Print length','304 pages',14),(66,'Print length','416 pages',15),(67,'Language','English',15),(68,'Publisher','National Geographic',15),(69,'Dimensions','7.45 x 1.4 x 9.45 inches',15),(70,'ISBN-10','1426222262',15),(76,'Print length','340 pages',17),(77,'Publisher','WildBlue Press',17),(78,'Language','English',17),(79,'File size','3083 KB',17),(80,'Page Flip','Enabled',17),(86,'Print length','368 pages',20),(92,'Print length','160 pages',22),(93,'Language','English',22),(94,'Publisher','Workman Publishing Company',22),(95,'Dimensions','6.25 x 3.18 x 6.25 inches',22),(96,'ISBN-13','978-1523516919',22),(97,'Print length','28 pages',23),(98,'Language','English',23),(99,'Publisher','Amber Lotus Publishing',23),(100,'Dimensions','11.8 x 0.3 x 11.8 inches',23),(101,'ISBN-10','1631368001',23),(102,'Language','English',20),(103,'Publisher','Random House US',20),(104,'Dimensions','5.2 x 0.71 x 7.99 inches',20),(105,'ISBN-10','1984854852',20),(106,'Print length','304 pages',24),(107,'Language','English',24),(108,'Publisher','New City Press',24),(109,'Publication date','December 25, 2002',24),(110,'Dimensions','4.25 x 0.75 x 6.75 inches',24),(111,'ISBN-13','978-1565481541',24),(112,'Print length','192 pages',25),(113,'Language','English',25),(114,'Publisher','Chronicle Books',25),(115,'Dimensions','7.8 x 0.95 x 9.3 inches',25),(116,'ISBN-13','978-1452179612',25),(117,'Print length','304 pages',26),(118,'Print length','304 pages',27),(119,'Language','English',27),(120,'Publisher','Fodor\'s Travel',27),(121,'Publication date','September 6, 2022',27),(122,'Dimensions','5.2 x 0.9 x 8 inches',27),(123,'Language','English',28),(124,'Print length','345 pages',28),(125,'Publisher','Little, Brown and Company',28),(126,'Dimensions','7.4 x 1.75 x 9.35 inches',28),(127,'ISBN-10','031659301X',28),(128,'Print length','304 pages',29),(129,'Language','English',29),(130,'Reading age','8 years and up',29),(131,'Grade level','3 - 7',29),(132,'Dimensions','9.29 x 1.65 x 10.71 inches',29),(133,'Publisher','Scholastic Inc.',29),(134,'Print length','304 pages',30),(135,'Language','English',30),(136,'Publication date','October 26, 2021',30),(137,'ISBN-13','978-1538724736',30),(138,'Print length','304 pages',31),(139,'Language','English',31),(140,'Publication date','November 10, 2015',31),(141,'Dimensions','5.31 x 0.8 x 8.25 inches',31),(142,'ISBN-13','978-1501110344',31),(143,'Print length','304 pages',32),(144,'Language','English',32),(145,'Publisher','Atria Books',32),(146,'File size','2074 KB',32),(147,'Word Wise','Enabled',32);
/*!40000 ALTER TABLE `book_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_images`
--

DROP TABLE IF EXISTS `book_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `book_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcnpy06tjmrsjisjf2bqpuvvbl` (`book_id`),
  CONSTRAINT `FKcnpy06tjmrsjisjf2bqpuvvbl` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_images`
--

LOCK TABLES `book_images` WRITE;
/*!40000 ALTER TABLE `book_images` DISABLE KEYS */;
INSERT INTO `book_images` VALUES (4,'51FVNHBBCdL.jpg',2),(7,'1.1.jpg',4),(8,'1.2.jpg',4),(9,'1.3.jpg',4),(10,'91OT6Jt78rL.jpg',5),(11,'3.1.jpg',6),(12,'3.2.jpg',6),(13,'51MVJyuvdNL._SX331_BO1,204,203,200_.jpg',7),(14,'816CO4v0-JL._AC_SY75_CR,0,0,75,75_.jpg',8),(15,'81ctRGIgFzL._AC_SY75_CR,0,0,75,75_.jpg',8),(16,'5.jpg',9),(17,'41PJmkwdH5L.jpg',10),(18,'51N2hDuVMrL.jpg',11),(19,'41gdzBNZQxL.jpg',12),(20,'51g4UUqnbcL.jpg',13),(22,'71olQ2H6s9L.jpg',15),(24,'51KDxSuWJLL.jpg',17),(26,'71Ik-NSSAoL.jpg',20),(27,'1.jpg',14),(31,'71i2ZwBH0UL._AC_SX75_CR,0,0,75,75_.jpg',22),(32,'91cE2L3i-YL._AC_SX75_CR,0,0,75,75_.jpg',22),(33,'81haGZ56l8L._AC_SX75_CR,0,0,75,75_.jpg',22),(35,'81eN-c1UWwL.jpg',23),(36,'81CiJWl0QNL._AC_SY75_CR,0,0,75,75_.jpg',23),(37,'61iGdfIx9gL.jpg',20),(38,'71p8O18Y3NL.jpg',24),(39,'41kOy4EjPaL.jpg',24),(40,'71he7oyuhIL.jpg',24),(41,'81FWzFy8uVL.jpg',25),(42,'8168sMnDHZL.jpg',25),(43,'81ocyjjpE1L.jpg',26),(44,'91RzgWcTT1L._AC._SR360,460.jpg',27),(45,'81k8gaOAQiL.jpg',28),(46,'81GjJ7RHK-L.jpg',28),(47,'81CKhFiOBnL.jpg',28),(49,'71tR2ZEgPYL.jpg',29),(51,'31catnQbg3L.jpg',30),(52,'815wvjrMo-L.jpg',30),(53,'816JfmabjiL.jpg',31),(54,'71-AAp0LqOL.jpg',31),(55,'41h8sSf6SYL.jpg',32),(56,'71rmOkkkBpL._AC_UL232_SR232,232_.jpg',3);
/*!40000 ALTER TABLE `book_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL,
  `cost` float NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `discount_percent` float DEFAULT NULL,
  `in_stock` bit(1) DEFAULT NULL,
  `main_image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `status` bit(1) NOT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `height` float NOT NULL,
  `length` float NOT NULL,
  `weight` float NOT NULL,
  `width` float NOT NULL,
  `average_rating` float NOT NULL,
  `review_count` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_7sei657lweflrklwrokwbusfh` (`alias`),
  UNIQUE KEY `UK_eh6bfj824qyn40pii29i90bll` (`name`),
  KEY `FKfjixh2vym2cvfj3ufxj91jem7` (`author_id`),
  KEY `FKleqa3hhc0uhfvurq6mil47xk0` (`category_id`),
  FULLTEXT KEY `books_FTS` (`name`,`description`),
  CONSTRAINT `FKfjixh2vym2cvfj3ufxj91jem7` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
  CONSTRAINT `FKleqa3hhc0uhfvurq6mil47xk0` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (2,'Elements-of-Style:-Designing-a-Home-&-a-Life',15,'2022-08-08 17:14:49.182000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">From the rising-star designer and author of the hit blog,&nbsp;</span></div><div><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Elements of Style</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">, a full-color, fully illustrated book packed with honest advice, inspiration, ideas, and lessons learned about designing a home that reflects your personality and style.</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br><br></span><span class=\"a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: italic !important;\">Elements of Style</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">&nbsp;is a uniquely personal and practical decorating guide that shows how designing a home can be an outlet of personal expression and an exercise in self-discovery. Drawing on her ten years of experience in the interior design industry, Erin combines honest design advice and gorgeous professional photographs and illustrations with personal essays about the lessons she has learned while designing her own home and her own life—the first being: none of our homes or lives is perfect. Like a funny best friend, she reveals the disasters she confronted in her own kitchen renovation, her struggles with anorexia, her epic fight with her husband over a Lucite table, and her secrets for starting a successful blog.</span><br></div>',7,_binary '\0','51FVNHBBCdL.jpg','Elements of Style',25.99,_binary '','2022-08-12 14:00:38.163000',1,11,2,2,2,2,0,0),(3,'(Rand-McNally-Large-Scale-Road-Atlas-USA)',3,'2022-08-08 17:29:59.422000','<div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">Give road-weary eyes a break with this spiral-bound Large Scale edition featuring all the accuracy you’ve come to expect from Rand McNally, only bigger.&nbsp;</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">This updated 2023 edition contains maps of every U.S. state, plus expanded coverage of Canada and Mexico,&nbsp;</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">that are 35% larger than the standard atlas version. Includes over 350 detailed city inset and national park maps and a comprehensive, unabridged index.&nbsp;</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">Road construction and conditions contact information for every state are conveniently located on map pages. Contains mileage chart showing distances between 77 North American cities and national parks with driving times map. Tough spiral binding allows the book to lay open easily.&nbsp;</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">A convenient page locator map on the inside cover makes it quick and easy to find the map you need. Tell Rand! As much as we work to keep our atlases up to date, conditions change quickly and new construction projects begin frequently.&nbsp;</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">If you know of something we haven’t captured in our atlas, let us know at randmcnally.com/tellrand. Tourism websites and phone numbers for every U.S. state and Canadian province on map pages.&nbsp;</span><br></div>',10,_binary '','51abQzI1aEL._SX381_BO1,204,203,200_.jpg','Rand McNally 2023 Large Scale Road Atlas',36,_binary '','2022-09-28 17:24:06.853000',3,6,2,3,4,3,5,1),(4,'A-Deck-and-Guidebook-Inspired-by-Deities,-Folklore,-and-Fairy-Tales-from-Around-the-World',2,'2022-08-09 09:17:49.784000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">Take a step forward on your spiritual journey with this gorgeously illustrated celebration of deities, folklore, and fairy tales from all over the world.</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br>&nbsp;<br>• Features rich, vibrant art and a keen understanding of traditional tarot archetypes infused with worldly insight and folkloric spirit.<br>• Illustrator Yoshi Yoshitani brings fables, ancient mythologies, and spiritual legends to life on the Major and Minor Arcana cards, inspired by the cultural traditions of China, Japan, Peru, Norway, Persia, England, Greece, Denmark, the Maori tribe of New Zealand, and more.<br>• The companion guidebook provides insight into how these fables from around the globe support traditional tarot imagery and themes.</span><br></div>',7,_binary '','1.jpg','Tarot of the Divine',45,_binary '','2022-09-28 15:18:13.833000',1,7,1,2,3,4,0,0),(5,'A-Century-of-Style-Hardcover',5,'2022-08-09 09:22:34.854000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">A rich visual history of&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Architectural Digest</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">, published for the magazine’s 100th anniversary&nbsp;</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br><br></span><span class=\"a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: italic !important;\">Architectural Digest at 100</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">&nbsp;celebrates the best from the pages of the international design authority.&nbsp;</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">The editors have delved into the archives and culled years of rich material covering a range of subjects.&nbsp;</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">Ranging freely between present and past, the book features the personal spaces of dozens of private celebrities like Barack and Michelle Obama,</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">&nbsp;David Bowie, Truman Capote, David Hockney, Michael Kors, and Diana Vreeland, and includes the work of top designers and architects like Frank Gehry, David Hicks, India Mahdavi, Peter Marino, John Fowler, Renzo Mongiardino, Oscar Niemeyer, Axel Vervoordt, Frank Lloyd Wright, and Elsie de Wolfe.&nbsp;</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">Also included are stunning images from the magazine’s history by photographers such as Bill Cunningham, Horst P. Horst, Simon Upton, Francois Dischinger, Francois Halard, Julius Shulman, and Oberto Gili.&nbsp;</span><br></div>',15,_binary '','2.jpg','Architectural Digest at 100',24,_binary '','2022-08-09 09:22:34.854000',1,8,2,4,5,4,0,0),(6,'The-Catalog-of-Producers,-Prices,-Models,-and-Specifications-Paperback',5,'2022-08-09 09:27:38.191000','<div><div><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">The essential guide for the collector of mechanical wristwatches, with complete information on over 1,400 models from 130 international brands</span></div><div>With&nbsp;<span class=\"a-text-italic\" style=\"font-style: italic !important;\">Wristwatch Annual</span>, collectors have at hand a wealth of information on the latest offerings from today’s most important watch producers, from Swiss mainstays like Rolex and Patek Philippe to the maverick independent brands springing up across Europe and the U.S. The book is arranged alphabetically by producer, and the movement, functions, case, band, price, and variations of each pictured watch are fully described.</div><div>This year’s edition, like its predecessors, features a variety of additional articles on independent watchmaking, key personalities in the watch world, and the technical aspects of horology. An illustrated glossary and a primer on watch care help acclimate the reader to the world of fine timepieces.</div></div>',12,_binary '','3.jpg','Wristwatch Annual 2022',56,_binary '','2022-08-09 09:27:38.191000',1,4,2,3,5,2,0,0),(7,'The-Ad-Hoc,-the-Illicit,-the-Controversial',5,'2022-08-09 09:32:04.959000','<div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">Craig Martin addresses the transgressive or&nbsp;</span><span class=\"a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: italic !important;\">deviant</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">&nbsp;aspects of design: design that straddles the divide between the licit and illicit, the legal and illegal, in a variety of ways. Martin argues that design is not necessarily for the social good, but that it is immersed in the social realm in all its contradictions and confusions.<br><br>Through a series of case studies he explores a wide range of social practices that employ illicit forms of design thinking, including: early computer hacking and present-day hacker culture in which everyday objects are repurposed and deliberately misused; the cultures of reproduction, counterfeit and pirated versions of classic and luxury designs; and the use of material practices by smugglers to conceal drugs within consumer goods and luggage.</span><br></div>',11,_binary '','51MVJyuvdNL._SX331_BO1,204,203,200_.jpg','Deviant Design',45,_binary '','2022-08-09 09:32:04.959000',3,10,3,4,5,6,0,0),(8,'The-Story-of-the-Iconic-Fashion-House',4,'2022-08-09 09:35:11.707000','<div><span class=\"a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: italic !important;\">Little Book of Hermès</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">&nbsp;tells the story of the evolution of the House of Hermès,</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">&nbsp;through beautiful illustrations of the most coveted items and authoritative text by fashion historian&nbsp;</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">Karen Homer</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">.</span><br></div>',12,_binary '','4.jpg','The Little Book of Hermès',35,_binary '','2022-09-28 15:18:44.707000',3,9,5,4,3,2,0,0),(9,'Tales-of-Life-and-Music-',20,'2022-08-09 09:39:02.055000','<div><div><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">Read by Dave Grohl. Features excerpts from five never before heard demos performed by Dave Grohl and an original story exclusive to&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"font-weight: 700 !important; font-style: italic !important;\">The Storyteller</span><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">&nbsp;audiobook.</span></div><div><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">So, I\'ve written a book.</span></div><div>Having entertained the idea for years, and even offered a few questionable opportunities (\"It\'s a piece of cake! Just do four hours of interviews, find someone else to write it, put your face on the cover, and voila!\") I have decided to tell these stories just as I have always done, in my own voice. The joy that I have felt from chronicling these tales is not unlike listening back to a song that I\'ve recorded and can\'t wait to share with the world, or reading a primitive journal entry from a stained notebook, or even hearing my voice bounce between the Kiss posters on my wall as a child.&nbsp;</div></div>',5,_binary '','5.jpg','The Storyteller',45,_binary '','2022-08-09 09:39:02.055000',3,6,7,6,5,4,0,0),(10,'The-Epic-Story-of-the-Making-of-The-Godfather',6,'2022-08-09 09:43:00.273000','<div><div><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">This “wickedly pacey page-turner” (</span><span class=\"a-text-bold a-text-italic\" style=\"font-weight: 700 !important; font-style: italic !important;\">Total Film</span><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">) unfurls the behind-the-scenes story of the making of&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"font-weight: 700 !important; font-style: italic !important;\">The Godfather,&nbsp;</span><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">50 years after the classic film’s original release.</span></div><div>The story of how&nbsp;<span class=\"a-text-italic\" style=\"font-style: italic !important;\">The Godfather&nbsp;</span>was made is as dramatic, operatic, and entertaining as the film itself. Over the years, many versions of various aspects of the movie’s fiery creation have been told - sometimes conflicting, but always compelling. Mark Seal sifts through the evidence, has extensive new conversations with director Francis Ford Coppola and several heretofore silent sources, and complements them with colorful interviews with key players including actors Al Pacino, James Caan, Talia Shire, and others to write “the definitive look at the making of an American classic” (<span class=\"a-text-italic\" style=\"font-style: italic !important;\">Library Journal</span>, starred review).</div></div>',3,_binary '','41PJmkwdH5L.jpg','Leave the Gun, Take the Cannoli',35,_binary '','2022-09-28 17:22:10.143000',3,5,8,4,5,4,3,2),(11,'Master-Your-Mind-and-Defy-the-Odds-',2,'2022-08-09 09:51:28.698000','<div><div>For David Goggins, childhood was a nightmare - poverty, prejudice, and physical abuse colored his days and haunted his nights. But through self-discipline, mental toughness, and hard work, Goggins transformed himself from a depressed, overweight young man with no future into a US Armed Forces icon and one of the world\'s top endurance athletes. The only man in history to complete elite training as a Navy SEAL, Army Ranger, and Air Force Tactical Air Controller, he went on to set records in numerous endurance events, inspiring&nbsp;<span class=\"a-text-italic\" style=\"font-style: italic !important;\">Outside</span>&nbsp;magazine to name him The Fittest (Real) Man in America.&nbsp;</div><div>In&nbsp;<span class=\"a-text-italic\" style=\"font-style: italic !important;\">Can\'t Hurt Me</span>, he shares his astonishing life story and reveals that most of us tap into only 40% of our capabilities. Goggins calls this The 40% Rule, and his story illuminates a path that anyone can follow to push past pain, demolish fear, and reach their full potential.&nbsp;</div></div>',10,_binary '','51N2hDuVMrL.jpg','Can\'t Hurt Me',95,_binary '','2022-09-28 15:19:15.571000',4,13,9,4,5,4,0,0),(12,'The-Story-of-the-World\'s-Longest-Treasure-Hunt',4,'2022-08-09 09:55:12.008000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">An in-depth look into the history of a Canadian island rumored to hold buried treasure and of centuries of failed attempts to claim the riches.</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br><br></span><span class=\"a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: italic !important;\">Updated with new material from the author</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br><br>In 1795, a teenager discovered a mysterious circular depression in the ground on Oak Island, in Nova Scotia, Canada, and ignited rumors of buried treasure. Early excavators uncovered a clay-lined shaft containing layers of soil interspersed with wooden platforms, but when they reached a depth of ninety feet, water poured into the shaft and made further digging impossible.</span><br></div>',5,_binary '','41gdzBNZQxL.jpg','The Curse of Oak Island',59,_binary '','2022-09-28 15:19:32.447000',4,12,5,5,5,4,0,0),(13,'Belle-da-Costa-Greene\'s-Journey-from-Prejudice-to-Privilege',15,'2022-08-09 09:59:09.569000','<div><div><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">The secret life of the sensational woman behind the Morgan masterpieces, who lit up New York society.</span></div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br></span><div>What would you give up to achieve your dream? When J. P. Morgan hired Belle da Costa Greene in 1905 to organize his rare book and manuscript collection, she had only her personality and a few years of experience to recommend her. Ten years later, she had shaped the famous Pierpont Morgan Library collection and was a proto-celebrity in New York and the art world, renowned for her self-made expertise, her acerbic wit, and her flirtatious relationships. Born to a family of free people of color, Greene changed her name and invented a Portuguese grandmother to enter white society. In her new world, she dined both at the tables of the highest society and with bohemian artists and activists. She also engaged in a decades-long affair with art critic Bernard Berenson. Greene is pure fascination—the buyer of illuminated manuscripts who attracted others to her like moths to a flame.</div></div>',15,_binary '\0','51g4UUqnbcL.jpg','An Illuminated Life',129,_binary '','2022-08-12 13:57:46.638000',4,14,3,4,4,4,0,0),(14,'Stories-from-a-South-African-Childhood',5,'2022-08-09 10:05:51.087000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">“Noah’s childhood stories are told with all the hilarity and intellect that characterizes his comedy, while illuminating a dark and brutal period in South Africa’s history that must never be forgotten.”—</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Esquire</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\"><br>&nbsp;<br></span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">Winner of the Thurber Prize for&nbsp;American Humor&nbsp;and&nbsp;an NAACP Image Award • Named one of the best books of the year by&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">The&nbsp;New York Time, USA Today, San Francisco Chronicle,</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">&nbsp;NPR,&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Esquire, Newsday,</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">&nbsp;and&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Booklist</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br></span></div>',25,_binary '\0','51pJwB1hlPL._SX331_BO1,204,203,200_.jpg','Born a Crime',129,_binary '','2022-08-12 14:34:01.360000',4,14,6,7,9,2,0,0),(15,'One-Woman\'s-Journey-to-Every-Country-in-the-World',10,'2022-08-09 10:09:04.572000','<div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">It was a daunting task, but Jessica Nabongo, the beloved voice behind the popular website&nbsp;</span><span class=\"a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: italic !important;\">The Catch Me if You Can</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">, made it happen, completing her journey to all 195 UN-recognized countries in the world in October 2019. Now, in this one-of-a-kind memoir, she reveals her top 100 destinations from her global adventure.<br>Beautifully illustrated with many of Nabongo\'s own photographs, the book documents her remarkable experiences in each country, including:<br><br></span><ul class=\"a-unordered-list a-vertical\" style=\"margin: 0px 0px 0px 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">A harrowing scooter accident in Nauru, the world’s least visited country,</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Seeing the life and community swarming around the Hazrat Ali Mazar mosque in Afghanistan,</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Horseback riding and learning to lasso with Black cowboys in Oklahoma,</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Playing dominoes with men on the streets of Havana,</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Learning to make traditional takoyaki (octopus balls) from locals in Japan,</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Dog sledding in Norway and swimming with humpback whales in Tonga,</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">A late night adventure with strangers to cross a border in Guinea Bissau,</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">And sunbathing on the sandy shores of Los Roques in Venezuela.</span></li></ul></div>',5,_binary '','51xKiRY4L0L._SX389_BO1,204,203,200_.jpg','The Catch Me If You Can',69,_binary '','2022-08-09 10:09:04.572000',5,19,3,4,5,4,0,0),(17,'Pyromania,-Murder,-and-a-Daughter\'s-Nightmare',15,'2022-08-09 10:15:26.999000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">A daughter’s account of the “Pillowcase Pyro,” hero firefighter turned killer arsonist John Orr. “A red-hot true crime masterpiece.” —Burl Barer, Edgar Award–winning author of&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Betrayal in Blue&nbsp;</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">and&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Murder in the Family</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br>&nbsp;<br>For years, Lori Orr believed her Los Angeles firefighter dad was a selfless hero. When Lori’s dad was arrested and charged with four murders and countless arson fires, it was her testimony that helped keep him from being sent to Death Row. Eventually, Lori’s search for the truth lead her to the dark secrets lurking in her family’s past—and to an inescapable conclusion about the remorseless killer and arsonist known as the “Pillowcase Pyro” and his reign of terror in sunny Southern California.</span><br></div>',25,_binary '','51KDxSuWJLL.jpg','Burned',299,_binary '','2022-08-09 10:15:26.999000',5,18,4,3,4,6,0,0),(20,'Educated',30,'2022-08-09 10:22:21.086000','<div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">Born to survivalists in the mountains of Idaho, Tara Westover was seventeen the first time she set foot in a classroom. Her family was so isolated from mainstream society that there was no one to ensure the children received an education, and no one to intervene when one of Tara’s older brothers became violent. When another brother got himself into college, Tara decided to try a new kind of life. Her quest for knowledge transformed her, taking her over oceans and across continents, to Harvard and to Cambridge University. Only then would she wonder if she’d traveled too far, if there was still a way home.<br>&nbsp;<br></span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">“Beautiful and propulsive . . . Despite the singularity of [Westover’s] childhood, the questions her book poses are universal: How much of ourselves should we give to those we love? And how much must we betray them to grow up?”—</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Vogue</span><br></div>',15,_binary '','41ErDhOZenL._SX322_BO1,204,203,200_.jpg','Educated',49,_binary '','2022-08-31 21:05:38.068000',6,17,1,1,2,2,0,0),(22,'Audubon-Nature-Page-A-Day-Gallery-Calendar',9,'2022-08-12 14:45:21.620000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">With every glance, escape to the natural world.</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br><br>Combining the stunning, full-color photography and high production standards of the Gallery line with the expertise of the National Audubon Society, Nature showcases the world at its most pristine. Here is day after day of spectacular landscapes, plus all the other wonders we find in the great outdoors. The breathtaking Grand Teton mountain range. A stunning Arctic Fox in Alaska blends into the wintry landscape. A herd of wildebeest thunder under a red East African sky. And pure paradise: The sun rises over the Needles rock monoliths at Oregon’s Cannon Beach. A fabulous gift for nature lovers, this calendar is a reminder of what remains—and what must be preserved.&nbsp;</span><br></div>',35,_binary '','51mxNrqR5cL._SX482_BO1,204,203,200_.jpg','Audubon Nature Page-A-Day Gallery Calendar',99,_binary '','2022-09-28 11:51:00.497000',8,27,3,5,4,2,4,1),(23,'And-Other-Places-of-Power-in-Britain-and-Ireland-',10,'2022-08-12 14:50:05.303000','<div><div>Embark on a magical journey through the Celtic landscape with the Sacred Celtic Sites wall calendar. Celebrating timeless monuments and geographical features steeped in myth and legend, this calendar features the<span class=\"a-text-quote\" style=\"position: relative; display: block; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-style: italic; padding-left: 0.5em;\">thin places</span>— doorways to another realm, divine places of spiritual awakening. Mara Freeman, an expert on Celtic spiritual and sacred traditions, guides you through timeless monuments that are as awe-inspiring today as they must have been millennia ago.</div><ul class=\"a-unordered-list a-vertical\" style=\"margin: 0px 0px 0px 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">12\" x 12\" wall calendar (12\" x 24\" open).</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">A year of lush photographs of ancient Celtic sites on your wall.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">The perfect gift for lovers of Celtic art and mythology.</span></li></ul></div>',65,_binary '\0','61hJ2xkeeCL._SY498_BO1,204,203,200_.jpg','And Other Places of Power in Britain and Ireland ',259,_binary '','2022-08-12 14:50:05.303000',8,27,5,2,2,3,0,0),(24,'Saint-Augustine-(The-Works-of-Saint-Augustine',35,'2022-08-31 21:09:34.513000','<div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">A masterful, new translation of a perennial classic, now available in pocket size! The Confessions of Saint Augustine is considered the all time number one Christian classic. Augustine undertook his greatest piece of writing with the conviction that God wanted him to make this confession. The Confessions are, in fact, an extended poetic, passionate, intimate prayer. Augustine’s experience of God speaks to us across time with little need of transpositions. This new translation by Maria Boulding masterfully captures his experience. Augustine was probably forty-three when he began this endeavor. He had been a baptized Catholic for ten years, a priest for six, and a bishop for only two. His pre-baptismal life raised questions in the community. Was his conversion genuine? The first hearers were captivated, as many millions have been over the following sixteen centuries.</span><br></div>',25,_binary '','51hvDT0CbsL._SX313_BO1,204,203,200_.jpg','The Confessions, Revised',299,_binary '','2022-08-31 21:09:34.513000',8,25,1,3,4,3,0,0),(25,'From-Crook-to-Cook',2,'2022-09-08 10:37:10.316000','<div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">Looking for cookbooks with a little more personality? Welcome to tha Boss Dogg\'s Kitchen.</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">The first cookbook and recipe book from Tha Dogg</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">,&nbsp;</span><span class=\"a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: italic !important;\">From Crook to Cook: Platinum Recipes from Tha Boss Dogg\'s Kitchen</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">. You\'ve seen Snoop Dogg work his culinary magic on VH1\'s Emmy-nominated Martha and Snoop\'s Potluck Dinner Party, and now Tha Dogg\'s up in your kitchen...with his first cookbook.</span><br></div>',0,_binary '','51wzZRmSdPL._SX417_BO1,204,203,200_.jpg','From Crook to Cook',15,_binary '','2022-09-08 10:37:10.316000',13,49,1,2,3,4,0,0),(26,'My-Year-of-Rest-and-Relaxation',2,'2022-09-08 10:40:44.731000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">“Darkly hilarious . . . [Moshfegh’s] the kind of provocateur who makes you laugh out loud while drawing blood.”&nbsp;</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">—</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Vogue</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\"><br><br></span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">From one of our boldest, most celebrated new literary voices, a novel about a young woman\'s efforts to duck the ills of the world by embarking on an extended hibernation with the help of one of the worst psychiatrists in the annals of literature and the battery of medicines she prescribes.</span><br></div>',5,_binary '','81ocyjjpE1L._AC._SR360,460.jpg','My Year of Rest and Relaxation',89,_binary '','2022-09-08 10:40:44.731000',13,1,4,2,3,2,0,0),(27,'Fodor\'s-Oahu',5,'2022-09-08 10:45:49.761000','<div><div><span class=\"a-text-italic\" style=\"font-style: italic !important;\">Fodor’s Oahu</span>&nbsp;travel guide&nbsp;includes:</div><ul class=\"a-unordered-list a-vertical\" style=\"margin: 0px 0px 0px 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">AN ILLUSTRATED ULTIMATE EXPERIENCES GUIDE</span>&nbsp;to the top things to see and do</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">MULTIPLE ITINERARIES</span>&nbsp;to effectively organize your days and maximize your time</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">MORE THAN 15 DETAILED MAPS and a FREE PULL-OUT MAP</span>&nbsp;to help you navigate confidently</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">COLOR PHOTOS</span>&nbsp;throughout to spark your wanderlust!</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">HONEST RECOMMENDATIONS</span>&nbsp;on the best sights, restaurants, hotels, nightlife, shopping, performing arts, activities,and more</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">PHOTO-FILLED “BEST OF” FEATURES</span>&nbsp;on “Oahu\'s Best Beaches,” “Oahu\'s Best Natural Wonders,” “Hawaiian Flora and Fauna,” and more</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">TRIP-PLANNING TOOLS AND PRACTICAL TIPS</span>&nbsp;including when to go, getting around, beating the crowds, and saving time and money</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">HISTORICAL AND CULTURAL INSIGHTS</span>&nbsp;providing rich context on the local people, politics, art, architecture, cuisine, music, geography and more</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\"><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">SPECIAL FEATURES</span>&nbsp;on “Hawaiian Cultural Traditions,” “What to Watch and Read Before You Visit,” and “What to Eat and Drink in Hawaii”</span></li></ul></div>',3,_binary '','91RzgWcTT1L._AC._SR360,460.jpg','Fodor\'s Oahu',39,_binary '','2022-09-08 10:45:49.761000',13,22,1,2,3,3,0,0),(28,'The-High-Sierra',0,'2022-09-08 10:49:15.954000','<div><div><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">A “sublime” and “radically original” exploration of the Sierra Nevadas, the best mountains on Earth for hiking and camping, from&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"font-weight: 700 !important; font-style: italic !important;\">New York Times</span><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">&nbsp;bestselling novelist Kim Stanley Robinson (Bill McKibben, Gary Snyder).</span></div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">Kim Stanley Robinson first ventured into the Sierra Nevada mountains during the summer of 1973. He returned from that encounter a changed man, awed by a landscape that made him feel as if he were simultaneously strolling through an art museum and scrambling on a jungle gym like an energized child. He has returned to the mountains throughout his life—more than a hundred trips—and has gathered a vast store of knowledge about them.&nbsp;</span><span class=\"a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: italic !important;\">The High Sierra</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">&nbsp;is his lavish celebration of this exceptional place and an exploration of what makes this span of mountains one of the most compelling places on Earth.</span><br></div>',50,_binary '\0','41mORT7m7QL._SX329_BO1,204,203,200_.jpg','The High Sierra',29,_binary '','2022-09-08 10:49:15.954000',13,22,3,2,2,3,0,0),(29,'Harry-Potter-and-the-Order-of-the-Phoenix',2,'2022-09-27 10:47:53.222000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">The fifth book in the beloved, bestselling Harry Potter series, now illustrated in brilliant full color.</span><div></div><div>There is a door at the end of a silent corridor. And it\'s haunting Harry Potter\'s dreams. Why else would he be waking in the middle of the night, screaming in terror? It\'s not just the upcoming O.W.L. exams; a new teacher with a personality like poisoned honey; a venomous, disgruntled house-elf; or even the growing threat of He-Who-Must-Not-Be-Named. Now Harry Potter is faced with the unreliability of the very government of the magical world and the impotence of the authorities at Hogwarts. Despite this (or perhaps because of it), he finds depth and strength in his friends, beyond what even he knew; boundless loyalty; and unbearable sacrifice.</div></div>',0,_binary '','51bZujlJxlL._SX422_BO1,204,203,200_.jpg','Harry Potter and the Order of the Phoenix',359,_binary '','2022-09-27 10:47:53.222000',13,51,8,4,3,6,0,0),(30,'Verity-Paperback',4,'2022-09-27 10:51:47.602000','<div><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Whose truth is the lie?&nbsp;</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">Stay up all night reading&nbsp;the sensational psychological thriller that has readers obsessed, from the #1&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">New York Times</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">&nbsp;bestselling author of&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">It Ends With Us</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">.</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br><br>Lowen Ashleigh is a struggling writer on the brink of financial ruin when she accepts the job offer of a lifetime. Jeremy Crawford, husband of bestselling author Verity Crawford, has hired Lowen to complete the remaining books in a successful series his injured wife is unable to finish.<br>&nbsp;<br>Lowen arrives at the Crawford home, ready to sort through years of Verity’s notes and outlines, hoping to find enough material to get her started. What Lowen doesn’t expect to uncover in the chaotic office is an unfinished autobiography Verity never intended for anyone to read. Page after page of bone-chilling admissions, including Verity\'s recollection of the night her family was forever altered.</span><br></div>',2,_binary '','41d1gVUK1yL._SX331_BO1,204,203,200_.jpg','Verity Paperback',15,_binary '','2022-09-27 10:54:29.085000',13,50,4,4,3,3,0,0),(31,'November-9',4,'2022-09-27 11:07:22.992000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">Beloved #1&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">New York Times</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">&nbsp;bestselling author of&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">It Ends with Us</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">&nbsp;and&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">All Your Perfects&nbsp;</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">returns with an unforgettable love story between a writer and his unexpected muse.</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br><br>Fallon meets Ben, an aspiring novelist, the day before her scheduled cross-country move. Their untimely attraction leads them to spend Fallon’s last day in Los Angeles together, and her eventful life becomes the creative inspiration Ben has always sought for his novel. Over time and amidst the various relationships and tribulations of their own separate lives, they continue to meet on the same date every year. Until one day Fallon becomes unsure if Ben has been telling her the truth or fabricating a perfect reality for the sake of the ultimate plot twist.<br><br>Can Ben’s relationship with Fallon—and simultaneously his novel—be considered a love story if it ends in heartbreak?</span><br></div>',2,_binary '','41HB7HlN27L._SX320_BO1,204,203,200_.jpg','November 9',58,_binary '','2022-09-27 11:07:22.992000',13,52,3,3,2,4,0,0),(32,'Hopeless',3,'2022-09-27 11:11:34.923000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">From the #1&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">New York Times</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">&nbsp;bestselling author of&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">All Your Perfects&nbsp;</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">and</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">&nbsp;It Ends with Us&nbsp;</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">comes the beginning of Sky and Dean’s passionate love story—where well-kept secrets threaten to opens wounds of a dark past.</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br><br></span><span class=\"a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: italic !important;\">Would you rather know a truth that makes you feel hopeless, or keep believing the lies?</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br><br>Beloved and bestselling author Colleen Hoover returns with the spellbinding story of two young people with devastating pasts who embark on a passionate, intriguing journey to discover the lessons of life, love, trust—and above all, the healing power that only truth can bring.</span><br></div>',0,_binary '\0','41IXUm1s2eL._SY346_.jpg','Hopeless',25,_binary '','2022-09-27 11:11:34.923000',13,48,1,2,2,1,0,0);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `book_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhiu1jw80o45wfiw5tgok1xpkl` (`book_id`),
  KEY `FKdagcsk6v6x4n1kxw3rkp57921` (`customer_id`),
  CONSTRAINT `FKdagcsk6v6x4n1kxw3rkp57921` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FKhiu1jw80o45wfiw5tgok1xpkl` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (8,3,22,7),(9,3,10,7),(10,2,5,7),(11,2,24,7),(45,1,22,8),(47,2,26,11),(55,2,5,15),(56,1,26,12),(57,2,5,16),(58,1,7,17),(59,2,10,10);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alias` varchar(64) NOT NULL,
  `image` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `status` bit(1) NOT NULL,
  `parent_id` int DEFAULT NULL,
  `all_parent_ids` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jx1ptm0r46dop8v0o7nmgfbeq` (`alias`),
  UNIQUE KEY `UK_t8o6pivur7nn124jehx7cygw5` (`name`),
  KEY `FKsaok720gsu4u2wrgbk10b5n8d` (`parent_id`),
  CONSTRAINT `FKsaok720gsu4u2wrgbk10b5n8d` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Arts & Photography','51sTUoojuaL._SX322_BO1,204,203,200_.jpg','Arts & Photography',_binary '',NULL,NULL),(2,'Biographies & Memoirs','81ghFDPPUxL._AC_UL127_SR127,127_.jpg','Biographies & Memoirs',_binary '',NULL,NULL),(3,'Business & Money','61Ars9rdgGS._AC_UL127_SR127,127_.jpg','Business & Money',_binary '',NULL,NULL),(4,'Drawing','61INQyYUJJL._AC._SR240,240.jpg','Drawing',_binary '',1,'-1-'),(5,'Photography & Video','311C7Xb-2FL._AC._SR240,240.jpg','Photography & Video',_binary '',1,'-1-'),(6,'Music','41SitFz-XsL._SY344_BO1,204,203,200_QL70_ML2_.jpg','Music',_binary '',1,'-1-'),(7,'Graphic Design','41f9x-pnVQL._AC._SR240,240.jpg','Graphic Design',_binary '',1,'-1-'),(8,'Decorative Arts & Design','41phrPC9v9L._AC._SR240,240.jpg','Decorative Arts & Design',_binary '',1,'-1-'),(9,'Performing Arts','51pJwB1hlPL._AC._SR240,240.jpg','Performing Arts',_binary '',1,'-1-'),(10,'History & Criticism','41mTUCODSOL._AC._SR240,240.jpg','History & Criticism',_binary '',1,'-1-'),(11,'Architecture','51k-iIhugSL._SX331_BO1,204,203,200_.jpg','Architecture',_binary '',1,'-1-'),(12,'Historical','41KY-NORo9L._AC._SR240,240.jpg','Historical',_binary '',2,'-2-'),(13,'Memoirs','41wfLB9cycL._AC._SR240,240 (1).jpg','Memoirs',_binary '',2,'-2-'),(14,'Arts & Literature','31sIl2nBSbS._AC._SR240,240.jpg','Arts & Literature',_binary '',2,'-2-'),(15,'Professionals & Academics','411Rri9i9vL._AC._SR240,240.jpg','Professionals & Academics',_binary '',2,'-2-'),(16,'Leaders & Notable People','51yoHjJDQ3L._AC._SR240,240.jpg','Leaders & Notable People',_binary '',2,'-2-'),(17,'Community & Culture','51WRCQlWvuL._AC._SR240,240.jpg','Community & Culture',_binary '',2,'-2-'),(18,'True Crime','41NGxKy-N1L._AC._SR240,240.jpg','True Crime',_binary '',2,'-2-'),(19,'Travelers & Explorers','51xKiRY4L0L._AC._SR240,240.jpg','Travelers & Explorers',_binary '',2,'-2-'),(20,'Computers & Technology','41dpdctWNhL.jpg','Computers & Technology',_binary '',NULL,NULL),(21,'Education & Teaching','51do7OKo3iL.jpg','Education & Teaching',_binary '',NULL,NULL),(22,'Travel','61vTN7miRpL._AC._SR360,460.jpg','Travel',_binary '',NULL,NULL),(23,'Sports & Outdoors','811A3zgJGML._AC._SR360,460.jpg','Sports & Outdoors',_binary '',NULL,NULL),(24,'Science Fiction & Fantasy','41NsJqa5o1L.jpg','Science Fiction & Fantasy',_binary '',NULL,NULL),(25,'Crafts, Hobbies & Home','91M5h3r6NaL._AC._SR360,460.jpg','Crafts, Hobbies & Home',_binary '',NULL,NULL),(26,'Health, Fitness & Dieting','81WzAUh1QcL._AC._SR360,460.jpg','Health, Fitness & Dieting',_binary '',NULL,NULL),(27,'Calendars','81blnopcUiL._AC_UL127_SR127,127_.jpg','Calendars',_binary '',NULL,NULL),(28,'Humor & Entertainment','91ks0ej5NnL._AC._SR360,460.jpg','Humor & Entertainment',_binary '',NULL,NULL),(35,'Economics','41fRhIU4BGL._AC._SR240,240.jpg','Economics',_binary '',3,'-3-'),(36,'Skills','51I2EIRF44L._AC._SR240,240.jpg','Skills',_binary '',3,'-3-'),(37,'Accounting','51IsooTKnFS._AC._SR240,240.jpg','Accounting',_binary '',3,'-3-'),(38,'Sports','41UnvCIXCKL._AC._SR240,240.jpg','Sports',_binary '',27,'-27-'),(39,'Arts','61nGi-u4TeL._AC._SR240,240.jpg','Arts',_binary '',27,'-27-'),(40,'Nature','51LmZ1cI7BL._AC._SR240,240.jpg','Nature',_binary '',27,'-27-'),(41,'Computer Science','41oYsXjLvZL._AC._SR240,240.jpg','Computer Science',_binary '',20,'-20-'),(42,'Web Development & Design','41leOaqpoyL._AC._SR240,240.jpg','Web Development & Design',_binary '',20,'-20-'),(43,'Internet & Social Media','41gHZZPTJ7L._AC._SR240,240.jpg','Internet & Social Media',_binary '',20,'-20-'),(44,'Pets & Animal Cate','41C92Hy0AHL._AC._SR240,240.jpg','Pets & Animal Cate',_binary '',25,'-25-'),(45,'Weddings','41GQndSbFnL._AC._SR240,240.jpg','Weddings',_binary '',25,'-25-'),(46,'Schools & Teaching','510g8NLbpNL._AC._SR240,240.jpg','Schools & Teaching',_binary '',21,'-21-'),(47,'Higher & Continuing','41L8zSvSUOL._AC._SR240,240.jpg','Higher & Continuing',_binary '',21,'-21-'),(48,'Mental Health','81d6nS3KUHL._AC_UL127_SR127,127_.jpg','Mental Health',_binary '',26,'-26-'),(49,'Humor','41NzDuSdIfL._AC._SR240,240.jpg','Humor',_binary '',28,'-28-'),(50,'Puzzles & Games','51qEePQ33JL._AC._SR240,240.jpg','Puzzles & Games',_binary '',28,'-28-'),(51,'Fantasy','81xT2mdyL7L._AC_UL127_SR127,127_.jpg','Fantasy',_binary '',24,'-24-'),(52,'Outdoor Recretion','41sVOgemofL._AC._SR240,240.jpg','Outdoor Recretion',_binary '',23,'-23-');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `code` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Andorra','AD'),(2,'United Arab Emirates','AE'),(3,'Afghanistan','AF'),(4,'Antigua and Barbuda','AG'),(5,'Anguilla','AI'),(6,'Albania','AL'),(7,'Armenia','AM'),(8,'Netherlands Antilles','AN'),(9,'Angola','AO'),(10,'Antarctica','AQ'),(11,'Argentina','AR'),(12,'American Samoa','AS'),(13,'Austria','AT'),(14,'Australia','AU'),(15,'Aruba','AW'),(16,'Åland Islands','AX'),(17,'Azerbaijan','AZ'),(18,'Bosnia and Herzegovina','BA'),(19,'Barbados','BB'),(20,'Bangladesh','BD'),(21,'Belgium','BE'),(22,'Burkina Faso','BF'),(23,'Bulgaria','BG'),(24,'Bahrain','BH'),(25,'Burundi','BI'),(26,'Benin','BJ'),(27,'Saint Barthélemy','BL'),(28,'Bermuda','BM'),(29,'Brunei','BN'),(30,'Bolivia','BO'),(31,'Bonaire, Sint Eustatius and Saba','BQ'),(32,'Brazil','BR'),(33,'Bahamas','BS'),(34,'Bhutan','BT'),(35,'Bouvet Island','BV'),(36,'Botswana','BW'),(37,'Belarus','BY'),(38,'Belize','BZ'),(39,'Canada','CA'),(40,'Cocos Islands','CC'),(41,'The Democratic Republic Of Congo','CD'),(42,'Central African Republic','CF'),(43,'Congo','CG'),(44,'Switzerland','CH'),(45,'Côte d\'Ivoire','CI'),(46,'Cook Islands','CK'),(47,'Chile','CL'),(48,'Cameroon','CM'),(49,'China','CN'),(50,'Colombia','CO'),(51,'Costa Rica','CR'),(52,'Cuba','CU'),(53,'Cape Verde','CV'),(54,'Curaçao','CW'),(55,'Christmas Island','CX'),(56,'Cyprus','CY'),(57,'Czech Republic','CZ'),(58,'Germany','DE'),(59,'Djibouti','DJ'),(60,'Denmark','DK'),(61,'Dominica','DM'),(62,'Dominican Republic','DO'),(63,'Algeria','DZ'),(64,'Ecuador','EC'),(65,'Estonia','EE'),(66,'Egypt','EG'),(67,'Western Sahara','EH'),(68,'Eritrea','ER'),(69,'Spain','ES'),(70,'Ethiopia','ET'),(71,'Finland','FI'),(72,'Fiji','FJ'),(73,'Falkland Islands','FK'),(74,'Micronesia','FM'),(75,'Faroe Islands','FO'),(76,'France','FR'),(77,'Gabon','GA'),(78,'United Kingdom','GB'),(79,'Grenada','GD'),(80,'Georgia','GE'),(81,'French Guiana','GF'),(82,'Guernsey','GG'),(83,'Ghana','GH'),(84,'Gibraltar','GI'),(85,'Greenland','GL'),(86,'Gambia','GM'),(87,'Guinea','GN'),(88,'Guadeloupe','GP'),(89,'Equatorial Guinea','GQ'),(90,'Greece','GR'),(91,'South Georgia And The South Sandwich Islands','GS'),(92,'Guatemala','GT'),(93,'Guam','GU'),(94,'Guinea-Bissau','GW'),(95,'Guyana','GY'),(96,'Hong Kong','HK'),(97,'Heard Island And McDonald Islands','HM'),(98,'Honduras','HN'),(99,'Croatia','HR'),(100,'Haiti','HT'),(101,'Hungary','HU'),(102,'Indonesia','ID'),(103,'Ireland','IE'),(104,'Israel','IL'),(105,'Isle Of Man','IM'),(106,'India','IN'),(107,'British Indian Ocean Territory','IO'),(108,'Iraq','IQ'),(109,'Iran','IR'),(110,'Iceland','IS'),(111,'Italy','IT'),(112,'Jersey','JE'),(113,'Jamaica','JM'),(114,'Jordan','JO'),(115,'Japan','JP'),(116,'Kenya','KE'),(117,'Kyrgyzstan','KG'),(118,'Cambodia','KH'),(119,'Kiribati','KI'),(120,'Comoros','KM'),(121,'Saint Kitts And Nevis','KN'),(122,'North Korea','KP'),(123,'South Korea','KR'),(124,'Kuwait','KW'),(125,'Cayman Islands','KY'),(126,'Kazakhstan','KZ'),(127,'Laos','LA'),(128,'Lebanon','LB'),(129,'Saint Lucia','LC'),(130,'Liechtenstein','LI'),(131,'Sri Lanka','LK'),(132,'Liberia','LR'),(133,'Lesotho','LS'),(134,'Lithuania','LT'),(135,'Luxembourg','LU'),(136,'Latvia','LV'),(137,'Libya','LY'),(138,'Morocco','MA'),(139,'Monaco','MC'),(140,'Moldova','MD'),(141,'Montenegro','ME'),(142,'Saint Martin','MF'),(143,'Madagascar','MG'),(144,'Marshall Islands','MH'),(145,'Macedonia','MK'),(146,'Mali','ML'),(147,'Myanmar','MM'),(148,'Mongolia','MN'),(149,'Macao','MO'),(150,'Northern Mariana Islands','MP'),(151,'Martinique','MQ'),(152,'Mauritania','MR'),(153,'Montserrat','MS'),(154,'Malta','MT'),(155,'Mauritius','MU'),(156,'Maldives','MV'),(157,'Malawi','MW'),(158,'Mexico','MX'),(159,'Malaysia','MY'),(160,'Mozambique','MZ'),(161,'Namibia','NA'),(162,'New Caledonia','NC'),(163,'Niger','NE'),(164,'Norfolk Island','NF'),(165,'Nigeria','NG'),(166,'Nicaragua','NI'),(167,'Netherlands','NL'),(168,'Norway','NO'),(169,'Nepal','NP'),(170,'Nauru','NR'),(171,'Niue','NU'),(172,'New Zealand','NZ'),(173,'Oman','OM'),(174,'Panama','PA'),(175,'Peru','PE'),(176,'French Polynesia','PF'),(177,'Papua New Guinea','PG'),(178,'Philippines','PH'),(179,'Pakistan','PK'),(180,'Poland','PL'),(181,'Saint Pierre And Miquelon','PM'),(182,'Pitcairn','PN'),(183,'Puerto Rico','PR'),(184,'Palestine','PS'),(185,'Portugal','PT'),(186,'Palau','PW'),(187,'Paraguay','PY'),(188,'Qatar','QA'),(189,'Reunion','RE'),(190,'Romania','RO'),(191,'Serbia','RS'),(192,'Russia','RU'),(193,'Rwanda','RW'),(194,'Saudi Arabia','SA'),(195,'Solomon Islands','SB'),(196,'Seychelles','SC'),(197,'Sudan','SD'),(198,'Sweden','SE'),(199,'Singapore','SG'),(200,'Saint Helena','SH'),(201,'Slovenia','SI'),(202,'Svalbard And Jan Mayen','SJ'),(203,'Slovakia','SK'),(204,'Sierra Leone','SL'),(205,'San Marino','SM'),(206,'Senegal','SN'),(207,'Somalia','SO'),(208,'Suriname','SR'),(209,'South Sudan','SS'),(210,'Sao Tome And Principe','ST'),(211,'El Salvador','SV'),(212,'Sint Maarten (Dutch part)','SX'),(213,'Syria','SY'),(214,'Swaziland','SZ'),(215,'Turks And Caicos Islands','TC'),(216,'Chad','TD'),(217,'French Southern Territories','TF'),(218,'Togo','TG'),(219,'Thailand','TH'),(220,'Tajikistan','TJ'),(221,'Tokelau','TK'),(222,'Timor-Leste','TL'),(223,'Turkmenistan','TM'),(224,'Tunisia','TN'),(225,'Tonga','TO'),(226,'Turkey','TR'),(227,'Trinidad and Tobago','TT'),(228,'Tuvalu','TV'),(229,'Taiwan','TW'),(230,'Tanzania','TZ'),(231,'Ukraine','UA'),(232,'Uganda','UG'),(233,'United States Minor Outlying Islands','UM'),(234,'United States','US'),(235,'Uruguay','UY'),(236,'Uzbekistan','UZ'),(237,'Vatican','VA'),(238,'Saint Vincent And The Grenadines','VC'),(239,'Venezuela','VE'),(240,'British Virgin Islands','VG'),(241,'U.S. Virgin Islands','VI'),(242,'Vietnam','VN'),(243,'Vanuatu','VU'),(244,'Wallis And Futuna','WF'),(245,'Samoa','WS'),(246,'Yemen','YE'),(247,'Mayotte','YT'),(248,'South Africa','ZA'),(249,'Zambia','ZM'),(250,'Zimbabwe','ZW'),(253,'New Country','CCN');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `symbol` varchar(3) NOT NULL,
  `code` varchar(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'United States Dollar','$','USD'),(2,'British Pound','£','GPB'),(3,'Japanese Yen','¥','JPY'),(4,'Euro','€','EUR'),(5,'Russian Ruble','₽','RUB'),(6,'South Korean Won','₩','KRW'),(7,'Chinese Yuan','¥','CNY'),(8,'Brazilian Real','R$','BRL'),(9,'Australian Dollar','$','AUD'),(10,'Canadian Dollar','$','CAD'),(11,'Vietnamese đồng ','₫','VND'),(12,'Indian Rupee','₹','INR');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(64) NOT NULL,
  `address_line_2` varchar(64) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `state` varchar(45) NOT NULL,
  `authentication_type` varchar(10) DEFAULT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(64) NOT NULL,
  `reset_password_token` varchar(30) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `verification_code` varchar(64) DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rfbvkrffamfql7cjmen8v976v` (`email`),
  KEY `FK7b7p2myt0y31l4nyj1p7sk0b1` (`country_id`),
  CONSTRAINT `FK7b7p2myt0y31l4nyj1p7sk0b1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'8 W Cerritos Ave #54','Benton, John B Jr','Ho Chi Minh','Quang','Trí','0987774191','71000','California','GOOGLE','2022-09-14 17:07:12.037000','triquang.15qt@gmail.com','',NULL,_binary '',NULL,234),(2,'8 W Cerritos Ave #54','8 W Cerritos Ave #54','New Orleans','Trí','Quang','0987774191','71000','Queensland','FACEBOOK','2022-09-14 17:52:45.582000','triquang.74qt@gmail.com','',NULL,_binary '',NULL,14);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `book_cost` float NOT NULL,
  `quantity` int NOT NULL,
  `shipping_cost` float NOT NULL,
  `subtotal` float NOT NULL,
  `unit_price` float NOT NULL,
  `book_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjqe04yonp6a52rhbf2y0m03qw` (`book_id`),
  KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  CONSTRAINT `FKjqe04yonp6a52rhbf2y0m03qw` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (10,18,2,39.92,128.7,64.35,22,8),(11,10,2,49.9,67.9,33.95,10,9),(12,6,2,39.92,64.8,32.4,3,10);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_track`
--

DROP TABLE IF EXISTS `order_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_track` (
  `id` int NOT NULL AUTO_INCREMENT,
  `notes` varchar(256) DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK31jv1s212kajfn3kk1ksmnyfl` (`order_id`),
  CONSTRAINT `FK31jv1s212kajfn3kk1ksmnyfl` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_track`
--

LOCK TABLES `order_track` WRITE;
/*!40000 ALTER TABLE `order_track` DISABLE KEYS */;
INSERT INTO `order_track` VALUES (38,'Order was placed by the customer','NEW','2022-09-28 02:50:58.000000',8),(40,'Order is being processed','PROCESSING','2022-09-28 14:52:29.000000',8),(41,'Shipper picked the package','PICKED','2022-09-28 14:53:22.874000',8),(42,'Shipper is delivering the package','SHIPPING','2022-09-28 14:53:45.065000',8),(43,'Customer received products','DELIVERED','2022-09-28 14:54:07.255000',8),(44,'Order was placed by the customer','NEW','2022-09-28 05:03:17.000000',9),(45,'Order is being processed','PROCESSING','2022-09-28 17:05:04.000000',9),(46,'Shipper picked the package','PICKED','2022-09-28 17:06:19.241000',9),(47,'Shipper is delivering the package','SHIPPING','2022-09-28 17:06:35.951000',9),(48,'Customer received products','DELIVERED','2022-09-28 17:06:54.264000',9),(49,'Order was placed by the customer','NEW','2022-09-28 05:29:26.000000',10),(50,'Order is being processed','PROCESSING','2022-09-28 17:29:58.000000',10),(51,'Shipper picked the package','PICKED','2022-09-28 17:30:47.108000',10),(52,'Shipper is delivering the package','SHIPPING','2022-09-28 17:30:49.453000',10),(53,'Customer received products','DELIVERED','2022-09-28 17:30:51.579000',10);
/*!40000 ALTER TABLE `order_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address_line_1` varchar(64) NOT NULL,
  `address_line_2` varchar(64) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `state` varchar(45) NOT NULL,
  `book_cost` float NOT NULL,
  `country` varchar(45) NOT NULL,
  `deliver_date` datetime(6) DEFAULT NULL,
  `deliver_days` int NOT NULL,
  `order_time` datetime(6) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `shipping_cost` float NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `subtotal` float NOT NULL,
  `tax` float NOT NULL,
  `total` float NOT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpxtb8awmi0dk6smoh2vp1litg` (`customer_id`),
  CONSTRAINT `FKpxtb8awmi0dk6smoh2vp1litg` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (8,'8 W Cerritos Ave #54','8 W Cerritos Ave #54','New Orleans','Trí','Quang','0987774191','71000','Queensland',18,'Australia','2022-10-03 00:00:00.000000',5,'2022-09-28 14:50:58.557000','PAYPAL',39.92,'DELIVERED',128.7,0,168.62,2),(9,'8 W Cerritos Ave #54','8 W Cerritos Ave #54','New Orleans','Trí','Quang','0987774191','71000','Queensland',10,'Australia','2022-10-03 00:00:00.000000',5,'2022-09-28 17:03:17.812000','COD',49.9,'DELIVERED',67.9,0,117.8,2),(10,'8 W Cerritos Ave #54','8 W Cerritos Ave #54','New Orleans','Trí','Quang','0987774191','71000','Queensland',6,'Australia','2022-10-03 00:00:00.000000',5,'2022-09-28 17:29:26.825000','PAYPAL',39.92,'DELIVERED',64.8,0,104.72,2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(4096) NOT NULL,
  `headline` varchar(128) NOT NULL,
  `rating` int NOT NULL,
  `review_time` datetime(6) NOT NULL,
  `book_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6a9k6xvev80se5rreqvuqr7f9` (`book_id`),
  KEY `FK4sm0k8kw740iyuex3vwwv1etu` (`customer_id`),
  CONSTRAINT `FK4sm0k8kw740iyuex3vwwv1etu` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FK6a9k6xvev80se5rreqvuqr7f9` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (9,'I\'ve been using this calendar for a few years and I love how each year its a new event on the date. I post it daily on my snapchat and my friends love reading what the event was.','Very interesting',4,'2022-09-28 16:57:53.807000',22,2),(10,'Holiday gift for someone who enjoys this type of items - Very nice!',' Very nice gift',3,'2022-09-28 17:07:37.337000',10,2),(11,'Was a Christmas gift for hubby who loves history. He is thoroughly enjoying this.','Hubby loves it',3,'2022-09-28 17:08:59.488000',10,2),(22,'Her art is cute. I just don\'t like that Mary finds it necessary to profess her liberal ideas so openly. I still like the art. We can like but not hate... unlike how she feels about us. Sad when well know people have to be so negatively political. Best to be quiet instead of hateful. The art on these calendars is all I care about - for now. Maybe next year I won\'t buy it. I can\'t even remember how many years I\'ve been buying her art - maybe 15 or better.','Love Her Art - but that\'s it.',5,'2022-09-28 17:31:35.987000',3,2);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `description` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ofx66keruapi6vyqpv6f2or37` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','Manage everything'),(2,'Salesperson','Manage product price, customers, shipping, orders and sales report'),(3,'Editor','Manage categories, authors, products, articles and menus'),(4,'Shipper','View products, view orders and update order status'),(5,'Assistant','Manage questions and reviews');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `key` varchar(128) NOT NULL,
  `value` varchar(1024) NOT NULL,
  `category` varchar(45) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('CURRENCY_ID','1','CURRENCY'),('CURRENCY_SYMBOL','$','CURRENCY'),('CURRENCY_SYMBOL_POSITION','Before price','CURRENCY'),('CUSTOMER_VERIFY_CONTENT','<b>&nbsp; &nbsp; &nbsp; Dear [[name]],</b><div><i><b><br></b></i></div><div><i><b>&nbsp;Click the link below to verify your registration:</b></i></div><div><i><b><br></b></i></div>\r\n\r\n\r\n&nbsp; <a href=\"[[URL]]\" target=\"_self\">VERIFY</a><a href=\"[[URL]]\" target=\"_self\"></a><h3></h3><div><br></div><a href=\"[[URL]]\" target=\"_self\"></a><div><b>&nbsp;Best Regard,</b></div><div><b>&nbsp;The Amazon Team.</b></div>','MAIL_TEMPLATES'),('CUSTOMER_VERIFY_SUBJECT','Please verify your registration to continue Amazon Book','MAIL_TEMPLATES'),('DECIMAL_DIGITS','2','CURRENCY'),('DECIMAL_POINT_TYPE','POINT','CURRENCY'),('MAIL_FROM','aptech.amazonbook@gmail.com','MAIL_SERVER'),('MAIL_HOST','smtp.gmail.com','MAIL_SERVER'),('MAIL_PASSWORD','fgfexbtvnqboebat','MAIL_SERVER'),('MAIL_PORT','587','MAIL_SERVER'),('MAIL_SENDER_NAME','The Amazon Team','MAIL_SERVER'),('MAIL_USERNAME','aptech.amazonbook@gmail.com','MAIL_SERVER'),('ORDER_CONFIRMATION_CONTENT','&nbsp; &nbsp; &nbsp; &nbsp; Dear [[name]],&nbsp;<div>&nbsp;This email is to confirm that you have successfully placed an order through our website. Please review the following order summary:<div><br></div></div><div>- Order ID: [[orderId]]</div><div>- Order time: [[orderTime]]</div><div>- Ship to: [[shippingAddress]]</div><div>- Total: [[total]]</div><div>- Payment method: [[paymentMethod]]</div><div><br></div><div>We\'re currently processing your order. Click here to view full details of your order on our website (login required).</div><div><br></div><div>Thanks for purchasing products at Amazon Book.</div><div><b>The Amazon Team.</b></div>','MAIL_TEMPLATES'),('ORDER_CONFIRMATION_SUBJECT','[Amazon Book] Purchase Confirmation of your order ID #[[orderId]]','MAIL_TEMPLATES'),('PAYPAL_API_BASE_URL','https://api-m.sandbox.paypal.com','PAYMENT'),('PAYPAL_API_CLIENT_ID','AVrNYKEuIxaJqdoYptMfy8ENDvwBc93u0ClhROkZz_J0sX3-Wa6vCv0s85WDO10e4GyVJo_UnTni47mq','PAYMENT'),('PAYPAL_API_CLIENT_SECRET','EFNVxb4GD57B_OLyw6nYsDJ6l-S08Dk8-l7qJMAf9pvEv5T-UkSMpjjsQoxGMFKVGTuAqe6mgj3Rfpox','PAYMENT'),('SITE_LOGO','/site-logo/icone-amazon-rouge.png','GENERAL'),('SITE_NAME','Amazon.com','GENERAL'),('SMTP_AUTH','true','MAIL_SERVER'),('SMTP_SECURED','true','MAIL_SERVER'),('THOUSANDS_POINT_TYPE','COMMA','CURRENCY');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_rates`
--

DROP TABLE IF EXISTS `shipping_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_rates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country_id` int DEFAULT NULL,
  `state` varchar(45) NOT NULL,
  `rate` float NOT NULL,
  `days` int NOT NULL,
  `cod_supported` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKef7sfgeybt3xn13nlt2j6sljw` (`country_id`),
  CONSTRAINT `FKef7sfgeybt3xn13nlt2j6sljw` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_rates`
--

LOCK TABLES `shipping_rates` WRITE;
/*!40000 ALTER TABLE `shipping_rates` DISABLE KEYS */;
INSERT INTO `shipping_rates` VALUES (2,234,'New York',10,7,_binary ''),(3,234,'Florida',12,6,_binary '\0'),(5,242,'Hanoi',3.98,2,_binary ''),(6,234,'California',11.56,6,_binary '\0'),(7,242,'Hai Phong',3.93,2,_binary '\0'),(8,242,'Bac Giang',4.12,2,_binary '\0'),(9,242,'Phu Tho',4.21,3,_binary '\0'),(10,242,'Thanh Hoa',3.52,1,_binary ''),(11,106,'Karnataka',8.22,5,_binary '\0'),(12,106,'Maharashtra',8.69,5,_binary ''),(13,106,'Meghalaya',8.1,4,_binary '\0'),(14,106,'Punjab',7.89,3,_binary '\0'),(15,106,'Tamil Nadu',8.25,4,_binary '\0'),(16,106,'Telangana',7.72,4,_binary '\0'),(17,242,'Da Nang',0.5,1,_binary ''),(18,234,'Ohio',11.5,8,_binary ''),(19,78,'London',9.88,6,_binary ''),(20,106,'Delhi',8.45,5,_binary ''),(21,106,'West Bengal',8.88,5,_binary ''),(22,78,'Barton',7.78,6,_binary ''),(23,106,'Andhra Pradesh',8.12,6,_binary ''),(24,234,'Tennessee',12,8,_binary ''),(25,234,'Massachusetts',11.85,7,_binary ''),(26,14,'Queensland',4.99,5,_binary ''),(27,199,'Singapore',3.33,3,_binary ''),(28,39,'British Columbia',9.88,7,_binary ''),(29,14,'New South Wales',4.57,6,_binary ''),(30,234,'Illinois',13,9,_binary '');
/*!40000 ALTER TABLE `shipping_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKskkdphjml9vjlrqn4m5hi251y` (`country_id`),
  CONSTRAINT `FKskkdphjml9vjlrqn4m5hi251y` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Ha Noi',242),(2,'Da Nang',242),(3,'New York',234),(4,'California',234),(5,'Ho Chi Minh City',242),(6,'Hai Phong',242),(7,'Bac Giang',242),(8,'Son La',242),(9,'Quang Ninh',242),(10,'Nghe An',242),(12,'Utah',234),(13,'Washington',234),(14,'Florida',234),(15,'Illinois',234),(16,'Texas',234),(18,'Colorado',234),(19,'Alaska',234),(20,'Can Tho',242),(22,'Binh Duong',242),(23,'Thanh Hoa',242),(24,'Andhra Pradesh',106),(25,'Arunachal Pradesh',106),(26,'Assam',106),(27,'Bihar',106),(28,'Haryana',106),(29,'Himacha Pradesh',106),(30,'Karnataka',106),(31,'Maharashtra',106),(32,'Meghalaya',106),(33,'Punjab',106),(34,'Tamil Nadu',106),(35,'Telangana',106),(36,'Uttar Pradesh',106),(37,'West Bengal',106),(38,'Bac Ninh',242),(40,'Ha Tinh',242),(41,'Hue',242),(42,'Binh Dinh',242),(43,'An Giang',242),(44,'Blackpool',78),(45,'London',78),(46,'Liverpool',78),(47,'Manchester',78),(48,'Newcastle',78),(49,'Bristol',78),(50,'Cambridge',78),(51,'Lang Son',242),(52,'Delhi',106),(53,'Hawaii',234),(54,'Georgia',234),(55,'Pennsylvania',234),(56,'Virginia',234),(57,'Arizona',234),(59,'Kerala',106),(60,'Rajasthan',106),(61,'Odisha',106),(62,'Mizoram',106),(63,'Sikkim',106),(64,'Manipur',106),(65,'Nagaland',106),(66,'Tripura',106),(67,'Jharkhand',106),(68,'Uttarakhand',106),(69,'Goa',106),(70,'Madhya Pradesh',106),(71,'Gujarat',106),(72,'Massachusetts',234),(73,'Indiana',234),(74,'Michigan',234),(75,'Ohio',234),(76,'New Jersey',234),(77,'Minnesota',234),(78,'North Carolina',234),(79,'Oregon',234),(80,'Maryland',234),(81,'Tennessee',234),(82,'Montana',234),(83,'Maine',234),(84,'Alabama',234),(85,'Wisconsin',234),(86,'Louisiana',234),(87,'Connecticut',234),(88,'Missouri',234),(89,'South Carolina',234),(90,'Mississippi',234),(91,'New Mexico',234),(92,'Nevada',234),(93,'Kentucky',234),(94,'Arkansas',234),(95,'Wyoming',234),(96,'Kansas',234),(97,'Delaware',234),(98,'Iowa',234),(99,'Idaho',234),(100,'Nebraska',234),(101,'Rhode Island',234),(102,'Vermont',234),(103,'South Dakota',234),(104,'New Hamsphire',234),(105,'West Virginia',234),(106,'North Dakota',234),(107,'Oklahoma',234),(109,'Nam Dinh',242),(110,'Khanh Hoa',242),(112,'Tay Ninh',242),(113,'Kien Giang',242),(114,'Lai Chau',242),(115,'Lao Cai',242),(116,'Ha Giang',242),(117,'Hoa Binh',242),(118,'Thai Binh',242),(119,'Dong Nai',242),(120,'Soc Trang',242),(121,'Bac Lieu',242),(123,'Ca Mau',242),(124,'Quang Binh',242),(125,'Quang Tri',242),(126,'Quang Nam',242),(127,'Quang Ngai',242),(128,'Gia Lai',242),(129,'Vinh Phuc',242),(130,'Lam Dong',242),(131,'Dak Lak',242),(132,'Phu Yen',242),(133,'Binh Phuoc',242),(134,'Dak Nong',242),(135,'Dong Thap',242),(136,'Hau Giang',242),(137,'Ba Ria Vung Tau',242),(138,'Binh Thuan',242),(139,'Hai Duong',242),(140,'Hung Yen',242),(141,'Thai Nguyen',242),(142,'Long An',242),(143,'Ben Tre',242),(144,'Bac Kan',242),(145,'Ninh Binh',242),(146,'Kon Tum',242),(147,'Tra Vinh',242),(148,'Yen Bai',242),(149,'Tuyen Quang',242),(150,'Phu Tho',242),(151,'Vinh Long',242),(152,'New South Wales',14),(153,'Queensland',14),(154,'Tasmania',14),(155,'Western Australia',14),(156,'Victoria',14),(157,'South Australia',14),(158,'Ontario',39),(159,'Quebec',39),(160,'Nova Scotia',39),(161,'New Brunswick',39),(162,'Manitoba',39),(163,'British Columbia',39),(164,'Prince Edward Island',39),(165,'Saskatchewan',39),(166,'Alberta',39),(167,'Newfoundland and Labrador',39),(168,'Grand Est',76),(169,'Hauts-de-France',76),(170,'Normandy',76),(171,'Nouvelle-Aquitaine',76),(172,'Occitanie',76),(173,'Brittany',76),(174,'Centre-Val de Loire',76),(175,'Corsica',76),(176,'French Guiana',76),(177,'Guadeloupe',76),(178,'Île-de-France',76),(179,'Martinique',76),(180,'Mayotte',76),(181,'Pays de la Loire',76),(182,'Provence-Alpes-Côte d\'Azur',76),(183,'Réunion',76),(184,'Aichi',115),(185,'Akita',115),(186,'Chiba',115),(187,'Ehime',115),(188,'Fukui',115),(189,'Fukuoka',115),(190,'Fukushima',115),(191,'Gunma',115),(192,'Kobe',115),(193,'Hiroshima',115),(194,'Hokkaido',115),(195,'Ishikawa',115),(196,'Kagawa',115),(197,'Kochi',115),(198,'Kyoto',115),(199,'Nagasaki',115),(200,'Okinawa',115),(201,'Osaka',115),(202,'Saga',115),(203,'Tokushima',115),(204,'Tokyo',115),(205,'Yamagata',115),(206,'Yamaguchi',115),(207,'Yamanashi',115),(208,'Greater Poland',180),(209,'Kuyavia-Pomerania',180),(210,'Lesser Poland',180),(211,'Łódź',180),(212,'Lower Silesia',180),(213,'Lublin',180),(214,'Lubusz',180),(215,'Masovia',180),(216,'Opole',180),(217,'Podlaskie',180),(218,'Pomerania',180),(219,'Silesia',180),(220,'Subcarpathia',180),(221,'Holy Cross Province',180),(222,'Warmia-Masuria',180),(223,'West Pomerania',180),(224,'Baden-Württemberg',58),(225,'Bavaria',58),(226,'Berlin',58),(227,'Brandenburg',58),(228,'Bremen',58),(229,'Hamburg',58),(230,'Hesse',58),(231,'Lower Saxony',58),(232,'Mecklenburg-Vorpommern',58),(233,'North Rhine- Westphalia',58),(234,'Rhineland-Palatinate',58),(235,'Saarland',58),(236,'Saxony',58),(237,'Saxony-Anhalt',58),(238,'Schleswig-Holstein',58),(239,'Thuringia',58),(240,'Acre',32),(241,'Alagoas',32),(242,'Amapá',32),(243,'Amazonas',32),(244,'Bahia',32),(245,'Ceará',32),(246,'Distrito Federal',32),(247,'Espírito Santo',32),(248,'Goiás',32),(249,'Maranhão',32),(250,'Mato Grosso',32),(251,'Minas Gerais',32),(252,'Pará',32),(253,'Paraíba',32),(254,'Paraná',32),(255,'Pernambuco',32),(256,'Piauí',32),(257,'Rio de Janeiro',32),(258,'Rio Grande do Norte',32),(259,'Rio Grande do Sul',32),(260,'Rondônia',32),(261,'Roraima',32),(262,'Santa Catarina',32),(263,'São Paulo',32),(264,'Sergipe',32),(265,'Tocantins',32),(266,'Adana',226),(267,'Adıyaman',226),(268,'Ankara',226),(269,'Balıkesir',226),(270,'Bilecik',226),(271,'Bingöl',226),(272,'Bursa',226),(273,'Çanakkale',226),(274,'Çankırı',226),(275,'Çorum',226),(276,'Denizli',226),(277,'Diyarbakır',226),(278,'Edirne',226),(279,'Erzurum',226),(280,'Gaziantep',226),(281,'Giresun',226),(282,'Hakkâri',226),(283,'Hatay',226),(284,'Isparta',226),(285,'Istanbul',226),(286,'Konya',226),(287,'Malatya',226),(288,'Manisa',226),(289,'Iğdır',226),(290,'Karaman',226),(291,'Osmaniye',226),(292,'Tokat',226),(293,'Sivas',226),(294,'Sinop',226),(295,'Siirt',226),(296,'Batman',226),(297,'Kilis',226),(298,'Rize',226),(299,'Ordu',226),(300,'Tunceli',226),(301,'Yozgat',226),(302,'Van',226),(303,'Bayburt',226),(304,'Yalova',226),(305,'Samsun',226),(306,'Sakarya',226);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `password` varchar(64) NOT NULL,
  `photos` varchar(64) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'triquang.95qt@gmail.com','Quang','Tri','$2a$10$0aY90d7DVwRgOD4itIxvie3/19WJQS7t6PoloXbJu5C9fm.keU2Yu','289014159_1126424917918145_1692834393169026245_n.jpg',_binary ''),(3,'art@venere.org','Art','Venere','$2a$10$VGRzfPXGouyweaS.fsDrWupx2mxAPcLbiI5wUJP.99y0YsXpuAGDm','Messi-800x480.jpg',_binary ''),(4,'lpaprocki@hotmail.com','Paprocki','Feltz Printing Service','$2a$10$B.H7nPBRlkcw4aZdXbURsOBISJzgizTDsPzeNddkmDdD144TgtuKO','bo.jpg',_binary ''),(5,'donette.foller@cox.net','Foller','Printing Dimensions','$2a$10$wn0pC9WMDG1rL/xeccajhOagRLvsu7ohGqZgP5QRpTELsX4bnfsDK','skysports-neymar-paris-saint-germain_4456493_yggp.jpg',_binary ''),(6,'simona@morasca.com','Morasca','Chapman, Ross E Esq','$2a$10$Ca.49abWWwaSHE4Y2J0P5uRsOC56HwauzwibrZB93AvHtmW0MpH1G','champions-league-psg-neymar-2_ccyv.jpg',_binary ''),(7,'sage_wieser@cox.net','Wieser','Truhlar And Truhlar Attys','$2a$10$AZ6Mur9GwQnnDGunxAbuZeO80pkz9lH5qTuKup38sZVOBQfUJ6.Gi','tong-thong-My-Donald-Trump-featured-image-elle-man-1.png',_binary ''),(8,'calbares@gmail.com','Rousseaux','Michael Esq','$2a$10$zw/Jla2nBcy7QeS9kKtF3ecuEouOCr.p8nAU1X8J4UOEdf1h5NMe6','pBpivAl.jpg',_binary ''),(9,'ravi@gmail.com','Ravi','Kumar','$2a$10$bRZuAmOVvEPJb9e/Zp0in.npKfyEsn8dZOTUvO82YbxpV79jmFo8u','images.jpg',_binary ''),(12,'quangtri.nguyen@dxc.com','Tri',' Quang','$2a$10$N9b0GSnOqoRxuBpnemHjS.4F9LnQ/HgXLho.TS1o/ObnTWM/JgRDm','david-beckham-10.jpg',_binary ''),(17,'Ozawoz_fia@gmail.com','James','Adell','$2a$10$HoSfsb7/mH/K1nx7T7wF6.M9rj4CjgteB1sGIJIZ1xu41rY.cVAv2','hinh-anh-gai-xinh-71.jpg',_binary '');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKj6m8fwv7oqv74fcehir1a9ffy` (`role_id`),
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(12,1),(7,2),(3,3),(6,3),(7,3),(8,3),(9,3),(4,4),(6,4),(8,4),(17,4),(5,5),(8,5),(9,5);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-28 17:35:55
