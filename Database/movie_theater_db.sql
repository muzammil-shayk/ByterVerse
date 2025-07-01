-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (arm64)
--
-- Host: localhost    Database: MovieTheaterDB
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Booking` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `ShowtimeID` int DEFAULT NULL,
  `SeatID` int DEFAULT NULL,
  `BookingDate` date DEFAULT NULL,
  `Status` enum('Confirmed','Pending','Cancelled') DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `booking_ibfk_1` (`CustomerID`),
  KEY `booking_ibfk_3` (`SeatID`),
  KEY `booking_ibfk_2` (`ShowtimeID`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`ShowtimeID`) REFERENCES `Showtime` (`ShowtimeID`),
  CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`SeatID`) REFERENCES `Seat` (`SeatID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
INSERT INTO `Booking` VALUES (1,14,103,13,'2025-06-30','Confirmed'),(2,15,125,49,'2025-06-30','Confirmed'),(3,16,217,8,'2025-06-30','Confirmed');
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Zaim','Khan','61G','9232123123','zaim.khan@gmail.com'),(2,'Talib','Ibrahim','51PGECHS','923297577','talib.ibrahim@gmail.com'),(3,'Sadeed','Ahmad','41IqbalTown','923142471','sadeed.ahmad@gmail.com'),(4,'Ali','Khan','Model Town, Lahore','03001234567','ali.khan@example.com'),(5,'Ahmad','Saqib','Gulberg, Lahore','03111234567','ahmad.saqib@example.com'),(6,'Rumaisa','Maalik','DHA Phase 5, Lahore','03211234567','rumaisa.maalik@example.com'),(7,'Amna','Miraj','Johar Town, Lahore','03331234567','amna.miraj@example.com'),(8,'Javed','Ali','Wapda Town, Lahore','03441234567','javed.ali@example.com'),(9,'Masroor','Ahmad','Bahria Town, Lahore','03051234567','masroor.ahmad@example.com'),(10,'Haseeb','Saif','Askari 10, Lahore','03561234567','haseeb.saif@example.com'),(11,'Muhammad','Muzammil','Askari 10, Lahore','03136006677','muhammad.muzz47@gmail.com'),(12,'Muhammad','Muzammil','Askari 10, Lahore','03136006677','muhammad.muzz47@gmail.com'),(13,'Muhammad','Muzammil','House :479A, Main Boulevard, Airline Society','03136006677','muhammad.muzz47@gmail.com'),(14,'Muhammad','Muzammil','House :479A, Main Boulevard, Airline Society','03136006677','muhammad.muzz47@gmail.com'),(15,'Muhammad','Muzammil','House :479A, Main Boulevard, Airline Society','03136006677','muhammad.muzz47@gmail.com'),(16,'Muhammad','Muzammil','House :479A, Main Boulevard, Airline Society','03136006677','muhammad.muzz47@gmail.com');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie`
--

