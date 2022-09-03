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
  PRIMARY KEY (`id`),
  KEY `FKn3sth7s3kur1rafwbbrqqnswt` (`country_id`),
  KEY `FKhrpf5e8dwasvdc5cticysrt2k` (`customer_id`),
  CONSTRAINT `FKhrpf5e8dwasvdc5cticysrt2k` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `FKn3sth7s3kur1rafwbbrqqnswt` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
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
INSERT INTO `author_categories` VALUES (1,1),(3,1),(4,2),(12,3),(1,4),(3,5),(3,6),(1,7),(1,8),(3,9),(3,10),(1,11),(4,12),(6,12),(4,13),(6,13),(4,14),(6,14),(5,15),(12,15),(5,16),(6,16),(4,17),(6,17),(5,18),(12,18),(5,19),(12,19),(8,20),(8,21),(9,21),(11,21),(7,22),(7,23),(7,24),(10,24),(8,25),(9,26),(10,26),(11,26),(8,27),(9,28),(10,28),(11,28);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'2.jpg','Adam Nayman'),(3,'1.jpg','Adrian Kulp'),(4,'5.jpg','Caroline Kepnes'),(5,'6.jpg','Darlene Deibler Rose'),(6,'9.jpg','Fred S. Kleiner'),(7,'10.jpg','Gardner R. Dozois'),(8,'15.jpg','Lewis Thomas'),(9,'13.jpg','J. Robin Albertson-W'),(10,'14.jpg','Kate Clifford Larson'),(11,'12.jpg','Isadora Montrose'),(12,'11.jpg','Hal B. Gregersen');
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
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_details`
--

LOCK TABLES `book_details` WRITE;
/*!40000 ALTER TABLE `book_details` DISABLE KEYS */;
INSERT INTO `book_details` VALUES (2,'Print length','336 pages',2),(3,'Language','English',2),(4,'Publisher','Simon & Schuster',2),(5,'Dimensions','7.38 x 1 x 9.13 inches',2),(6,'ISBN-10','9781476744872',2),(7,'Print length','288 pages',3),(8,'Language','English',3),(9,'Publisher','Rand McNally',3),(10,'Dimensions',' Dimensions 11 x 0.5 x 15 inches',3),(11,'ISBN-13','978-0528026348',3),(12,'Print length','78 pages',4),(13,'Language','English',4),(14,'Publisher','Clarkson Potter',4),(15,'Dimensions','4.83 x 1.9 x 6.31 inches',4),(16,'ISBN-10','0593135148',4),(17,'Language','English',5),(18,'Print length','464 pages',5),(19,'Publisher','Abrams',5),(20,'Dimensions','10.55 x 1.6 x 13.45 inches',5),(21,'ISBN-10','1419733338',5),(22,'Print length','352 pages',6),(23,'Language','English',6),(24,'Publisher','Abbeville Press',6),(25,'Dimensions','8.4 x 0.9 x 11.7 inches',6),(26,'ISBN-13','978-0789214263',6),(27,'Print length','200 pages',7),(28,'Language','English',7),(29,'Publisher','Bloomsbury Visual Arts',7),(30,'Dimensions','6.15 x 0.6 x 9.15 inches',7),(31,'ISBN-10','1350035335',7),(32,'Print length','160 pages',8),(33,'Language','English',8),(34,'Publisher','Welbeck Publishing',8),(35,'Dimensions','5.25 x 0.75 x 7.5 inches',8),(36,'ISBN-13','978-1802790115',8),(37,'Listening Length','10 hours and 35 minutes',9),(38,'Narrator','Dave Grohl',9),(39,'Language','English',9),(40,'Publisher','HarperAudio',9),(41,'ASIN','B091WVM1JD',9),(42,'Version','Unabridged',9),(43,'Listening Length','15 hours and 1 minute',10),(44,'Narrator','Phil Thron',10),(45,'Language','English',10),(46,'Publisher','Simon & Schuster Audio',10),(47,'ASIN','B08X9Y1VMY',10),(48,'Program Type','Audiobook',10),(49,'Listening Length','13 hours and 37 minutes',11),(50,'Language','English',11),(51,'Narrator','David',11),(52,'Publisher','Lioncrest Publishing',11),(53,'ASIN','B07KKP62FW',11),(54,'Program Type','Audiobook',11),(55,'Print length','488 pages',12),(56,'Language','English',12),(57,'Publisher','Atlantic Monthly Press',12),(58,'File size','8433 KB',12),(59,'Page Flip','Enabled',12),(60,'Print length','592 pages',13),(61,'Language','English',13),(62,'Publisher','W. W. Norton & Company',13),(63,'File size','43316 KB',13),(64,'Word Wise','Enabled',13),(65,'Print length','304 pages',14),(66,'Print length','416 pages',15),(67,'Language','English',15),(68,'Publisher','National Geographic',15),(69,'Dimensions','7.45 x 1.4 x 9.45 inches',15),(70,'ISBN-10','1426222262',15),(71,'Print length','752 pages',16),(72,'Language','English',16),(73,'Publisher','Doubleday',16),(74,'Dimensions','6.13 x 1.5 x 9.25 inches',16),(75,'ISBN-10','038554653X',16),(76,'Print length','340 pages',17),(77,'Publisher','WildBlue Press',17),(78,'Language','English',17),(79,'File size','3083 KB',17),(80,'Page Flip','Enabled',17),(81,'Print length','304 pages',18),(82,'Language','English',18),(83,'Publisher','Riverhead Books',18),(84,'Dimensions',' Dimensions 5.2 x 0.8 x 8 inches',18),(85,'ISBN-10','0525537392',18),(86,'Print length','368 pages',20),(87,'Print length','320 pages',21),(88,'Language','English',21),(89,'Publisher','Workman Publishing Company',21),(90,'Dimensions','6.26 x 1.54 x 7.56 inches',21),(91,'SBN-10','1523512822',21),(92,'Print length','160 pages',22),(93,'Language','English',22),(94,'Publisher','Workman Publishing Company',22),(95,'Dimensions','6.25 x 3.18 x 6.25 inches',22),(96,'ISBN-13','978-1523516919',22),(97,'Print length','28 pages',23),(98,'Language','English',23),(99,'Publisher','Amber Lotus Publishing',23),(100,'Dimensions','11.8 x 0.3 x 11.8 inches',23),(101,'ISBN-10','1631368001',23),(102,'Language','English',20),(103,'Publisher','Random House US',20),(104,'Dimensions','5.2 x 0.71 x 7.99 inches',20),(105,'ISBN-10','1984854852',20),(106,'Print length','304 pages',24),(107,'Language','English',24),(108,'Publisher','New City Press',24),(109,'Publication date','December 25, 2002',24),(110,'Dimensions','4.25 x 0.75 x 6.75 inches',24),(111,'ISBN-13','978-1565481541',24);
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_images`
--

