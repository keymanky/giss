CREATE DATABASE  IF NOT EXISTS `giss` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `giss`;
-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: giss
-- ------------------------------------------------------
-- Server version	5.5.44-0+deb8u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contrasenas`
--

DROP TABLE IF EXISTS `contrasenas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrasenas` (
  `contrasena` varchar(45) NOT NULL,
  `id_contrasena` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_contrasena`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrasenas`
--

LOCK TABLES `contrasenas` WRITE;
/*!40000 ALTER TABLE `contrasenas` DISABLE KEYS */;
INSERT INTO `contrasenas` VALUES ('test',1),('dif',2);
/*!40000 ALTER TABLE `contrasenas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direccion` (
  `id_direccion` int(11) NOT NULL AUTO_INCREMENT,
  `id_entidad_federativa` int(11) DEFAULT NULL,
  `calle` varchar(50) DEFAULT NULL,
  `num_ext` varchar(20) DEFAULT NULL,
  `num_int` varchar(20) DEFAULT NULL,
  `codigo_postal` varchar(5) DEFAULT NULL,
  `colonia` varchar(50) DEFAULT NULL,
  `localidad` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `telefono_particular` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `f4_idx` (`id_entidad_federativa`),
  CONSTRAINT `f4` FOREIGN KEY (`id_entidad_federativa`) REFERENCES `entidad_federativa` (`id_identidad_federativa`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,15,'Av. de los Barrios','1',' ','54090','Los reyes Ixtacala','Zona metropolitana','Tlalnepantla','56231333'),(2,15,'Av. de los Barrios','1',' ','54090','Los reyes Ixtacala','Zona metropolitana','Tlalnepantla','5538169364'),(3,9,'Desconocido','S/N',' ','02070','Azcapotzalco','Zona metropolitana','Azcapotzalco','5527651866'),(4,15,'Desconocido','24',' ','54150','Acueducto de Tenayuca','Zona metropolitana','Tlalnepantla','5534748105'),(5,15,'Av. Alcanfores y San Juan Totoltepec','S/N',' ','53150','Santa Cruz Acatlán','Zona metropolitana','Tlalnepantla','5531984102'),(6,1,' ',' ',' ',' ',' ',' ',' ',' '),(7,1,' ',' ',' ',' ',' ',' ',' ',' '),(8,1,' ',' ',' ',' ',' ',' ',' ',' '),(9,1,' ',' ',' ',' ',' ',' ',' ',' '),(10,1,' ',' ',' ',' ',' ',' ',' ',' '),(11,1,' ',' ',' ',' ',' ',' ',' ',' '),(12,1,' ',' ',' ',' ',' ',' ',' ',' ');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidad_federativa`
--

