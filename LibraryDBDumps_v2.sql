CREATE DATABASE  IF NOT EXISTS `librarydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `librarydb`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: librarydb
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `activitystatustable`
--

DROP TABLE IF EXISTS `activitystatustable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activitystatustable` (
  `ActivityStatusID` int NOT NULL AUTO_INCREMENT,
  `ActivityStatus` enum('active','inactive') NOT NULL,
  PRIMARY KEY (`ActivityStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activitystatustable`
--

LOCK TABLES `activitystatustable` WRITE;
/*!40000 ALTER TABLE `activitystatustable` DISABLE KEYS */;
INSERT INTO `activitystatustable` VALUES (1,'active'),(2,'inactive');
/*!40000 ALTER TABLE `activitystatustable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `AddressID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `FlatNo` varchar(30) NOT NULL,
  `Street` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `PostalCode` varchar(20) NOT NULL,
  `Country` varchar(50) NOT NULL,
  PRIMARY KEY (`AddressID`),
  UNIQUE KEY `AddressID` (`AddressID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `libraryusers` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,1,'40','StagsWay','Isleworth','TW7 5PG','UK'),(2,2,'78','St. John’s Road','Isleworth','TW7 6NL','UK'),(3,1,'H45','High Street','Hounslow','TW3 1ES','UK'),(4,3,'30','Thornbury Road','Osterley','TW7 4LN','UK'),(5,3,'100','Oxford Street','London','W1D 1LL','UK'),(6,4,'23','Commerce Road','Brentford','TW8 8LE','UK'),(7,5,'B12','Kingsley Road','Hounslow','TW3 1PA','UK');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `AuthorID` int NOT NULL AUTO_INCREMENT,
  `Firstname` varchar(50) NOT NULL,
  `Lastname` varchar(50) NOT NULL,
  PRIMARY KEY (`AuthorID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'F. Scott','Fitzgerald'),(2,'Jane','Austen'),(3,'J.D.','Salinger'),(4,'Herman','Melville'),(5,'J.R.R.','Tolkien'),(6,'J.K','Rowling');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `BookID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(200) NOT NULL,
  `AuthorID` int DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  `PublishedYear` int DEFAULT NULL,
  `CopiesAvailable` int DEFAULT '1',
  PRIMARY KEY (`BookID`),
  UNIQUE KEY `BookID` (`BookID`),
  KEY `AuthorID` (`AuthorID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`AuthorID`) REFERENCES `authors` (`AuthorID`),
  CONSTRAINT `books_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'The Great Gatsby',1,1,1925,2),(2,'The Hobbit',5,2,1937,6),(3,'Pride and Prejudice',2,1,1813,4),(4,'Moby-Dick',4,2,1851,5),(5,'The Catcher in the Rye',3,3,1951,2),(6,'Harry Potter and the Philosopher Stone',6,1,1997,10);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowingbooks`
--

DROP TABLE IF EXISTS `borrowingbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowingbooks` (
  `BorrowID` int NOT NULL AUTO_INCREMENT,
  `BookID` int DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `BorrowDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `DueDate` date GENERATED ALWAYS AS ((`BorrowDate` + interval 14 day)) STORED,
  `ReturnDate` date DEFAULT NULL,
  `StatusID` int DEFAULT NULL,
  PRIMARY KEY (`BorrowID`),
  KEY `BookID` (`BookID`),
  KEY `UserID` (`UserID`),
  KEY `StatusID` (`StatusID`),
  CONSTRAINT `borrowingbooks_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`),
  CONSTRAINT `borrowingbooks_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `libraryusers` (`UserID`),
  CONSTRAINT `borrowingbooks_ibfk_3` FOREIGN KEY (`StatusID`) REFERENCES `borrowstatus` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowingbooks`
--