LOCK TABLES `book_images` WRITE;
/*!40000 ALTER TABLE `book_images` DISABLE KEYS */;
INSERT INTO `book_images` VALUES (4,'51FVNHBBCdL.jpg',2),(5,'A1Qq8Rt8eeL._AC_SX75_CR,0,0,75,75_.jpg',3),(6,'91+WCZxr-LL._AC_SX75_CR,0,0,75,75_.jpg',3),(7,'1.1.jpg',4),(8,'1.2.jpg',4),(9,'1.3.jpg',4),(10,'91OT6Jt78rL.jpg',5),(11,'3.1.jpg',6),(12,'3.2.jpg',6),(13,'51MVJyuvdNL._SX331_BO1,204,203,200_.jpg',7),(14,'816CO4v0-JL._AC_SY75_CR,0,0,75,75_.jpg',8),(15,'81ctRGIgFzL._AC_SY75_CR,0,0,75,75_.jpg',8),(16,'5.jpg',9),(17,'41PJmkwdH5L.jpg',10),(18,'51N2hDuVMrL.jpg',11),(19,'41gdzBNZQxL.jpg',12),(20,'51g4UUqnbcL.jpg',13),(22,'71olQ2H6s9L.jpg',15),(23,'41C+OjN2AmL._SX327_BO1,204,203,200_.jpg',16),(24,'51KDxSuWJLL.jpg',17),(25,'41IA0MIbf+L._SX318_BO1,204,203,200_.jpg',18),(26,'71Ik-NSSAoL.jpg',20),(27,'1.jpg',14),(28,'81MTVP2IBqL.jpg',21),(29,'81C7bPsozCL.jpg',21),(30,'81M21JShUhL.jpg',21),(31,'71i2ZwBH0UL._AC_SX75_CR,0,0,75,75_.jpg',22),(32,'91cE2L3i-YL._AC_SX75_CR,0,0,75,75_.jpg',22),(33,'81haGZ56l8L._AC_SX75_CR,0,0,75,75_.jpg',22),(34,'91Iyp+xLSUL._AC_SX75_CR,0,0,75,75_.jpg',22),(35,'81eN-c1UWwL.jpg',23),(36,'81CiJWl0QNL._AC_SY75_CR,0,0,75,75_.jpg',23),(37,'61iGdfIx9gL.jpg',20),(38,'71p8O18Y3NL.jpg',24),(39,'41kOy4EjPaL.jpg',24),(40,'71he7oyuhIL.jpg',24);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_7sei657lweflrklwrokwbusfh` (`alias`),
  UNIQUE KEY `UK_eh6bfj824qyn40pii29i90bll` (`name`),
  KEY `FKfjixh2vym2cvfj3ufxj91jem7` (`author_id`),
  KEY `FKleqa3hhc0uhfvurq6mil47xk0` (`category_id`),
  FULLTEXT KEY `books_FTS` (`name`,`description`),
  CONSTRAINT `FKfjixh2vym2cvfj3ufxj91jem7` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
  CONSTRAINT `FKleqa3hhc0uhfvurq6mil47xk0` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (2,'Elements-of-Style:-Designing-a-Home-&-a-Life',15,'2022-08-08 17:14:49.182000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">From the rising-star designer and author of the hit blog,&nbsp;</span></div><div><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Elements of Style</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">, a full-color, fully illustrated book packed with honest advice, inspiration, ideas, and lessons learned about designing a home that reflects your personality and style.</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br><br></span><span class=\"a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: italic !important;\">Elements of Style</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">&nbsp;is a uniquely personal and practical decorating guide that shows how designing a home can be an outlet of personal expression and an exercise in self-discovery. Drawing on her ten years of experience in the interior design industry, Erin combines honest design advice and gorgeous professional photographs and illustrations with personal essays about the lessons she has learned while designing her own home and her own life—the first being: none of our homes or lives is perfect. Like a funny best friend, she reveals the disasters she confronted in her own kitchen renovation, her struggles with anorexia, her epic fight with her husband over a Lucite table, and her secrets for starting a successful blog.</span><br></div>',7,_binary '\0','51FVNHBBCdL.jpg','Elements of Style',25.99,_binary '','2022-08-12 14:00:38.163000',1,11),(3,'(Rand-McNally-Large-Scale-Road-Atlas-USA)',7,'2022-08-08 17:29:59.422000','<div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">Give road-weary eyes a break with this spiral-bound Large Scale edition featuring all the accuracy you’ve come to expect from Rand McNally, only bigger.&nbsp;</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">This updated 2023 edition contains maps of every U.S. state, plus expanded coverage of Canada and Mexico,&nbsp;</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">that are 35% larger than the standard atlas version. Includes over 350 detailed city inset and national park maps and a comprehensive, unabridged index.&nbsp;</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">Road construction and conditions contact information for every state are conveniently located on map pages. Contains mileage chart showing distances between 77 North American cities and national parks with driving times map. Tough spiral binding allows the book to lay open easily.&nbsp;</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">A convenient page locator map on the inside cover makes it quick and easy to find the map you need. Tell Rand! As much as we work to keep our atlases up to date, conditions change quickly and new construction projects begin frequently.&nbsp;</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">If you know of something we haven’t captured in our atlas, let us know at randmcnally.com/tellrand. Tourism websites and phone numbers for every U.S. state and Canadian province on map pages.&nbsp;</span><br></div>',10,_binary '','51abQzI1aEL._SX381_BO1,204,203,200_.jpg','Rand McNally 2023 Large Scale Road Atlas',36,_binary '','2022-08-08 17:29:59.422000',3,22),(4,'A-Deck-and-Guidebook-Inspired-by-Deities,-Folklore,-and-Fairy-Tales-from-Around-the-World',12,'2022-08-09 09:17:49.784000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">Take a step forward on your spiritual journey with this gorgeously illustrated celebration of deities, folklore, and fairy tales from all over the world.</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br>&nbsp;<br>• Features rich, vibrant art and a keen understanding of traditional tarot archetypes infused with worldly insight and folkloric spirit.<br>• Illustrator Yoshi Yoshitani brings fables, ancient mythologies, and spiritual legends to life on the Major and Minor Arcana cards, inspired by the cultural traditions of China, Japan, Peru, Norway, Persia, England, Greece, Denmark, the Maori tribe of New Zealand, and more.<br>• The companion guidebook provides insight into how these fables from around the globe support traditional tarot imagery and themes.</span><br></div>',7,_binary '','1.jpg','Tarot of the Divine',45,_binary '','2022-08-09 09:17:49.784000',1,7),(5,'A-Century-of-Style-Hardcover',5,'2022-08-09 09:22:34.854000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">A rich visual history of&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Architectural Digest</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">, published for the magazine’s 100th anniversary&nbsp;</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br><br></span><span class=\"a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: italic !important;\">Architectural Digest at 100</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">&nbsp;celebrates the best from the pages of the international design authority.&nbsp;</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">The editors have delved into the archives and culled years of rich material covering a range of subjects.&nbsp;</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">Ranging freely between present and past, the book features the personal spaces of dozens of private celebrities like Barack and Michelle Obama,</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">&nbsp;David Bowie, Truman Capote, David Hockney, Michael Kors, and Diana Vreeland, and includes the work of top designers and architects like Frank Gehry, David Hicks, India Mahdavi, Peter Marino, John Fowler, Renzo Mongiardino, Oscar Niemeyer, Axel Vervoordt, Frank Lloyd Wright, and Elsie de Wolfe.&nbsp;</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">Also included are stunning images from the magazine’s history by photographers such as Bill Cunningham, Horst P. Horst, Simon Upton, Francois Dischinger, Francois Halard, Julius Shulman, and Oberto Gili.&nbsp;</span><br></div>',15,_binary '','2.jpg','Architectural Digest at 100',24,_binary '','2022-08-09 09:22:34.854000',1,8),(6,'The-Catalog-of-Producers,-Prices,-Models,-and-Specifications-Paperback',5,'2022-08-09 09:27:38.191000','<div><div><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">The essential guide for the collector of mechanical wristwatches, with complete information on over 1,400 models from 130 international brands</span></div><div>With&nbsp;<span class=\"a-text-italic\" style=\"font-style: italic !important;\">Wristwatch Annual</span>, collectors have at hand a wealth of information on the latest offerings from today’s most important watch producers, from Swiss mainstays like Rolex and Patek Philippe to the maverick independent brands springing up across Europe and the U.S. The book is arranged alphabetically by producer, and the movement, functions, case, band, price, and variations of each pictured watch are fully described.</div><div>This year’s edition, like its predecessors, features a variety of additional articles on independent watchmaking, key personalities in the watch world, and the technical aspects of horology. An illustrated glossary and a primer on watch care help acclimate the reader to the world of fine timepieces.</div></div>',12,_binary '','3.jpg','Wristwatch Annual 2022',56,_binary '','2022-08-09 09:27:38.191000',1,4),(7,'The-Ad-Hoc,-the-Illicit,-the-Controversial',5,'2022-08-09 09:32:04.959000','<div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">Craig Martin addresses the transgressive or&nbsp;</span><span class=\"a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: italic !important;\">deviant</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">&nbsp;aspects of design: design that straddles the divide between the licit and illicit, the legal and illegal, in a variety of ways. Martin argues that design is not necessarily for the social good, but that it is immersed in the social realm in all its contradictions and confusions.<br><br>Through a series of case studies he explores a wide range of social practices that employ illicit forms of design thinking, including: early computer hacking and present-day hacker culture in which everyday objects are repurposed and deliberately misused; the cultures of reproduction, counterfeit and pirated versions of classic and luxury designs; and the use of material practices by smugglers to conceal drugs within consumer goods and luggage.</span><br></div>',11,_binary '','51MVJyuvdNL._SX331_BO1,204,203,200_.jpg','Deviant Design',45,_binary '','2022-08-09 09:32:04.959000',3,10),(8,'The-Story-of-the-Iconic-Fashion-House',5,'2022-08-09 09:35:11.707000','<div><span class=\"a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: italic !important;\">Little Book of Hermès</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">&nbsp;tells the story of the evolution of the House of Hermès,</span></div><div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">&nbsp;through beautiful illustrations of the most coveted items and authoritative text by fashion historian&nbsp;</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">Karen Homer</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">.</span><br></div>',12,_binary '','4.jpg','The Little Book of Hermès',35,_binary '','2022-08-09 09:35:11.707000',3,9),(9,'Tales-of-Life-and-Music-',20,'2022-08-09 09:39:02.055000','<div><div><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">Read by Dave Grohl. Features excerpts from five never before heard demos performed by Dave Grohl and an original story exclusive to&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"font-weight: 700 !important; font-style: italic !important;\">The Storyteller</span><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">&nbsp;audiobook.</span></div><div><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">So, I\'ve written a book.</span></div><div>Having entertained the idea for years, and even offered a few questionable opportunities (\"It\'s a piece of cake! Just do four hours of interviews, find someone else to write it, put your face on the cover, and voila!\") I have decided to tell these stories just as I have always done, in my own voice. The joy that I have felt from chronicling these tales is not unlike listening back to a song that I\'ve recorded and can\'t wait to share with the world, or reading a primitive journal entry from a stained notebook, or even hearing my voice bounce between the Kiss posters on my wall as a child.&nbsp;</div></div>',5,_binary '','5.jpg','The Storyteller',45,_binary '','2022-08-09 09:39:02.055000',3,6),(10,'The-Epic-Story-of-the-Making-of-The-Godfather',5,'2022-08-09 09:43:00.273000','<div><div><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">This “wickedly pacey page-turner” (</span><span class=\"a-text-bold a-text-italic\" style=\"font-weight: 700 !important; font-style: italic !important;\">Total Film</span><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">) unfurls the behind-the-scenes story of the making of&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"font-weight: 700 !important; font-style: italic !important;\">The Godfather,&nbsp;</span><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">50 years after the classic film’s original release.</span></div><div>The story of how&nbsp;<span class=\"a-text-italic\" style=\"font-style: italic !important;\">The Godfather&nbsp;</span>was made is as dramatic, operatic, and entertaining as the film itself. Over the years, many versions of various aspects of the movie’s fiery creation have been told - sometimes conflicting, but always compelling. Mark Seal sifts through the evidence, has extensive new conversations with director Francis Ford Coppola and several heretofore silent sources, and complements them with colorful interviews with key players including actors Al Pacino, James Caan, Talia Shire, and others to write “the definitive look at the making of an American classic” (<span class=\"a-text-italic\" style=\"font-style: italic !important;\">Library Journal</span>, starred review).</div></div>',3,_binary '','41PJmkwdH5L.jpg','Leave the Gun, Take the Cannoli',35,_binary '','2022-08-09 09:43:00.273000',3,5),(11,'Master-Your-Mind-and-Defy-the-Odds-',5,'2022-08-09 09:51:28.698000','<div><div>For David Goggins, childhood was a nightmare - poverty, prejudice, and physical abuse colored his days and haunted his nights. But through self-discipline, mental toughness, and hard work, Goggins transformed himself from a depressed, overweight young man with no future into a US Armed Forces icon and one of the world\'s top endurance athletes. The only man in history to complete elite training as a Navy SEAL, Army Ranger, and Air Force Tactical Air Controller, he went on to set records in numerous endurance events, inspiring&nbsp;<span class=\"a-text-italic\" style=\"font-style: italic !important;\">Outside</span>&nbsp;magazine to name him The Fittest (Real) Man in America.&nbsp;</div><div>In&nbsp;<span class=\"a-text-italic\" style=\"font-style: italic !important;\">Can\'t Hurt Me</span>, he shares his astonishing life story and reveals that most of us tap into only 40% of our capabilities. Goggins calls this The 40% Rule, and his story illuminates a path that anyone can follow to push past pain, demolish fear, and reach their full potential.&nbsp;</div></div>',10,_binary '','51N2hDuVMrL.jpg','Can\'t Hurt Me',95,_binary '','2022-08-09 09:51:28.698000',4,13),(12,'The-Story-of-the-World\'s-Longest-Treasure-Hunt',10,'2022-08-09 09:55:12.008000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">An in-depth look into the history of a Canadian island rumored to hold buried treasure and of centuries of failed attempts to claim the riches.</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br><br></span><span class=\"a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: italic !important;\">Updated with new material from the author</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br><br>In 1795, a teenager discovered a mysterious circular depression in the ground on Oak Island, in Nova Scotia, Canada, and ignited rumors of buried treasure. Early excavators uncovered a clay-lined shaft containing layers of soil interspersed with wooden platforms, but when they reached a depth of ninety feet, water poured into the shaft and made further digging impossible.</span><br></div>',5,_binary '','41gdzBNZQxL.jpg','The Curse of Oak Island',59,_binary '','2022-08-09 09:55:12.008000',4,12),(13,'Belle-da-Costa-Greene\'s-Journey-from-Prejudice-to-Privilege',15,'2022-08-09 09:59:09.569000','<div><div><span class=\"a-text-bold\" style=\"font-weight: 700 !important;\">The secret life of the sensational woman behind the Morgan masterpieces, who lit up New York society.</span></div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br></span><div>What would you give up to achieve your dream? When J. P. Morgan hired Belle da Costa Greene in 1905 to organize his rare book and manuscript collection, she had only her personality and a few years of experience to recommend her. Ten years later, she had shaped the famous Pierpont Morgan Library collection and was a proto-celebrity in New York and the art world, renowned for her self-made expertise, her acerbic wit, and her flirtatious relationships. Born to a family of free people of color, Greene changed her name and invented a Portuguese grandmother to enter white society. In her new world, she dined both at the tables of the highest society and with bohemian artists and activists. She also engaged in a decades-long affair with art critic Bernard Berenson. Greene is pure fascination—the buyer of illuminated manuscripts who attracted others to her like moths to a flame.</div></div>',15,_binary '\0','51g4UUqnbcL.jpg','An Illuminated Life',129,_binary '','2022-08-12 13:57:46.638000',4,14),(14,'Stories-from-a-South-African-Childhood',5,'2022-08-09 10:05:51.087000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">“Noah’s childhood stories are told with all the hilarity and intellect that characterizes his comedy, while illuminating a dark and brutal period in South Africa’s history that must never be forgotten.”—</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Esquire</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\"><br>&nbsp;<br></span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">Winner of the Thurber Prize for&nbsp;American Humor&nbsp;and&nbsp;an NAACP Image Award • Named one of the best books of the year by&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">The&nbsp;New York Time, USA Today, San Francisco Chronicle,</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">&nbsp;NPR,&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Esquire, Newsday,</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">&nbsp;and&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Booklist</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br></span></div>',25,_binary '\0','51pJwB1hlPL._SX331_BO1,204,203,200_.jpg','Born a Crime',129,_binary '','2022-08-12 14:34:01.360000',4,14),(15,'One-Woman\'s-Journey-to-Every-Country-in-the-World',10,'2022-08-09 10:09:04.572000','<div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">It was a daunting task, but Jessica Nabongo, the beloved voice behind the popular website&nbsp;</span><span class=\"a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: italic !important;\">The Catch Me if You Can</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">, made it happen, completing her journey to all 195 UN-recognized countries in the world in October 2019. Now, in this one-of-a-kind memoir, she reveals her top 100 destinations from her global adventure.<br>Beautifully illustrated with many of Nabongo\'s own photographs, the book documents her remarkable experiences in each country, including:<br><br></span><ul class=\"a-unordered-list a-vertical\" style=\"margin: 0px 0px 0px 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">A harrowing scooter accident in Nauru, the world’s least visited country,</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Seeing the life and community swarming around the Hazrat Ali Mazar mosque in Afghanistan,</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Horseback riding and learning to lasso with Black cowboys in Oklahoma,</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Playing dominoes with men on the streets of Havana,</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Learning to make traditional takoyaki (octopus balls) from locals in Japan,</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Dog sledding in Norway and swimming with humpback whales in Tonga,</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">A late night adventure with strangers to cross a border in Guinea Bissau,</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">And sunbathing on the sandy shores of Los Roques in Venezuela.</span></li></ul></div>',5,_binary '','51xKiRY4L0L._SX389_BO1,204,203,200_.jpg','The Catch Me If You Can',69,_binary '','2022-08-09 10:09:04.572000',5,19),(16,'Trump-in-the-White-House,-2017-2021',25,'2022-08-09 10:11:48.012000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">The inside story of the four years when Donald Trump went to war with Washington, from the chaotic beginning to the violent finale, told by revered journalists Peter Baker of&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">The New York Times</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">&nbsp;and Susan Glasser of&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">The New Yorker</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">—an ambitious and lasting history of the full Trump presidency that also contains dozens of exclusive scoops and stories from behind the scenes in the White House, from the absurd to the deadly serious.</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br><br>The bestselling authors of&nbsp;</span><span class=\"a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: italic !important;\">The Man Who Ran Washington</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">&nbsp;argue that Trump was not just lurching from one controversy to another; he was learning to be more like the foreign autocrats he admired.</span><br></div>',15,_binary '','41C+OjN2AmL._SX327_BO1,204,203,200_.jpg','The Divider',259,_binary '','2022-08-09 10:11:48.012000',5,16),(17,'Pyromania,-Murder,-and-a-Daughter\'s-Nightmare',15,'2022-08-09 10:15:26.999000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">A daughter’s account of the “Pillowcase Pyro,” hero firefighter turned killer arsonist John Orr. “A red-hot true crime masterpiece.” —Burl Barer, Edgar Award–winning author of&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Betrayal in Blue&nbsp;</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">and&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Murder in the Family</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br>&nbsp;<br>For years, Lori Orr believed her Los Angeles firefighter dad was a selfless hero. When Lori’s dad was arrested and charged with four murders and countless arson fires, it was her testimony that helped keep him from being sent to Death Row. Eventually, Lori’s search for the truth lead her to the dark secrets lurking in her family’s past—and to an inescapable conclusion about the remorseless killer and arsonist known as the “Pillowcase Pyro” and his reign of terror in sunny Southern California.</span><br></div>',25,_binary '','51KDxSuWJLL.jpg','Burned',299,_binary '','2022-08-09 10:15:26.999000',5,18),(18,'A-Memoir-Paperback',5,'2022-08-09 10:18:15.797000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">As seen/heard on&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Fresh Air</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">,&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">The Daily Show with Trevor Noah</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">, NBC</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">&nbsp;Nightly News</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">, MSNBC,&nbsp;</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Weekend Edition</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">,</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">&nbsp;and more</span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\"><br><br>An emergency room physician explores how a life of service to others taught her how to heal herself.</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br><br>Michele Harper is a female, African American emergency room physician in a profession that is overwhelmingly male and white. Brought up in Washington, D.C., in a complicated family, she went to Harvard, where she met her husband. They stayed together through medical school until two months before she was scheduled to join the staff of a hospital in central Philadelphia, when he told her he couldn’t move with her. Her marriage at an end, Harper began her new life in a new city, in a new job, as a newly single woman.</span><br></div>',15,_binary '','41IA0MIbf+L._SX318_BO1,204,203,200_.jpg','The Beauty in Breaking',99,_binary '','2022-08-09 10:18:15.797000',5,15),(20,'Educated',30,'2022-08-09 10:22:21.086000','<div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">Born to survivalists in the mountains of Idaho, Tara Westover was seventeen the first time she set foot in a classroom. Her family was so isolated from mainstream society that there was no one to ensure the children received an education, and no one to intervene when one of Tara’s older brothers became violent. When another brother got himself into college, Tara decided to try a new kind of life. Her quest for knowledge transformed her, taking her over oceans and across continents, to Harvard and to Cambridge University. Only then would she wonder if she’d traveled too far, if there was still a way home.<br>&nbsp;<br></span><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">“Beautiful and propulsive . . . Despite the singularity of [Westover’s] childhood, the questions her book poses are universal: How much of ourselves should we give to those we love? And how much must we betray them to grow up?”—</span><span class=\"a-text-bold a-text-italic\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important; font-style: italic !important;\">Vogue</span><br></div>',15,_binary '','41ErDhOZenL._SX322_BO1,204,203,200_.jpg','Educated',49,_binary '','2022-08-31 21:05:38.068000',6,17),(21,'A-wilderness-escape-every-single-day',25,'2022-08-12 14:39:35.900000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">The gift for the discerning nature lover.</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br>&nbsp;<br>A stunning combination: The exquisite photography and&nbsp;uncompromising production standards of the gallery calendar&nbsp;format married to the most&nbsp; transporting flora, fauna, and other&nbsp;wonders of nature from all around planet Earth. A hippo and her baby&nbsp;peer out from the water at South Africa’s&nbsp;Kruger National Park.&nbsp;Ponderosa pines sprout precariously from deep canyons at New&nbsp;Mexico’s Kasha-Katuwe Tent Rocks National&nbsp;Monument. Punch&nbsp;Bowl Falls pours into the impossibly clear water of the Columbia&nbsp;River Gorge. And a pair of Arctic Terns soar over a field of yellow&nbsp;buttercups. It’s a true gift for nature lovers—a wilderness escape,&nbsp;every day. Printed on FSC-certified paper.&nbsp;</span><br></div>',50,_binary '\0','51ji6ae+9rS._SX482_BO1,204,203,200_.jpg','Audubon Nature Page-A-Day Gallery Calendar 2022',145,_binary '','2022-08-12 14:39:35.900000',8,27),(22,'Audubon-Nature-Page-A-Day-Gallery-Calendar',15,'2022-08-12 14:45:21.620000','<div><span class=\"a-text-bold\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-weight: 700 !important;\">With every glance, escape to the natural world.</span><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><br><br>Combining the stunning, full-color photography and high production standards of the Gallery line with the expertise of the National Audubon Society, Nature showcases the world at its most pristine. Here is day after day of spectacular landscapes, plus all the other wonders we find in the great outdoors. The breathtaking Grand Teton mountain range. A stunning Arctic Fox in Alaska blends into the wintry landscape. A herd of wildebeest thunder under a red East African sky. And pure paradise: The sun rises over the Needles rock monoliths at Oregon’s Cannon Beach. A fabulous gift for nature lovers, this calendar is a reminder of what remains—and what must be preserved.&nbsp;</span><br></div>',35,_binary '','51mxNrqR5cL._SX482_BO1,204,203,200_.jpg','Audubon Nature Page-A-Day Gallery Calendar',99,_binary '','2022-08-12 14:45:21.620000',8,27),(23,'And-Other-Places-of-Power-in-Britain-and-Ireland-',10,'2022-08-12 14:50:05.303000','<div><div>Embark on a magical journey through the Celtic landscape with the Sacred Celtic Sites wall calendar. Celebrating timeless monuments and geographical features steeped in myth and legend, this calendar features the<span class=\"a-text-quote\" style=\"position: relative; display: block; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-style: italic; padding-left: 0.5em;\">thin places</span>— doorways to another realm, divine places of spiritual awakening. Mara Freeman, an expert on Celtic spiritual and sacred traditions, guides you through timeless monuments that are as awe-inspiring today as they must have been millennia ago.</div><ul class=\"a-unordered-list a-vertical\" style=\"margin: 0px 0px 0px 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">12\" x 12\" wall calendar (12\" x 24\" open).</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">A year of lush photographs of ancient Celtic sites on your wall.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">The perfect gift for lovers of Celtic art and mythology.</span></li></ul></div>',65,_binary '\0','61hJ2xkeeCL._SY498_BO1,204,203,200_.jpg','And Other Places of Power in Britain and Ireland ',259,_binary '','2022-08-12 14:50:05.303000',8,27),(24,'Saint-Augustine-(The-Works-of-Saint-Augustine',35,'2022-08-31 21:09:34.513000','<div><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">A masterful, new translation of a perennial classic, now available in pocket size! The Confessions of Saint Augustine is considered the all time number one Christian classic. Augustine undertook his greatest piece of writing with the conviction that God wanted him to make this confession. The Confessions are, in fact, an extended poetic, passionate, intimate prayer. Augustine’s experience of God speaks to us across time with little need of transpositions. This new translation by Maria Boulding masterfully captures his experience. Augustine was probably forty-three when he began this endeavor. He had been a baptized Catholic for ten years, a priest for six, and a bishop for only two. His pre-baptismal life raised questions in the community. Was his conversion genuine? The first hearers were captivated, as many millions have been over the following sixteen centuries.</span><br></div>',25,_binary '','51hvDT0CbsL._SX313_BO1,204,203,200_.jpg','The Confessions, Revised',299,_binary '','2022-08-31 21:09:34.513000',8,25);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (1,1,18,1),(8,3,22,7),(9,3,10,7),(10,2,5,7),(11,2,24,7),(32,5,6,12);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Arts & Photography','51sTUoojuaL._SX322_BO1,204,203,200_.jpg','Arts & Photography',_binary '',NULL,NULL),(2,'Biographies & Memoirs','81ghFDPPUxL._AC_UL127_SR127,127_.jpg','Biographies & Memoirs',_binary '',NULL,NULL),(3,'Business & Money','61Ars9rdgGS._AC_UL127_SR127,127_.jpg','Business & Money',_binary '',NULL,NULL),(4,'Drawing','61INQyYUJJL._AC._SR240,240.jpg','Drawing',_binary '',1,'-1-'),(5,'Photography & Video','311C7Xb-2FL._AC._SR240,240.jpg','Photography & Video',_binary '',1,'-1-'),(6,'Music','41SitFz-XsL._SY344_BO1,204,203,200_QL70_ML2_.jpg','Music',_binary '',1,'-1-'),(7,'Graphic Design','41f9x-pnVQL._AC._SR240,240.jpg','Graphic Design',_binary '',1,'-1-'),(8,'Decorative Arts & Design','41phrPC9v9L._AC._SR240,240.jpg','Decorative Arts & Design',_binary '',1,'-1-'),(9,'Performing Arts','51pJwB1hlPL._AC._SR240,240.jpg','Performing Arts',_binary '',1,'-1-'),(10,'History & Criticism','41mTUCODSOL._AC._SR240,240.jpg','History & Criticism',_binary '',1,'-1-'),(11,'Architecture','51k-iIhugSL._SX331_BO1,204,203,200_.jpg','Architecture',_binary '',1,'-1-'),(12,'Historical','41KY-NORo9L._AC._SR240,240.jpg','Historical',_binary '',2,'-2-'),(13,'Memoirs','41wfLB9cycL._AC._SR240,240 (1).jpg','Memoirs',_binary '',2,'-2-'),(14,'Arts & Literature','31sIl2nBSbS._AC._SR240,240.jpg','Arts & Literature',_binary '',2,'-2-'),(15,'Professionals & Academics','411Rri9i9vL._AC._SR240,240.jpg','Professionals & Academics',_binary '',2,'-2-'),(16,'Leaders & Notable People','51yoHjJDQ3L._AC._SR240,240.jpg','Leaders & Notable People',_binary '',2,'-2-'),(17,'Community & Culture','51WRCQlWvuL._AC._SR240,240.jpg','Community & Culture',_binary '',2,'-2-'),(18,'True Crime','41NGxKy-N1L._AC._SR240,240.jpg','True Crime',_binary '',2,'-2-'),(19,'Travelers & Explorers','51xKiRY4L0L._AC._SR240,240.jpg','Travelers & Explorers',_binary '',2,'-2-'),(20,'Computers & Technology','41dpdctWNhL.jpg','Computers & Technology',_binary '',NULL,NULL),(21,'Education & Teaching','51do7OKo3iL.jpg','Education & Teaching',_binary '',NULL,NULL),(22,'Travel','61vTN7miRpL._AC._SR360,460.jpg','Travel',_binary '',NULL,NULL),(23,'Sports & Outdoors','811A3zgJGML._AC._SR360,460.jpg','Sports & Outdoors',_binary '',NULL,NULL),(24,'Science Fiction & Fantasy','41NsJqa5o1L.jpg','Science Fiction & Fantasy',_binary '',NULL,NULL),(25,'Crafts, Hobbies & Home','91M5h3r6NaL._AC._SR360,460.jpg','Crafts, Hobbies & Home',_binary '',NULL,NULL),(26,'Health, Fitness & Dieting','81WzAUh1QcL._AC._SR360,460.jpg','Health, Fitness & Dieting',_binary '',NULL,NULL),(27,'Calendars','81BHjeJ+42L._AC._SR360,460.jpg','Calendars',_binary '',NULL,NULL),(28,'Humor & Entertainment','91ks0ej5NnL._AC._SR360,460.jpg','Humor & Entertainment',_binary '',NULL,NULL);
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
  `code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Afghanistan','AFG'),(2,'Argentina','ARG'),(3,'Australia','AUS'),(4,'Brazil','BRA'),(5,'Canada','CAN'),(6,'China','CHN'),(7,'Dominican Republic','DOM'),(8,'East Timor','TMP'),(9,'France','FRA'),(10,'Germany','DEU'),(11,'Hong Kong, China','HKG'),(12,'Hungary','HUN'),(13,'Iceland','ISL'),(14,'India','IND'),(15,'Indonesia','IDN'),(16,'Iran, Islamic Rep','IRN'),(17,'Iraq','IRQ'),(18,'Ireland','IRL'),(19,'Italy','ITA'),(20,'Japan','JPN'),(21,'Korea, Rep','KOR'),(23,'Vietnam','VNM'),(25,'United States','USA'),(26,'Singapore','SGP');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'5 Washington St #1','5 Washington St #1','Ho Chi Minh','Thaddeus','Ankeny','098-777-4191','121212','Washington','DATABASE','2020-10-09 03:18:58.000000','triquang.04qt@gmail.com','$2a$10$/usRREkW3ypuTi8OQHMpMeFKkgqM18ArhCk/WejfLM2sPiYR/aOSq',NULL,_binary '',NULL,25),(4,'63 E Aurora Dr','8 W Cerritos Ave #54','Bridgeport','Motley','Chauncey','407-557-8857','346772','Prince Georges','DATABASE','2020-10-09 03:18:58.000000','chauncey_motley@aol.com','$2a$10$UDY0lXzGpSc6ZcOWL1WeWuG08.28Gg271bSzbfm/GQm/mO2zmKVzm',NULL,_binary '',NULL,21),(5,'2 Sw Nyberg Rd','2 Sw Nyberg Rd','Queensland','Kampa','Raylene','574-330-1884','121212','Daytona Beach','DATABASE','2020-10-09 03:18:58.000000','rkampa@kampa.org','$2a$10$6wzlm/njpbea3gLTeCeFQe1Lkz1QXfDcJTl3gDLhlJehyH8wEpa1C',NULL,_binary '',NULL,5),(7,'8 W Cerritos Ave #54','Ho Chi Minh','Queensland','Biddy','Jani','123-345-3434','121212','Alliance','DATABASE','2020-10-09 03:18:58.000000','jbiddy@yahoo.com','$2a$10$r/qrdq1eqzhaNhZ0mUNcGuPfMeRR0F113O3sGGTkrUIv8vPsVKx82',NULL,_binary '',NULL,7),(8,'8 W Cerritos Ave #54','8 W Cerritos Ave #54','Bridgeport','Bookamer','Flo','123-234-4546','121212','Florida','DATABASE','2020-10-09 03:18:58.000000','flo.bookamer@cox.net','$2a$10$xINxNL4mJuZq6knKLmRRQOG2hwXwzKzx7wSM7gSRuqPOP1j./UeJ.',NULL,_binary '',NULL,10),(9,'8 W Cerritos Ave #54','8 W Cerritos Ave #54','Bridgeport','Jovita','Oles','123-234-4546','121212','Florida','DATABASE','2020-10-09 03:18:58.000000','joles@gmail.com','$2a$10$V.QY.zOtxklbbV7ybJql9ueddfxk5hgmHd9ZjU6ZQkjvhc1S.4WxO',NULL,_binary '',NULL,2),(10,'Ha Noi','Ho Chi Minh','Ho Chi Minh','Quang','Trí','123-356-4632','1254125','Ho Chi Minh City','GOOGLE','2022-08-12 15:37:37.102000','triquang.95qt@gmail.com','',NULL,_binary '',NULL,23),(11,'8 W Cerritos Ave #54','8 W Cerritos Ave #54','Bridgeport','Cris','Ronadol','535-754-3678','346772','New South Wales','DATABASE','2022-08-12 15:53:19.210000','Murad.89@gmail.com','$2a$10$V.QY.zOtxklbbV7ybJql9ueddfxk5hgmHd9ZjU6ZQkjvhc1S.4WxO',NULL,_binary '',NULL,9),(12,'8 W Cerritos Ave #54','1 State Route 27','Bridgeport','Quang','Tri','234-123-1212','346772','Florida','GOOGLE','2022-08-31 08:07:52.020000','onlinebook.amazon.com@gmail.com','',NULL,_binary '',NULL,1),(13,'',NULL,'Bridgeport','Trí','Quang','234-123-1212','346772','New South Wales','FACEBOOK','2022-08-31 14:06:24.717000','triquang.74qt@gmail.com','','5EZsq040TMLhVirmhmF2yS4FKfB8C9',_binary '',NULL,9);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
