CREATE DATABASE  IF NOT EXISTS `pixabeam` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pixabeam`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: pixabeam
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` text,
  `date` datetime NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Data & Donuts','Morning data talk with snacks','2025-09-03 10:00:00','Pune',1,'2025-08-30 14:04:28'),(2,'Supabase Workshop','Hands-on Supabase basics','2025-09-07 15:00:00','Mumbai',2,'2025-08-30 14:04:28'),(3,'Evening Run','Group run in the park','2025-09-02 07:00:00','Bengaluru',3,'2025-08-30 14:04:28'),(4,'Movie Night','Indie movies + pizza','2025-09-10 19:00:00','Delhi',4,'2025-08-30 14:04:28'),(5,'Hackathon Meetup','Form teams & discuss ideas','2025-09-05 11:00:00','Chennai',5,'2025-08-30 14:04:28');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rsvps`
--

DROP TABLE IF EXISTS `rsvps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rsvps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `event_id` int NOT NULL,
  `status` enum('Yes','No','Maybe') NOT NULL DEFAULT 'Maybe',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_rsvp` (`user_id`,`event_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `rsvps_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rsvps_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rsvps`
--

LOCK TABLES `rsvps` WRITE;
/*!40000 ALTER TABLE `rsvps` DISABLE KEYS */;
INSERT INTO `rsvps` VALUES (1,1,1,'Yes','2025-08-30 14:04:32'),(2,2,1,'Maybe','2025-08-30 14:04:32'),(3,3,1,'Yes','2025-08-30 14:04:32'),(4,4,1,'No','2025-08-30 14:04:32'),(5,6,2,'Yes','2025-08-30 14:04:32'),(6,7,2,'Yes','2025-08-30 14:04:32'),(7,8,2,'Maybe','2025-08-30 14:04:32'),(8,9,2,'Yes','2025-08-30 14:04:32'),(9,10,3,'Yes','2025-08-30 14:04:32'),(10,2,3,'No','2025-08-30 14:04:32'),(11,9,3,'Maybe','2025-08-30 14:04:32'),(12,1,3,'Yes','2025-08-30 14:04:32'),(13,3,4,'Yes','2025-08-30 14:04:32'),(14,6,4,'Maybe','2025-08-30 14:04:32'),(15,7,4,'No','2025-08-30 14:04:32'),(16,4,4,'Yes','2025-08-30 14:04:32'),(17,10,5,'Yes','2025-08-30 14:04:32'),(18,8,5,'Maybe','2025-08-30 14:04:32'),(19,5,5,'Yes','2025-08-30 14:04:32'),(20,2,5,'Yes','2025-08-30 14:04:32');
/*!40000 ALTER TABLE `rsvps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Alice Kumar','alice.kumar@example.com','2025-08-30 14:04:22'),(2,'Bhavik Patel','bhavik.patel@example.com','2025-08-30 14:04:22'),(3,'Chitra Rao','chitra.rao@example.com','2025-08-30 14:04:22'),(4,'Dev Sharma','dev.sharma@example.com','2025-08-30 14:04:22'),(5,'Esha Menon','esha.menon@example.com','2025-08-30 14:04:22'),(6,'Farhan Khan','farhan.khan@example.com','2025-08-30 14:04:22'),(7,'Gayatri Singh','gayatri.singh@example.com','2025-08-30 14:04:22'),(8,'Harsh Verma','harsh.verma@example.com','2025-08-30 14:04:22'),(9,'Isha Gupta','isha.gupta@example.com','2025-08-30 14:04:22'),(10,'Jatin Agarwal','jatin.agarwal@example.com','2025-08-30 14:04:22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-30 19:44:57