LOCK TABLES `borrowingbooks` WRITE;
/*!40000 ALTER TABLE `borrowingbooks` DISABLE KEYS */;
INSERT INTO `borrowingbooks` (`BorrowID`, `BookID`, `UserID`, `BorrowDate`, `ReturnDate`, `StatusID`) VALUES (7,1,1,'2025-03-21 10:00:00',NULL,1),(8,2,2,'2025-02-10 11:00:00','2025-03-21',2),(9,3,3,'2025-03-12 12:00:00',NULL,1),(10,4,4,'2025-03-14 13:00:00',NULL,3),(11,5,5,'2025-02-10 14:00:00','2025-03-01',2),(12,6,6,'2025-03-20 15:00:00',NULL,1),(13,1,1,'2025-03-24 21:24:29',NULL,NULL);
/*!40000 ALTER TABLE `borrowingbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowstatus`
--

DROP TABLE IF EXISTS `borrowstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowstatus` (
  `StatusID` int NOT NULL AUTO_INCREMENT,
  `StatusDescription` varchar(50) NOT NULL,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowstatus`
--

LOCK TABLES `borrowstatus` WRITE;
/*!40000 ALTER TABLE `borrowstatus` DISABLE KEYS */;
INSERT INTO `borrowstatus` VALUES (1,'Borrowed'),(2,'Returned'),(3,'Overdue');
/*!40000 ALTER TABLE `borrowstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Fiction'),(2,'Classic'),(3,'Modern'),(4,'Horror'),(5,'Fantasy');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finestable`
--

DROP TABLE IF EXISTS `finestable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finestable` (
  `FineId` int NOT NULL AUTO_INCREMENT,
  `BorrowID` int NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `overdue_days` int GENERATED ALWAYS AS ((to_days(`return_date`) - to_days(`due_date`))) VIRTUAL,
  `late_fee` decimal(5,2) GENERATED ALWAYS AS ((`overdue_days` * 0.5)) VIRTUAL,
  `FineStatus` enum('unpaid','paid') DEFAULT 'unpaid',
  `PaymentDate` date DEFAULT NULL,
  PRIMARY KEY (`FineId`),
  KEY `BorrowID` (`BorrowID`),
  CONSTRAINT `finestable_ibfk_1` FOREIGN KEY (`BorrowID`) REFERENCES `borrowingbooks` (`BorrowID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finestable`
--

LOCK TABLES `finestable` WRITE;
/*!40000 ALTER TABLE `finestable` DISABLE KEYS */;
INSERT INTO `finestable` (`FineId`, `BorrowID`, `due_date`, `return_date`, `FineStatus`, `PaymentDate`) VALUES (8,8,'2025-02-24','2025-03-21','paid','2025-03-24'),(9,11,'2025-02-24','2025-03-01','unpaid',NULL);
/*!40000 ALTER TABLE `finestable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libraryusers`
--

DROP TABLE IF EXISTS `libraryusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libraryusers` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `JoinDate` date DEFAULT NULL,
  `MembershipTypeID` int DEFAULT NULL,
  `ActivityStatusID` int DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserID` (`UserID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `MembershipTypeID` (`MembershipTypeID`),
  KEY `ActivityStatusID` (`ActivityStatusID`),
  CONSTRAINT `libraryusers_ibfk_1` FOREIGN KEY (`MembershipTypeID`) REFERENCES `membershiptypetable` (`MembershipTypeID`),
  CONSTRAINT `libraryusers_ibfk_2` FOREIGN KEY (`ActivityStatusID`) REFERENCES `activitystatustable` (`ActivityStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libraryusers`
--

LOCK TABLES `libraryusers` WRITE;
/*!40000 ALTER TABLE `libraryusers` DISABLE KEYS */;
INSERT INTO `libraryusers` VALUES (1,'Sheshank','Gowda','Sheshank@gmail.com','9876543210','2024-06-15',2,1),(2,'Lisa','Simpson','Lisasimp@gmail.com','123-456-7890','2010-09-22',2,1),(3,'Alice','Johnson','alice.johnson@email.com','9234567890','2023-06-15',2,2),(4,'Bob','Smith','bob.smith@email.com','9876543210','2022-09-22',2,1),(5,'Charlie','Davis','charlie.davis@email.com','555-123-4567','2024-01-05',1,1),(6,'Chaitra','Gowda','Chaitra@gmail.com','9876543212','2022-08-20',2,1),(7,'Bart','Simpson','Bartsimps@gmail.com','9176543212','2025-08-22',2,1);
/*!40000 ALTER TABLE `libraryusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membershiptypetable`
--

DROP TABLE IF EXISTS `membershiptypetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membershiptypetable` (
  `MembershipTypeID` int NOT NULL AUTO_INCREMENT,
  `MembershipType` enum('visitor','member') NOT NULL,
  PRIMARY KEY (`MembershipTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membershiptypetable`
--

LOCK TABLES `membershiptypetable` WRITE;
/*!40000 ALTER TABLE `membershiptypetable` DISABLE KEYS */;
INSERT INTO `membershiptypetable` VALUES (1,'visitor'),(2,'member');
/*!40000 ALTER TABLE `membershiptypetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `NotificationID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `NotificationType` varchar(50) DEFAULT NULL,
  `Message` text,
  `NotificationDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsRead` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`NotificationID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `libraryusers` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,1,'overdue','Your Book is overdue','2025-03-24 21:05:58',0);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vborrowedbooks`
--

DROP TABLE IF EXISTS `vborrowedbooks`;
/*!50001 DROP VIEW IF EXISTS `vborrowedbooks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vborrowedbooks` AS SELECT 
 1 AS `BorrowID`,
 1 AS `BookID`,
 1 AS `Title`,
 1 AS `UserID`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `BorrowDate`,
 1 AS `DueDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'librarydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `BorrowBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BorrowBook`(
    IN p_book_id INT,
    IN p_user_id INT
)
BEGIN
    DECLARE available_count INT;
 
    -- Check if the book is available
    SELECT available_copies INTO available_count
    FROM Books
    WHERE book_id = p_book_id;
 
    IF available_count > 0 THEN
        -- Insert the borrow record into the Borrow_Log table
        INSERT INTO Borrow_Log (book_id, user_id, borrow_date)
        VALUES (p_book_id, p_user_id, NOW());
 
        -- Decrease the available book count
        UPDATE Books
        SET available_copies = available_copies - 1
        WHERE book_id = p_book_id;
 
        COMMIT;
    ELSE
        -- Raise an error if no copies are available
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No available copies for this book';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BorrowBooks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BorrowBooks`(

    IN p_book_id INT,

    IN p_user_id INT

)
BEGIN

    DECLARE available_count INT;
 
    -- Check if the book is available

    SELECT CopiesAvailable INTO available_count

    FROM Books

    WHERE book_id = p_book_id

    FOR UPDATE;  -- Locks the row to prevent race conditions
 
    IF available_count > 0 THEN

        -- Insert the borrow record into the Borrow_Log table

        INSERT INTO Borrow_Log (book_id, user_id, borrow_date)

        VALUES (p_book_id, p_user_id, NOW());
 
        -- Decrease the available book count atomically

        UPDATE Books

        SET CopiesAvailable = CopiesAvailable - 1

        WHERE book_id = p_book_id;
 
    ELSE

        -- Raise an error if no copies are available

        SIGNAL SQLSTATE '45000'

        SET MESSAGE_TEXT = 'No available copies for this book';

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BorrowingBooks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BorrowingBooks`(

    IN p_BookID INT,
	IN p_UserID INT
)
BEGIN

    DECLARE available_count INT;
 
    -- Check if the book is available

    SELECT CopiesAvailable INTO available_count

    FROM Books

    WHERE BookID = p_BookID

    FOR UPDATE;  -- Locks the row to prevent race conditions
 
    IF available_count > 0 THEN

        -- Insert the borrow record into the Borrow_Log table

        INSERT INTO Borrow_Log (BookID, UserID, BorrowDate)

        VALUES (p_BookID, p_UserID, NOW());
 
        -- Decrease the available book count atomically

        UPDATE Books

        SET CopiesAvailable = CopiesAvailable - 1

        WHERE BookID = p_BookID;
 
    ELSE

        -- Raise an error if no copies are available

        SIGNAL SQLSTATE '45000'

        SET MESSAGE_TEXT = 'No available copies for this book';

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Borrowing_Books` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Borrowing_Books`(

    IN p_BookID INT,
	IN p_UserID INT
)
BEGIN

    DECLARE available_count INT;
 
    -- Check if the book is available

    SELECT CopiesAvailable INTO available_count

    FROM Books

    WHERE BookID = p_BookID

    FOR UPDATE;  -- Locks the row to prevent race conditions
 
    IF available_count > 0 THEN

        -- Insert the borrow record into the Borrow_Log table

        INSERT INTO BorrowingBooks (BookID, UserID, BorrowDate)

        VALUES (p_BookID, p_UserID, NOW());
 
        -- Decrease the available book count atomically

        UPDATE Books

        SET CopiesAvailable = CopiesAvailable - 1

        WHERE BookID = p_BookID;
 
    ELSE

        -- Raise an error if no copies are available

        SIGNAL SQLSTATE '45000'

        SET MESSAGE_TEXT = 'No available copies for this book';

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PayFine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PayFine`(
    IN p_FineID INT
)
BEGIN
    -- Check if the fine exists and is unpaid
    IF EXISTS (
        SELECT 1 FROM FinesTable
        WHERE FineId = p_FineID AND FineStatus = 'unpaid' and overdue_days>=1
    ) THEN
        UPDATE FinesTable
        SET FineStatus = 'paid',
            PaymentDate = CURRENT_DATE
        WHERE FineId = p_FineID;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Fine is already paid or does not exist.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SendNotifications` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SendNotifications`( IN p_UserID INT, 
IN p_NotificationType VARCHAR(50), 
IN p_Message TEXT)
BEGIN    -- Create a notifications table if it doesn't exist    
CREATE TABLE 
IF NOT EXISTS Notifications (
	NotificationID INT PRIMARY KEY AUTO_INCREMENT,        
	UserID INT,        
    NotificationType VARCHAR(50),        
    Message TEXT,        
    NotificationDate DATETIME DEFAULT CURRENT_TIMESTAMP,        
    IsRead BOOLEAN DEFAULT FALSE,        
    FOREIGN KEY (UserID) REFERENCES LibraryUsers(UserID)); -- Insert notification    
    
    INSERT INTO Notifications (UserID, NotificationType, Message)    
    VALUES (p_UserID, p_NotificationType, p_Message);
    
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vborrowedbooks`
--

/*!50001 DROP VIEW IF EXISTS `vborrowedbooks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vborrowedbooks` AS select `bb`.`BorrowID` AS `BorrowID`,`b`.`BookID` AS `BookID`,`b`.`Title` AS `Title`,`bb`.`UserID` AS `UserID`,`lu`.`FirstName` AS `firstname`,`lu`.`LastName` AS `lastname`,`bb`.`BorrowDate` AS `BorrowDate`,`bb`.`DueDate` AS `DueDate` from ((`borrowingbooks` `bb` join `books` `b` on((`bb`.`BookID` = `b`.`BookID`))) join `libraryusers` `lu` on((`lu`.`UserID` = `lu`.`UserID`))) where (`bb`.`ReturnDate` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-24 21:43:08