INSERT INTO `settings` VALUES ('CURRENCY_ID','4','CURRENCY'),('CURRENCY_SYMBOL','€','CURRENCY'),('CURRENCY_SYMBOL_POSITION','Before price','CURRENCY'),('CUSTOMER_VERIFY_CONTENT','<b>&nbsp; &nbsp; &nbsp; Dear [[name]],</b><div><i><b><br></b></i></div><div><i><b>&nbsp;Click the link below to verify your registration:</b></i></div><div><i><b><br></b></i></div>\r\n\r\n\r\n&nbsp; <a href=\"[[URL]]\" target=\"_self\">VERIFY</a><a href=\"[[URL]]\" target=\"_self\"></a><h3></h3><div><br></div><a href=\"[[URL]]\" target=\"_self\"></a><div><b>&nbsp;Best Regard,</b></div><div><b>&nbsp;The Amazon Team.</b></div>','MAIL_TEMPLATES'),('CUSTOMER_VERIFY_SUBJECT','Please verify your registration to continue Amazon Book','MAIL_TEMPLATES'),('DECIMAL_DIGITS','2','CURRENCY'),('DECIMAL_POINT_TYPE','COMMA','CURRENCY'),('MAIL_FROM','triquang.95qt@gmail.com','MAIL_SERVER'),('MAIL_HOST','smtp.gmail.com','MAIL_SERVER'),('MAIL_PASSWORD','gcawfqbilchqzdpg','MAIL_SERVER'),('MAIL_PORT','587','MAIL_SERVER'),('MAIL_SENDER_NAME','The Amazon Team','MAIL_SERVER'),('MAIL_USERNAME','triquang.95qt@gmail.com','MAIL_SERVER'),('SITE_LOGO','/site-logo/amazon.png','GENERAL'),('SITE_NAME','Amazon.com','GENERAL'),('SMTP_AUTH','true','MAIL_SERVER'),('SMTP_SECURED','true','MAIL_SERVER'),('THOUSANDS_POINT_TYPE','POINT','CURRENCY');
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
  `cod_supported` bit(1) DEFAULT NULL,
  `days` int NOT NULL,
  `rate` float NOT NULL,
  `state` varchar(45) NOT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKef7sfgeybt3xn13nlt2j6sljw` (`country_id`),
  CONSTRAINT `FKef7sfgeybt3xn13nlt2j6sljw` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_rates`