DROP TABLE IF EXISTS `Movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movie` (
  `MovieID` int NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Genre` varchar(50) DEFAULT NULL,
  `Duration` int DEFAULT NULL,
  `Language` varchar(50) DEFAULT NULL,
  `Rating` varchar(10) DEFAULT NULL,
  `ReleaseDate` date DEFAULT NULL,
  `PosterPath` varchar(255) DEFAULT NULL,
  `TicketPrice` decimal(6,2) DEFAULT NULL,
  `IsTrending` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`MovieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie`
--

LOCK TABLES `Movie` WRITE;
/*!40000 ALTER TABLE `Movie` DISABLE KEYS */;
INSERT INTO `Movie` VALUES (1,'Oppenheimer','Action',180,'English','8.7','2023-07-21','https://res.cloudinary.com/dgmsptsr9/image/upload/v1749212091/MV5BN2JkMDc5MGQtZjg3YS00NmFiLWIyZmQtZTJmNTM5MjVmYTQ4XkEyXkFqcGc_._V1__fsq64e.jpg',1500.00,1),(2,'Inception','Sci-Fi',148,'English','PG-13','2010-07-16','https://res.cloudinary.com/dgmsptsr9/image/upload/v1749212089/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw_._V1__qsv5wj.jpg',1300.00,1),(3,'Interstellar','Sci-Fi',169,'English','PG-13','2014-11-07','https://res.cloudinary.com/dgmsptsr9/image/upload/v1749212099/MV5BYzdjMDAxZGItMjI2My00ODA1LTlkNzItOWFjMDU5ZDJlYWY3XkEyXkFqcGc_._V1__jgvyg9.jpg',1300.00,1),(4,'The Dark Knight','Action',152,'English','PG-13','2008-07-18','https://res.cloudinary.com/dgmsptsr9/image/upload/v1749212089/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw_._V1_FMjpg_UX1000__oxbcwe.jpg',1200.00,1),(5,'Dangal','Drama',161,'Hindi','PG','2016-12-23','https://res.cloudinary.com/dgmsptsr9/image/upload/v1749212089/dangal_r8uk3g.jpg',1100.00,0),(6,'Parasite','Thriller',132,'Korean','R','2019-05-30','https://res.cloudinary.com/dgmsptsr9/image/upload/v1749212092/parasite_mhk7uk.jpg',1150.00,0),(7,'Joker','Drama',122,'English','R','2019-10-04','https://res.cloudinary.com/dgmsptsr9/image/upload/v1749212088/Joker_lwvhqw.jpg',1200.00,1),(8,'3 Idiots','Comedy',170,'Hindi','PG','2009-12-25','https://res.cloudinary.com/dgmsptsr9/image/upload/v1749212082/3idiots_jluaoi.jpg',1000.00,0),(9,'Spider-Man: No Way Home','Action',148,'English','PG-13','2021-12-17','https://res.cloudinary.com/dgmsptsr9/image/upload/v1749212091/spidermannwh_uwh7or.jpg',1400.00,0),(10,'The Matrix','Sci-Fi',136,'English','R','1999-03-31','https://res.cloudinary.com/dgmsptsr9/image/upload/v1749212088/matrix_zecupc.jpg',1100.00,1),(11,'Barbie','Fantasy',114,'English','PG-13','2023-07-21','https://res.cloudinary.com/dgmsptsr9/image/upload/v1749212087/barbie_h0b1e1.jpg',1300.00,0),(12,'Sinners','Horror',180,'English','R','2025-05-25','https://res.cloudinary.com/dgmsptsr9/image/upload/v1749212091/sinners_jyym70.jpg',1250.00,0),(13,'The Shawshank Redemption','Drama',142,'English','R','1994-09-23','https://res.cloudinary.com/dgmsptsr9/image/upload/v1749216038/shawshank_ibyxdu.jpg',1100.00,1),(14,'The Godfather','Crime',175,'English','R','1972-03-24','https://res.cloudinary.com/dgmsptsr9/image/upload/v1749216038/godfather_keask1.jpg',1150.00,0),(15,'Pulp Fiction','Crime',154,'English','R','1994-10-14','https://res.cloudinary.com/dgmsptsr9/image/upload/v1749216038/pulp_ua2rch.jpg',1100.00,0),(16,'Fight Club','Drama',139,'English','R','1999-10-15','https://res.cloudinary.com/dgmsptsr9/image/upload/v1749216038/fightclub_dtqp6s.jpg',1050.00,0),(17,'Forrest Gump','Drama',142,'English','PG-13','1994-07-06','https://res.cloudinary.com/dgmsptsr9/image/upload/v1749216038/forrestgump_uv30mp.jpg',1000.00,0),(18,'F1','Sports Drama',130,'English','PG-13',NULL,'https://res.cloudinary.com/dgmsptsr9/image/upload/v1751305207/f1_y3adb2.jpg',NULL,1);
/*!40000 ALTER TABLE `Movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `BookingID` int DEFAULT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `Amount` decimal(8,2) DEFAULT NULL,
  `Status` enum('Paid','Pending') DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `payment_ibfk_1` (`BookingID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `Booking` (`BookingID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (1,2,'Card','2025-06-30',800.00,NULL),(2,3,'Card','2025-06-30',800.00,NULL);
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seat`
--

DROP TABLE IF EXISTS `Seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Seat` (
  `SeatID` int NOT NULL AUTO_INCREMENT,
  `TheaterID` int DEFAULT NULL,
  `SeatNumber` varchar(10) DEFAULT NULL,
  `RowLabel` varchar(10) DEFAULT NULL,
  `AvailabilityStatus` enum('Booked','Available') DEFAULT NULL,
  PRIMARY KEY (`SeatID`),
  KEY `TheaterID` (`TheaterID`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`TheaterID`) REFERENCES `Theater` (`TheaterID`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seat`
--

LOCK TABLES `Seat` WRITE;
/*!40000 ALTER TABLE `Seat` DISABLE KEYS */;
INSERT INTO `Seat` VALUES (1,1,'A1','A','Available'),(2,1,'A2','A','Available'),(3,1,'A3','A','Available'),(4,1,'A4','A','Available'),(5,1,'A5','A','Available'),(6,1,'B1','B','Available'),(7,1,'B2','B','Available'),(8,1,'B3','B','Booked'),(9,1,'B4','B','Available'),(10,1,'B5','B','Available'),(11,1,'C1','C','Available'),(12,1,'C2','C','Available'),(13,1,'C3','C','Booked'),(14,1,'C4','C','Available'),(15,1,'C5','C','Available'),(16,1,'D1','D','Available'),(17,1,'D2','D','Available'),(18,1,'D3','D','Available'),(19,1,'D4','D','Available'),(20,1,'D5','D','Available'),(21,2,'A1','A','Available'),(22,2,'A2','A','Available'),(23,2,'A3','A','Available'),(24,2,'A4','A','Available'),(25,2,'A5','A','Available'),(26,2,'B1','B','Available'),(27,2,'B2','B','Available'),(28,2,'B3','B','Available'),(29,2,'B4','B','Available'),(30,2,'B5','B','Available'),(31,2,'C1','C','Available'),(32,2,'C2','C','Available'),(33,2,'C3','C','Available'),(34,2,'C4','C','Available'),(35,2,'C5','C','Available'),(36,2,'D1','D','Available'),(37,2,'D2','D','Available'),(38,2,'D3','D','Available'),(39,2,'D4','D','Available'),(40,2,'D5','D','Available'),(41,3,'A1','A','Available'),(42,3,'A2','A','Available'),(43,3,'A3','A','Available'),(44,3,'A4','A','Available'),(45,3,'A5','A','Available'),(46,3,'B1','B','Available'),(47,3,'B2','B','Available'),(48,3,'B3','B','Available'),(49,3,'B4','B','Booked'),(50,3,'B5','B','Available'),(51,3,'C1','C','Available'),(52,3,'C2','C','Available'),(53,3,'C3','C','Available'),(54,3,'C4','C','Available'),(55,3,'C5','C','Available'),(56,3,'D1','D','Available'),(57,3,'D2','D','Available'),(58,3,'D3','D','Available'),(59,3,'D4','D','Available'),(60,3,'D5','D','Available'),(61,4,'A1','A','Available'),(62,4,'A2','A','Available'),(63,4,'A3','A','Available'),(64,4,'A4','A','Available'),(65,4,'A5','A','Available'),(66,4,'B1','B','Available'),(67,4,'B2','B','Available'),(68,4,'B3','B','Available'),(69,4,'B4','B','Available'),(70,4,'B5','B','Available'),(71,4,'C1','C','Available'),(72,4,'C2','C','Available'),(73,4,'C3','C','Available'),(74,4,'C4','C','Available'),(75,4,'C5','C','Available'),(76,4,'D1','D','Available'),(77,4,'D2','D','Available'),(78,4,'D3','D','Available'),(79,4,'D4','D','Available'),(80,4,'D5','D','Available'),(81,5,'A1','A','Available'),(82,5,'A2','A','Available'),(83,5,'A3','A','Available'),(84,5,'A4','A','Available'),(85,5,'A5','A','Available'),(86,5,'B1','B','Available'),(87,5,'B2','B','Available'),(88,5,'B3','B','Available'),(89,5,'B4','B','Available'),(90,5,'B5','B','Available'),(91,5,'C1','C','Available'),(92,5,'C2','C','Available'),(93,5,'C3','C','Available'),(94,5,'C4','C','Available'),(95,5,'C5','C','Available'),(96,5,'D1','D','Available'),(97,5,'D2','D','Available'),(98,5,'D3','D','Available'),(99,5,'D4','D','Available'),(100,5,'D5','D','Available'),(101,6,'A1','A','Available'),(102,6,'A2','A','Available'),(103,6,'A3','A','Available'),(104,6,'A4','A','Available'),(105,6,'A5','A','Available'),(106,6,'B1','B','Available'),(107,6,'B2','B','Available'),(108,6,'B3','B','Available'),(109,6,'B4','B','Available'),(110,6,'B5','B','Available'),(111,6,'C1','C','Available'),(112,6,'C2','C','Available'),(113,6,'C3','C','Available'),(114,6,'C4','C','Available'),(115,6,'C5','C','Available'),(116,6,'D1','D','Available'),(117,6,'D2','D','Available'),(118,6,'D3','D','Available'),(119,6,'D4','D','Available'),(120,6,'D5','D','Available'),(121,7,'A1','A','Available'),(122,7,'A2','A','Available'),(123,7,'A3','A','Available'),(124,7,'A4','A','Available'),(125,7,'A5','A','Available'),(126,7,'B1','B','Available'),(127,7,'B2','B','Available'),(128,7,'B3','B','Available'),(129,7,'B4','B','Available'),(130,7,'B5','B','Available'),(131,7,'C1','C','Available'),(132,7,'C2','C','Available'),(133,7,'C3','C','Available'),(134,7,'C4','C','Available'),(135,7,'C5','C','Available'),(136,7,'D1','D','Available'),(137,7,'D2','D','Available'),(138,7,'D3','D','Available'),(139,7,'D4','D','Available'),(140,7,'D5','D','Available'),(141,8,'A1','A','Available'),(142,8,'A2','A','Available'),(143,8,'A3','A','Available'),(144,8,'A4','A','Available'),(145,8,'A5','A','Available'),(146,8,'B1','B','Available'),(147,8,'B2','B','Available'),(148,8,'B3','B','Available'),(149,8,'B4','B','Available'),(150,8,'B5','B','Available'),(151,8,'C1','C','Available'),(152,8,'C2','C','Available'),(153,8,'C3','C','Available'),(154,8,'C4','C','Available'),(155,8,'C5','C','Available'),(156,8,'D1','D','Available'),(157,8,'D2','D','Available'),(158,8,'D3','D','Available'),(159,8,'D4','D','Available'),(160,8,'D5','D','Available'),(161,9,'A1','A','Available'),(162,9,'A2','A','Available'),(163,9,'A3','A','Available'),(164,9,'A4','A','Available'),(165,9,'A5','A','Available'),(166,9,'B1','B','Available'),(167,9,'B2','B','Available'),(168,9,'B3','B','Available'),(169,9,'B4','B','Available'),(170,9,'B5','B','Available'),(171,9,'C1','C','Available'),(172,9,'C2','C','Available'),(173,9,'C3','C','Available'),(174,9,'C4','C','Available'),(175,9,'C5','C','Available'),(176,9,'D1','D','Available'),(177,9,'D2','D','Available'),(178,9,'D3','D','Available'),(179,9,'D4','D','Available'),(180,9,'D5','D','Available'),(181,10,'A1','A','Available'),(182,10,'A2','A','Available'),(183,10,'A3','A','Available'),(184,10,'A4','A','Available'),(185,10,'A5','A','Available'),(186,10,'B1','B','Available'),(187,10,'B2','B','Available'),(188,10,'B3','B','Available'),(189,10,'B4','B','Available'),(190,10,'B5','B','Available'),(191,10,'C1','C','Available'),(192,10,'C2','C','Available'),(193,10,'C3','C','Available'),(194,10,'C4','C','Available'),(195,10,'C5','C','Available'),(196,10,'D1','D','Available'),(197,10,'D2','D','Available'),(198,10,'D3','D','Available'),(199,10,'D4','D','Available'),(200,10,'D5','D','Available');
/*!40000 ALTER TABLE `Seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Showtime`
--

DROP TABLE IF EXISTS `Showtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Showtime` (
  `ShowtimeID` int NOT NULL AUTO_INCREMENT,
  `MovieID` int DEFAULT NULL,
  `TheaterID` int DEFAULT NULL,
  `ShowDate` date DEFAULT NULL,
  `ShowTime` time DEFAULT NULL,
  PRIMARY KEY (`ShowtimeID`),
  KEY `MovieID` (`MovieID`),
  KEY `TheaterID` (`TheaterID`),
  CONSTRAINT `showtime_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `Movie` (`MovieID`),
  CONSTRAINT `showtime_ibfk_2` FOREIGN KEY (`TheaterID`) REFERENCES `Theater` (`TheaterID`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Showtime`
--

LOCK TABLES `Showtime` WRITE;
/*!40000 ALTER TABLE `Showtime` DISABLE KEYS */;
INSERT INTO `Showtime` VALUES (101,1,1,'2024-05-01','15:00:00'),(102,2,1,'2024-05-02','18:00:00'),(103,3,1,'2024-05-03','20:00:00'),(104,4,2,'2024-05-04','17:00:00'),(105,5,2,'2024-05-05','21:00:00'),(106,6,3,'2024-05-06','19:00:00'),(107,7,3,'2024-05-07','16:30:00'),(108,8,1,'2024-05-08','14:00:00'),(109,9,2,'2024-05-09','20:30:00'),(110,10,2,'2024-05-10','18:30:00'),(111,1,1,'2025-07-01','18:00:00'),(112,2,1,'2025-07-01','21:00:00'),(113,3,1,'2025-07-02','17:00:00'),(114,4,1,'2025-07-02','20:00:00'),(115,5,1,'2025-07-03','19:00:00'),(116,6,2,'2025-07-01','18:30:00'),(117,7,2,'2025-07-01','21:30:00'),(118,8,2,'2025-07-02','17:30:00'),(119,9,2,'2025-07-02','20:30:00'),(120,10,2,'2025-07-03','19:15:00'),(121,11,3,'2025-07-01','16:00:00'),(122,12,3,'2025-07-01','19:00:00'),(123,13,3,'2025-07-02','21:00:00'),(124,14,3,'2025-07-03','18:30:00'),(125,15,3,'2025-07-03','20:45:00'),(126,1,4,'2025-07-04','18:00:00'),(127,2,4,'2025-07-04','21:00:00'),(128,3,4,'2025-07-05','17:00:00'),(129,4,4,'2025-07-05','20:00:00'),(130,5,4,'2025-07-06','19:00:00'),(131,6,5,'2025-07-04','18:30:00'),(132,7,5,'2025-07-04','21:30:00'),(133,8,5,'2025-07-05','17:30:00'),(134,9,5,'2025-07-05','20:30:00'),(135,10,5,'2025-07-06','19:15:00'),(136,11,6,'2025-07-04','16:00:00'),(137,12,6,'2025-07-04','19:00:00'),(138,13,6,'2025-07-05','21:00:00'),(139,14,6,'2025-07-06','18:30:00'),(140,15,6,'2025-07-06','20:45:00'),(141,1,7,'2025-07-07','18:00:00'),(142,2,7,'2025-07-07','21:00:00'),(143,3,7,'2025-07-08','17:00:00'),(144,4,7,'2025-07-08','20:00:00'),(145,5,7,'2025-07-09','19:00:00'),(146,6,8,'2025-07-07','18:30:00'),(147,7,8,'2025-07-07','21:30:00'),(148,8,8,'2025-07-08','17:30:00'),(149,9,8,'2025-07-08','20:30:00'),(150,10,8,'2025-07-09','19:15:00'),(151,11,9,'2025-07-07','16:00:00'),(152,12,9,'2025-07-07','19:00:00'),(153,13,9,'2025-07-08','21:00:00'),(154,14,9,'2025-07-09','18:30:00'),(155,15,9,'2025-07-09','20:45:00'),(156,1,10,'2025-07-10','18:00:00'),(157,2,10,'2025-07-10','21:00:00'),(158,3,10,'2025-07-11','17:00:00'),(159,4,10,'2025-07-11','20:00:00'),(160,5,10,'2025-07-12','19:00:00'),(161,1,1,'2025-07-01','18:00:00'),(162,2,1,'2025-07-01','21:00:00'),(163,3,1,'2025-07-02','17:00:00'),(164,4,1,'2025-07-02','20:00:00'),(165,5,1,'2025-07-03','19:00:00'),(166,6,2,'2025-07-01','18:30:00'),(167,7,2,'2025-07-01','21:30:00'),(168,8,2,'2025-07-02','17:30:00'),(169,9,2,'2025-07-02','20:30:00'),(170,10,2,'2025-07-03','19:15:00'),(171,11,3,'2025-07-01','16:00:00'),(172,12,3,'2025-07-01','19:00:00'),(173,13,3,'2025-07-02','21:00:00'),(174,14,3,'2025-07-03','18:30:00'),(175,15,3,'2025-07-03','20:45:00'),(176,1,4,'2025-07-04','18:00:00'),(177,2,4,'2025-07-04','21:00:00'),(178,3,4,'2025-07-05','17:00:00'),(179,4,4,'2025-07-05','20:00:00'),(180,5,4,'2025-07-06','19:00:00'),(181,6,5,'2025-07-04','18:30:00'),(182,7,5,'2025-07-04','21:30:00'),(183,8,5,'2025-07-05','17:30:00'),(184,9,5,'2025-07-05','20:30:00'),(185,10,5,'2025-07-06','19:15:00'),(186,11,6,'2025-07-04','16:00:00'),(187,12,6,'2025-07-04','19:00:00'),(188,13,6,'2025-07-05','21:00:00'),(189,14,6,'2025-07-06','18:30:00'),(190,15,6,'2025-07-06','20:45:00'),(191,1,7,'2025-07-07','18:00:00'),(192,2,7,'2025-07-07','21:00:00'),(193,3,7,'2025-07-08','17:00:00'),(194,4,7,'2025-07-08','20:00:00'),(195,5,7,'2025-07-09','19:00:00'),(196,6,8,'2025-07-07','18:30:00'),(197,7,8,'2025-07-07','21:30:00'),(198,8,8,'2025-07-08','17:30:00'),(199,9,8,'2025-07-08','20:30:00'),(200,10,8,'2025-07-09','19:15:00'),(201,11,9,'2025-07-07','16:00:00'),(202,12,9,'2025-07-07','19:00:00'),(203,13,9,'2025-07-08','21:00:00'),(204,14,9,'2025-07-09','18:30:00'),(205,15,9,'2025-07-09','20:45:00'),(206,1,10,'2025-07-10','18:00:00'),(207,2,10,'2025-07-10','21:00:00'),(208,3,10,'2025-07-11','17:00:00'),(209,4,10,'2025-07-11','20:00:00'),(210,5,10,'2025-07-12','19:00:00'),(211,16,1,'2025-07-15','17:00:00'),(212,16,2,'2025-07-16','20:30:00'),(213,16,3,'2025-07-17','19:15:00'),(214,17,1,'2025-07-15','14:00:00'),(215,17,4,'2025-07-16','18:30:00'),(216,17,5,'2025-07-17','21:00:00'),(217,18,1,'2025-07-15','19:00:00'),(218,18,2,'2025-07-16','21:00:00'),(219,18,3,'2025-07-17','18:30:00');
/*!40000 ALTER TABLE `Showtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `StaffID` int NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `ShiftTime` varchar(20) DEFAULT NULL,
  `TheaterID` int DEFAULT NULL,
  PRIMARY KEY (`StaffID`),
  KEY `TheaterID` (`TheaterID`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`TheaterID`) REFERENCES `Theater` (`TheaterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES (1,'Ali','Khan','0300-1234567','Manager',50000.00,'Morning',1),(2,'Sara','Malik','0311-2345678','Cashier',25000.00,'Evening',2),(3,'Omar','Sheikh','0322-3456789','Cleaner',15000.00,'Night',3),(4,'Ayesha','Iqbal','0301-9876543','Ticket Checker',20000.00,'Morning',1),(5,'Zain','Ahmed','0315-8765432','Usher',18000.00,'Evening',2),(6,'Fatima','Noor','0340-7654321','Manager',52000.00,'Morning',3),(7,'Hassan','Raza','0307-6543210','Cashier',26000.00,'Night',1),(8,'Mariam','Asif','0321-5432109','Cleaner',15000.00,'Evening',2),(9,'Usman','Tariq','0309-4321098','Usher',18000.00,'Morning',3),(10,'Nida','Farooq','0318-3210987','Ticket Checker',22000.00,'Night',1);
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Theater`
--

DROP TABLE IF EXISTS `Theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Theater` (
  `TheaterID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `NumOfScreens` int DEFAULT NULL,
  `TotalSeats` int DEFAULT NULL,
  PRIMARY KEY (`TheaterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Theater`
--

LOCK TABLES `Theater` WRITE;
/*!40000 ALTER TABLE `Theater` DISABLE KEYS */;
INSERT INTO `Theater` VALUES (1,'Grand Cinema','Lahore',5,800),(2,'Starplex','Karachi',7,1200),(3,'CineWorld','Islamabad',4,600),(4,'Movie Palace','Faisalabad',6,900),(5,'Galaxy Theaters','Rawalpindi',3,450),(6,'Royal Screens','Multan',5,700),(7,'Silver Screen','Peshawar',4,550),(8,'Plaza Cinemas','Quetta',2,300),(9,'CineStar','Sialkot',3,400),(10,'Metro Movies','Hyderabad',4,650);
/*!40000 ALTER TABLE `Theater` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-01 14:17:20
