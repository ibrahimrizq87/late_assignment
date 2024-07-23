-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: ITIdatabase
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.24.04.1

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
-- Table structure for table `Change_Log`
--

DROP TABLE IF EXISTS `Change_Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Change_Log` (
  `logID` int NOT NULL AUTO_INCREMENT,
  `action_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `action_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`logID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Change_Log`
--

LOCK TABLES `Change_Log` WRITE;
/*!40000 ALTER TABLE `Change_Log` DISABLE KEYS */;
/*!40000 ALTER TABLE `Change_Log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contact_Info`
--

DROP TABLE IF EXISTS `Contact_Info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contact_Info` (
  `contactID` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`contactID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contact_Info`
--

LOCK TABLES `Contact_Info` WRITE;
/*!40000 ALTER TABLE `Contact_Info` DISABLE KEYS */;
/*!40000 ALTER TABLE `Contact_Info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Deleted_Students`
--

DROP TABLE IF EXISTS `Deleted_Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Deleted_Students` (
  `StudentID` int NOT NULL DEFAULT '0',
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `trackID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Deleted_Students`
--

LOCK TABLES `Deleted_Students` WRITE;
/*!40000 ALTER TABLE `Deleted_Students` DISABLE KEYS */;
/*!40000 ALTER TABLE `Deleted_Students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Exam`
--

DROP TABLE IF EXISTS `Exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Exam` (
  `ExamID` int NOT NULL AUTO_INCREMENT,
  `StudentID` int DEFAULT NULL,
  `SubjectID` int DEFAULT NULL,
  `ExamDate` date DEFAULT NULL,
  `Score` int DEFAULT NULL,
  PRIMARY KEY (`ExamID`),
  KEY `fk_student` (`StudentID`),
  KEY `fk_subject` (`SubjectID`),
  CONSTRAINT `Exam_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`),
  CONSTRAINT `Exam_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `Subject` (`SubjectID`),
  CONSTRAINT `fk_student` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE CASCADE,
  CONSTRAINT `fk_subject` FOREIGN KEY (`SubjectID`) REFERENCES `Subject` (`SubjectID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exam`
--

LOCK TABLES `Exam` WRITE;
/*!40000 ALTER TABLE `Exam` DISABLE KEYS */;
INSERT INTO `Exam` VALUES (1,1,1,'2024-06-01',85),(2,1,2,'2024-06-10',90),(3,2,3,'2024-06-05',75),(4,3,4,'2024-06-15',88),(5,4,5,'2024-06-20',92),(6,1,2,'2024-07-23',88);
/*!40000 ALTER TABLE `Exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhoneNumber`
--

DROP TABLE IF EXISTS `PhoneNumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PhoneNumber` (
  `PhoneNumberID` int NOT NULL AUTO_INCREMENT,
  `StudentID` int DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`PhoneNumberID`),
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `PhoneNumber_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhoneNumber`
--

LOCK TABLES `PhoneNumber` WRITE;
/*!40000 ALTER TABLE `PhoneNumber` DISABLE KEYS */;
INSERT INTO `PhoneNumber` VALUES (1,1,'0123456789'),(2,1,'0123456789'),(3,2,'0123456789'),(4,3,'0123456789'),(5,4,'0123456789'),(6,5,'0123456789');
/*!40000 ALTER TABLE `PhoneNumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Student` (
  `StudentID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `trackID` int DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `fk_track` (`trackID`),
  CONSTRAINT `fk_track` FOREIGN KEY (`trackID`) REFERENCES `Track` (`track_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (1,'ibrahim@gmail.com','assuit','male','2050-12-15','Ibrahim','Rizq',1),(2,'mohamed@gmail.com','cairo','male','2005-10-15','mohamed','ahmed',2),(3,'ahmed@gmail.com','assuit','male','2010-01-15','ahmed','sayed',3),(4,'Nour@gmail.com','Minia','female','1997-01-01','Nour','Alaa',1),(5,'Ali@gmail.com','Alex','male','1950-10-15','Ali','mahmoud',2);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_student_add` AFTER INSERT ON `Student` FOR EACH ROW BEGIN
    INSERT INTO backup_students (studentID, first_name, last_name, birth_date, Address, gender, Email, trackID)
    VALUES (NEW.studentID, NEW.first_name, NEW.last_name, NEW.birth_date, NEW.Address, NEW.gender, NEW.Email, NEW.trackID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_student_delete` BEFORE DELETE ON `Student` FOR EACH ROW BEGIN
    INSERT INTO Deleted_Students (studentID, first_name, last_name, birth_date, Address, gender, Email, trackID)
    VALUES (OLD.studentID, OLD.first_name, OLD.last_name, OLD.birth_date, OLD.Address, OLD.gender, OLD.Email, OLD.trackID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `StudentSubject`
--

DROP TABLE IF EXISTS `StudentSubject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentSubject` (
  `StudentID` int NOT NULL,
  `SubjectID` int NOT NULL,
  PRIMARY KEY (`StudentID`,`SubjectID`),
  KEY `SubjectID` (`SubjectID`),
  CONSTRAINT `StudentSubject_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`),
  CONSTRAINT `StudentSubject_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `Subject` (`SubjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentSubject`
--

LOCK TABLES `StudentSubject` WRITE;
/*!40000 ALTER TABLE `StudentSubject` DISABLE KEYS */;
INSERT INTO `StudentSubject` VALUES (1,1),(1,2),(2,3),(3,4),(4,5);
/*!40000 ALTER TABLE `StudentSubject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subject`
--

DROP TABLE IF EXISTS `Subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Subject` (
  `SubjectID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Description` text,
  `MaxScore` int DEFAULT NULL,
  PRIMARY KEY (`SubjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subject`
--

LOCK TABLES `Subject` WRITE;
/*!40000 ALTER TABLE `Subject` DISABLE KEYS */;
INSERT INTO `Subject` VALUES (1,'C','Programming in C',100),(2,'CPP','Programming in C++',100),(3,'HTML','Web development with HTML',100),(4,'JS','JavaScript programming',100),(5,'Python','Programming in Python',100);
/*!40000 ALTER TABLE `Subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Track`
--

DROP TABLE IF EXISTS `Track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Track` (
  `track_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`track_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Track`
--

LOCK TABLES `Track` WRITE;
/*!40000 ALTER TABLE `Track` DISABLE KEYS */;
INSERT INTO `Track` VALUES (1,'PHP'),(2,'.NET'),(3,'FrontEnd'),(4,'backend');
/*!40000 ALTER TABLE `Track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_students`
--

DROP TABLE IF EXISTS `backup_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backup_students` (
  `StudentID` int NOT NULL DEFAULT '0',
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `trackID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_students`
--

LOCK TABLES `backup_students` WRITE;
/*!40000 ALTER TABLE `backup_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `student_scores`
--

DROP TABLE IF EXISTS `student_scores`;
/*!50001 DROP VIEW IF EXISTS `student_scores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `student_scores` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `student_score`,
 1 AS `subject_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `student_tracks`
--

DROP TABLE IF EXISTS `student_tracks`;
/*!50001 DROP VIEW IF EXISTS `student_tracks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `student_tracks` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `students_score`
--

DROP TABLE IF EXISTS `students_score`;
/*!50001 DROP VIEW IF EXISTS `students_score`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `students_score` AS SELECT 
 1 AS `student_name`,
 1 AS `subject_name`,
 1 AS `student_score`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `subject_students`
--

DROP TABLE IF EXISTS `subject_students`;
/*!50001 DROP VIEW IF EXISTS `subject_students`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `subject_students` AS SELECT 
 1 AS `student_name`,
 1 AS `subject_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `subject_tracks`
--

DROP TABLE IF EXISTS `subject_tracks`;
/*!50001 DROP VIEW IF EXISTS `subject_tracks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `subject_tracks` AS SELECT 
 1 AS `track_name`,
 1 AS `subject_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `student_scores`
--

/*!50001 DROP VIEW IF EXISTS `student_scores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_scores` AS select `Student`.`first_name` AS `first_name`,`Student`.`last_name` AS `last_name`,`Exam`.`Score` AS `student_score`,`Subject`.`Name` AS `subject_name` from (((`Student` join `StudentSubject` on((`Student`.`StudentID` = `StudentSubject`.`StudentID`))) join `Subject` on((`StudentSubject`.`SubjectID` = `Subject`.`SubjectID`))) join `Exam` on(((`Exam`.`SubjectID` = `Subject`.`SubjectID`) and (`Exam`.`StudentID` = `Student`.`StudentID`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_tracks`
--

/*!50001 DROP VIEW IF EXISTS `student_tracks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_tracks` AS select `Student`.`first_name` AS `first_name`,`Student`.`last_name` AS `last_name`,`Track`.`name` AS `name` from (`Student` join `Track` on((`Student`.`trackID` = `Track`.`track_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `students_score`
--

/*!50001 DROP VIEW IF EXISTS `students_score`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `students_score` AS select `Student`.`first_name` AS `student_name`,`Subject`.`Name` AS `subject_name`,`Exam`.`Score` AS `student_score` from (((`Student` join `StudentSubject` on((`Student`.`StudentID` = `StudentSubject`.`StudentID`))) join `Subject` on((`StudentSubject`.`SubjectID` = `Subject`.`SubjectID`))) join `Exam` on((`Exam`.`SubjectID` = `Subject`.`SubjectID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `subject_students`
--

/*!50001 DROP VIEW IF EXISTS `subject_students`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `subject_students` AS select `Student`.`first_name` AS `student_name`,`Subject`.`Name` AS `subject_name` from ((`Student` join `StudentSubject` on((`Student`.`StudentID` = `StudentSubject`.`StudentID`))) join `Subject` on((`StudentSubject`.`SubjectID` = `Subject`.`SubjectID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `subject_tracks`
--

/*!50001 DROP VIEW IF EXISTS `subject_tracks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `subject_tracks` AS select `Track`.`name` AS `track_name`,`Subject`.`Name` AS `subject_name` from (((`Student` join `Track` on((`Student`.`trackID` = `Track`.`track_id`))) join `StudentSubject` on((`Student`.`StudentID` = `StudentSubject`.`StudentID`))) join `Subject` on((`StudentSubject`.`SubjectID` = `Subject`.`SubjectID`))) */;
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

-- Dump completed on 2024-07-24  0:22:46
