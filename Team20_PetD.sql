-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: petdb
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `admissions`
--

DROP TABLE IF EXISTS `admissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admissions` (
  `AdmissionID` varchar(100) NOT NULL,
  `DateIn` date NOT NULL,
  `DateOut` date NOT NULL,
  `Comments` varchar(100) NOT NULL,
  `PetID` varchar(100) NOT NULL,
  `PenID` varchar(100) NOT NULL,
  PRIMARY KEY (`AdmissionID`),
  KEY `Admissions_pet_FK` (`PetID`),
  KEY `Admissions_pens_FK` (`PenID`),
  CONSTRAINT `Admissions_pens_FK` FOREIGN KEY (`PenID`) REFERENCES `pens` (`PenID`),
  CONSTRAINT `Admissions_pet_FK` FOREIGN KEY (`PetID`) REFERENCES `pet` (`PetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admissions`
--

LOCK TABLES `admissions` WRITE;
/*!40000 ALTER TABLE `admissions` DISABLE KEYS */;
INSERT INTO `admissions` VALUES ('AD01','2026-04-01','2026-04-03','Observed for ear infection treatment','P01','PN02'),('AD02','2026-04-01','2026-04-02','Overnight monitoring after examination','P02','PN04'),('AD03','2026-04-02','2026-04-05','Recovery after wound care','P03','PN06'),('AD04','2026-04-02','2026-04-04','Monitoring after injury','P04','PN08'),('AD05','2026-04-03','2026-04-05','Dental observation','P05','PN02'),('AD06','2026-04-03','2026-04-04','IV fluids and rest','P06','PN04'),('AD07','2026-04-04','2026-04-06','Behaviour monitoring','P07','PN06'),('AD08','2026-04-04','2026-04-05','Short stay for skin treatment','P08','PN08');
/*!40000 ALTER TABLE `admissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `AppointmentID` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `PetID` varchar(100) NOT NULL,
  `StaffID` int(11) NOT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `Appointment_pet_FK` (`PetID`),
  KEY `Appointment_staff_FK` (`StaffID`),
  CONSTRAINT `Appointment_pet_FK` FOREIGN KEY (`PetID`) REFERENCES `pet` (`PetID`),
  CONSTRAINT `Appointment_staff_FK` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES ('A01','2026-04-12','09:00:00','P01',101),('A02','2026-04-12','10:00:00','P02',103),('A03','2026-04-13','11:30:00','P03',105),('A04','2026-04-14','14:00:00','P04',101),('A05','2026-04-15','09:45:00','P05',103),('A06','2026-04-15','13:15:00','P06',105),('A07','2026-04-16','10:20:00','P07',101),('A08','2026-04-16','15:40:00','P08',103);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic`
--

DROP TABLE IF EXISTS `clinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic` (
  `ClinicID` int(11) NOT NULL,
  `PostCode` varchar(8) NOT NULL,
  `Street` varchar(100) NOT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Phone` int(11) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ClinicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic`
--

LOCK TABLES `clinic` WRITE;
/*!40000 ALTER TABLE `clinic` DISABLE KEYS */;
INSERT INTO `clinic` VALUES (1,'BT11AA','12 Victoria Street','Belfast',90112233,'belfast@petdb.com'),(2,'BT486XY','8 Strand Road','Derry',71334455,'derry@petdb.com'),(3,'BT281AB','22 Market Square','Lisburn',92667788,'lisburn@petdb.com'),(4,'BT358CD','4 Hill Street','Newry',30221144,'newry@petdb.com'),(5,'BT521EF','16 Railway Road','Coleraine',70335566,'coleraine@petdb.com'),(6,'BT790GH','9 High Street','Omagh',82245577,'omagh@petdb.com'),(7,'BT203JK','31 Main Street','Bangor',91446688,'bangor@petdb.com'),(8,'BT414LM','7 Church Road','Antrim',94443322,'antrim@petdb.com');
/*!40000 ALTER TABLE `clinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examination`
--

DROP TABLE IF EXISTS `examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examination` (
  `ExamID` varchar(100) NOT NULL,
  `DateTime` datetime NOT NULL,
  `Results` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `PetID` varchar(100) NOT NULL,
  `StaffID` int(11) NOT NULL,
  PRIMARY KEY (`ExamID`),
  KEY `Examination_pet_FK` (`PetID`),
  KEY `Examination_staff_FK` (`StaffID`),
  CONSTRAINT `Examination_pet_FK` FOREIGN KEY (`PetID`) REFERENCES `pet` (`PetID`),
  CONSTRAINT `Examination_staff_FK` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examination`
--

LOCK TABLES `examination` WRITE;
/*!40000 ALTER TABLE `examination` DISABLE KEYS */;
INSERT INTO `examination` VALUES ('E01','2026-04-01 09:30:00','Ear infection','Dog presented with inflamed ear canal','P01',101),('E02','2026-04-01 10:15:00','Low appetite','Cat appeared lethargic and dehydrated','P02',103),('E03','2026-04-02 11:00:00','Minor wound','Rabbit with wound on rear leg','P03',105),('E04','2026-04-02 14:20:00','Limping','Dog injured leg during walk','P04',101),('E05','2026-04-03 09:10:00','Dental issues','Cat with severe plaque build-up','P05',103),('E06','2026-04-03 15:45:00','Fever','Young dog with dehydration and fever','P06',105),('E07','2026-04-04 10:40:00','Feather loss','Parrot showing stress symptoms','P07',101),('E08','2026-04-04 16:00:00','Skin irritation','Hamster with mild irritation','P08',103);
/*!40000 ALTER TABLE `examination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examtreatment`
--

DROP TABLE IF EXISTS `examtreatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examtreatment` (
  `ExamID` varchar(100) NOT NULL,
  `TreatmentID` varchar(100) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `Comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ExamID`,`TreatmentID`),
  KEY `ExamTreatment_treatment_FK` (`TreatmentID`),
  CONSTRAINT `ExamTreatment_examination_FK` FOREIGN KEY (`ExamID`) REFERENCES `examination` (`ExamID`),
  CONSTRAINT `ExamTreatment_treatment_FK` FOREIGN KEY (`TreatmentID`) REFERENCES `treatment` (`TreatmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examtreatment`
--

LOCK TABLES `examtreatment` WRITE;
/*!40000 ALTER TABLE `examtreatment` DISABLE KEYS */;
INSERT INTO `examtreatment` VALUES ('E01','T01',1,'2026-04-01','2026-04-08','7 day antibiotic course'),('E02','T07',1,'2026-04-01','2026-04-01','Blood sample taken'),('E03','T04',2,'2026-04-02','2026-04-06','Wound cleaned and dressed'),('E04','T08',1,'2026-04-02','2026-04-02','X-ray completed'),('E05','T06',1,'2026-04-03','2026-04-03','Dental cleaning performed'),('E06','T02',1,'2026-04-03','2026-04-06','Pain relief during recovery'),('E07','T05',1,'2026-04-04','2026-04-10','Eye and feather care'),('E08','T02',1,'2026-04-04','2026-04-07','Pain relief and monitoring');
/*!40000 ALTER TABLE `examtreatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `InvoiceID` varchar(100) NOT NULL,
  `InvoiceData` varchar(100) DEFAULT NULL,
  `datePaid` date DEFAULT NULL,
  `paymentMethod` varchar(100) DEFAULT NULL,
  `Cost` double DEFAULT NULL,
  PRIMARY KEY (`InvoiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES ('I01','2026-04-01','2026-04-02','Visa',53.5),('I02','2026-04-01','2026-04-01','Cash',40),('I03','2026-04-02','2026-04-05','Cheque',22),('I04','2026-04-02','2026-04-03','Visa',75),('I05','2026-04-03','2026-04-03','Cash',65),('I06','2026-04-03','2026-04-04','Visa',18.5),('I07','2026-04-04','2026-04-06','Cash',14),('I08','2026-04-04','2026-04-07','Cheque',35);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `OwnerID` varchar(100) NOT NULL,
  `fName` varchar(100) NOT NULL,
  `lName` varchar(100) NOT NULL,
  `Street` varchar(100) NOT NULL,
  `Postcode` varchar(100) NOT NULL,
  `City` varchar(100) DEFAULT NULL,
  `phoneNumber` varchar(100) NOT NULL,
  `emailAddress` varchar(100) NOT NULL,
  PRIMARY KEY (`OwnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES ('O01','Alice','Brown','15 Elm Street','BT54RT','Belfast','2890440001','alice.brown@email.com'),('O02','Brian','McKay','7 Shore Road','BT203PL','Bangor','2891440002','brian.mckay@email.com'),('O03','Chloe','Dunn','29 Garden Close','BT489LL','Derry','2871330003','chloe.dunn@email.com'),('O04','David','Hunter','11 Pine Court','BT283YT','Lisburn','2892660004','david.hunter@email.com'),('O05','Ella','Scott','8 Rosemount','BT341AR','Newry','2830220005','ella.scott@email.com'),('O06','Finn','Morgan','50 Mill Road','BT790AX','Omagh','2882240006','finn.morgan@email.com'),('O07','Grace','White','3 Brookfield','BT522PA','Coleraine','2870330007','grace.white@email.com'),('O08','Hannah','Bell','6 Maple Drive','BT411EZ','Antrim','2894440008','hannah.bell@email.com');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pens`
--

DROP TABLE IF EXISTS `pens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pens` (
  `PenID` varchar(100) NOT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `Status` varchar(100) DEFAULT NULL,
  `ClinicID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PenID`),
  KEY `Pens_clinic_FK` (`ClinicID`),
  CONSTRAINT `Pens_clinic_FK` FOREIGN KEY (`ClinicID`) REFERENCES `clinic` (`ClinicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pens`
--

LOCK TABLES `pens` WRITE;
/*!40000 ALTER TABLE `pens` DISABLE KEYS */;
INSERT INTO `pens` VALUES ('PN01',2,'Available',1),('PN02',4,'Occupied',1),('PN03',3,'Available',2),('PN04',2,'Occupied',2),('PN05',4,'Available',3),('PN06',1,'Occupied',4),('PN07',2,'Available',5),('PN08',3,'Occupied',6);
/*!40000 ALTER TABLE `pens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet` (
  `PetID` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `breedOfAnimal` varchar(100) NOT NULL,
  `typeOfAnimal` varchar(100) NOT NULL,
  `Description` varchar(300) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `dateRegistered` date NOT NULL,
  `Status` varchar(100) NOT NULL,
  `ClinicID` int(11) NOT NULL,
  PRIMARY KEY (`PetID`),
  KEY `Pet_clinic_FK` (`ClinicID`),
  CONSTRAINT `Pet_clinic_FK` FOREIGN KEY (`ClinicID`) REFERENCES `clinic` (`ClinicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet`
--

LOCK TABLES `pet` WRITE;
/*!40000 ALTER TABLE `pet` DISABLE KEYS */;
INSERT INTO `pet` VALUES ('P01','Max','Golden Retriever','Dog','Male dog with light coat','2020-06-15','2024-01-10','Alive',1),('P02','Luna','British Shorthair','Cat','Black female cat','2021-03-22','2024-02-05','Alive',2),('P03','Bella','Mini Lop','Rabbit','White rabbit with brown ears','2022-08-11','2024-03-18','Alive',3),('P04','Charlie','Beagle','Dog','Male dog with limp','2019-11-02','2024-01-14','Alive',4),('P05','Milo','Tabby','Cat','Grey tabby male cat','2018-01-09','2024-02-20','Deceased',5),('P06','Daisy','Cocker Spaniel','Dog','Young female spaniel','2023-04-17','2024-03-01','Alive',6),('P07','Coco','African Grey','Parrot','Talking parrot','2017-12-25','2024-02-11','Alive',7),('P08','Rocky','Syrian','Hamster','Brown hamster with skin irritation','2024-02-05','2024-04-11','Alive',8);
/*!40000 ALTER TABLE `pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `fName` varchar(100) NOT NULL,
  `lName` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Street` varchar(100) NOT NULL,
  `City` varchar(100) NOT NULL,
  `phoneNumber` int(11) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `Sex` varchar(6) NOT NULL,
  `niNumber` varchar(9) NOT NULL,
  `Position` varchar(100) NOT NULL,
  `Qualifications` varchar(100) NOT NULL,
  `Salary` double NOT NULL,
  `ClinicID` int(11) NOT NULL,
  PRIMARY KEY (`StaffID`),
  KEY `Staff_clinic_FK` (`ClinicID`),
  CONSTRAINT `Staff_clinic_FK` FOREIGN KEY (`ClinicID`) REFERENCES `clinic` (`ClinicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (101,'Emma','Wilson','4 Oak Avenue','Oak Avenue','Belfast',771110001,'1980-05-14','F','AB123456C','Vet','BVSc',52000,1),(102,'Ryan','Kelly','22 River Road','River Road','Belfast',771110002,'1992-08-21','M','CD234567D','Nurse','RVN',31000,1),(103,'Sarah','Owen','18 Hillview','Hillview','Derry',771110003,'1985-02-11','F','EF345678E','Vet','BVMS',54000,2),(104,'Mark','Boyle','7 Green Park','Green Park','Derry',771110004,'1994-11-02','M','GH456789F','Secretary','BTEC Admin',25500,2),(105,'Laura','Devlin','31 Cedar Drive','Cedar Drive','Lisburn',771110005,'1988-03-19','F','IJ567890G','Vet','BVSc',53500,3),(106,'James','Murphy','9 Meadow Lane','Meadow Lane','Newry',771110006,'1990-12-10','M','KL678901H','Nurse','RVN',30000,4),(107,'Niamh','Quinn','44 Beech Road','Beech Road','Bangor',771110007,'1996-07-25','F','MN789012J','Cleaner','Level2 Hygiene',22000,7),(108,'Daniel','Reid','2 Station View','Station View','Antrim',771110008,'1987-09-30','M','OP890123K','Secretary','Office Admin Cert',26000,8);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment` (
  `TreatmentID` varchar(100) NOT NULL,
  `Desc` varchar(100) NOT NULL,
  `Dose` varchar(100) NOT NULL,
  `Cost` double NOT NULL,
  PRIMARY KEY (`TreatmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
INSERT INTO `treatment` VALUES ('T01','Antibiotics','2 tablets daily',35),('T02','Pain Relief','1 tablet daily',18.5),('T03','Vaccination Booster','Single dose',25),('T04','Wound Dressing','Twice weekly',22),('T05','Eye Drops','3 drops daily',14),('T06','Dental Cleaning','Single session',65),('T07','Blood Test','One sample',40),('T08','X-Ray','One scan',75);
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'petdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-22 14:45:41
