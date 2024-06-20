-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: flutter_db
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

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
-- Table structure for table `buku`
--

DROP TABLE IF EXISTS `buku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `rating` float DEFAULT NULL,
  `halaman` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buku`
--

LOCK TABLES `buku` WRITE;
/*!40000 ALTER TABLE `buku` DISABLE KEYS */;
INSERT INTO `buku` VALUES (1,'Harry Potter and the Philosopher\'s Stone','J.K. Rowling',4.76,223,10),(2,'To Kill a Mockingbird','Harper Lee',4.28,281,5),(3,'1984','George Orwell',4.17,328,8),(4,'Pride and Prejudice','Jane Austen',4.25,279,7),(5,'The Great Gatsby','F. Scott Fitzgerald',3.91,180,12),(6,'The Catcher in the Rye','J.D. Salinger',3.8,214,4),(7,'The Hobbit','J.R.R. Tolkien',4.27,310,15),(8,'Fahrenheit 451','Ray Bradbury',3.99,194,6),(9,'Moby Dick','Herman Melville',3.51,635,3),(10,'War and Peace','Leo Tolstoy',4.11,1225,2);
/*!40000 ALTER TABLE `buku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edukasi`
--

DROP TABLE IF EXISTS `edukasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edukasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `rating` float DEFAULT NULL,
  `halaman` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edukasi`
--

LOCK TABLES `edukasi` WRITE;
/*!40000 ALTER TABLE `edukasi` DISABLE KEYS */;
INSERT INTO `edukasi` VALUES (1,'Belajar Pemrograman Python','John Doe',4.5,300,50),(2,'Matematika Dasar','Jane Smith',4,200,30),(3,'Sejarah Dunia Modern','Michael Johnson',4.2,400,40),(4,'Kimia Organik','Emily Brown',4.7,350,25),(5,'Fisika Modern','David Wilson',4.6,320,35);
/*!40000 ALTER TABLE `edukasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengembalian`
--

DROP TABLE IF EXISTS `pengembalian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pengembalian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `rating` float DEFAULT 0,
  `halaman` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengembalian`
--

LOCK TABLES `pengembalian` WRITE;
/*!40000 ALTER TABLE `pengembalian` DISABLE KEYS */;
INSERT INTO `pengembalian` VALUES (1,'The Great Gatsby','F. Scott Fitzgerald',4.5,180,5),(2,'To Kill a Mockingbird','Harper Lee',4.8,281,3),(3,'1984','George Orwell',4.7,328,4),(4,'Pride and Prejudice','Jane Austen',4.6,279,2),(5,'The Catcher in the Rye','J.D. Salinger',4.4,214,6),(6,'The Great Gatsby','F. Scott Fitzgerald',4.5,180,5),(7,'The Great Gatsby','F. Scott Fitzgerald',4.5,180,5),(8,'The Great Gatsby','F. Scott Fitzgerald',4.5,180,5),(9,'To Kill a Mockingbird','Harper Lee',4.8,281,3),(10,'To Kill a Mockingbird','Harper Lee',4.8,300,3),(11,'To Kill a Mockingbird','Harper Lee',4.8,300,5),(12,'To Kill a Mockingbird','Harper Lee',4.8,300,5),(13,'To Kill a Mockingbird','Harper Lee',4.8,200,5),(14,'To Kill a Mockingbird','Harper Lee',3.8,200,2),(15,'To Kill a Mockingbird','Harper Lee',3.8,200,2),(16,'to kill us','salekon',3.8,200,2),(17,'to kill us','salekon',3,250,2),(18,'to kill us','lee harper',3,250,2),(19,'to kill us','lee harper',3,250,2),(20,'to kill us','lee harper',5,250,2),(21,'to kill us','lee harper',4.5,250,2),(22,'to kill us','lee harper',4.5,250,2),(23,'to kill us','lee harper',4.5,250,2),(24,'to kill us','lee harper',4.5,250,2),(25,'to kill us','lee harper',3.6,450,4),(26,'harry','pother',3.8,200,2),(27,'harry','pother',3.8,200,2),(28,'harry','pother',3.8,200,2),(29,'harry','pother',3.8,300,2),(30,'paret of the carabian','jack sprapat',5,500,3),(31,'harry potter','jk roling',4.6,25,12),(32,'harry potter','jk roling',4.6,25,12),(33,'harry potter','jk roling',4.6,25,12),(34,'harry potter','jk roling',4.6,25,12),(35,'harry potter','jk roling',4.6,250,12),(36,'harry','pother',4.8,300,5),(37,'to kill us','lee harper',4.8,450,4),(38,'to kill us','lee harper',4.8,450,4),(39,'harry','jk rowkling',2.5,300,5),(40,'pother','hary',2.5,300,5),(41,'harry','puter',2,500,2);
/*!40000 ALTER TABLE `pengembalian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'john.doe@example.com','password123'),(3,'jane.smith@example.com','securePassword456'),(4,'user1@example.com','$2a$10$scHOC.aaUYEieVFyK9bnT./3Y6TclhEChm9IiLgqQzIp8r0wWP0B.');
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

-- Dump completed on 2024-06-20 20:34:42
