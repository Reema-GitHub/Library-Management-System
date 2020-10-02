-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: lms
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin` (
  `user_id` int(11) NOT NULL,
  `admin_officeExtenison` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'617-568-5674');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `autdet`
--

DROP TABLE IF EXISTS `autdet`;
/*!50001 DROP VIEW IF EXISTS `autdet`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `autdet` AS SELECT 
 1 AS `Name`,
 1 AS `Email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `autdetails`
--

DROP TABLE IF EXISTS `autdetails`;
/*!50001 DROP VIEW IF EXISTS `autdetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `autdetails` AS SELECT 
 1 AS `Name`,
 1 AS `author_email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `author_firstName` varchar(45) DEFAULT NULL,
  `author_lastName` varchar(45) DEFAULT NULL,
  `author_stageName` varchar(45) DEFAULT NULL,
  `author_email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (130,'Michael','Men','MM','abc@gmail.com'),(131,'John','jorey','J','pqr@gmail.com'),(132,'Katy','chris','KC','xyz@gmail.com');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `book_title` varchar(45) NOT NULL,
  `book_ISBN` varchar(45) NOT NULL,
  `release_date` date NOT NULL,
  `book_backCoverText` varchar(200) NOT NULL,
  `flag_reserved` tinyint(4) NOT NULL,
  `Publisher_publisher_id` int(11) NOT NULL,
  `book_comments` varchar(200) DEFAULT NULL,
  `BookLocation_book_id` int(11) NOT NULL,
  PRIMARY KEY (`book_id`,`BookLocation_book_id`),
  KEY `fk_Book_Publisher1_idx` (`Publisher_publisher_id`),
  KEY `fk_Book_BookLocation1_idx` (`BookLocation_book_id`),
  CONSTRAINT `fk_Book_BookLocation1` FOREIGN KEY (`BookLocation_book_id`) REFERENCES `booklocation` (`book_id`),
  CONSTRAINT `fk_Book_Publisher1` FOREIGN KEY (`Publisher_publisher_id`) REFERENCES `publisher` (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (36,'Database','979','2017-11-15','Data concepts',1,24,'good',35),(36,'Networking','979','2015-10-18','Data Networking',1,22,'excellent',38),(40,'java','678','2015-12-17','object oriented concept',1,21,'Nice',36);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookauthor`
--

DROP TABLE IF EXISTS `bookauthor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bookauthor` (
  `record_id` int(11) NOT NULL,
  `Author_author_id` int(11) NOT NULL,
  `Book_book_id` int(11) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `fk_BookAuthor_Author1_idx` (`Author_author_id`),
  KEY `fk_BookAuthor_Book1_idx` (`Book_book_id`),
  CONSTRAINT `fk_BookAuthor_Author1` FOREIGN KEY (`Author_author_id`) REFERENCES `author` (`author_id`),
  CONSTRAINT `fk_BookAuthor_Book1` FOREIGN KEY (`Book_book_id`) REFERENCES `book` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookauthor`
--

LOCK TABLES `bookauthor` WRITE;
/*!40000 ALTER TABLE `bookauthor` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookauthor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booklocation`
--

DROP TABLE IF EXISTS `booklocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `booklocation` (
  `book_id` int(11) NOT NULL,
  `Compartment_compartment_id` int(11) NOT NULL,
  PRIMARY KEY (`book_id`),
  KEY `fk_BookLocation_Compartment1_idx` (`Compartment_compartment_id`),
  CONSTRAINT `fk_BookLocation_Compartment1` FOREIGN KEY (`Compartment_compartment_id`) REFERENCES `compartment` (`compartment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booklocation`
--

LOCK TABLES `booklocation` WRITE;
/*!40000 ALTER TABLE `booklocation` DISABLE KEYS */;
INSERT INTO `booklocation` VALUES (35,95),(36,96),(38,97);
/*!40000 ALTER TABLE `booklocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower`
--

DROP TABLE IF EXISTS `borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `borrower` (
  `user_id` int(11) NOT NULL,
  `user_createdById` int(11) NOT NULL,
  `user_LibraryCardNumber` varchar(45) NOT NULL,
  `Admin_user_id` int(11) NOT NULL,
  `Librarian_user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_Borrower_Admin1_idx` (`Admin_user_id`),
  KEY `fk_Borrower_Librarian1_idx` (`Librarian_user_id`),
  CONSTRAINT `fk_Borrower_Admin1` FOREIGN KEY (`Admin_user_id`) REFERENCES `admin` (`user_id`),
  CONSTRAINT `fk_Borrower_Librarian1` FOREIGN KEY (`Librarian_user_id`) REFERENCES `librarian` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower`
--

LOCK TABLES `borrower` WRITE;
/*!40000 ALTER TABLE `borrower` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowerrecord`
--

DROP TABLE IF EXISTS `borrowerrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `borrowerrecord` (
  `record_id` int(11) NOT NULL,
  `date_borrowed` date DEFAULT NULL,
  `flag_returned` tinyint(4) DEFAULT NULL,
  `Borrower_user_id` int(11) NOT NULL,
  `Book_book_id` int(11) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `fk_BorrowerRecord_Borrower1_idx` (`Borrower_user_id`),
  KEY `fk_BorrowerRecord_Book1_idx` (`Book_book_id`),
  CONSTRAINT `fk_BorrowerRecord_Book1` FOREIGN KEY (`Book_book_id`) REFERENCES `book` (`book_id`),
  CONSTRAINT `fk_BorrowerRecord_Borrower1` FOREIGN KEY (`Borrower_user_id`) REFERENCES `borrower` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowerrecord`
--

LOCK TABLES `borrowerrecord` WRITE;
/*!40000 ALTER TABLE `borrowerrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrowerrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compartment`
--

DROP TABLE IF EXISTS `compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compartment` (
  `compartment_id` int(11) NOT NULL,
  `Shelf_shelf_id` int(11) NOT NULL,
  PRIMARY KEY (`compartment_id`),
  KEY `fk_Compartment_Shelf1_idx` (`Shelf_shelf_id`),
  CONSTRAINT `fk_Compartment_Shelf1` FOREIGN KEY (`Shelf_shelf_id`) REFERENCES `shelf` (`shelf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compartment`
--

LOCK TABLES `compartment` WRITE;
/*!40000 ALTER TABLE `compartment` DISABLE KEYS */;
INSERT INTO `compartment` VALUES (95,105),(96,106),(97,107);
/*!40000 ALTER TABLE `compartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librarian`
--

DROP TABLE IF EXISTS `librarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `librarian` (
  `user_id` int(11) NOT NULL,
  `librarian_officeExtension` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librarian`
--

LOCK TABLES `librarian` WRITE;
/*!40000 ALTER TABLE `librarian` DISABLE KEYS */;
INSERT INTO `librarian` VALUES (5,'617-657-8907');
/*!40000 ALTER TABLE `librarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `publisher_name` varchar(45) DEFAULT NULL,
  `publisher_officeAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (21,'dover','New Jersey'),(22,'Sigma','California'),(24,'nation','New York');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shelf`
--

DROP TABLE IF EXISTS `shelf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shelf` (
  `shelf_id` int(11) NOT NULL,
  `shelf_label` varchar(45) NOT NULL,
  `shelf_floor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`shelf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shelf`
--

LOCK TABLES `shelf` WRITE;
/*!40000 ALTER TABLE `shelf` DISABLE KEYS */;
INSERT INTO `shelf` VALUES (105,'history','1'),(106,'Eco','1'),(107,'Maths','2');
/*!40000 ALTER TABLE `shelf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_firstname` varchar(45) NOT NULL,
  `user_lastname` varchar(45) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_typeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_typeid` (`user_typeid`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_typeid`) REFERENCES `userrole` (`user_typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Reema','Mehta','mehta,re@husky.neu.edu',1),(2,'neha','Mehra','abc@husky.neu.edu',3),(3,'asha','shah','xyz@husky.neu.edu',3),(4,'dimple','zatkia','pqr@husky.neu.edu',3),(5,'kashish','Mehta','mehta,re@husky.neu.edu',2),(6,'11','4563789','2',1),(7,'13','48689599','1',2),(8,'12','68345857','2',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `userrole` (
  `user_typeid` int(11) NOT NULL,
  `user_typedesc` varchar(45) NOT NULL,
  PRIMARY KEY (`user_typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (1,'Admin'),(2,'Librarian'),(3,'Student');
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'lms'
--
/*!50003 DROP PROCEDURE IF EXISTS `ListStudents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListStudents`()
SELECT user_id , user_firstname
  FROM User
  Where user_typeid = 3 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `autdet`
--

/*!50001 DROP VIEW IF EXISTS `autdet`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `autdet` (`Name`,`Email`) AS select concat(`author`.`author_firstName`,`author`.`author_lastName`) AS `Name`,`author`.`author_email` AS `author_email` from `author` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `autdetails`
--

/*!50001 DROP VIEW IF EXISTS `autdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `autdetails` AS select concat(`author`.`author_firstName`,`author`.`author_lastName`) AS `Name`,`author`.`author_email` AS `author_email` from `author` */;
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

-- Dump completed on 2018-12-13 15:34:35