DROP TABLE IF EXISTS `entidad_federativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entidad_federativa` (
  `id_identidad_federativa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_identidad_federativa`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidad_federativa`
--

LOCK TABLES `entidad_federativa` WRITE;
/*!40000 ALTER TABLE `entidad_federativa` DISABLE KEYS */;
INSERT INTO `entidad_federativa` VALUES (1,'Aguascalientes'),(2,'Baja California'),(3,'Baja California Sur'),(4,'Campeche'),(5,'Coahuila de Zaragoza'),(6,'Colima'),(7,'Chiapas'),(8,'Chihuahua'),(9,'Distrito Federal'),(10,'Durango'),(11,'Guanajuato'),(12,'Guerrero'),(13,'Hidalgo'),(14,'Jalisco'),(15,'México'),(16,'Michoacán de Ocampo'),(17,'Morelos'),(18,'Nayarit'),(19,'Nuevo León'),(20,'Oaxaca'),(21,'Puebla'),(22,'Querétaro'),(23,'Quintana Roo'),(24,'San Luis Potosí'),(25,'Sinaloa'),(26,'Sonora'),(27,'Tabasco'),(28,'Tamaulipas'),(29,'Tlaxcala'),(30,'Veracruz'),(31,'Yucatán'),(32,'Zacatecas');
/*!40000 ALTER TABLE `entidad_federativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inciso`
--

DROP TABLE IF EXISTS `inciso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inciso` (
  `id_inciso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `ruta_imagen` varchar(100) DEFAULT NULL,
  `secuencia` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `codificacion` int(11) DEFAULT '0',
  `salta_a_la_seccion_id` int(11) DEFAULT NULL,
  `estatus` int(11) DEFAULT '1',
  PRIMARY KEY (`id_inciso`),
  KEY `f10_idx` (`id_pregunta`),
  CONSTRAINT `f10` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inciso`
--

LOCK TABLES `inciso` WRITE;
/*!40000 ALTER TABLE `inciso` DISABLE KEYS */;
INSERT INTO `inciso` VALUES (1,'','',NULL,NULL,NULL,NULL,1),(2,'Hipoacúsico','./imagenes/Inciso2.jpg',1,1,1,NULL,1),(3,'Sordo','./imagenes/Inciso3.jpg',2,1,2,NULL,1),(4,'Visual','./imagenes/Inciso4.jpg',1,10,1,NULL,1),(5,'Auditiva','./imagenes/Inciso5.jpg',2,10,2,NULL,1),(6,'Motriz','./imagenes/Inciso6.jpg',3,10,3,NULL,1),(7,'Otra','',4,10,4,NULL,1),(8,'NO tiene discapacidad','',5,10,5,NULL,1),(9,'Juntos','',1,11,1,NULL,1),(10,'Separados','',2,11,2,NULL,1),(11,'No hay estudios','',1,14,1,NULL,1),(12,'Aprender oficio','',2,14,2,NULL,1),(13,'Primaria','',3,14,3,NULL,1),(14,'Secundario o Carrera Técnica','',4,14,4,NULL,1),(15,'Preparatoria','',5,14,5,NULL,1),(16,'Universidad','',6,14,6,NULL,1),(17,'No hay estudios','',1,15,1,NULL,1),(18,'Aprender oficio','',2,15,2,NULL,1),(19,'Primaria','',3,15,3,NULL,1),(20,'Secundario o Carrera Técnica','',4,15,4,NULL,1),(21,'Preparatoria','',5,15,5,NULL,1),(22,'Universidad','',6,15,6,NULL,1),(23,'Casa papá y mamá','',1,16,1,NULL,1),(24,'Casa mamá','',2,16,2,NULL,1),(25,'Casa papá','',3,16,3,NULL,1),(26,'Casa otra persona mi familia','',4,16,4,NULL,1),(27,'Internado - Casa gobierno','',5,16,5,NULL,1),(28,'Casa yo dueño','',6,16,6,NULL,1),(29,'Sí','',1,17,1,NULL,1),(30,'No','',2,17,2,NULL,1),(31,'Sí','',1,18,1,NULL,1),(32,'No','',2,18,2,NULL,1),(33,'Sí','',1,19,1,NULL,1),(34,'No','',2,19,2,NULL,1),(35,'Nunca / Jamás','./imagenes/Inciso35.jpg',1,20,1,NULL,1),(36,'Poco','./imagenes/Inciso36.jpg',2,20,2,NULL,1),(37,'A veces','./imagenes/Inciso37.jpg',3,20,3,NULL,1),(38,'Mucho','./imagenes/Inciso38.jpg',4,20,4,NULL,1),(39,'Mucho más / Siempre','./imagenes/Inciso39.jpg',5,20,5,NULL,1),(40,'Nunca / Jamás','./imagenes/Inciso40.jpg',1,21,1,NULL,1),(41,'Poco','./imagenes/Inciso41.jpg',2,21,2,NULL,1),(42,'A veces','./imagenes/Inciso42.jpg',3,21,3,NULL,1),(43,'Mucho','./imagenes/Inciso43.jpg',4,21,4,NULL,1),(44,'Mucho más / Siempre','./imagenes/Inciso44.jpg',5,21,5,NULL,1),(45,'Nunca / Jamás','./imagenes/Inciso45.jpg',1,22,1,NULL,1),(46,'Poco','./imagenes/Inciso46.jpg',2,22,2,NULL,1),(47,'A veces','./imagenes/Inciso47.jpg',3,22,3,NULL,1),(48,'Mucho','./imagenes/Inciso48.jpg',4,22,4,NULL,1),(49,'Mucho más / Siempre','./imagenes/Inciso49.jpg',5,22,5,NULL,1),(50,'Nunca / Jamás','./imagenes/Inciso50.jpg',1,23,1,NULL,1),(51,'Poco','./imagenes/Inciso51.jpg',2,23,2,NULL,1),(52,'A veces','./imagenes/Inciso52.jpg',3,23,3,NULL,1),(53,'Mucho','./imagenes/Inciso53.jpg',4,23,4,NULL,1),(54,'Mucho más / Siempre','./imagenes/Inciso54.jpg',5,23,5,NULL,1),(55,'Nunca / Jamás','./imagenes/Inciso55.jpg',1,24,1,NULL,1),(56,'Poco','./imagenes/Inciso56.jpg',2,24,2,NULL,1),(57,'A veces','./imagenes/Inciso57.jpg',3,24,3,NULL,1),(58,'Mucho','./imagenes/Inciso58.jpg',4,24,4,NULL,1),(59,'Mucho más / Siempre','./imagenes/Inciso59.jpg',5,24,5,NULL,1),(60,'Nunca / Jamás','./imagenes/Inciso60.jpg',1,25,1,NULL,1),(61,'Poco','./imagenes/Inciso61.jpg',2,25,2,NULL,1),(62,'A veces','./imagenes/Inciso62.jpg',3,25,3,NULL,1),(63,'Mucho','./imagenes/Inciso63.jpg',4,25,4,NULL,1),(64,'Mucho más / Siempre','./imagenes/Inciso64.jpg',5,25,5,NULL,1),(65,'Nunca / Jamás','./imagenes/Inciso65.jpg',1,26,1,NULL,1),(66,'Poco','./imagenes/Inciso66.jpg',2,26,2,NULL,1),(67,'A veces','./imagenes/Inciso67.jpg',3,26,3,NULL,1),(68,'Mucho','./imagenes/Inciso68.jpg',4,26,4,NULL,1),(69,'Mucho más / Siempre','./imagenes/Inciso69.jpg',5,26,5,NULL,1),(70,'Nunca / Jamás','./imagenes/Inciso70.jpg',1,27,1,NULL,1),(71,'Poco','./imagenes/Inciso71.jpg',2,27,2,NULL,1),(72,'A veces','./imagenes/Inciso72.jpg',3,27,3,NULL,1),(73,'Mucho','./imagenes/Inciso73.jpg',4,27,4,NULL,1),(74,'Mucho más / Siempre','./imagenes/Inciso74.jpg',5,27,5,NULL,1),(75,'Nunca / Jamás','./imagenes/Inciso75.jpg',1,28,1,NULL,1),(76,'Poco','./imagenes/Inciso76.jpg',2,28,2,NULL,1),(77,'A veces','./imagenes/Inciso77.jpg',3,28,3,NULL,1),(78,'Mucho','./imagenes/Inciso78.jpg',4,28,4,NULL,1),(79,'Mucho más / Siempre','./imagenes/Inciso79.jpg',5,28,5,NULL,1),(80,'Nunca / Jamás','./imagenes/Inciso80.jpg',1,29,1,NULL,1),(81,'Poco','./imagenes/Inciso81.jpg',2,29,2,NULL,1),(82,'A veces','./imagenes/Inciso82.jpg',3,29,3,NULL,1),(83,'Mucho','./imagenes/Inciso83.jpg',4,29,4,NULL,1),(84,'Mucho más / Siempre','./imagenes/Inciso84.jpg',5,29,5,NULL,1),(85,'Hombre','./imagenes/Inciso85.jpg',1,3,1,NULL,1),(86,'Mujer','./imagenes/Inciso86.jpg',2,3,2,NULL,1),(87,'Nunca / Jamás','./imagenes/Inciso87.jpg',1,30,1,NULL,1),(88,'Poco','./imagenes/Inciso88.jpg',2,30,2,NULL,1),(89,'A veces','./imagenes/Inciso89.jpg',3,30,3,NULL,1),(90,'Mucho','./imagenes/Inciso90.jpg',4,30,4,NULL,1),(91,'Mucho más / Siempre','./imagenes/Inciso91.jpg',5,30,5,NULL,1),(92,'Nunca / Jamás','./imagenes/Inciso92.jpg',1,31,1,NULL,1),(93,'Poco','./imagenes/Inciso93.jpg',2,31,2,NULL,1),(94,'A veces','./imagenes/Inciso94.jpg',3,31,3,NULL,1),(95,'Mucho','./imagenes/Inciso95.jpg',4,31,4,NULL,1),(96,'Mucho más / Siempre','./imagenes/Inciso96.jpg',5,31,5,NULL,1),(97,'Nunca / Jamás','./imagenes/Inciso97.jpg',1,32,1,NULL,1),(98,'Poco','./imagenes/Inciso98.jpg',2,32,2,NULL,1),(99,'A veces','./imagenes/Inciso99.jpg',3,32,3,NULL,1),(100,'Mucho','./imagenes/Inciso100.jpg',4,32,4,NULL,1),(101,'Mucho más / Siempre','./imagenes/Inciso101.jpg',5,32,5,NULL,1),(102,'Nunca / Jamás','./imagenes/Inciso102.jpg',1,33,1,NULL,1),(103,'Poco','./imagenes/Inciso103.jpg',2,33,2,NULL,1),(104,'A veces','./imagenes/Inciso104.jpg',3,33,3,NULL,1),(105,'Mucho','./imagenes/Inciso105.jpg',4,33,4,NULL,1),(106,'Mucho más / Siempre','./imagenes/Inciso106.jpg',5,33,5,NULL,1),(107,'Nunca / Jamás','./imagenes/Inciso107.jpg',1,34,1,NULL,1),(108,'Poco','./imagenes/Inciso108.jpg',2,34,2,NULL,1),(109,'A veces','./imagenes/Inciso109.jpg',3,34,3,NULL,1),(110,'Mucho','./imagenes/Inciso110.jpg',4,34,4,NULL,1),(111,'Mucho más / Siempre','./imagenes/Inciso111.jpg',5,34,5,NULL,1),(112,'Nunca / Jamás','./imagenes/Inciso112.jpg',1,35,1,NULL,1),(113,'Poco','./imagenes/Inciso113.jpg',2,35,2,NULL,1),(114,'A veces','./imagenes/Inciso114.jpg',3,35,3,NULL,1),(115,'Mucho','./imagenes/Inciso115.jpg',4,35,4,NULL,1),(116,'Mucho más / Siempre','./imagenes/Inciso116.jpg',5,35,5,NULL,1),(117,'Nunca / Jamás','./imagenes/Inciso117.jpg',1,36,1,NULL,1),(118,'Poco','./imagenes/Inciso118.jpg',2,36,2,NULL,1),(119,'A veces','./imagenes/Inciso119.jpg',3,36,3,NULL,1),(120,'Mucho','./imagenes/Inciso120.jpg',4,36,4,NULL,1),(121,'Mucho más / Siempre','./imagenes/Inciso121.jpg',5,36,5,NULL,1),(122,'Nunca / Jamás','./imagenes/Inciso122.jpg',1,37,1,NULL,1),(123,'Poco','./imagenes/Inciso123.jpg',2,37,2,NULL,1),(124,'A veces','./imagenes/Inciso124.jpg',3,37,3,NULL,1),(125,'Mucho','./imagenes/Inciso125.jpg',4,37,4,NULL,1),(126,'Mucho más / Siempre','./imagenes/Inciso126.jpg',5,37,5,NULL,1),(127,'Nunca / Jamás','./imagenes/Inciso127.jpg',1,38,1,NULL,1),(128,'Poco','./imagenes/Inciso128.jpg',2,38,2,NULL,1),(129,'A veces','./imagenes/Inciso129.jpg',3,38,3,NULL,1),(130,'Mucho','./imagenes/Inciso130.jpg',4,38,4,NULL,1),(131,'Mucho más / Siempre','./imagenes/Inciso131.jpg',5,38,5,NULL,1),(132,'Nunca / Jamás','./imagenes/Inciso132.jpg',1,39,1,NULL,1),(133,'Poco','./imagenes/Inciso133.jpg',2,39,2,NULL,1),(134,'A veces','./imagenes/Inciso134.jpg',3,39,3,NULL,1),(135,'Mucho','./imagenes/Inciso135.jpg',4,39,4,NULL,1),(136,'Mucho más / Siempre','./imagenes/Inciso136.jpg',5,39,5,NULL,1),(137,'Nunca / Jamás','./imagenes/Inciso137.jpg',1,40,1,NULL,1),(138,'Poco','./imagenes/Inciso138.jpg',2,40,2,NULL,1),(139,'A veces','./imagenes/Inciso139.jpg',3,40,3,NULL,1),(140,'Mucho','./imagenes/Inciso140.jpg',4,40,4,NULL,1),(141,'Mucho más / Siempre','./imagenes/Inciso141.jpg',5,40,5,NULL,1),(142,'Nunca / Jamás','./imagenes/Inciso142.jpg',1,41,1,NULL,1),(143,'Poco','./imagenes/Inciso143.jpg',2,41,2,NULL,1),(144,'A veces','./imagenes/Inciso144.jpg',3,41,3,NULL,1),(145,'Mucho','./imagenes/Inciso145.jpg',4,41,4,NULL,1),(146,'Mucho más / Siempre','./imagenes/Inciso146.jpg',5,41,5,NULL,1),(147,'Nunca / Jamás','./imagenes/Inciso147.jpg',1,42,1,NULL,1),(148,'Poco','./imagenes/Inciso148.jpg',2,42,2,NULL,1),(149,'A veces','./imagenes/Inciso149.jpg',3,42,3,NULL,1),(150,'Mucho','./imagenes/Inciso150.jpg',4,42,4,NULL,1),(151,'Mucho más / Siempre','./imagenes/Inciso151.jpg',5,42,5,NULL,1),(152,'Nunca / Jamás','./imagenes/Inciso152.jpg',1,43,1,NULL,1),(153,'Poco','./imagenes/Inciso153.jpg',2,43,2,NULL,1),(154,'A veces','./imagenes/Inciso154.jpg',3,43,3,NULL,1),(155,'Mucho','./imagenes/Inciso155.jpg',4,43,4,NULL,1),(156,'Mucho más / Siempre','./imagenes/Inciso156.jpg',5,43,5,NULL,1),(157,'Nunca / Jamás','./imagenes/Inciso157.jpg',1,44,1,NULL,1),(158,'Poco','./imagenes/Inciso158.jpg',2,44,2,NULL,1),(159,'A veces ','./imagenes/Inciso159.jpg',3,44,3,NULL,1),(160,'Mucho','./imagenes/Inciso160.jpg',4,44,4,NULL,1),(161,'Mucho más / Siempre','./imagenes/Inciso161.jpg',5,44,5,NULL,1),(162,'Nunca / Jamás','./imagenes/Inciso162.jpg',1,45,1,NULL,1),(163,'Poco','./imagenes/Inciso163.jpg',2,45,2,NULL,1),(164,'A veces','./imagenes/Inciso164.jpg',3,45,3,NULL,1),(165,'Mucho','./imagenes/Inciso165.jpg',4,45,4,NULL,1),(166,'Mucho más / Siempre','./imagenes/Inciso166.jpg',5,45,5,NULL,1),(167,'Nunca / Jamás','./imagenes/Inciso167.jpg',1,46,1,NULL,1),(168,'Poco','./imagenes/Inciso168.jpg',2,46,2,NULL,1),(169,'A veces','./imagenes/Inciso169.jpg',3,46,3,NULL,1),(170,'Mucho','./imagenes/Inciso170.jpg',4,46,4,NULL,1),(171,'Mucho más / Siempre','./imagenes/Inciso171.jpg',5,46,5,NULL,1),(172,'Nunca / Jamás','./imagenes/Inciso172.jpg',1,47,1,NULL,1),(173,'Poco','./imagenes/Inciso173.jpg',2,47,2,NULL,1),(174,'A veces','./imagenes/Inciso174.jpg',3,47,3,NULL,1),(175,'Mucho','./imagenes/Inciso175.jpg',4,47,4,NULL,1),(176,'Mucho más / Siempre','./imagenes/Inciso176.jpg',5,47,5,NULL,1),(177,'Sí','',1,48,1,NULL,1),(178,'No','',2,48,2,1,1),(179,'Soltero','./imagenes/Inciso179.jpg',1,5,1,NULL,1),(180,'Casado','./imagenes/Inciso180.jpg',2,5,2,NULL,1),(181,'Unión Libre','./imagenes/Inciso181.jpg',3,5,3,NULL,1),(182,'Otro','',4,5,4,NULL,1),(183,'Novio o novia','',1,50,1,NULL,1),(184,'Amigo o amiga','',2,50,2,NULL,1),(185,'Un familiar','',3,50,3,NULL,1),(186,'Alguien desconocido','',4,50,4,NULL,1),(187,'Otro','',5,50,NULL,NULL,1),(188,'Sí','',1,51,1,NULL,1),(189,'No','',2,51,2,NULL,1),(190,'Sí','',1,52,1,NULL,1),(191,'No','',2,52,2,NULL,1),(192,'Mi casa','',1,53,1,NULL,1),(193,'Casa amigo o amiga','',2,53,2,NULL,1),(194,'Casa mi novio o novia','',3,53,3,NULL,1),(195,'Hotel','',4,53,4,NULL,1),(196,'Casa familia','',5,53,5,NULL,1),(197,'Sí','',1,54,1,NULL,1),(198,'No','',2,54,2,NULL,1),(199,'Nada','',1,55,1,NULL,1),(200,'Condón hombre','',2,55,2,NULL,1),(201,'Pastilas anticonceptivas o del día siguiente ( pastilla para NO bebé)','',3,55,3,NULL,1),(202,'No eyacular (moco blanco hombre) NO adentro mujer','',4,55,4,NULL,1),(203,'Sexo ano','',5,55,5,NULL,1),(204,'Otro','',6,55,6,NULL,1),(205,'No tiene escuela','',1,6,1,NULL,1),(206,'Aprender oficio','',2,6,2,NULL,1),(207,'Primaria','',3,6,3,NULL,1),(208,'Secundario o Carrera Técnica','',4,6,4,NULL,1),(209,'Preparatoria','',5,6,5,NULL,1),(210,'Universidad','',6,6,6,NULL,1),(211,'1 (sólo una)','',1,60,1,NULL,1),(212,'2 (dos)','',2,60,2,NULL,1),(213,'3 (tres)','',3,60,3,NULL,1),(214,'4 (cuatro o MÁS)','',4,60,4,NULL,1),(215,'Sí','',1,63,1,NULL,1),(216,'No','',2,63,2,NULL,1),(217,'Sí','',1,64,1,NULL,1),(218,'No','',2,64,2,NULL,1),(219,'Sí','',1,65,1,NULL,1),(220,'No','',2,65,2,NULL,1),(221,'Sí','',1,66,1,NULL,1),(222,'No','',2,66,2,NULL,1),(223,'Sí','',1,67,1,NULL,1),(224,'No','',2,67,2,NULL,1),(225,'Sí','',1,68,1,NULL,1),(226,'No','',2,68,2,NULL,1),(227,'Sí','',1,69,1,NULL,1),(228,'No','',2,69,2,NULL,1),(229,'Sí','',1,7,1,NULL,1),(230,'No','',2,7,2,NULL,1),(231,'Sí','',1,70,1,NULL,1),(232,'No','',2,70,2,NULL,1),(233,'Sí','',1,71,1,NULL,1),(234,'No','',2,71,2,NULL,1),(235,'Nunca / Jamás','./imagenes/Inciso235.jpg',1,72,1,NULL,1),(236,'Poco','./imagenes/Inciso236.jpg',2,72,2,NULL,1),(237,'A veces','./imagenes/Inciso237.jpg',3,72,3,NULL,1),(238,'Mucho','./imagenes/Inciso238.jpg',4,72,4,NULL,1),(239,'Mucho más / Siempre','./imagenes/Inciso239.jpg',5,72,5,NULL,1),(240,'Nunca / Jamás','./imagenes/Inciso240.jpg',1,73,1,NULL,1),(241,'Poco','./imagenes/Inciso241.jpg',2,73,2,NULL,1),(242,'A veces','./imagenes/Inciso242.jpg',3,73,3,NULL,1),(243,'Mucho','./imagenes/Inciso243.jpg',4,73,4,NULL,1),(244,'Mucho más / Siempre','./imagenes/Inciso244.jpg',5,73,5,NULL,1),(245,'Nunca / Jamás','./imagenes/Inciso245.jpg',1,74,1,NULL,1),(246,'Poco','./imagenes/Inciso246.jpg',2,74,2,NULL,1),(247,'A veces','./imagenes/Inciso247.jpg',3,74,3,NULL,1),(248,'Mucho','./imagenes/Inciso248.jpg',4,74,4,NULL,1),(249,'Mucho más / Siempre','./imagenes/Inciso249.jpg',5,74,5,NULL,1),(250,'Nunca / Jamás','./imagenes/Inciso250.jpg',1,75,1,NULL,1),(251,'Poco','./imagenes/Inciso251.jpg',2,75,2,NULL,1),(252,'A veces','./imagenes/Inciso252.jpg',3,75,3,NULL,1),(253,'Mucho','./imagenes/Inciso253.jpg',4,75,4,NULL,1),(254,'Mucho más / Siempre','./imagenes/Inciso254.jpg',5,75,5,NULL,1),(255,'Nunca / Jamás','./imagenes/Inciso255.jpg',1,76,1,NULL,1),(256,'Poco','./imagenes/Inciso256.jpg',2,76,2,NULL,1),(257,'A veces','./imagenes/Inciso257.jpg',3,76,3,NULL,1),(258,'Mucho','./imagenes/Inciso258.jpg',4,76,4,NULL,1),(259,'Mucho más / Siempre','./imagenes/Inciso259.jpg',5,76,5,NULL,1),(260,'Nunca / Jamás','',1,77,1,NULL,1),(261,'Poco','',2,77,2,NULL,1),(262,'A veces','',3,77,3,NULL,1),(263,'Mucho','',4,77,4,NULL,1),(264,'Mucho más / Siempre','',5,77,5,NULL,1),(265,'Nunca / Jamás','',1,78,1,NULL,1),(266,'Poco','',2,78,2,NULL,1),(267,'A veces','',3,78,3,NULL,1),(268,'Mucho','',4,78,4,NULL,1),(269,'Mucho más / Siempre','',5,78,5,NULL,1),(270,'Nunca / Jamás','',1,79,1,NULL,1),(271,'Poco','',2,79,2,NULL,1),(272,'A veces','',3,79,3,NULL,1),(273,'Mucho','',4,79,4,NULL,1),(274,'Mucho más / Siempre','',5,79,5,NULL,1),(275,'Visual','./imagenes/Inciso275.jpg',1,8,1,NULL,1),(276,'Auditiva','./imagenes/Inciso276.jpg',2,8,2,NULL,1),(277,'Motriz','./imagenes/Inciso277.jpg',3,8,3,NULL,1),(278,'Otra','',4,8,4,NULL,1),(279,'NO tiene discapacidad','',5,8,5,NULL,1),(280,'Verdadero','',1,80,1,NULL,1),(281,'Falso','',2,80,2,NULL,1),(282,'No sé','',3,80,3,NULL,1),(283,'Verdadero','',1,81,1,NULL,1),(284,'Falso','',2,81,2,NULL,1),(285,'No sé','',3,81,3,NULL,1),(286,'Verdadero','',1,82,1,NULL,1),(287,'Falso','',2,82,2,NULL,1),(288,'No sé','',3,82,3,NULL,1),(289,'Verdadero','',1,83,1,NULL,1),(290,'Falso','',2,83,2,NULL,1),(291,'No sé','',3,83,3,NULL,1),(292,'Verdadero','',1,84,1,NULL,1),(293,'Falso','',2,84,2,NULL,1),(294,'No sé','',3,84,3,NULL,1),(295,'Verdadero','',1,85,1,NULL,1),(296,'Falso','',2,85,2,NULL,1),(297,'No sé','',3,85,3,NULL,1),(298,'Verdadero','',1,86,1,NULL,1),(299,'Falso','',2,86,2,NULL,1),(300,'No sé','',3,86,3,NULL,1),(301,'Verdadero','',1,87,1,NULL,1),(302,'Falso','',2,87,2,NULL,1),(303,'No sé','',3,87,3,NULL,1),(304,'Verdadero','',1,88,1,NULL,1),(305,'Falso','',2,88,2,NULL,1),(306,'No sé','',3,88,3,NULL,1),(307,'Verdadero','',1,89,1,NULL,1),(308,'Falso','',2,89,2,NULL,1),(309,'No sé','',3,89,3,NULL,1),(310,'Sí','',1,9,1,NULL,1),(311,'No','',2,9,2,NULL,1),(312,'Verdadero','',1,90,1,NULL,1),(313,'Falso','',2,90,2,NULL,1),(314,'No sé','',3,90,3,NULL,1),(315,'Verdadero','',1,91,1,NULL,1),(316,'Falso','',2,91,2,NULL,1),(317,'No sé','',3,91,3,NULL,1),(318,'Verdadero','',1,92,1,NULL,1),(319,'Falso','',2,92,2,NULL,1),(320,'No sé','',3,92,3,NULL,1),(321,'Verdadero','',1,93,1,NULL,1),(322,'Falso','',2,93,2,NULL,1),(323,'No sé','',3,93,3,NULL,1);
/*!40000 ALTER TABLE `inciso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pantalla_de_instruccion`
--

DROP TABLE IF EXISTS `pantalla_de_instruccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pantalla_de_instruccion` (
  `id_pantalla_de_instruccion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `ruta_imagen` varchar(100) DEFAULT NULL,
  `ruta_video` varchar(100) DEFAULT NULL,
  `secuencia` int(11) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  `id_seccion` int(11) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_pantalla_de_instruccion`),
  KEY `f12_idx` (`id_seccion`),
  CONSTRAINT `f12` FOREIGN KEY (`id_seccion`) REFERENCES `pregunta` (`id_seccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pantalla_de_instruccion`
--

LOCK TABLES `pantalla_de_instruccion` WRITE;
/*!40000 ALTER TABLE `pantalla_de_instruccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `pantalla_de_instruccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permiso` (
  `id_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES (1,'lectura'),(2,'creacion y modificacion'),(3,'mantenimiento');
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido_paterno` varchar(35) DEFAULT NULL,
  `apellido_materno` varchar(35) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` int(11) DEFAULT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `f5_idx` (`id_direccion`),
  CONSTRAINT `f5` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'susana','robles','montijo','susana@campus.iztacala.unam.mx',NULL,1,1),(2,'breatriz','frías','arroyo','bety.frias@gmail.com',NULL,1,2),(3,'yuma','yoaly','pérez','yoaly_yu@hotmail.com',NULL,1,3),(4,'jorge','salgado','mendoza','keymanky@hotmail.com','1991-01-16',2,4),(5,'dyana erika','marrón','luna','dyana.marron@gmail.com',NULL,1,5),(6,' ',' ',' ',' ','0000-00-00',NULL,6),(7,' ',' ',' ',' ','0000-00-00',NULL,7),(8,' ',' ',' ',' ','0000-00-00',NULL,8),(9,' ',' ',' ',' ','0000-00-00',NULL,9),(10,' ',' ',' ',' ','0000-00-00',NULL,10),(11,' ',' ',' ',' ','0000-00-00',NULL,11),(12,' ',' ',' ',' ','0000-00-00',NULL,12);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta` (
  `id_pregunta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text,
  `ruta_imagen` varchar(100) DEFAULT NULL,
  `ruta_video` varchar(100) DEFAULT NULL,
  `secuencia` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `id_seccion` int(11) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_pregunta`),
  KEY `f9_idx` (`id_seccion`),
  CONSTRAINT `f9` FOREIGN KEY (`id_seccion`) REFERENCES `seccion` (`id_seccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` VALUES (1,'Tú:',NULL,'./videos/Pregunta1.mp4',1,'Tipo o nivel de la discapacidad',1,1),(2,'Tú sordo o hipoacusia ASÍ NACIÓ o cuando NIÑO tu sordo o hipoacusia cuántos años:',NULL,'./videos/Pregunta2.mp4',2,'Edad inicial de la discapacidad',1,1),(3,'Tú:',NULL,'./videos/Pregunta3.mp4',3,'Sexo',1,1),(4,'Tú cuántos años ahorita:',NULL,'./videos/Pregunta4.mp4',4,'Edad actual',1,1),(5,'Tú:',NULL,'./videos/Pregunta5.mp4',5,'Estado civil',1,1),(6,'Tú nivel estudios hasta:',NULL,'./videos/Pregunta6.mp4',6,'Nivel Estudios',1,1),(7,'¿Tu PAPÁ vive?',NULL,'./videos/Pregunta7.mp4',7,'Vive papá',1,1),(8,'¿Tu PAPÁ tiene discapacidad:',NULL,'./videos/Pregunta8.mp4',8,'Discapacidad del papá',1,1),(9,'¿Tu MAMÁ vive?',NULL,'./videos/Pregunta9.mp4',9,'Vive mamá',1,1),(10,'¿Tu MAMÁ tiene discapacidad?',NULL,'./videos/Pregunta10.mp4',10,'Discapacidad de la mamá',1,1),(11,'¿Tu PAPÁ y MAMÁ viven:',NULL,'./videos/Pregunta11.mp4',11,'Papá y mamá viven juntos o separados',1,1),(12,'Tu PAPÁ cuántos años ahorita:',NULL,'./videos/Pregunta12.mp4',12,'Edad del papá',1,1),(13,'Tu MAMÁ cuántos años ahorita:',NULL,'./videos/Pregunta13.mp4',13,'Edad de la mamá',1,1),(14,'Tu PAPÁ nivel estudios:',NULL,'./videos/Pregunta14.mp4',14,'Nivel de estudios del papá',1,1),(15,'Tu MAMÁ nivel estudios:',NULL,'./videos/Pregunta15.mp4',15,'Nivel de estudios de la mamá',1,1),(16,'¿TÚ ahorita dónde vives?',NULL,'./videos/Pregunta16.mp4',16,'Con quién vive el participante',1,1),(17,'Tu PAPÁ trabaja',NULL,'./videos/Pregunta17.mp4',17,'El papá trabaja',1,1),(18,'Tu MAMÁ trabaja',NULL,'./videos/Pregunta18.mp4',18,'La mamá trabaja',1,1),(19,'TÚ trabajas',NULL,'./videos/Pregunta19.mp4',19,'Trabaja el participante',1,1),(20,'TÚ y tu PAPÁ cuánto platicar\n\"bien o mal cuando hay sexo\"',NULL,'./videos/Pregunta20.mp4',1,'Papá - Ventajas y desventajas de tener relaciones sexuales',2,1),(21,'TÚ y tu PAPÁ cuánto platicar\n\"tú esperar después para sexo, ahorita NO\"',NULL,'./videos/Pregunta21.mp4',2,'Papá - Posponer encuentro sexual',2,1),(22,'TÚ y tu PAPÁ cuánto platicar\n\"tú decir SÍ o NO quiere sexo\"',NULL,'./videos/Pregunta22.mp4',3,'Papá - Tener relaciones sexuales por decisión propia',2,1),(23,'TÚ y tu PAPÁ cuánto platicar\n\"OTRA PERSONA tocar tuyo cuerpo o quiere sexo a fuerza y TÚ NO quiere sexo, tú decir NO\"',NULL,'./videos/Pregunta23.mp4',4,'Papá - No permitir abuso sexual ',2,1),(24,'TÚ y tu PAPÁ cuánto platicar\n\"CÓMO cuidar para NO embarazo\"',NULL,'./videos/Pregunta24.mp4',5,'Papá - Cómo evitar un embarazo',2,1),(25,'TÚ y tu PAPÁ cuánto platicar\n\"CÓMO pega las infecciones sexo y SIDA\"',NULL,'./videos/Pregunta25.mp4',6,'Papá - Cómo se contraen las ETS',2,1),(26,'TÚ y tu PAPÁ cuánto platicar\n\"Métodos anticonceptivos\"\nEjemplo: Pastillas para no embarazo, condón, dispositivo.',NULL,'./videos/Pregunta26.mp4',7,'Papá - Comunicación sobre métodos anticonceptivos',2,1),(27,'TÚ y tu PAPÁ cuánto platicar\n\"CÓMO usar CONDÓN HOMBRE\"',NULL,'./videos/Pregunta27.mp4',8,'Papá - Cómo usar condón masculino ',2,1),(28,'TÚ y tu PAPÁ cuánto platicar\n\"CÓMO usar CONDÓN MUJER\"',NULL,'./videos/Pregunta28.mp4',9,'Papá - Cómo usar condón femenino',2,1),(29,'TÚ y tu PAPÁ cuánto platicar\n\"DÓNDE comprar o personas regalar CONDONES\"',NULL,'./videos/Pregunta29.mp4',10,'Papá - Dónde comprar o adquirir condones',2,1),(30,'TÚ y tu PAPÁ cuánto platicar\n\"CONDÓN bueno seguro no pegar infección sexo o no embarazo\"',NULL,'./videos/Pregunta30.mp4',11,'Papá - Efectividad del condón para prevenir infecciones y embarazos',2,1),(31,'TÚ y tu MAMÁ cuánto platicar\n\"bien o mal cuando hay sexo\"',NULL,'./videos/Pregunta31.mp4',12,'Mamá - Ventajas y desventajas de tener relaciones sexuales',2,1),(32,'TÚ y tu MAMÁ cuánto platicar\n\"tú esperar después para sexo, ahorita NO\"',NULL,'./videos/Pregunta32.mp4',13,'Mamá - posponer encuentro sexual',2,1),(33,'TÚ y tu MAMÁ cuánto platicar\n\"tú decir SI o NO quiere sexo\"',NULL,'./videos/Pregunta33.mp4',14,'Mamá - Tener relaciones sexuales por decisión propia',2,1),(34,'TÚ y tu MAMÁ cuánto platicar\n\"OTRA PERSONA tocar tuyo cuerpo o quiere sexo a fuerza y TÚ NO quiere sexo, tú decir NO\"',NULL,'./videos/Pregunta34.mp4',15,'Mamá - No permitir el abuso sexual',2,1),(35,'TÚ y tu MAMÁ cuánto platicar\n\"CÓMO cuidar para NO embarazo\"',NULL,'./videos/Pregunta35.mp4',16,'Mamá - Cómo evitar un embarazo',2,1),(36,'TÚ y tu MAMÁ cuánto platicar\n\"CÓMO pega las infecciones sexo y SIDA\"',NULL,'./videos/Pregunta36.mp4',17,'Mamá - Cómo se contraen las ETS',2,1),(37,'TÚ y tu MAMÁ cuánto platicar\n\"Métodos anticonceptivos\"\nEjemplo: Pastillas para NO embarazo, condón, dispositivo.',NULL,'./videos/Pregunta37.mp4',18,'Mamá - Comunicación sobre métodos anticonceptivos',2,1),(38,'TÚ y tu MAMÁ cuánto platicar\n\"CÓMO usar CONDÓN HOMBRE\"',NULL,'./videos/Pregunta38.mp4',19,'Mamá - Cómo usar condón masculino',2,1),(39,'TÚ y tu MAMÁ cuánto platicar\n\"CÓMO usar CONDÓN MUJER\"',NULL,'./videos/Pregunta39.mp4',20,'Mamá - Cómo usar condón femenino',2,1),(40,'TÚ y tu MAMÁ cuánto platicar, \n\"DÓNDE comprar o personas regalar CONDONES\"',NULL,'./videos/Pregunta40.mp4',21,'Mamá - Dónde comparar o adquirir condones',2,1),(41,'TÚ y tu MAMÁ cuánto platicar\n\"CONDÓN bueno seguro no pegar infección sexo y no embarazo\"',NULL,'./videos/Pregunta41.mp4',22,'Mamá - Efectividad del condón para prevenir infecciones y embarazos',2,1),(42,'Tu PAPÁ ayuda para TÚ aprender cosas sexo',NULL,'./videos/Pregunta42.mp4',23,'Papá - Apoyo educación sexual',2,1),(43,'Tu MAMÁ ayuda para TÚ aprender cosas sexo',NULL,'./videos/Pregunta43.mp4',24,'Mamá - Apoyo en educación sexual',2,1),(44,'Tu PAPÁ ayuda para TÚ bien, salud y sexo cuidado NO infección sexo, NO embarazo',NULL,'./videos/Pregunta44.mp4',25,'Papá - Contribución en Bienestar y Salud',2,1),(45,'Tu MAMÁ ayuda para TÚ bien, salud y sexo cuidado NO infección sexo, NO embarazo',NULL,'./videos/Pregunta45.mp4',26,'Mamá - Contribución en Bienestar y Salud',2,1),(46,'Tu PAPÁ cuida, platica, pregunta cosas TU escuela o amigos o novio(a)',NULL,'./videos/Pregunta46.mp4',27,'Padre al pendiente de su hijo',2,1),(47,'Tu MAMÁ cuida, platica, pregunta cosas TU escuela o amigos o novio(a)',NULL,'./videos/Pregunta47.mp4',28,'Madre al pendiente de su hijo',2,1),(48,'¿TÚ ya antes hay sexo?',NULL,'./videos/Pregunta48.mp4',1,'Tener relaciones sexuales',3,1),(49,'¿TÚ cuántos años cuando PRIMERO sexo?',NULL,'./videos/Pregunta49.mp4',2,'Edad primera relación sexual',3,1),(50,'TÚ cuál persona PRIMERO sexo',NULL,'./videos/Pregunta50.mp4',3,'Primer persona sexo',3,1),(51,'TÚ PRIMERO relación sexo otra persona A FUERZA y TÚ no gusta o no quiere',NULL,'./videos/Pregunta51.mp4',4,'Primera relación sexual forzada',3,1),(52,'TÚ piensa dónde, cómo y cuándo PRIMERO relación sexo',NULL,'./videos/Pregunta52.mp4',5,'Planeación de la primera relación sexual',3,1),(53,'TÚ dónde PRIMERO sexo',NULL,'./videos/Pregunta53.mp4',6,'Lugar de la primera relación sexual',3,1),(54,'TÚ PRIMERO sexo tú USAR método anticonceptivo\nEjemplo: condón, pastilla no embarazo, dispositivo',NULL,'./videos/Pregunta54.mp4',7,'Uso de métodos anticonceptivos en primera relación sexual',3,1),(55,'TÚ cuál USAR PRIMERO relación sexo',NULL,'./videos/Pregunta55.mp4',8,'Método anticonceptivo usado en primera relación sexual',3,1),(56,'TÚ cuántas veces tener relaciones sexo hasta ahora ',NULL,'./videos/Pregunta56.mp4',9,'Número de relaciones sexuales en toda la vida',3,1),(57,'TÚ cuántas veces usar condón hasta ahora ',NULL,'./videos/Pregunta57.mp4',10,'Número de veces que usó condón en toda la vida',3,1),(58,'TÚ cuántas veces relaciones sexo últimos 3 meses ',NULL,'./videos/Pregunta58.mp4',11,'Número relaciones últimos 3 meses',3,1),(59,'TÚ cuántas veces usar condón últimos 3 meses',NULL,'./videos/Pregunta59.mp4',12,'Número de veces usó condón últimos 3 meses',3,1),(60,'TÚ cuántas parejas (novio/a, esposo/a, amigo/a) para sexo hasta ahora',NULL,'./videos/Pregunta60.mp4',13,'Número de parejas sexuales en toda la vida',3,1),(61,'TÚ cuántas veces tener relaciones sexo personas otras NO novio o novia',NULL,'./videos/Pregunta61.mp4',14,'Número de relaciones sexuales con desconocidos',3,1),(62,'TÚ tener relaciones sexo otra persona NO novios o novias cuántas veces USAR CONDÓN',NULL,'./videos/Pregunta62.mp4',15,'Número de veces usó condón con personas desconocidas',3,1),(63,'TÚ después PRIMERO relación sexo de tu primera relación sexual otra persona a fuerza y TÚ NO gusta o NO quiere',NULL,'./videos/Pregunta63.mp4',16,'Relaciones forzadas subsecuentes',3,1),(64,'TÚ ya antes embarazada o TÚ embarazar tu novia',NULL,'./videos/Pregunta64.mp4',17,'Haber tenido un embarazo',3,1),(65,'TÚ o tu novia aborto bebé',NULL,'./videos/Pregunta65.mp4',18,'Haber tenido un aborto',3,1),(66,'TÚ antes o ahora hay sexo homosexual (gay, lesbiana)',NULL,'./videos/Pregunta66.mp4',19,'Relaciones homosexuales',3,1),(67,'TÚ ya antes o ahora ir laboratorio prueba para ver hay INFECCIÓN sexo',NULL,'./videos/Pregunta67.mp4',20,'Hacerse pruebas para ITS',3,1),(68,'TÚ hay antes o ahora INFECCIÓN sexo',NULL,'./videos/Pregunta68.mp4',21,'Haber tenido alguna ITS',3,1),(69,'PERSONA tocar TU CUERPO (partes íntimas) a fuerza TÚ NO gusta o NO quiere',NULL,'./videos/Pregunta69.mp4',22,'Tocar partes íntimas a fuerza',3,1),(70,'PERSONA dice TÚ tocar tu cuerpo a fuerza, TÚ NO quiere o NO gusta',NULL,'./videos/Pregunta70.mp4',23,'Alguien te pide que a fuerza toques tus partes íntimas',3,1),(71,'PERSONA dice TÚ quitar ropa para ver cuerpo a fuerza, TÚ NO quiere o NO gusta',NULL,'./videos/Pregunta71.mp4',24,'Alguien te ha forzado a quitarte la ropa para ver tu cuerpo',3,1),(72,'TÚ y tu novio(a) poner condón al revés y después voltea condón para poner bien',NULL,'./videos/Pregunta72.mp4',1,'Falla 1: ponerse el condón al revés',4,1),(73,'TÚ y tu novio(a) hay sexo SIN condón y ANTES eyacular (moco blanco hombre) poner condón pene',NULL,'./videos/Pregunta73.mp4',2,'Falla 2: ponerse el condón después de penetración',4,1),(74,'TÚ y tu novio(a) poner condón cuando pene NO erecto (NO duro).',NULL,'./videos/Pregunta74.mp4',3,'Falla 3: Poner condón cuando pene no está erecto',4,1),(75,'TÚ antes usar condón ver fecha para NO viejo',NULL,'./videos/Pregunta75.mp4',4,'Falla 4: Revisar fecha caducidad',4,1),(76,'TÚ y tu novio(a) quitar condón pene DÉBIL, DORMIDO (NO ERECTO)',NULL,'./videos/Pregunta76.mp4',5,'Falla 5: Quitar condón cuando pene no está erecto',4,1),(77,'TÚ y tu novio(a) poner condón pene deja  aire punta',NULL,'./videos/Pregunta77.mp4',6,'Falla 6: poner condón dejando aire en la punta',4,1),(78,'TÚ y tu novio(a) rompe condón cuando hay sexo',NULL,'./videos/Pregunta78.mp4',7,'Ruptura del condón',4,1),(79,'TÚ y tu novio(a) hay sexo condón adentro vagina, pene no tiene condón',NULL,'./videos/Pregunta79.mp4',8,'Deslizamiento del condón',4,1),(80,'TÚ piensa cuando CONDÓN calor sol, guardar pantalón o cartera (dinero) ya no sirve',NULL,'./videos/Pregunta80.mp4',1,'Conocimientos uso condón 1. Exponer condones al calor.',5,1),(81,'CONDÓN cuya fecha de caducidad vence en año puede usarse sin riesgo de que se rompa',NULL,'./videos/Pregunta81.mp4',2,'Conocimiento uso condón 2. Condón que está por vencer su caducidad en un año',5,1),(82,'Antes abrir bolsa dentro condón TÚ baja condón con dedos, después abrir para no romper condón',NULL,'./videos/Pregunta82.mp4',3,'Conocimiento uso condón 3. Recorrer el condón para evitar que se dañe',5,1),(83,'Los lubricantes a base de agua deben usarse sólo con condones de látex',NULL,'./videos/Pregunta83.mp4',4,'Conocimiento uso condón 4. Lubricantes a base de agua y condones de látex',5,1),(84,'Cuando se coloca un condón en el pene NO dejar aire punta',NULL,'./videos/Pregunta84.mp4',5,'Conocimiento uso condón 5. No dejar espacio en la punta del condón',5,1),(85,'Es necesario colocar el condón hasta la base del pene porque si no se desliza durante el acto sexual',NULL,'./videos/Pregunta85.mp4',6,'Conocimiento uso condón 6. Poner condón hasta la base del pene',5,1),(86,'Infeccion VIH hay diarrea, calentura, sudar noche y pierde peso (flaco)',NULL,'./videos/Pregunta86.mp4',7,'Conocimiento ETS 1. Síntomas VIH',5,1),(87,'VIH pega usar jeringas desechables y esterilizadas',NULL,'./videos/Pregunta87.mp4',8,'Conocimiento ETS 2. Transmisión VIH por jeringas desechables',5,1),(88,'Tener relaciones sexuales con la misma pareja sana disminuye el riesgo de infectarse con VIH',NULL,'./videos/Pregunta88.mp4',9,'Conocimiento ETS 3. Relaciones sexuales con la misma pareja',5,1),(89,'Gonorrea, Clamidia y Tricomoniasis INFECCIONES SEXO no puede curar doctor',NULL,'./videos/Pregunta89.mp4',10,'Conocimiento ETS 4. ETS que no pueden curarse con tratamiento médico',5,1),(90,'Métodos anticonceptivos, PASTILLAS PARA NO BEBÉ ayuda para NO INFECCIONES SEXO',NULL,'./videos/Pregunta90.mp4',11,'Conocimiento ETS 5. Métodos anticonceptivos orales y enfermedades de transmisión sexual',5,1),(91,'Tener relaciones sexuales sin penetración evita contraer algunas infecciones de transmisión sexual',NULL,'./videos/Pregunta91.mp4',12,'Conocimientos ETS 6. Relaciones sexuales sin penetración',5,1),(92,'Mujer hay INFECCIÓN SEXO puede aborto bebé o bebé nace antes. Hombre o mujer NO PUEDE HIJOS después',NULL,'./videos/Pregunta92.mp4',13,'Conocimiento ETS 7. Infecciones de transmisión sexual provocan abortos, partos prematuros',5,1),(93,'Virus del papiloma humano puede CÁNCER',NULL,'./videos/Pregunta93.mp4',14,'Conocimientos ETS 8. Virus papiloma humano provoca cáncer',5,1);
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'joven con discapacidad','Jóven con discapacidad auditiva y contesta el cuestionario'),(2,'administrativo','encargado de dar mantenimiento al catalogo de secciones, preguntas e incisos'),(3,'administrador','encargado de dar mantenimiento general al sistema');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_permiso`
--

DROP TABLE IF EXISTS `rol_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol_permiso` (
  `id_rol_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  PRIMARY KEY (`id_rol_permiso`),
  KEY `f2_idx` (`id_rol`),
  KEY `f3_idx` (`id_permiso`),
  CONSTRAINT `f2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  CONSTRAINT `f3` FOREIGN KEY (`id_permiso`) REFERENCES `permiso` (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_permiso`
--

LOCK TABLES `rol_permiso` WRITE;
/*!40000 ALTER TABLE `rol_permiso` DISABLE KEYS */;
INSERT INTO `rol_permiso` VALUES (1,1,1),(2,2,1),(3,2,2),(4,3,3);
/*!40000 ALTER TABLE `rol_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seccion`
--

DROP TABLE IF EXISTS `seccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seccion` (
  `id_seccion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `ruta_imagen` varchar(100) DEFAULT NULL,
  `ruta_video` varchar(100) DEFAULT NULL,
  `secuencia` int(11) DEFAULT NULL,
  `es_final` tinyint(1) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT '1',
  `descripcion` text,
  PRIMARY KEY (`id_seccion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seccion`
--

LOCK TABLES `seccion` WRITE;
/*!40000 ALTER TABLE `seccion` DISABLE KEYS */;
INSERT INTO `seccion` VALUES (1,'SECCIÓN I: DATOS GENERALES',NULL,'./videos/Seccion1.mp4',1,0,1,''),(2,'SECCIÓN II: COMUNICACIÓN CON PADRES',NULL,'./videos/Seccion2.mp4',2,0,1,''),(3,'SECCIÓN III: COMPORTAMIENTO SEXUAL',NULL,'./videos/Seccion3.mp4',3,0,1,''),(4,'SECCIÓN III: COMPORTAMIENTO SEXUAL ÚLTIMOS 6 MESES',NULL,'./videos/Seccion4.mp4',4,0,1,''),(5,'SECCIÓN IV:  CONOCIMIENTOS',NULL,'./videos/Seccion5.mp4',5,0,1,''),(6,'Gracias Por ayudar',NULL,'./videos/Seccion6.mp4',6,1,1,'Gracias Por ayudar');
/*!40000 ALTER TABLE `seccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) DEFAULT NULL,
  `name_login` varchar(20) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `ultima_pregunta_contestada_id` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `f1_idx` (`id_rol`),
  KEY `f6_idx` (`id_persona`),
  CONSTRAINT `f1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  CONSTRAINT `f6` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,'susana','susana',1,1,NULL,2),(2,2,'bety','bety',1,1,NULL,2),(3,3,'yuma','yuma',1,1,NULL,2),(4,4,'jorge','jorge',1,1,NULL,3),(5,5,'diana','diana',1,1,NULL,3),(6,6,'folio','ejemplo',1,1,NULL,1),(7,7,'folio','JU227',1,1,93,1),(8,8,'folio','JU228',1,1,93,1),(9,9,'folio','JU239',1,1,19,1),(10,10,'folio','JU2410',1,1,93,1),(11,11,'folio','JU2411',1,1,8,1),(12,12,'folio','SE812',1,1,NULL,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_respuesta`
--

DROP TABLE IF EXISTS `usuario_respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_respuesta` (
  `id_usuario_respuesta` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `id_inciso` int(11) DEFAULT NULL,
  `fecha_hora_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `comentario` varchar(20) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario_respuesta`),
  KEY `f7_idx` (`id_usuario`),
  KEY `f8_idx` (`id_inciso`),
  CONSTRAINT `f7` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f8` FOREIGN KEY (`id_inciso`) REFERENCES `inciso` (`id_inciso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_respuesta`
--

LOCK TABLES `usuario_respuesta` WRITE;
/*!40000 ALTER TABLE `usuario_respuesta` DISABLE KEYS */;
INSERT INTO `usuario_respuesta` VALUES (1,8,1,2,'2015-06-23 03:16:44',NULL,NULL),(2,8,2,NULL,'2015-06-23 03:16:50','5',NULL),(3,8,3,86,'2015-06-23 03:16:52',NULL,NULL),(4,8,4,NULL,'2015-06-23 03:16:59','12',NULL),(5,8,5,182,'2015-06-23 03:17:02',NULL,NULL),(6,8,6,205,'2015-06-23 03:17:06',NULL,NULL),(7,8,7,230,'2015-06-23 03:17:07',NULL,NULL),(8,8,8,279,'2015-06-23 03:17:11',NULL,NULL),(9,8,9,310,'2015-06-23 03:17:12',NULL,NULL),(10,8,10,6,'2015-06-23 03:17:14',NULL,NULL),(11,8,11,9,'2015-06-23 03:17:16',NULL,NULL),(12,8,12,NULL,'2015-06-23 03:17:24','26',NULL),(13,8,13,NULL,'2015-06-23 03:17:29','12',NULL),(14,8,14,11,'2015-06-23 03:18:15',NULL,NULL),(15,8,15,18,'2015-06-23 03:18:17',NULL,NULL),(16,8,16,26,'2015-06-23 03:18:18',NULL,NULL),(17,8,17,30,'2015-06-23 03:18:20',NULL,NULL),(18,8,18,31,'2015-06-23 03:19:14',NULL,NULL),(19,8,19,34,'2015-06-23 03:19:16',NULL,NULL),(20,8,20,35,'2015-06-23 03:19:28',NULL,NULL),(21,8,21,43,'2015-06-23 03:19:32',NULL,NULL),(22,8,22,45,'2015-06-23 03:19:36',NULL,NULL),(23,8,23,51,'2015-06-23 03:19:38',NULL,NULL),(24,8,24,55,'2015-06-23 03:19:41',NULL,NULL),(25,8,25,63,'2015-06-23 03:19:45',NULL,NULL),(26,8,26,69,'2015-06-23 03:19:48',NULL,NULL),(27,8,27,71,'2015-06-23 03:19:52',NULL,NULL),(28,8,28,75,'2015-06-23 03:19:55',NULL,NULL),(29,8,29,81,'2015-06-23 03:19:57',NULL,NULL),(30,8,30,90,'2015-06-23 03:20:02',NULL,NULL),(31,8,31,96,'2015-06-23 03:20:05',NULL,NULL),(32,8,32,97,'2015-06-23 03:20:21',NULL,NULL),(33,8,33,103,'2015-06-23 03:20:25',NULL,NULL),(34,8,34,111,'2015-06-23 03:20:30',NULL,NULL),(35,8,35,113,'2015-06-23 03:20:35',NULL,NULL),(36,8,36,117,'2015-06-23 03:20:39',NULL,NULL),(37,8,37,124,'2015-06-23 03:20:42',NULL,NULL),(38,8,38,131,'2015-06-23 03:20:50',NULL,NULL),(39,8,39,135,'2015-06-23 03:20:54',NULL,NULL),(40,8,40,137,'2015-06-23 03:20:57',NULL,NULL),(41,8,41,144,'2015-06-23 03:21:03',NULL,NULL),(42,8,42,147,'2015-06-23 03:21:10',NULL,NULL),(43,8,43,154,'2015-06-23 03:21:15',NULL,NULL),(44,8,44,160,'2015-06-23 03:21:19',NULL,NULL),(45,8,45,162,'2015-06-23 03:21:22',NULL,NULL),(46,8,46,171,'2015-06-23 03:21:27',NULL,NULL),(47,8,47,173,'2015-06-23 03:21:31',NULL,NULL),(48,8,48,177,'2015-06-23 03:21:40',NULL,NULL),(49,8,49,NULL,'2015-06-23 03:21:47','23',NULL),(50,8,50,185,'2015-06-23 03:21:52',NULL,NULL),(51,8,51,189,'2015-06-23 03:21:54',NULL,NULL),(52,8,52,190,'2015-06-23 03:21:57',NULL,NULL),(53,8,53,195,'2015-06-23 03:21:59',NULL,NULL),(54,8,54,197,'2015-06-23 03:22:01',NULL,NULL),(55,8,55,203,'2015-06-23 03:22:04',NULL,NULL),(56,8,56,NULL,'2015-06-23 03:22:10','12',NULL),(57,8,57,NULL,'2015-06-23 03:22:17','34',NULL),(58,8,58,NULL,'2015-06-23 03:22:23','50',NULL),(59,8,59,NULL,'2015-06-23 03:22:28','1',NULL),(60,8,60,213,'2015-06-23 03:22:31',NULL,NULL),(61,8,61,NULL,'2015-06-23 03:22:40','2',NULL),(62,8,62,NULL,'2015-06-23 03:22:49','12',NULL),(63,8,63,215,'2015-06-23 03:22:54',NULL,NULL),(64,8,64,217,'2015-06-23 03:22:58',NULL,NULL),(65,8,65,220,'2015-06-23 03:23:01',NULL,NULL),(66,8,66,221,'2015-06-23 03:23:10',NULL,NULL),(67,8,67,224,'2015-06-23 03:23:14',NULL,NULL),(68,8,68,225,'2015-06-23 03:23:22',NULL,NULL),(69,8,69,228,'2015-06-23 03:23:26',NULL,NULL),(70,8,70,231,'2015-06-23 03:23:29',NULL,NULL),(71,8,71,234,'2015-06-23 03:23:33',NULL,NULL),(72,8,72,235,'2015-06-23 03:24:00',NULL,NULL),(73,8,73,243,'2015-06-23 03:24:06',NULL,NULL),(74,8,74,249,'2015-06-23 03:24:09',NULL,NULL),(75,8,75,250,'2015-06-23 03:24:13',NULL,NULL),(76,8,76,255,'2015-06-23 03:24:18',NULL,NULL),(77,8,77,264,'2015-06-23 03:24:27',NULL,NULL),(78,8,78,265,'2015-06-23 03:24:31',NULL,NULL),(79,8,79,272,'2015-06-23 03:24:47',NULL,NULL),(80,8,80,280,'2015-06-23 03:25:07',NULL,NULL),(81,8,81,284,'2015-06-23 03:25:10',NULL,NULL),(82,8,82,288,'2015-06-23 03:25:12',NULL,NULL),(83,8,83,290,'2015-06-23 03:25:34',NULL,NULL),(84,8,84,292,'2015-06-23 03:25:37',NULL,NULL),(85,8,85,297,'2015-06-23 03:25:40',NULL,NULL),(86,8,86,298,'2015-06-23 03:25:43',NULL,NULL),(87,8,87,302,'2015-06-23 03:25:46',NULL,NULL),(88,8,88,304,'2015-06-23 03:26:05',NULL,NULL),(89,8,89,308,'2015-06-23 03:26:09',NULL,NULL),(90,8,90,314,'2015-06-23 03:26:12',NULL,NULL),(91,8,91,316,'2015-06-23 03:26:14',NULL,NULL),(92,8,92,318,'2015-06-23 03:26:17',NULL,NULL),(93,8,93,322,'2015-06-23 03:26:21',NULL,NULL),(94,9,1,2,'2015-06-23 16:48:20',NULL,NULL),(95,9,2,NULL,'2015-06-23 16:48:38','1',NULL),(96,9,3,85,'2015-06-23 16:48:40',NULL,NULL),(97,9,4,NULL,'2015-06-23 16:48:42','1',NULL),(98,9,5,179,'2015-06-23 16:48:43',NULL,NULL),(99,9,6,205,'2015-06-23 16:48:45',NULL,NULL),(100,9,7,229,'2015-06-23 16:48:46',NULL,NULL),(101,9,8,275,'2015-06-23 16:48:47',NULL,NULL),(102,9,9,310,'2015-06-23 16:48:48',NULL,NULL),(103,9,10,4,'2015-06-23 16:48:49',NULL,NULL),(104,9,11,9,'2015-06-23 16:48:50',NULL,NULL),(105,9,12,NULL,'2015-06-23 16:48:52','1',NULL),(106,9,13,NULL,'2015-06-23 16:48:54','1',NULL),(107,9,14,11,'2015-06-23 16:48:55',NULL,NULL),(108,9,15,17,'2015-06-23 16:48:56',NULL,NULL),(109,9,16,23,'2015-06-23 16:48:57',NULL,NULL),(110,9,17,29,'2015-06-23 16:48:58',NULL,NULL),(111,9,18,31,'2015-06-23 16:48:59',NULL,NULL),(112,9,19,33,'2015-06-23 16:49:00',NULL,NULL),(113,10,1,2,'2015-06-25 00:09:17',NULL,NULL),(114,10,2,NULL,'2015-06-25 00:09:31','66',NULL),(115,10,3,86,'2015-06-25 00:09:34',NULL,NULL),(116,10,4,NULL,'2015-06-25 00:09:37','66',NULL),(117,10,5,179,'2015-06-25 00:09:40',NULL,NULL),(118,10,6,206,'2015-06-25 00:09:42',NULL,NULL),(119,10,7,229,'2015-06-25 00:09:44',NULL,NULL),(120,10,8,276,'2015-06-25 00:09:46',NULL,NULL),(121,10,9,310,'2015-06-25 00:09:48',NULL,NULL),(122,10,10,5,'2015-06-25 00:09:49',NULL,NULL),(123,10,11,9,'2015-06-25 00:09:51',NULL,NULL),(124,10,12,NULL,'2015-06-25 00:09:54','66',NULL),(125,10,13,NULL,'2015-06-25 00:09:58','66',NULL),(126,10,14,11,'2015-06-25 00:10:00',NULL,NULL),(127,10,15,18,'2015-06-25 00:10:01',NULL,NULL),(128,10,16,23,'2015-06-25 00:10:04',NULL,NULL),(129,10,17,30,'2015-06-25 00:10:05',NULL,NULL),(130,10,18,31,'2015-06-25 00:10:09',NULL,NULL),(131,10,19,34,'2015-06-25 00:10:11',NULL,NULL),(132,10,20,35,'2015-06-25 00:10:14',NULL,NULL),(133,10,21,41,'2015-06-25 00:10:17',NULL,NULL),(134,10,22,45,'2015-06-25 00:10:18',NULL,NULL),(135,10,23,51,'2015-06-25 00:10:19',NULL,NULL),(136,10,24,55,'2015-06-25 00:10:24',NULL,NULL),(137,10,25,61,'2015-06-25 00:10:25',NULL,NULL),(138,10,26,65,'2015-06-25 00:10:28',NULL,NULL),(139,10,27,71,'2015-06-25 00:10:29',NULL,NULL),(140,10,28,75,'2015-06-25 00:10:30',NULL,NULL),(141,10,29,81,'2015-06-25 00:10:32',NULL,NULL),(142,10,30,87,'2015-06-25 00:10:34',NULL,NULL),(143,10,31,93,'2015-06-25 00:10:37',NULL,NULL),(144,10,32,97,'2015-06-25 00:10:38',NULL,NULL),(145,10,33,103,'2015-06-25 00:10:39',NULL,NULL),(146,10,34,107,'2015-06-25 00:10:41',NULL,NULL),(147,10,35,113,'2015-06-25 00:10:43',NULL,NULL),(148,10,36,117,'2015-06-25 00:10:48',NULL,NULL),(149,10,37,123,'2015-06-25 00:10:49',NULL,NULL),(150,10,38,127,'2015-06-25 00:10:53',NULL,NULL),(151,10,39,133,'2015-06-25 00:10:54',NULL,NULL),(152,10,40,137,'2015-06-25 00:10:55',NULL,NULL),(153,10,41,143,'2015-06-25 00:10:57',NULL,NULL),(154,10,42,147,'2015-06-25 00:10:59',NULL,NULL),(155,10,43,153,'2015-06-25 00:11:01',NULL,NULL),(156,10,44,157,'2015-06-25 00:11:02',NULL,NULL),(157,10,45,163,'2015-06-25 00:11:03',NULL,NULL),(158,10,46,167,'2015-06-25 00:11:05',NULL,NULL),(159,10,47,173,'2015-06-25 00:11:06',NULL,NULL),(160,10,48,178,'2015-06-25 00:11:11',NULL,NULL),(161,10,49,NULL,'2015-06-25 00:11:11','98',NULL),(162,10,50,NULL,'2015-06-25 00:11:12','98',NULL),(163,10,51,NULL,'2015-06-25 00:11:12','98',NULL),(164,10,52,NULL,'2015-06-25 00:11:12','98',NULL),(165,10,53,NULL,'2015-06-25 00:11:12','98',NULL),(166,10,54,NULL,'2015-06-25 00:11:12','98',NULL),(167,10,55,NULL,'2015-06-25 00:11:12','98',NULL),(168,10,56,NULL,'2015-06-25 00:11:12','98',NULL),(169,10,57,NULL,'2015-06-25 00:11:12','98',NULL),(170,10,58,NULL,'2015-06-25 00:11:12','98',NULL),(171,10,59,NULL,'2015-06-25 00:11:12','98',NULL),(172,10,60,NULL,'2015-06-25 00:11:12','98',NULL),(173,10,61,NULL,'2015-06-25 00:11:12','98',NULL),(174,10,62,NULL,'2015-06-25 00:11:12','98',NULL),(175,10,63,NULL,'2015-06-25 00:11:12','98',NULL),(176,10,64,NULL,'2015-06-25 00:11:12','98',NULL),(177,10,65,NULL,'2015-06-25 00:11:12','98',NULL),(178,10,66,NULL,'2015-06-25 00:11:12','98',NULL),(179,10,67,NULL,'2015-06-25 00:11:12','98',NULL),(180,10,68,NULL,'2015-06-25 00:11:12','98',NULL),(181,10,69,NULL,'2015-06-25 00:11:12','98',NULL),(182,10,70,NULL,'2015-06-25 00:11:12','98',NULL),(183,10,71,NULL,'2015-06-25 00:11:12','98',NULL),(184,10,72,235,'2015-06-25 00:11:38',NULL,NULL),(185,10,73,241,'2015-06-25 00:11:40',NULL,NULL),(186,10,74,245,'2015-06-25 00:11:42',NULL,NULL),(187,10,75,251,'2015-06-25 00:11:43',NULL,NULL),(188,10,76,255,'2015-06-25 00:11:44',NULL,NULL),(189,10,77,261,'2015-06-25 00:11:45',NULL,NULL),(190,10,78,265,'2015-06-25 00:11:47',NULL,NULL),(191,10,79,271,'2015-06-25 00:11:48',NULL,NULL),(192,10,80,280,'2015-06-25 00:15:29',NULL,NULL),(193,10,81,284,'2015-06-25 00:15:30',NULL,NULL),(194,10,82,286,'2015-06-25 00:15:31',NULL,NULL),(195,10,83,290,'2015-06-25 00:15:33',NULL,NULL),(196,10,84,292,'2015-06-25 00:15:34',NULL,NULL),(197,10,85,296,'2015-06-25 00:15:35',NULL,NULL),(198,10,86,298,'2015-06-25 00:15:36',NULL,NULL),(199,10,87,302,'2015-06-25 00:15:38',NULL,NULL),(200,10,88,304,'2015-06-25 00:15:39',NULL,NULL),(201,10,89,308,'2015-06-25 00:15:40',NULL,NULL),(202,10,90,312,'2015-06-25 00:15:41',NULL,NULL),(203,10,91,316,'2015-06-25 00:15:42',NULL,NULL),(204,10,92,318,'2015-06-25 00:15:43',NULL,NULL),(205,10,93,322,'2015-06-25 00:15:44',NULL,NULL),(206,7,12,NULL,'2015-06-25 00:40:21','40',NULL),(207,7,12,NULL,'2015-06-25 00:44:55','42',NULL),(208,7,13,NULL,'2015-06-25 00:44:58','41',NULL),(209,7,14,12,'2015-06-25 00:44:59',NULL,NULL),(210,7,15,17,'2015-06-25 00:45:01',NULL,NULL),(211,7,16,26,'2015-06-25 00:45:03',NULL,NULL),(212,7,17,29,'2015-06-25 00:45:04',NULL,NULL),(213,7,18,32,'2015-06-25 00:45:06',NULL,NULL),(214,7,19,33,'2015-06-25 00:45:07',NULL,NULL),(215,7,20,35,'2015-06-25 00:45:11',NULL,NULL),(216,7,21,41,'2015-06-25 00:45:12',NULL,NULL),(217,7,22,45,'2015-06-25 00:45:13',NULL,NULL),(218,7,23,51,'2015-06-25 00:45:14',NULL,NULL),(219,7,24,55,'2015-06-25 00:45:15',NULL,NULL),(220,7,25,62,'2015-06-25 00:45:16',NULL,NULL),(221,7,26,67,'2015-06-25 00:45:18',NULL,NULL),(222,7,27,72,'2015-06-25 00:45:19',NULL,NULL),(223,7,28,77,'2015-06-25 00:45:21',NULL,NULL),(224,7,29,82,'2015-06-25 00:45:22',NULL,NULL),(225,7,29,82,'2015-06-25 00:45:22',NULL,NULL),(226,7,30,89,'2015-06-25 00:45:23',NULL,NULL),(227,7,30,89,'2015-06-25 00:45:23',NULL,NULL),(228,7,31,94,'2015-06-25 00:45:24',NULL,NULL),(229,7,31,94,'2015-06-25 00:45:24',NULL,NULL),(230,7,31,94,'2015-06-25 00:45:24',NULL,NULL),(231,7,31,94,'2015-06-25 00:45:24',NULL,NULL),(232,7,32,99,'2015-06-25 00:45:25',NULL,NULL),(233,7,32,99,'2015-06-25 00:45:25',NULL,NULL),(234,7,32,99,'2015-06-25 00:45:25',NULL,NULL),(235,7,33,104,'2015-06-25 00:45:26',NULL,NULL),(236,7,34,108,'2015-06-25 00:45:28',NULL,NULL),(237,7,35,116,'2015-06-25 00:45:30',NULL,NULL),(238,7,36,118,'2015-06-25 00:45:33',NULL,NULL),(239,7,37,122,'2015-06-25 00:45:35',NULL,NULL),(240,7,38,130,'2015-06-25 00:45:37',NULL,NULL),(241,7,39,136,'2015-06-25 00:45:38',NULL,NULL),(242,7,40,137,'2015-06-25 00:45:39',NULL,NULL),(243,7,41,142,'2015-06-25 00:45:41',NULL,NULL),(244,7,42,150,'2015-06-25 00:45:41',NULL,NULL),(245,7,43,156,'2015-06-25 00:45:43',NULL,NULL),(246,7,44,157,'2015-06-25 00:45:45',NULL,NULL),(247,7,45,162,'2015-06-25 00:45:47',NULL,NULL),(248,7,46,168,'2015-06-25 00:45:49',NULL,NULL),(249,7,47,172,'2015-06-25 00:45:51',NULL,NULL),(250,7,48,178,'2015-06-25 00:46:11',NULL,NULL),(251,7,49,NULL,'2015-06-25 00:46:11','98',NULL),(252,7,50,NULL,'2015-06-25 00:46:11','98',NULL),(253,7,51,NULL,'2015-06-25 00:46:11','98',NULL),(254,7,52,NULL,'2015-06-25 00:46:11','98',NULL),(255,7,53,NULL,'2015-06-25 00:46:11','98',NULL),(256,7,54,NULL,'2015-06-25 00:46:11','98',NULL),(257,7,55,NULL,'2015-06-25 00:46:11','98',NULL),(258,7,56,NULL,'2015-06-25 00:46:11','98',NULL),(259,7,57,NULL,'2015-06-25 00:46:11','98',NULL),(260,7,58,NULL,'2015-06-25 00:46:11','98',NULL),(261,7,59,NULL,'2015-06-25 00:46:11','98',NULL),(262,7,60,NULL,'2015-06-25 00:46:11','98',NULL),(263,7,61,NULL,'2015-06-25 00:46:11','98',NULL),(264,7,62,NULL,'2015-06-25 00:46:11','98',NULL),(265,7,63,NULL,'2015-06-25 00:46:11','98',NULL),(266,7,64,NULL,'2015-06-25 00:46:11','98',NULL),(267,7,65,NULL,'2015-06-25 00:46:11','98',NULL),(268,7,66,NULL,'2015-06-25 00:46:11','98',NULL),(269,7,67,NULL,'2015-06-25 00:46:11','98',NULL),(270,7,68,NULL,'2015-06-25 00:46:11','98',NULL),(271,7,69,NULL,'2015-06-25 00:46:12','98',NULL),(272,7,70,NULL,'2015-06-25 00:46:12','98',NULL),(273,7,71,NULL,'2015-06-25 00:46:12','98',NULL),(274,7,72,235,'2015-06-25 00:46:15',NULL,NULL),(275,7,73,241,'2015-06-25 00:46:16',NULL,NULL),(276,7,74,248,'2015-06-25 00:46:18',NULL,NULL),(277,7,75,250,'2015-06-25 00:46:20',NULL,NULL),(278,7,76,257,'2015-06-25 00:46:21',NULL,NULL),(279,7,77,264,'2015-06-25 00:46:22',NULL,NULL),(280,7,78,266,'2015-06-25 00:46:24',NULL,NULL),(281,7,79,274,'2015-06-25 00:46:25',NULL,NULL),(282,7,80,282,'2015-06-25 00:46:29',NULL,NULL),(283,7,81,285,'2015-06-25 00:46:31',NULL,NULL),(284,7,82,288,'2015-06-25 00:46:32',NULL,NULL),(285,7,83,290,'2015-06-25 00:46:33',NULL,NULL),(286,7,84,292,'2015-06-25 00:46:35',NULL,NULL),(287,7,85,297,'2015-06-25 00:46:37',NULL,NULL),(288,7,86,298,'2015-06-25 00:46:38',NULL,NULL),(289,7,87,303,'2015-06-25 00:46:39',NULL,NULL),(290,7,88,304,'2015-06-25 00:46:40',NULL,NULL),(291,7,89,309,'2015-06-25 00:46:42',NULL,NULL),(292,7,90,313,'2015-06-25 00:46:43',NULL,NULL),(293,7,91,316,'2015-06-25 00:46:44',NULL,NULL),(294,7,92,319,'2015-06-25 00:46:45',NULL,NULL),(295,7,93,322,'2015-06-25 00:46:46',NULL,NULL),(296,11,1,2,'2015-06-25 00:49:27',NULL,NULL),(297,11,2,NULL,'2015-06-25 00:49:32','40',NULL),(298,11,3,85,'2015-06-25 00:51:26',NULL,NULL),(299,11,4,NULL,'2015-06-25 00:51:30','45',NULL),(300,11,5,179,'2015-06-25 00:51:32',NULL,NULL),(301,11,6,206,'2015-06-25 00:51:44',NULL,NULL),(302,11,7,229,'2015-06-25 00:51:46',NULL,NULL),(303,11,8,276,'2015-06-25 00:51:47',NULL,NULL);
/*!40000 ALTER TABLE `usuario_respuesta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-11 16:08:31