--

LOCK TABLES `shipping_rates` WRITE;
/*!40000 ALTER TABLE `shipping_rates` DISABLE KEYS */;
INSERT INTO `shipping_rates` VALUES (1,_binary '',3,5,'Ho Chi Minh',23),(2,_binary '',4,8,'Ha Noi',23),(3,_binary '',4,9,'Da Nang',23),(4,_binary '',10,8,'Alberta',5),(5,_binary '',15,6,'Nova Scotia',5),(6,_binary '',12,7,'New Brunswick',5),(7,_binary '',9,12,'Andorra',9),(9,_binary '',6,9,'Kansai',20),(10,_binary '',7,10,'Hokkaidō ',20),(11,_binary '\0',8,8,'Washington',25),(12,_binary '',8,12,' West Virginia',25),(13,_binary '',8,13,'Wyoming',25),(14,_binary '',6,7,'South Carolina',25),(15,_binary '',3,4,'Hue',23),(16,_binary '',5,9,'Bac Ninh',23),(17,_binary '',2,7,'Dong Nai',23);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'quangtri.nguyen@dxc.com','Quang','Tri','$2a$10$0aY90d7DVwRgOD4itIxvie3/19WJQS7t6PoloXbJu5C9fm.keU2Yu','289014159_1126424917918145_1692834393169026245_n.jpg',_binary ''),(2,'josephine_darakjy@darakjy.org','Josephine','Darakjy','$2a$10$me7sCy.mQo8wETU63jTBp.GYL4szu5dCXf5txPtzGYKHRk8PWfg7q','ronaldo_0.jpg',_binary ''),(3,'art@venere.org','Art','Venere','$2a$10$VGRzfPXGouyweaS.fsDrWupx2mxAPcLbiI5wUJP.99y0YsXpuAGDm','Messi-800x480.jpg',_binary ''),(4,'lpaprocki@hotmail.com','Paprocki','Feltz Printing Service','$2a$10$B.H7nPBRlkcw4aZdXbURsOBISJzgizTDsPzeNddkmDdD144TgtuKO','bo.jpg',_binary ''),(5,'donette.foller@cox.net','Foller','Printing Dimensions','$2a$10$wn0pC9WMDG1rL/xeccajhOagRLvsu7ohGqZgP5QRpTELsX4bnfsDK','skysports-neymar-paris-saint-germain_4456493_yggp.jpg',_binary ''),(6,'simona@morasca.com','Morasca','Chapman, Ross E Esq','$2a$10$Ca.49abWWwaSHE4Y2J0P5uRsOC56HwauzwibrZB93AvHtmW0MpH1G','champions-league-psg-neymar-2_ccyv.jpg',_binary ''),(7,'sage_wieser@cox.net','Wieser','Truhlar And Truhlar Attys','$2a$10$AZ6Mur9GwQnnDGunxAbuZeO80pkz9lH5qTuKup38sZVOBQfUJ6.Gi','tong-thong-My-Donald-Trump-featured-image-elle-man-1.png',_binary ''),(8,'calbares@gmail.com','Rousseaux','Michael Esq','$2a$10$zw/Jla2nBcy7QeS9kKtF3ecuEouOCr.p8nAU1X8J4UOEdf1h5NMe6','pBpivAl.jpg',_binary '');
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
INSERT INTO `users_roles` VALUES (1,1),(2,2),(7,2),(3,3),(6,3),(7,3),(8,3),(4,4),(6,4),(8,4),(5,5),(8,5);
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

-- Dump completed on 2022-09-03 20:12:28
