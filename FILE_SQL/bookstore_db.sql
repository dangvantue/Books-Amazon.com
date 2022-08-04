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
INSERT INTO `categories` VALUES (1,'Arts & Photography','61MLln5mCbL._AC_UL127_SR127,127_.jpg','Arts & Photography',_binary '',NULL),(2,'Biographies & Memoirs','81ghFDPPUxL._AC_UL127_SR127,127_.jpg','Biographies & Memoirs',_binary '',NULL),(3,'Business & Money','61Ars9rdgGS._AC_UL127_SR127,127_.jpg','Business & Money',_binary '',NULL),(4,'Drawing','61INQyYUJJL._AC._SR240,240.jpg','Drawing',_binary '',1),(5,'Photography & Video','311C7Xb-2FL._AC._SR240,240.jpg','Photography & Video',_binary '',1),(6,'Music','41wfLB9cycL._AC._SR240,240.jpg','Music',_binary '',1),(7,'Graphic Design','41f9x-pnVQL._AC._SR240,240.jpg','Graphic Design',_binary '',1),(8,'Decorative Arts & Design','41phrPC9v9L._AC._SR240,240.jpg','Decorative Arts & Design',_binary '',1),(9,'Performing Arts','51pJwB1hlPL._AC._SR240,240.jpg','Performing Arts',_binary '',1),(10,'History & Criticism','41mTUCODSOL._AC._SR240,240.jpg','History & Criticism',_binary '',1),(11,'Architecture','41RrX77809L._AC._SR240,240.jpg','Architecture',_binary '',1),(12,'Historical','41KY-NORo9L._AC._SR240,240.jpg','Historical',_binary '',2),(13,'Memoirs','41wfLB9cycL._AC._SR240,240 (1).jpg','Memoirs',_binary '',2),(14,'Arts & Literature','31sIl2nBSbS._AC._SR240,240.jpg','Arts & Literature',_binary '',2),(15,'Professionals & Academics','411Rri9i9vL._AC._SR240,240.jpg','Professionals & Academics',_binary '',2),(16,'Leaders & Notable People','51yoHjJDQ3L._AC._SR240,240.jpg','Leaders & Notable People',_binary '',2),(17,'Community & Culture','51WRCQlWvuL._AC._SR240,240.jpg','Community & Culture',_binary '',2),(18,'True Crime','41NGxKy-N1L._AC._SR240,240.jpg','True Crime',_binary '',2),(19,'Travelers & Explorers','51xKiRY4L0L._AC._SR240,240.jpg','Travelers & Explorers',_binary '',2),(20,'Computers & Technology','41dpdctWNhL.jpg','Computers & Technology',_binary '',NULL),(21,'Education & Teaching','51do7OKo3iL.jpg','Education & Teaching',_binary '',NULL),(22,'Travel','61vTN7miRpL._AC._SR360,460.jpg','Travel',_binary '',NULL),(23,'Sports & Outdoors','811A3zgJGML._AC._SR360,460.jpg','Sports & Outdoors',_binary '',NULL),(24,'Science Fiction & Fantasy','41NsJqa5o1L.jpg','Science Fiction & Fantasy',_binary '',NULL),(25,'Crafts, Hobbies & Home','91M5h3r6NaL._AC._SR360,460.jpg','Crafts, Hobbies & Home',_binary '',NULL),(26,'Health, Fitness & Dieting','81WzAUh1QcL._AC._SR360,460.jpg','Health, Fitness & Dieting',_binary '',NULL),(27,'Calendars','81BHjeJ+42L._AC._SR360,460.jpg','Calendars',_binary '',NULL),(28,'Humor & Entertainment','91ks0ej5NnL._AC._SR360,460.jpg','Humor & Entertainment',_binary '',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
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

-- Dump completed on 2022-08-04 11:37:38
