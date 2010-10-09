-- MySQL dump 10.13  Distrib 5.1.25-rc, for Win32 (ia32)
--
-- Host: localhost    Database: vitaflo_sistema
-- ------------------------------------------------------
-- Server version	5.1.25-rc-community

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
-- Create schema vitaflo_sistema
--
CREATE DATABASE IF NOT EXISTS vitaflo_sistema;
USE vitaflo_sistema;

GRANT all ON vitaflo_sistema.* TO 'vitaflo'@'localhost' IDENTIFIED BY 'java1234';


--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  `address` varchar(45) NOT NULL DEFAULT '',
  `telephone` varchar(45) NOT NULL DEFAULT '',
  `email` varchar(45) NOT NULL DEFAULT '',
  `status` enum('Enabled','Disabled') NOT NULL DEFAULT 'Enabled',
  `contact` varchar(45) NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK334B8608D5F7034F` (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'OSPIA','Venezuela 2386','4383-9026','','Enabled','',0,NULL,1),(2,'DroguerÃ­a Itati','Gobernador Pedro FerrÃ© 1878','03783-430595/436225','','Enabled','',0,NULL,1),(3,'DroguerÃ­a Zeus','Avda. Cabret 1916 (Posadas)','03752-438900','','Enabled','',0,NULL,1),(4,'OSECAC','Moreno 648 (Capital Federal)','4332-4217','','Enabled','',0,NULL,1),(5,'Obra Social Jefes de Oficiales Navales','24 de Noviembre 645','4932-8079','','Enabled','',0,NULL,1),(6,'NÃ©stor Mainardi','Urquiza 225 (CÃ³rdoba)','03562-422502','','Disabled','',0,NULL,1),(7,'Droguer&Atilde;&shy;a Central','NO','NO','','Disabled','',0,NULL,1),(8,'Hospital FrancÃ©s','La Rioja 951','4959-1500','','Enabled','',0,NULL,1),(9,'DASPU OBRA SOCIAL','NO','NO','','Enabled','',0,NULL,1),(10,'Fundo Estadual de Saude do Parana','Rua Piquiri, 170, Reboucas. Curitiba, Parana,','NO','','Enabled','',0,NULL,1),(11,'DroguerÃ­a San Miguel','San Martin 2102 (Posadas)','03752-431652','','Enabled','',0,NULL,1),(12,'Obra Social Personal de Farmacia','ConstituciÃ³n 2066','4941-1342','','Enabled','',0,NULL,1),(13,'I.N.S.S.J.P','PerÃº 169 5Â°A','4344-8701','','Enabled','',0,NULL,1),(14,'Hospital Garrahan','Combate de los Pozos 1881','4308-4300','','Enabled','',0,NULL,1),(15,'CEMECO','CÃ³rdoba','NO','','Enabled','',0,NULL,1),(16,'Corbiet SA','C&Atilde;&sup3;rdoba','NO','','Enabled','',0,NULL,1),(17,'Sin Obra Social','NO','NO','','Enabled','',0,NULL,1),(18,'Drogueria Pharmers SRL','NO','NO','','Enabled','',0,NULL,1),(19,'Biofar','Lopez y Planes 551 (Resistencia, Chaco)','(03722) 441212/442772','','Enabled','',1,NULL,2),(20,'Secretaria de Saude de Santa Catarina','Brasil','NO','','Enabled','',0,NULL,1),(21,'Libra','ARROYO GRANDE 2832.CP 11800. Montevideo. Urug','00598 2200 5521','','Enabled','',0,NULL,1),(22,'Smata','CÃ³rdoba','NO','','Enabled','',0,NULL,1),(23,'Instituto de PrevisiÃ³n y Seguridad Social','TucumÃ¡n','NO','','Enabled','',0,NULL,1),(24,'Drogueria Mar','Chaco','03783-478400','','Enabled','',0,NULL,1),(25,'IOSE','NO','NO','','Enabled','',0,NULL,1),(26,'Instituto del niÃ±o (Ecuador)','Ecuador','NO','','Enabled','',0,NULL,1),(27,'OSPE','Rodriguez PeÃ±a 538','4373-5740/4371/8957','','Enabled','',0,NULL,1),(28,'Helio Segouras','Brazil','NO','','Enabled','',0,NULL,1),(29,'Rafael Elizalde','NO','NO','','Enabled','',0,NULL,1),(30,'Swan Medicare','Denmark','+45 33 88 10 00','','Enabled','',0,NULL,1),(31,'Cassia Sana','Brasil','NO','','Enabled','',0,NULL,1),(32,'Isabel Magnano','Brasil','NO','','Enabled','',0,NULL,1),(33,'Ramiro Cabrero','Brasil','NO','','Enabled','',0,NULL,1),(34,'ProtecciÃ³n Social de Ecuador','Ecuador','NO','','Enabled','',0,NULL,1),(35,'CompaÃ±ia de Servicios FarmacÃ©uticos','NO','NO','NO','Enabled','',0,NULL,1),(36,'Hospital Italiano','GascÃ³n 450','4959-0200','Gabriela.Fraschetti@hospitalitaliano.org.ar','Enabled','',0,NULL,1),(37,'Peralta','Diagonal TucumÃ¡n 1193.Martnez','4798-5152/154404-9480','','Enabled','',0,NULL,1),(38,'OSPECOR','NO','NO','gralbard@yahoo.com.ar','Enabled','Graciela',0,NULL,1),(39,'Instituto Dorrego','3 de febrero 748.Rosario','(0341)4202411','farmacia@institutodorrego.com.ar','Enabled','',0,NULL,1),(40,'Gina Marinho','Brasil','NO','NO','Enabled','',0,NULL,1),(41,'Alfonso RamÃ³n DarÃ­o','Chaco','no','no','Enabled','no',0,NULL,1),(42,'Consulado Paraguay','no','no','iralabernal@hotmail.com','Enabled','',0,NULL,1),(43,'SES','Brasil','(51) 3288-5982','ceres@saude.rs.gov.br','Enabled','Ceres Salazar',0,NULL,1),(44,'Ministerio de Desarrollo Social','no','4121-4604/4121-4611','no','Enabled','Dr Silvio Presa',0,NULL,1),(45,'Galeno ','no','no','no','Enabled','J.C.Laporta',0,NULL,1),(46,'Juan','test address','45454465','test@email.com','Enabled','Cirilo',0,NULL,1),(49,'Joâo','Jobim','4452-9802','joao@jobim.com','Enabled','no',0,NULL,2);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `countries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,0,'AR','Argentina'),(2,0,'BR','Brasil'),(3,0,'CL','Chile'),(4,0,'UY','Uruguay');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drugs`
--

DROP TABLE IF EXISTS `drugs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `drugs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  `status` enum('Enabled','Disabled') NOT NULL DEFAULT 'Enabled',
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `drugs`
--

LOCK TABLES `drugs` WRITE;
/*!40000 ALTER TABLE `drugs` DISABLE KEYS */;
INSERT INTO `drugs` VALUES (2,'Fenilbutirato de Sodio','Enabled',0),(3,'Cisteamina','Enabled',0),(4,'Orphadin','Enabled',0),(5,'Ambetaine','Enabled',0),(7,'Fenilbutirato 250mg','Enabled',0),(8,'Hemina','Enabled',0),(9,'LNAA','Enabled',0),(11,'Lacrisert ','Enabled',0),(12,'Cidofovir','Enabled',0),(13,'dicloroacetato de sodio','Enabled',0);
/*!40000 ALTER TABLE `drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `proforma_id` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(45) NOT NULL DEFAULT '',
  `client_id` int(10) unsigned NOT NULL DEFAULT '0',
  `amount` float NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `status` enum('Pendiente','Pagada','Entregada') NOT NULL DEFAULT 'Pendiente',
  `concile` int(10) unsigned NOT NULL DEFAULT '0',
  `version` bigint(20) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `purchase_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK25F222E6250603F7` (`client_id`),
  KEY `FK25F222E68E8C9EED` (`proforma_id`),
  KEY `FK25F222E66E093105` (`proforma_id`),
  KEY `FK25F222E6E4BB2F65` (`purchase_id`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (2,'2008-07-30 12:19:02',71,'',17,0,'2008-07-30','Pendiente',0,0,NULL,NULL),(91,'2009-08-16 19:04:38',36,'1003',0,1078.56,'2009-08-16','Pendiente',0,3,NULL,2),(7,'2008-08-07 11:16:16',5,'177',5,0,'2008-01-14','Pagada',1,3,NULL,89),(8,'2008-08-07 11:16:58',6,'181',6,0,'2008-01-15','Pagada',0,3,NULL,1),(9,'2008-08-07 11:17:54',7,'183',1,0,'2008-02-07','Pagada',1,4,NULL,NULL),(10,'2008-08-07 11:19:10',8,'188',8,0,'2008-02-19','Pagada',0,0,NULL,NULL),(11,'2008-08-07 11:20:10',9,'189',9,0,'2008-02-19','Pagada',0,0,NULL,NULL),(12,'2008-08-07 11:24:39',11,'192',3,0,'2008-02-21','Pagada',1,0,NULL,NULL),(14,'2008-08-07 11:30:04',13,'232',12,0,'2008-07-07','Pendiente',0,0,NULL,NULL),(15,'2008-08-07 11:32:04',14,'186',1,0,'2008-02-19','Pagada',1,0,NULL,NULL),(16,'2008-08-07 11:33:41',15,'187',13,0,'2008-02-19','Pagada',1,0,NULL,NULL),(17,'2008-08-07 11:41:20',17,'185',4,0,'2008-02-18','Pagada',0,0,NULL,NULL),(18,'2008-08-07 11:53:48',20,'194',16,0,'2008-03-06','Pagada',1,1,NULL,90),(19,'2008-08-07 12:04:26',21,'191',17,0,'2008-02-21','Pagada',0,0,NULL,NULL),(20,'2008-08-07 12:05:48',22,'195',17,0,'2008-03-19','Pagada',1,0,NULL,NULL),(21,'2008-08-07 12:09:35',23,'200',3,0,'2008-04-11','Pagada',1,0,NULL,NULL),(22,'2008-08-07 12:12:07',25,'193',4,0,'2008-03-06','Pagada',1,0,NULL,NULL),(23,'2008-08-07 12:24:54',26,'199',8,0,'2008-04-11','Pagada',0,0,NULL,NULL),(24,'2008-08-07 12:26:39',27,'196',5,0,'2008-03-26','Pagada',1,0,NULL,NULL),(25,'2008-08-07 12:31:36',28,'197',1,0,'2008-03-26','Pagada',1,0,NULL,NULL),(26,'2008-08-07 12:36:16',29,'206',18,0,'2008-04-18','Pagada',1,0,NULL,NULL),(27,'2008-08-07 12:40:26',30,'208',19,0,'2008-05-13','Pagada',1,0,NULL,NULL),(28,'2008-08-07 12:49:16',31,'202',5,0,'2008-04-14','Pagada',1,0,NULL,NULL),(29,'2008-08-11 11:25:36',32,'203',1,0,'2008-04-14','Pagada',1,0,NULL,NULL),(30,'2008-08-11 11:28:52',33,'201',4,0,'2008-04-11','Pagada',1,0,NULL,NULL),(31,'2008-08-11 11:49:34',37,'211',1,0,'2008-05-19','Pagada',1,0,NULL,NULL),(32,'2008-08-11 11:50:30',38,'212',1,0,'2008-05-19','Pagada',1,0,NULL,NULL),(33,'2008-08-11 11:58:26',41,'207',21,0,'2008-05-15','Pagada',1,0,NULL,NULL),(34,'2008-08-11 12:01:24',42,'213',16,0,'2008-05-19','Pagada',1,0,NULL,NULL),(35,'2008-08-11 12:03:31',43,'213',8,0,'2008-05-19','Pagada',0,0,NULL,NULL),(36,'2008-08-11 12:05:49',44,'209',17,0,'2008-05-15','Pagada',1,0,NULL,NULL),(37,'2008-08-11 12:07:55',45,'218',22,0,'2008-06-11','Pagada',0,0,NULL,NULL),(38,'2008-08-11 12:09:28',46,'219',9,0,'2008-06-18','Pagada',0,0,NULL,NULL),(39,'2008-08-11 12:10:31',47,'215',21,0,'2008-05-22','Pagada',1,0,NULL,NULL),(40,'2008-08-11 12:11:44',48,'220',1,0,'2008-06-18','Pagada',1,0,NULL,NULL),(41,'2008-08-11 12:13:40',49,'221',5,0,'2008-06-18','Pagada',1,0,NULL,NULL),(42,'2008-08-11 12:15:21',50,'184',23,0,'2008-02-07','Pagada',1,0,NULL,NULL),(43,'2008-08-11 12:24:18',52,'216',4,0,'2008-05-26','Pagada',1,0,NULL,NULL),(44,'2008-08-11 12:26:36',53,'229',1,0,'2008-07-17','Pagada',0,0,NULL,NULL),(45,'2008-08-11 12:28:13',55,'217',10,0,'2008-05-27','Pagada',1,0,NULL,NULL),(46,'2008-08-11 12:33:17',57,'208',19,0,'2008-05-13','Pagada',0,0,NULL,NULL),(47,'2008-08-11 12:38:19',58,'223',12,0,'2008-06-30','Pagada',1,0,NULL,NULL),(48,'2008-08-11 12:39:32',59,'227',8,0,'2008-07-02','Pagada',0,0,NULL,NULL),(49,'2008-08-11 12:54:45',60,'222',4,0,'2008-06-18','Pagada',0,0,NULL,NULL),(50,'2008-08-11 12:56:54',61,'224',17,0,'2008-07-02','Pagada',0,0,NULL,NULL),(51,'2008-08-12 11:01:29',62,'228',11,0,'2008-02-07','Pagada',1,0,NULL,NULL),(52,'2008-08-12 11:07:39',64,'231',17,0,'2008-07-07','Pagada',0,0,NULL,NULL),(53,'2008-08-12 11:15:26',65,'229',1,0,'2008-07-17','Pagada',0,0,NULL,NULL),(54,'2008-08-12 11:30:33',66,'232',12,0,'2008-07-17','Pagada',1,0,NULL,NULL),(55,'2008-08-12 11:32:03',67,'233',25,0,'2008-07-17','Pagada',0,0,NULL,NULL),(56,'2008-08-12 11:35:12',69,'230',4,0,'2008-07-17','Pagada',1,0,NULL,NULL),(57,'2008-08-12 11:45:00',72,'224',28,0,'2008-07-02','Pagada',1,0,NULL,NULL),(58,'2008-09-26 13:01:15',105,'225',24,0,'2008-07-02','Pagada',1,0,NULL,NULL),(59,'2008-10-03 14:55:51',107,'234',11,0,'2008-07-31','Pagada',0,0,NULL,NULL),(60,'2008-10-03 15:01:49',82,'235',12,0,'2008-07-31','Pagada',0,0,NULL,NULL),(61,'2008-10-03 15:02:54',97,'236',10,0,'2008-08-13','Pagada',0,0,NULL,NULL),(62,'2008-10-03 15:04:33',81,'237',31,0,'2008-08-13','Pagada',1,0,NULL,NULL),(63,'2008-10-03 15:16:47',96,'238',1,0,'2008-08-20','Pagada',1,0,NULL,NULL),(64,'2008-10-03 15:26:50',108,'239',4,0,'2008-08-22','Pagada',1,0,NULL,NULL),(65,'2008-10-03 15:32:16',76,'240',5,0,'2008-08-22','Pagada',1,0,NULL,NULL),(66,'2008-10-03 15:33:25',87,'241',11,0,'2008-08-22','Pagada',1,0,NULL,NULL),(67,'2008-10-03 15:35:10',89,'242',13,0,'2008-09-02','Pagada',1,0,NULL,NULL),(68,'2008-10-03 15:36:50',93,'243',15,0,'2008-09-03','Pagada',0,0,NULL,NULL),(69,'2008-10-03 15:38:09',79,'244',16,0,'2008-09-03','Pagada',1,0,NULL,NULL),(70,'2008-10-03 15:42:12',109,'245',17,0,'2008-09-08','Pagada',0,0,NULL,NULL),(71,'2008-10-03 15:46:50',110,'246',12,0,'2008-08-09','Pagada',1,0,NULL,NULL),(72,'2008-10-03 15:47:39',86,'247',9,0,'2008-09-08','Pagada',0,0,NULL,NULL),(73,'2008-10-03 15:48:20',90,'248',29,0,'2008-09-08','Pagada',0,0,NULL,NULL),(74,'2008-10-03 15:49:07',92,'249',33,0,'2008-09-08','Pagada',0,0,NULL,NULL),(76,'2008-10-03 15:52:41',106,'251',1,200,'2008-09-12','Pagada',0,20,NULL,NULL),(77,'2008-10-03 15:56:56',100,'252',5,100,'2008-09-16','Pagada',0,16,NULL,NULL),(78,'2008-10-03 15:59:54',95,'253',4,0,'2008-09-19','Pagada',1,0,NULL,NULL),(79,'2008-10-03 16:01:42',85,'254',1,0,'2008-09-19','Pagada',1,0,NULL,NULL),(80,'2008-10-03 16:02:19',102,'255',5,0,'2008-09-23','Pendiente',1,0,NULL,NULL),(81,'2008-10-08 12:53:45',101,'256',29,0,'2008-09-29','Pendiente',0,0,NULL,NULL),(83,'2008-10-10 16:21:39',114,'190',35,0,'2008-02-19','Pagada',1,0,NULL,NULL),(84,'2008-10-10 16:46:09',115,'226',19,0,'2008-07-02','Pagada',1,0,NULL,NULL),(85,'2009-01-20 11:25:00',164,'292',1,0,'2009-01-12','Pagada',1,0,NULL,NULL),(86,'2009-01-30 14:19:09',176,'293',45,0,'2009-01-28','Pendiente',1,0,NULL,NULL),(87,'2009-01-30 14:20:21',173,'294',1,0,'2009-01-29','Pendiente',1,0,NULL,NULL),(88,'2009-08-16 14:26:43',18,'1000',0,394.67,'2009-08-16','Pendiente',0,1,NULL,NULL),(89,'2009-08-16 16:02:56',185,'1001',0,1000,'2009-08-16','Pendiente',0,1,NULL,NULL),(90,'2009-08-16 18:29:24',19,'20',0,567.98,'2009-08-16','Pendiente',0,1,NULL,NULL);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `text` text NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,1,'2009-02-01 23:31:18','asdf',2,0);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `patients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL DEFAULT '',
  `last_name` varchar(45) NOT NULL DEFAULT '',
  `client_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` enum('Enabled','Disabled') NOT NULL DEFAULT 'Enabled',
  `telephone` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK49A9760E250603F7` (`client_id`),
  KEY `FK49A9760EC07819E5` (`client_id`),
  KEY `FK49A9760ED5F7034F` (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Ignacio','Levandowsky',1,'Enabled','44427329','Carina Levandowsky (madre)',0,1),(2,'Facundo','Vallejos',2,'Enabled','03783430595','Drogueria Itati',0,1),(3,'JC','Rotta',3,'Enabled','0375415414701','Diego Rotta (padre)',0,1),(4,'Lucas','Contreras',4,'Enabled','02302434171 / 15488809 ','Marcela (madre)',0,1),(5,'Maximo','Tortolini',5,'Enabled','1551783880','Javier (padre)',0,1),(6,'Melina','Mainardi',22,'Enabled','03562422502','Nestor (padre)',0,1),(7,'Franco','Viggiano',8,'Enabled','','',0,1),(8,'Candela','Altamira',9,'Enabled','03543447044 / 156209922','Mariana (madre)',0,1),(9,'VGPF','VGPF',10,'Enabled','00551150817396','Instituto Canguru',0,1),(10,'Ariadna','Coronel',12,'Enabled','','',0,1),(11,'Marlene','Guercio',13,'Enabled','0222715440258 / 02272420354','Josefina (madre)',0,1),(12,'NO','NO',14,'Disabled','','',0,1),(13,'Natali','Singh',15,'Enabled','035145886473','CEMECO',0,1),(14,'Gianella','Maldonado',16,'Enabled','0351156795626','Nancy (madre)',0,1),(15,'Ricardo','Noriega',17,'Disabled','','',0,1),(16,'Alfonso','Sana',17,'Enabled','00551150817396','Instituto Canguru',0,1),(17,'Christian','Guanco',18,'Enabled','03884261758','Gustavo Poccioni (Drogueria)',0,1),(18,'Santino','Ocampo',19,'Enabled','0372215700656 / 15715560','Mariana (madre)',0,1),(19,'Arantxa','Sola',15,'Enabled','0358154298509','Paola (madre)',0,1),(20,'No','I',1,'Disabled','','',0,1),(21,'Sin','Identificar',17,'Enabled','','',0,1),(22,'Rosario','Zelaya',23,'Enabled','0381154441747','Queca',0,1),(23,'Gabriel','Marinho',17,'Enabled','00551150817396','Instituto Canguru',0,1),(24,'Mateo','Elizalde',17,'Enabled','48160772 / 1541499555','Rafael (padre) / Magda (madre)',0,1),(25,'Michael','Hernandez',25,'Enabled','0294415689023 / 15343832','Paula (madre)',0,1),(26,'Joaquin','Marchi',27,'Enabled','43726327','Alejandra (madre)',0,1),(27,'Helio','Segouras',17,'Enabled','00551150817396','Instituto Canguru',0,1),(28,'Catarina','Magnano',32,'Enabled','','Isabel Magnano',0,1),(29,'Matheus','Giovanella',20,'Enabled','00551150817396','Instituto Canguru',0,1),(30,'Rosaura','Lascano',34,'Enabled','','',0,1),(31,'Lautaro','Contreras',35,'Enabled','','',0,1),(32,'Micaela','Rodriguez',36,'Enabled','1556549423','Andrea (madre)',0,1),(33,'Victoria','Peralta',1,'Enabled','47985152','Maria (madre)',0,1),(34,'Micaela','Cabrera',14,'Enabled','3434','',0,1),(35,'Luisina','Zabala',38,'Enabled','03571470695 / 15698824','Angel (padre)',0,1),(36,'Nicolas','Molinas',19,'Enabled','03722441212','Arnaldo Claro (Biofar)',0,1),(37,'Estefania','Gimenez',39,'Enabled','0341420241','Santiago Pernigotti (Farmacia)',0,1),(38,'Busquet','Valentina',2,'Enabled','','',0,1),(39,'Paula','Laporta',45,'Enabled','4501-1288/1557108834','J.C.Laporta',0,1),(40,'test','ddd',11,'Enabled','dfdfd','',0,1);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  `drug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `status` enum('Enabled','Disabled') NOT NULL DEFAULT 'Enabled',
  `supplier_id` int(10) unsigned NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `presentation` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC42BD16458E8F475` (`supplier_id`),
  KEY `FKC42BD164770C72CD` (`drug_id`),
  KEY `FKC42BD164D6C2F785` (`supplier_id`),
  KEY `FKC42BD1649D819485` (`drug_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Producto Test',3,10,'Producto Test 150mg','Enabled',1,3,150),(2,'Cystagonpó',3,0,'Cystagon 150 mg','Enabled',1,3,10),(3,'NTBC 5mg',4,0,'Bottle 60 Capsulas de 5 mg','Enabled',1,0,NULL),(4,'Betaina',5,0,'Betaina Polvo 98%','Enabled',1,0,NULL),(5,'Ambutyrate',2,0,'Ambutyrate Polvo 98%','Enabled',1,0,NULL),(6,'Ambutyrate Oral',2,0,'Fenilbutirato Polvo SoluciÃ³n Oral 250 mg en 1 ml','Enabled',1,0,NULL),(7,'NTBC 10mg',4,0,'NTBC 10mg Bottle 60 Comprimidos','Enabled',1,0,NULL),(8,'NTBC 2mg',4,0,'NTBC 2 mg Frasco de 60 comprimidos. ','Enabled',1,0,NULL),(9,'Buphenyl Tabletas',2,0,'Buphenyl Tabletas 250 comprimidos.','Enabled',1,0,NULL),(10,'Normosang',8,0,'Ampollas x 4','Enabled',1,0,NULL),(11,'Neophe',9,0,'Frasco 550 Tabletas','Enabled',1,0,NULL),(12,'Lacrisert 5 mg',2,0,'60 unidades','Enabled',1,0,NULL),(13,'Cidofovir ',12,0,'Frasco de Ampollas.','Enabled',1,0,NULL),(14,'Sodium Dichloroacetate',13,0,'Dicloroacetato de sodio (98%)Polvo de 10g\\\\r\\\\nDicloroacetato de sodio 50mg en 1ml Polvo Liquido\\\\r\\\\nDicloroacetato de sodio Polvo de 100g','Enabled',1,0,NULL),(15,'Producto Test',2,10,'','Enabled',1,2,100.89);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Drop Table structure for table `proforma_details`
--

DROP TABLE IF EXISTS `proforma_details`;


--
-- Table structure for table `proformadetails`
--

DROP TABLE IF EXISTS `proformadetails`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `proformadetails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `price_each` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text,
  `proforma_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lot` varchar(45) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  `daily_dose` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK928612B28E8C9EED` (`proforma_id`),
  KEY `FK928612B23082FFEF` (`product_id`),
  KEY `FKF5BEAA926E093105` (`proforma_id`),
  KEY `FKF5BEAA922F8F58AF` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=287 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `proformadetails`
--

LOCK TABLES `proformadetails` WRITE;
/*!40000 ALTER TABLE `proformadetails` DISABLE KEYS */;
INSERT INTO `proformadetails` VALUES (284,30,'0.00','0.00',7,NULL,1,NULL,0,'1.00'),(2,5,'0.00','0.00',1,'Buphenyl',2,'',0,NULL),(3,2,'0.00','0.00',3,'NTBC',3,'',0,NULL),(4,3,'0.00','0.00',3,'NTBC5mg',4,'',0,NULL),(5,1,'0.00','0.00',1,'Buphenyl',5,'',0,NULL),(6,10,'0.00','0.00',4,'Betaina',6,'',0,NULL),(7,1,'0.00','0.00',1,'Buphenyl',7,'',0,NULL),(8,1,'0.00','0.00',5,'Ambutyrate',8,'',0,NULL),(9,3,'0.00','0.00',6,'AmbutyrateOral',9,'',0,NULL),(11,2,'0.00','0.00',3,'NTBC5mg',11,'',0,NULL),(12,2,'0.00','0.00',3,'NTBC5mg',12,'',0,NULL),(13,1,'0.00','0.00',8,'NTBC2mg',12,'',0,NULL),(14,1,'0.00','0.00',3,'NTBC5mg',13,'',0,NULL),(15,1,'0.00','0.00',1,'Buphenyl',14,'',0,NULL),(16,5,'0.00','0.00',9,'BuphenylTabletas',15,'',0,NULL),(17,1,'0.00','0.00',1,'BuphenylPolvo',16,'',0,NULL),(18,3,'0.00','0.00',3,'NTBC5mg',17,'',0,NULL),(19,1,'0.00','0.00',3,'NTBC5mg',18,'',0,NULL),(20,1,'0.00','0.00',4,'Betaina',19,'',0,NULL),(21,6,'0.00','0.00',8,'NTBC2mg',20,'',0,NULL),(22,6,'0.00','0.00',4,'Betaina',21,'',0,NULL),(23,3,'0.00','0.00',7,'NTBC10mg',22,'',0,NULL),(24,2,'0.00','0.00',3,'NTBC5mg',23,'',0,NULL),(25,1,'0.00','0.00',5,'Ambutyrate',24,'',0,NULL),(26,3,'0.00','0.00',3,'NTBC5mg',25,'',0,NULL),(27,1,'0.00','0.00',5,'Ambutyrate',26,'',0,NULL),(28,1,'0.00','0.00',1,'BuphenylPolvo',27,'',0,NULL),(29,1,'0.00','0.00',1,'BuphenylPolvo',28,'',0,NULL),(30,6,'0.00','0.00',2,'Cystagon',29,'',0,NULL),(31,3,'0.00','0.00',2,'Cystagon',30,'',0,NULL),(32,1,'0.00','0.00',1,'BuphenylPolvo',31,'',0,NULL),(33,1,'0.00','0.00',1,'BuphenylPolvo',32,'',0,NULL),(34,3,'0.00','0.00',3,'NTBC5mg',33,'',0,NULL),(35,1,'0.00','0.00',8,'NTBC2mg',33,'',0,NULL),(36,4,'0.00','0.00',3,'NTBC5mg',34,'',0,NULL),(37,6,'0.00','0.00',8,'NTBC2mg',34,'',0,NULL),(38,4,'0.00','0.00',4,'Betaina',35,'',0,NULL),(39,3,'0.00','0.00',7,'NTBC10mg',36,'',0,NULL),(40,1,'0.00','0.00',1,'BuphenylPolvo',37,'',0,NULL),(41,1,'0.00','0.00',1,'BuphenylPolvo',38,'',0,NULL),(42,5,'0.00','0.00',9,'BuphenylTabletas',39,'',0,NULL),(43,1,'0.00','0.00',7,'NTBC10mg',40,'',0,NULL),(44,1,'0.00','0.00',3,'NTBC5mg',40,'',0,NULL),(45,1,'0.00','0.00',8,'NTBC2mg',40,'',0,NULL),(46,1,'0.00','0.00',10,'Normosang',41,'',0,NULL),(47,6,'0.00','0.00',8,'NTBC2mg',42,'',0,NULL),(48,1,'0.00','0.00',5,'Ambutyrate',43,'',0,NULL),(49,3,'0.00','0.00',7,'NTBC10mg',44,'',0,NULL),(50,10,'0.00','0.00',4,'Betaina',45,'',0,NULL),(51,2,'0.00','0.00',6,'AmbutyrateOral',46,'',0,NULL),(52,1,'0.00','0.00',10,'Normosang',47,'',0,NULL),(53,1,'0.00','0.00',1,'BuphenylPolvo',48,'',0,NULL),(54,1,'0.00','0.00',1,'BuphenylPolvo',49,'',0,NULL),(55,2,'0.00','0.00',7,'NTBC10mg',50,'',0,NULL),(56,2,'0.00','0.00',3,'NTBC5mg',50,'',0,NULL),(57,3,'0.00','0.00',8,'NTBC2mg',50,'',0,NULL),(58,6,'0.00','0.00',3,'NTBC5mg',51,'',0,NULL),(59,10,'0.00','0.00',8,'NTBC2mg',51,'',0,NULL),(60,2,'0.00','0.00',3,'NTBC5mg',52,'',0,NULL),(61,1,'0.00','0.00',1,'BuphenylPolvo',53,'',0,NULL),(62,3,'0.00','0.00',7,'NTBC10mg',54,'',0,NULL),(63,3,'0.00','0.00',7,'NTBC10mg',55,'',0,NULL),(64,8,'0.00','0.00',2,'Cystagon',56,'',0,NULL),(65,9,'0.00','0.00',2,'Cystagon',57,'',0,NULL),(66,1,'0.00','0.00',8,'NTBC2mg',58,'',0,NULL),(67,1,'0.00','0.00',5,'Ambutyrate',59,'',0,NULL),(68,3,'0.00','0.00',3,'NTBC5mg',60,'',0,NULL),(69,1,'0.00','0.00',8,'NTBC2mg',61,'',0,NULL),(70,1,'0.00','0.00',8,'NTBC2mg',62,'',0,NULL),(71,2,'0.00','0.00',4,'Betaina',63,'',0,NULL),(72,1,'0.00','0.00',5,'Ambutyrate',64,'',0,NULL),(73,1,'0.00','0.00',1,'BuphenylPolvo',65,'',0,NULL),(74,1,'0.00','0.00',8,'NTBC2mg',66,'',0,NULL),(75,2,'0.00','0.00',4,'Betaina',67,'',0,NULL),(76,2,'0.00','0.00',7,'NTBC10mg',68,'',0,NULL),(77,4,'0.00','0.00',3,'NTBC5mg',69,'',0,NULL),(78,1,'0.00','0.00',11,'Neophe',70,'',0,NULL),(79,1,'0.00','0.00',5,'Ambutyrate',71,'',0,NULL),(80,1,'0.00','0.00',5,'Ambutyrate',72,'',0,NULL),(81,2,'0.00','0.00',5,'Ambutyrate',73,'',0,NULL),(82,2,'0.00','0.00',6,'Ambutyrate Oral',74,'',0,NULL),(83,6,'0.00','0.00',7,'NTBC10mg',75,'',0,NULL),(84,1,'0.00','0.00',1,'Buphenyl Polvo',76,'',0,NULL),(85,2,'0.00','0.00',3,'NTBC 5mg',77,'',0,NULL),(86,5,'0.00','0.00',3,'NTBC 5mg',78,'',0,NULL),(87,2,'0.00','0.00',3,'NTBC 5mg',79,'',0,NULL),(88,2,'0.00','0.00',7,'NTBC 10mg',80,'',0,NULL),(89,1,'0.00','0.00',3,'NTBC 5mg',80,'',0,NULL),(90,1,'0.00','0.00',8,'NTBC 2mg',80,'',0,NULL),(91,3,'0.00','0.00',7,'NTBC 10mg',81,'',0,NULL),(92,1,'0.00','0.00',3,'NTBC 5mg',82,'',0,NULL),(93,10,'0.00','0.00',4,'Betaina',83,'',0,NULL),(94,3,'0.00','0.00',7,'NTBC 10mg',84,'',0,NULL),(95,3,'0.00','0.00',3,'NTBC 5mg',84,'',0,NULL),(96,9,'0.00','0.00',8,'NTBC 2mg',84,'',0,NULL),(97,2,'0.00','0.00',1,'Buphenyl Polvo',85,'',0,NULL),(98,4,'0.00','0.00',6,'Ambutyrate Oral',86,'',0,NULL),(99,2,'0.00','0.00',3,'NTBC 5mg',87,'',0,NULL),(100,1,'0.00','0.00',8,'NTBC 2mg',87,'',0,NULL),(101,1,'0.00','0.00',9,'Buphenyl Tabletas',88,'',0,NULL),(102,5,'0.00','0.00',9,'Buphenyl Tabletas',89,'',0,NULL),(103,2,'0.00','0.00',6,'Ambutyrate Oral',90,'',0,NULL),(104,2,'0.00','0.00',7,'NTBC 10mg',91,'',0,NULL),(105,2,'0.00','0.00',3,'NTBC 5mg',91,'',0,NULL),(106,3,'0.00','0.00',8,'NTBC 2mg',91,'',0,NULL),(107,1,'0.00','0.00',5,'Ambutyrate',92,'',0,NULL),(108,2,'0.00','0.00',4,'Betaina',93,'',0,NULL),(109,6,'0.00','0.00',7,'NTBC 10mg',94,'',0,NULL),(110,5,'0.00','0.00',3,'NTBC 5mg',95,'',0,NULL),(111,2,'0.00','0.00',1,'Buphenyl Polvo',96,'',0,NULL),(112,4,'0.00','0.00',8,'NTBC 2mg',97,'',0,NULL),(113,8,'0.00','0.00',7,'NTBC 10mg',97,'',0,NULL),(114,10,'0.00','0.00',4,'Betaina',98,'',0,NULL),(115,2,'0.00','0.00',4,'Betaina',99,'',0,NULL),(116,2,'0.00','0.00',1,'Buphenyl Polvo',100,'',0,NULL),(117,2,'0.00','0.00',6,'Ambutyrate Oral',101,'',0,NULL),(118,1,'0.00','0.00',1,'Buphenyl Polvo',102,'',0,NULL),(119,2,'0.00','0.00',3,'NTBC 5mg',103,'',0,NULL),(120,1,'0.00','0.00',3,'NTBC 5mg',104,'',0,NULL),(121,6,'0.00','0.00',3,'NTBC 5mg',105,'',0,NULL),(122,10,'0.00','0.00',8,'NTBC 2mg',105,'',0,NULL),(123,2,'0.00','0.00',1,'Buphenyl Polvo',106,'',0,NULL),(124,2,'0.00','0.00',3,'NTBC 5mg',107,'',0,NULL),(125,1,'0.00','0.00',8,'NTBC 2mg',107,'',0,NULL),(126,4,'0.00','0.00',3,'NTBC 5mg',108,'',0,NULL),(127,10,'0.00','0.00',4,'Betaina',109,'',0,NULL),(128,1,'0.00','0.00',3,'NTBC 5mg',110,'',0,NULL),(129,1,'0.00','0.00',8,'NTBC 2mg',111,'',0,NULL),(130,2,'0.00','0.00',3,'NTBC 5mg',111,'',0,NULL),(131,2,'0.00','0.00',7,'NTBC 10mg',112,'',0,NULL),(132,1,'0.00','0.00',8,'NTBC 2mg',112,'',0,NULL),(133,2,'0.00','0.00',6,'Ambutyrate Oral',113,'',0,NULL),(134,3,'0.00','0.00',2,'Cystagon',114,'',0,NULL),(135,8,'0.00','0.00',2,'Cystagon',115,'',0,NULL),(136,2,'0.00','0.00',1,'Buphenyl Polvo',116,'',0,NULL),(137,9,'0.00','0.00',2,'Cystagon',117,'',0,NULL),(138,1,'0.00','0.00',5,'Ambutyrate',118,'',0,NULL),(139,1,'0.00','0.00',1,'Buphenyl Polvo',119,'',0,NULL),(140,5,'0.00','0.00',9,'Buphenyl Tabletas',120,'',0,NULL),(141,6,'0.00','0.00',9,'Buphenyl Tabletas',121,'',0,NULL),(142,12,'0.00','0.00',5,'Ambutyrate',122,'',0,NULL),(143,2,'0.00','0.00',1,'Buphenyl Polvo',123,'',0,NULL),(144,1,'0.00','0.00',10,'Normosang',124,'',0,NULL),(145,2,'0.00','0.00',5,'Ambutyrate',125,'',0,NULL),(146,2,'0.00','0.00',4,'Betaina',126,'',0,NULL),(147,1,'0.00','0.00',1,'Buphenyl Polvo',127,'',0,NULL),(148,1,'0.00','0.00',3,'NTBC 5mg',128,'',0,NULL),(149,2,'0.00','0.00',8,'NTBC 2mg',128,'',0,NULL),(150,8,'0.00','0.00',3,'NTBC 5mg',129,'',0,NULL),(151,1,'0.00','0.00',5,'Ambutyrate',130,'',0,NULL),(152,3,'0.00','0.00',7,'NTBC 10mg',131,'',0,NULL),(153,2,'0.00','0.00',6,'Ambutyrate Oral',132,'',0,NULL),(154,6,'0.00','0.00',2,'Cystagon',133,'',0,NULL),(155,2,'0.00','0.00',3,'NTBC 5mg',134,'',0,NULL),(156,1,'0.00','0.00',8,'NTBC 2mg',134,'',0,NULL),(157,8,'0.00','0.00',3,'NTBC 5mg',135,'',0,NULL),(158,2,'0.00','0.00',8,'NTBC 2mg',136,'',0,NULL),(159,2,'0.00','0.00',8,'NTBC 2mg',137,'',0,NULL),(160,2,'0.00','0.00',5,'Ambutyrate',138,'',0,NULL),(161,2,'0.00','0.00',5,'Ambutyrate',139,'',0,NULL),(162,6,'0.00','0.00',9,'Buphenyl Tabletas',140,'',0,NULL),(163,2,'0.00','0.00',3,'NTBC 5mg',141,'',0,NULL),(164,1,'0.00','0.00',8,'NTBC 2mg',141,'',0,NULL),(165,2,'0.00','0.00',3,'NTBC 5mg',142,'',0,NULL),(166,1,'0.00','0.00',7,'NTBC 10mg',143,'',0,NULL),(167,1,'0.00','0.00',3,'NTBC 5mg',143,'',0,NULL),(168,1,'0.00','0.00',8,'NTBC 2mg',143,'',0,NULL),(169,2,'0.00','0.00',12,'Lacrisert 5 mg',144,'',0,NULL),(170,1,'0.00','0.00',13,'Cidofovir ',144,'',0,NULL),(171,1,'0.00','0.00',7,'NTBC 10mg',145,'',0,NULL),(172,1,'0.00','0.00',3,'NTBC 5mg',145,'',0,NULL),(173,2,'0.00','0.00',6,'Ambutyrate Oral',146,'',0,NULL),(174,2,'0.00','0.00',3,'NTBC 5mg',147,'',0,NULL),(175,2,'0.00','0.00',5,'Ambutyrate',148,'',0,NULL),(176,2,'0.00','0.00',5,'Ambutyrate',149,'',0,NULL),(177,1,'0.00','0.00',5,'Ambutyrate',150,'',0,NULL),(178,2,'0.00','0.00',6,'Ambutyrate Oral',151,'',0,NULL),(179,2,'0.00','0.00',3,'NTBC 5mg',152,'',0,NULL),(180,4,'0.00','0.00',6,'Ambutyrate Oral',153,'',0,NULL),(181,1,'0.00','0.00',1,'Buphenyl Polvo',154,'',0,NULL),(182,2,'0.00','0.00',5,'Ambutyrate',155,'',0,NULL),(183,3,'0.00','0.00',8,'NTBC 2mg',156,'',0,NULL),(184,3,'0.00','0.00',8,'NTBC 2mg',157,'',0,NULL),(185,3,'0.00','0.00',8,'NTBC 2mg',158,'',0,NULL),(186,3,'0.00','0.00',8,'NTBC 2mg',159,'',0,NULL),(187,3,'0.00','0.00',8,'NTBC 2mg',160,'',0,NULL),(188,2,'0.00','0.00',5,'Ambutyrate',161,'',0,NULL),(189,6,'0.00','0.00',9,'Buphenyl Tabletas',162,'',0,NULL),(190,1,'0.00','0.00',8,'NTBC 2mg',163,'',0,NULL),(191,2,'0.00','0.00',3,'NTBC 5mg',163,'',0,NULL),(192,2,'0.00','0.00',1,'Buphenyl Polvo',164,'',0,NULL),(193,1,'0.00','0.00',8,'NTBC 2mg',165,'',0,NULL),(194,2,'0.00','0.00',3,'NTBC 5mg',165,'',0,NULL),(195,2,'0.00','0.00',4,'Betaina',166,'',0,NULL),(196,2,'0.00','0.00',6,'Ambutyrate Oral',167,'',0,NULL),(197,3,'0.00','0.00',3,'NTBC 5mg',168,'no',0,NULL),(198,2,'0.00','0.00',3,'NTBC 5mg',169,'',0,NULL),(199,2,'0.00','0.00',3,'NTBC 5mg',170,'',0,NULL),(200,10,'0.00','0.00',4,'Betaina',171,'',0,NULL),(201,2,'0.00','0.00',6,'Ambutyrate Oral',172,'',0,NULL),(202,1,'0.00','0.00',1,'Buphenyl Polvo',173,'',0,NULL),(203,5,'0.00','0.00',3,'NTBC 5mg',174,'',0,NULL),(204,1,'0.00','0.00',5,'Ambutyrate',175,'',0,NULL),(205,4,'0.00','0.00',14,'Sodium Dichloroacetate',176,'',0,NULL),(206,2,'0.00','0.00',4,'Betaina',177,'B052644',0,NULL),(207,2,'0.00','0.00',7,'NTBC 10mg',178,'',0,NULL),(208,4,'0.00','0.00',8,'NTBC 2mg',178,'',0,NULL),(209,2,'0.00','0.00',3,'NTBC 5mg',178,'',0,NULL),(210,1,'0.00','0.00',1,'Buphenyl Polvo',179,'',0,NULL),(211,10,'0.00','0.00',15,NULL,185,NULL,0,'1.00'),(221,10,'0.00','0.00',5,NULL,184,NULL,0,'1.00'),(218,10,'0.00','0.00',5,NULL,184,NULL,0,'1.00'),(219,10,'0.00','0.00',5,NULL,184,NULL,0,'1.00'),(220,10,'0.00','0.00',5,NULL,184,NULL,0,'1.00'),(222,10,'0.00','0.00',5,NULL,184,NULL,0,'1.00'),(223,10,'0.00','0.00',5,NULL,184,NULL,0,'1.00'),(224,10,'0.00','0.00',5,NULL,184,NULL,0,'1.00'),(225,10,'0.00','0.00',5,NULL,184,NULL,0,'1.00'),(226,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(227,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(228,2,'0.00','0.00',13,NULL,183,NULL,0,'20.00'),(229,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(230,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(231,2,'0.00','0.00',13,NULL,183,NULL,0,'20.00'),(232,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(233,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(234,2,'0.00','0.00',13,NULL,183,NULL,0,'20.00'),(235,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(236,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(237,2,'0.00','0.00',13,NULL,183,NULL,0,'20.00'),(238,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(239,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(240,2,'0.00','0.00',13,NULL,183,NULL,0,'20.00'),(241,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(242,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(243,2,'0.00','0.00',13,NULL,183,NULL,0,'20.00'),(244,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(245,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(246,2,'0.00','0.00',13,NULL,183,NULL,0,'20.00'),(247,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(248,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(249,2,'0.00','0.00',13,NULL,183,NULL,0,'20.00'),(250,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(251,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(252,2,'0.00','0.00',13,NULL,183,NULL,0,'20.00'),(253,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(254,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(255,2,'0.00','0.00',13,NULL,183,NULL,0,'20.00'),(256,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(257,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(258,2,'0.00','0.00',13,NULL,183,NULL,0,'20.00'),(259,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(260,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(261,2,'0.00','0.00',13,NULL,183,NULL,0,'20.00'),(262,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(263,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(264,2,'0.00','0.00',13,NULL,183,NULL,0,'20.00'),(265,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(266,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(267,2,'0.00','0.00',13,NULL,183,NULL,0,'20.00'),(268,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(269,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(270,2,'0.00','0.00',13,NULL,183,NULL,0,'20.00'),(271,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(272,1,'0.00','0.00',15,NULL,183,NULL,0,'10.00'),(273,2,'0.00','0.00',13,NULL,183,NULL,0,'20.00'),(282,10,'0.00','0.00',15,NULL,181,NULL,0,'1.00'),(283,20,'0.00','0.00',15,NULL,1,NULL,0,'1.00'),(285,30,'0.00','0.00',15,NULL,193,NULL,0,'1.00');
/*!40000 ALTER TABLE `proformadetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proformas`
--

DROP TABLE IF EXISTS `proformas`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `proformas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `discount` int(10) unsigned NOT NULL DEFAULT '0',
  `courier` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `patient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `patient_description` text,
  `client_id` int(10) unsigned NOT NULL DEFAULT '0',
  `client_description` text,
  `status` enum('Creada','Aprobada','Rechazada','Anulada') NOT NULL DEFAULT 'Creada',
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC46A34E3FC1E8BF7` (`user_id`),
  KEY `FKC46A34E3250603F7` (`client_id`),
  KEY `FKC46A34E3D2A7C6C3` (`patient_id`),
  KEY `FKC46A34E3C07819E5` (`client_id`),
  KEY `FKC46A34E32F7C98EF` (`patient_id`)
) ENGINE=MyISAM AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `proformas`
--

LOCK TABLES `proformas` WRITE;
/*!40000 ALTER TABLE `proformas` DISABLE KEYS */;
INSERT INTO `proformas` VALUES (1,0,0,'500.61','0.00','2008-07-15 12:00:03',8,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Anulada',13),(2,0,0,'0.00','0.00','2008-07-15 12:11:21',2,'Facundo Vallejos',2,'DroguerÃ­a Itati\nGobernador Pedro FerrÃ© 1878\n03783-430595/436225\n','Aprobada',0),(3,0,0,'0.00','0.00','2008-07-15 12:25:34',3,'JC Rotta',3,'DroguerÃ­a Zeus\nAvda. Cabret 1916 (Posadas)\n03752-438900\n','Aprobada',0),(4,0,0,'0.00','0.00','2008-07-15 12:31:20',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Aprobada',0),(5,0,0,'0.00','0.00','2008-07-15 12:37:13',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Aprobada',0),(6,0,0,'0.00','0.00','2008-07-15 12:42:59',6,'Melina Mainardi',6,'NÃ©stor Mainardi\nUrquiza 225 (CÃ³rdoba)\n03562-422502\n','Aprobada',0),(7,0,0,'0.00','0.00','2008-07-15 12:43:43',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',0),(8,0,0,'0.00','0.00','2008-07-15 12:51:36',7,'Franco Viggiano',8,'Hospital FrancÃ©s\nLa Rioja 951\n4959-1500\n','Aprobada',0),(9,0,0,'0.00','0.00','2008-07-15 13:50:30',8,'Candela Altamira',9,'DASPU OBRA SOCIAL\nNO\nNO\n','Aprobada',0),(11,0,0,'0.00','0.00','2008-07-15 14:01:19',3,'JC Rotta',3,'DroguerÃ­a Zeus\nAvda. Cabret 1916 (Posadas)\n03752-438900\n','Aprobada',0),(12,0,0,'0.00','0.00','2008-07-18 11:38:37',3,'JC Rotta',11,'DroguerÃ­a San Miguel\nSan Martin 2102 (Posadas)\n03752-431652\n','Aprobada',0),(13,0,0,'0.00','0.00','2008-07-18 11:49:09',10,'Ariadna Coronel',12,'Obra Social Personal de Farmacia\nConstituciÃ³n 2066\n4941-1342\n','Aprobada',0),(14,0,0,'0.00','0.00','2008-07-21 16:13:01',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',0),(15,0,10,'0.00','0.00','2008-07-21 16:35:01',11,'Marlene Guercio',13,'I.N.S.S.J.P\nPerÃº 169 5Â°A\n4344-8701\n','Aprobada',0),(16,0,0,'0.00','0.00','2008-07-22 11:20:07',12,'NO NO',14,'Hospital Garrahan\nCombate de los Pozos 1881\n4308-4300\n','Creada',0),(17,0,0,'0.00','0.00','2008-07-22 11:21:08',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Aprobada',0),(18,0,3,'0.00','0.00','2008-07-22 11:23:26',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Creada',0),(19,0,0,'0.00','0.00','2008-07-22 11:32:30',13,'Natali Singh',15,'CEMECO\nCÃ³rdoba\nNO\n','Creada',0),(20,0,3,'0.00','0.00','2008-07-22 11:38:28',14,'Gianella Maldonado',16,'Corbiet SA\nCÃ³rdoba\nNO\n','Aprobada',0),(21,0,0,'0.00','0.00','2008-07-22 11:41:57',15,'Ricardo Noriega',17,'Sin Obra Social\nNO\nNO\n','Aprobada',0),(22,0,0,'0.00','0.00','2008-07-22 11:46:47',16,'Alfonso Sana',17,'Sin Obra Social\nNO\nNO\n','Aprobada',0),(23,0,0,'0.00','0.00','2008-07-22 12:24:28',3,'JC Rotta',3,'DroguerÃ­a Zeus\nAvda. Cabret 1916 (Posadas)\n03752-438900\n','Aprobada',0),(24,0,0,'0.00','0.00','2008-07-22 12:32:08',12,'NO NO',14,'Hospital Garrahan\nCombate de los Pozos 1881\n4308-4300\n','Creada',0),(25,0,0,'0.00','0.00','2008-07-23 11:44:16',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Aprobada',0),(26,0,0,'0.00','0.00','2008-07-23 11:45:57',12,'NO NO',8,'Hospital FrancÃ©s\nLa Rioja 951\n4959-1500\n','Aprobada',0),(27,0,0,'0.00','0.00','2008-07-23 11:47:26',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Aprobada',0),(28,0,0,'0.00','0.00','2008-07-23 11:48:03',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',0),(29,0,0,'0.00','0.00','2008-07-23 11:52:05',17,'Christian Guanco',18,'Drogueria Pharmers SRL\nNO\nNO\n','Aprobada',0),(30,0,0,'0.00','0.00','2008-07-23 11:57:15',12,'NO NO',19,'Biofar\nLopez y Planes 551 (Resistencia, Chaco)\n(03722) 441212/442772\n','Aprobada',0),(31,0,0,'0.00','0.00','2008-07-23 12:00:22',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Aprobada',0),(32,0,0,'0.00','0.00','2008-07-23 12:01:25',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',0),(33,0,0,'0.00','0.00','2008-07-23 12:02:48',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Aprobada',0),(34,0,0,'0.00','0.00','2008-07-23 12:05:39',18,'Santino Ocampo',19,'Biofar\nLopez y Planes 551 (Resistencia, Chaco)\n(03722) 441212/442772\n','Creada',0),(35,0,0,'0.00','0.00','2008-07-23 12:08:52',19,'Arantxa Sola',15,'CEMECO\nCÃ³rdoba\nNO\n','Creada',0),(36,0,0,'0.00','0.00','2008-07-23 12:16:17',21,'Sin Identificar',20,'Secretaria de Saude de Santa Catarina\nBrasil\nNO\n','Creada',0),(37,0,0,'0.00','0.00','2008-07-23 12:17:12',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',0),(38,0,0,'0.00','0.00','2008-07-23 12:17:56',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',0),(39,0,10,'0.00','0.00','2008-07-23 12:18:41',11,'Marlene Guercio',13,'I.N.S.S.J.P\nPerÃº 169 5Â°A\n4344-8701\n','Creada',0),(40,0,0,'0.00','0.00','2008-07-23 12:20:35',3,'JC Rotta',3,'DroguerÃ­a Zeus\nAvda. Cabret 1916 (Posadas)\n03752-438900\n','Creada',0),(41,0,0,'0.00','0.00','2008-07-23 12:26:35',21,'Sin Identificar',21,'Libra\nARROYO GRANDE 2832.CP 11800. Montevideo. Urug\n00598 2200 5521\n','Aprobada',0),(42,0,0,'0.00','0.00','2008-07-23 12:27:55',14,'Gianella Maldonado',16,'Corbiet SA\nCÃ³rdoba\nNO\n','Aprobada',0),(43,0,0,'0.00','0.00','2008-07-23 12:29:23',7,'Franco Viggiano',8,'Hospital FrancÃ©s\nLa Rioja 951\n4959-1500\n','Aprobada',0),(44,0,7,'0.00','0.00','2008-07-23 12:31:46',16,'Alfonso Sana',17,'Sin Obra Social\nNO\nNO\n','Aprobada',0),(45,0,0,'0.00','0.00','2008-07-23 12:35:16',6,'Melina Mainardi',22,'Smata\nCÃ³rdoba\nNO\n','Aprobada',0),(46,0,0,'0.00','0.00','2008-07-23 12:38:53',8,'Candela Altamira',9,'DASPU OBRA SOCIAL\nNO\nNO\n','Aprobada',0),(47,0,0,'0.00','0.00','2008-07-23 12:39:54',21,'Sin Identificar',21,'Libra\nARROYO GRANDE 2832.CP 11800. Montevideo. Urug\n00598 2200 5521\n','Aprobada',0),(48,0,0,'0.00','0.00','2008-07-23 12:42:07',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',0),(49,0,0,'0.00','0.00','2008-07-23 12:42:43',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Aprobada',0),(50,0,0,'0.00','0.00','2008-07-23 12:48:21',22,'Rosario Zelaya',23,'Instituto de PrevisiÃ³n y Seguridad Social\nTucumÃ¡n\nNO\n','Aprobada',0),(51,0,0,'0.00','0.00','2008-07-23 12:51:34',18,'Santino Ocampo',24,'Drogueria Mar\nChaco\n03783-478400\n','Creada',0),(52,0,0,'0.00','0.00','2008-07-23 13:02:46',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Aprobada',0),(53,0,0,'0.00','0.00','2008-07-23 13:03:24',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',0),(54,0,3,'0.00','0.00','2008-07-23 13:07:25',21,'Sin Identificar',10,'Instituto ParanÃ¡\nNO\nNO\n','Creada',0),(55,0,0,'0.00','0.00','2008-07-23 13:09:13',21,'Sin Identificar',10,'Instituto ParanÃ¡\nNO\nNO\n','Aprobada',0),(56,0,0,'0.00','0.00','2008-07-23 13:10:03',21,'Sin Identificar',19,'Biofar\nLopez y Planes 551 (Resistencia, Chaco)\n(03722) 441212/442772\n','Creada',0),(57,0,0,'0.00','0.00','2008-07-23 13:10:55',21,'Sin Identificar',19,'Biofar\nLopez y Planes 551 (Resistencia, Chaco)\n(03722) 441212/442772\n','Aprobada',0),(58,0,0,'0.00','0.00','2008-07-23 13:14:49',10,'Ariadna Coronel',12,'Obra Social Personal de Farmacia\nConstituciÃ³n 2066\n4941-1342\n','Aprobada',0),(59,0,0,'0.00','0.00','2008-07-23 13:15:50',7,'Franco Viggiano',8,'Hospital FrancÃ©s\nLa Rioja 951\n4959-1500\n','Aprobada',0),(60,0,0,'0.00','0.00','2008-07-23 13:16:29',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Aprobada',0),(61,0,0,'0.00','0.00','2008-07-23 13:17:57',23,'Gina Marinho',17,'Sin Obra Social\nNO\nNO\n','Aprobada',0),(62,0,0,'0.00','0.00','2008-07-23 13:18:59',3,'JC Rotta',11,'DroguerÃ­a San Miguel\nSan Martin 2102 (Posadas)\n03752-431652\n','Aprobada',0),(63,0,0,'0.00','0.00','2008-07-23 13:19:41',19,'Arantxa Sola',15,'CEMECO\nCÃ³rdoba\nNO\n','Creada',0),(64,0,0,'0.00','0.00','2008-07-23 13:20:45',24,'Rafael Elizalde',17,'Sin Obra Social\nNO\nNO\n','Aprobada',0),(65,0,0,'0.00','0.00','2008-07-23 13:21:20',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',0),(66,0,0,'0.00','0.00','2008-07-23 13:22:07',10,'Ariadna Coronel',12,'Obra Social Personal de Farmacia\nConstituciÃ³n 2066\n4941-1342\n','Aprobada',0),(67,0,0,'0.00','0.00','2008-07-23 13:24:17',25,'Michael Hernandez',25,'IOSE\nNO\nNO\n','Aprobada',0),(68,0,0,'0.00','0.00','2008-07-23 13:29:19',21,'Sin Identificar',26,'Instituto del niÃ±o (Ecuador)\nEcuador\nNO\n','Creada',0),(69,0,0,'0.00','0.00','2008-07-23 13:36:08',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Aprobada',0),(70,0,0,'0.00','0.00','2008-07-24 14:10:51',26,'Joaquin Marchi',27,'OSPE\nRodriguez PeÃ±a 538\n4373-5740/4371/8957\n','Creada',0),(71,0,0,'0.00','0.00','2008-07-25 10:40:39',27,'Helio Segouras',17,'Sin Obra Social\nNO\nNO\n','Anulada',0),(72,0,0,'0.00','0.00','2008-07-30 12:22:02',27,'Helio Segouras',28,'Helio Segouras\nBrazil\nNO\n','Aprobada',0),(73,0,0,'0.00','0.00','2008-07-31 16:10:03',24,'Mateo Elizalde',29,'Rafael Elizalde\nNO\nNO\n','Rechazada',0),(74,0,0,'0.00','0.00','2008-08-01 11:25:59',24,'Mateo Elizalde',29,'Rafael Elizalde\nNO\nNO\n','Creada',0),(75,0,0,'0.00','0.00','2008-08-01 13:03:29',21,'Sin Identificar',30,'Swan Medicare\nDenmark\n+45 33 88 10 00\n','Creada',0),(76,0,0,'0.00','0.00','2008-08-04 12:26:45',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Aprobada',0),(77,0,0,'0.00','0.00','2008-08-05 14:53:25',14,'Gianella Maldonado',16,'Corbiet SA\nCÃ³rdoba\nNO\n','Rechazada',0),(78,0,0,'0.00','0.00','2008-08-05 14:56:25',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Creada',0),(79,0,4,'0.00','0.00','2008-08-08 11:53:11',14,'Gianella Maldonado',16,'Corbiet SA\nCÃ³rdoba\nNO\n','Aprobada',0),(80,0,0,'0.00','0.00','2008-08-11 13:11:33',16,'Alfonso Sana',31,'Cassia Sana\nBrasil\nNO\n','Rechazada',0),(81,0,7,'0.00','0.00','2008-08-13 17:02:26',16,'Alfonso Sana',31,'Cassia Sana\nBrasil\nNO\n','Aprobada',0),(82,0,0,'0.00','0.00','2008-08-19 14:11:42',10,'Ariadna Coronel',12,'Obra Social Personal de Farmacia\nConstituciÃ³n 2066\n4941-1342\n','Aprobada',0),(83,0,0,'0.00','0.00','2008-08-19 14:14:50',25,'Michael Hernandez',17,'Sin Obra Social\nNO\nNO\n','Creada',0),(84,0,0,'0.00','0.00','2008-08-19 14:17:06',18,'Santino Ocampo',19,'Biofar\nLopez y Planes 551 (Resistencia, Chaco)\n(03722) 441212/442772\n','Creada',0),(85,0,0,'0.00','0.00','2008-08-21 11:27:48',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',0),(86,0,0,'0.00','0.00','2008-08-22 11:05:20',8,'Candela Altamira',9,'DASPU OBRA SOCIAL\nNO\nNO\n','Aprobada',0),(87,0,0,'0.00','0.00','2008-08-22 11:07:21',3,'JC Rotta',11,'DroguerÃ­a San Miguel\nSan Martin 2102 (Posadas)\n03752-431652\n','Aprobada',0),(88,0,50,'0.00','0.00','2008-08-22 16:56:00',8,'Candela Altamira',19,'Biofar\nLopez y Planes 551 (Resistencia, Chaco)\n(03722) 441212/442772\n','Rechazada',0),(89,0,25,'0.00','0.00','2008-08-25 18:16:14',11,'Marlene Guercio',13,'I.N.S.S.J.P\nPerÃº 169 5Â°A\n4344-8701\n','Aprobada',0),(90,0,0,'0.00','0.00','2008-08-27 12:40:39',24,'Mateo Elizalde',29,'Rafael Elizalde\nNO\nNO\n','Aprobada',0),(91,0,0,'0.00','0.00','2008-08-28 11:17:29',22,'Rosario Zelaya',23,'Instituto de PrevisiÃ³n y Seguridad Social\nTucumÃ¡n\nNO\n','Aprobada',0),(92,0,0,'0.00','0.00','2008-08-28 12:31:17',28,'Catarina Magnano',33,'Ramiro Cabrero\nBrasil\nNO\n','Aprobada',0),(93,0,0,'0.00','0.00','2008-09-03 14:51:17',19,'Arantxa Sola',15,'CEMECO\nCÃ³rdoba\nNO\n','Aprobada',0),(94,0,10,'0.00','0.00','2008-09-09 15:51:52',29,'Matheus Giovanella',20,'Secretaria de Saude de Santa Catarina\nBrasil\nNO\n','Aprobada',0),(95,0,0,'0.00','0.00','2008-09-11 09:59:22',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Aprobada',0),(96,0,0,'0.00','0.00','2008-09-12 15:12:26',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',0),(97,0,0,'0.00','0.00','2008-09-15 11:41:47',21,'Sin Identificar',10,'Fundo Estadual de Saude do Parana\nRua Piquiri, 170, Reboucas. Curitiba, Parana,\nNO\n','Aprobada',0),(98,0,0,'0.00','0.00','2008-09-16 15:10:28',6,'Melina Mainardi',22,'Smata\nCÃ³rdoba\nNO\n','Creada',0),(99,0,0,'0.00','0.00','2008-09-17 11:05:16',25,'Michael Hernandez',25,'IOSE\nNO\nNO\n','Creada',0),(100,0,0,'0.00','0.00','2008-09-17 11:59:56',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Aprobada',0),(101,0,0,'0.00','0.00','2008-09-22 10:38:26',24,'Mateo Elizalde',29,'Rafael Elizalde\nNO\nNO\n','Aprobada',0),(102,0,0,'0.00','0.00','2008-09-23 14:41:44',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Aprobada',0),(103,0,0,'0.00','0.00','2008-09-25 11:11:29',14,'Gianella Maldonado',16,'Corbiet SA\nCÃ³rdoba\nNO\n','Creada',0),(104,0,0,'0.00','0.00','2008-09-25 15:20:50',30,'Rosaura Lascano',34,'ProtecciÃ³n Social de Ecuador\nEcuador\nNO\n','Creada',0),(105,0,0,'0.00','0.00','2008-09-26 12:57:59',18,'Santino Ocampo',24,'Drogueria Mar\nChaco\n03783-478400\n','Aprobada',0),(106,0,0,'0.00','0.00','2008-10-03 11:44:37',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',0),(107,0,0,'0.00','0.00','2008-10-03 14:55:13',3,'JC Rotta',11,'DroguerÃ­a San Miguel\nSan Martin 2102 (Posadas)\n03752-431652\n','Aprobada',0),(108,0,0,'0.00','0.00','2008-10-03 15:25:04',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Aprobada',0),(109,0,0,'0.00','0.00','2008-10-03 15:41:24',25,'Michael Hernandez',17,'Sin Obra Social\nNO\nNO\n','Aprobada',0),(110,0,0,'0.00','0.00','2008-10-03 15:45:32',10,'Ariadna Coronel',12,'Obra Social Personal de Farmacia\nConstituciÃ³n 2066\n4941-1342\n','Aprobada',0),(111,0,0,'0.00','0.00','2008-10-09 10:34:03',3,'JC Rotta',11,'DroguerÃ­a San Miguel\nSan Martin 2102 (Posadas)\n03752-431652\n','Creada',0),(112,0,0,'0.00','0.00','2008-10-09 12:45:47',16,'Alfonso Sana',31,'Cassia Sana\nBrasil\nNO\n','Creada',0),(113,0,0,'0.00','0.00','2008-10-09 15:07:17',24,'Mateo Elizalde',29,'Rafael Elizalde\nNO\nNO\n','Creada',0),(114,0,0,'0.00','0.00','2008-10-10 16:20:47',31,'Lautaro Contreras',35,'CompaÃ±ia de Servicios FarmacÃ©uticos\nNO\nNO\nNO','Aprobada',0),(115,0,0,'0.00','0.00','2008-10-10 16:45:41',21,'Sin Identificar',19,'Biofar\nLopez y Planes 551 (Resistencia, Chaco)\n(03722) 441212/442772\n','Aprobada',0),(116,0,0,'0.00','0.00','2008-10-15 13:18:36',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Creada',0),(117,0,0,'0.00','0.00','2008-10-20 13:00:28',17,'Christian Guanco',18,'Drogueria Pharmers SRL\nNO\nNO\n','Creada',0),(118,0,0,'0.00','0.00','2008-10-21 11:46:31',32,'Micaela Rodriguez',36,'Hospital Italiano\nGascÃ³n 450\n4959-0200\nGabriela.Fraschetti@hospitalitaliano.org.ar','Creada',0),(119,0,0,'0.00','0.00','2008-10-24 09:12:28',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Creada',0),(120,0,25,'0.00','0.00','2008-10-24 11:51:51',11,'Marlene Guercio',13,'I.N.S.S.J.P\nPerÃº 169 5Â°A\n4344-8701\n','Rechazada',0),(121,0,25,'0.00','0.00','2008-10-24 12:03:00',11,'Marlene Guercio',13,'I.N.S.S.J.P\nPerÃº 169 5Â°A\n4344-8701\n','Creada',0),(122,0,0,'0.00','0.00','2008-10-24 14:26:41',32,'Micaela Rodriguez',36,'Hospital Italiano\nGascÃ³n 450\n4959-0200\nGabriela.Fraschetti@hospitalitaliano.org.ar','Creada',0),(123,0,0,'0.00','0.00','2008-10-28 14:18:05',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Creada',0),(124,0,0,'0.00','0.00','2008-10-28 14:41:09',21,'Sin Identificar',21,'Libra\nARROYO GRANDE 2832.CP 11800. Montevideo. Urug\n00598 2200 5521\n','Creada',0),(125,0,0,'0.00','0.00','2008-10-30 11:41:22',33,'Victoria Peralta',37,'Peralta\nDiagonal TucumÃ¡n 1193.Martnez\n4798-5152/154404-9480\n','Creada',0),(126,0,0,'0.00','0.00','2008-11-03 09:19:46',19,'Arantxa Sola',15,'CEMECO\nCÃ³rdoba\nNO\n','Creada',0),(127,0,0,'0.00','0.00','2008-11-04 11:46:07',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Creada',0),(128,0,0,'0.00','0.00','2008-11-04 15:27:42',34,'Micaela Cabrera',14,'Hospital Garrahan\nCombate de los Pozos 1881\n4308-4300\n','Creada',0),(129,0,0,'0.00','0.00','2008-11-04 15:48:34',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Creada',0),(130,0,0,'0.00','0.00','2008-11-05 11:23:13',35,'Luisina Zabala',38,'OSPECOR\nNO\nNO\nNO','Creada',0),(131,0,32,'0.00','0.00','2008-11-05 11:55:26',16,'Alfonso Sana',31,'Cassia Sana\nBrasil\nNO\n','Creada',0),(132,0,0,'0.00','0.00','2008-11-07 11:07:27',24,'Mateo Elizalde',29,'Rafael Elizalde\nNO\nNO\n','Creada',0),(133,0,0,'0.00','0.00','2008-11-07 11:54:35',36,'Nicolas Molinas',19,'Biofar\nLopez y Planes 551 (Resistencia, Chaco)\n(03722) 441212/442772\n','Creada',0),(134,0,0,'0.00','0.00','2008-11-10 08:45:40',3,'JC Rotta',11,'DroguerÃ­a San Miguel\nSan Martin 2102 (Posadas)\n03752-431652\n','Rechazada',0),(135,0,0,'0.00','0.00','2008-11-10 08:49:28',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Creada',0),(136,0,0,'0.00','0.00','2008-11-13 16:08:35',23,'Gabriel Marinho',17,'Sin Obra Social\nNO\nNO\n','Creada',0),(137,0,0,'0.00','0.00','2008-11-13 16:14:23',23,'Gabriel Marinho',40,'Gina Marinho\nBrasil\nNO\nNO','Creada',0),(138,0,0,'0.00','0.00','2008-11-14 11:02:57',37,'estefania gimenez',39,'Instituto Dorrego\n3 de febrero 748.Rosario\n(0341)4202411\nfarmacia@institutodorrego.com.ar','Rechazada',0),(139,0,0,'0.00','0.00','2008-11-18 12:23:43',27,'Helio Segouras',28,'Helio Segouras\nBrazil\nNO\n','Creada',0),(140,0,25,'0.00','0.00','2008-11-18 14:30:23',11,'Marlene Guercio',13,'I.N.S.S.J.P\nPerÃº 169 5Â°A\n4344-8701\n','Creada',0),(141,0,0,'0.00','0.00','2008-11-19 11:39:12',3,'JC Rotta',41,'Alfonso RamÃ³n DarÃ­o\nChaco\nno\nno','Creada',0),(142,0,0,'0.00','0.00','2008-11-20 15:33:11',14,'Gianella Maldonado',36,'Hospital Italiano\nGascÃ³n 450\n4959-0200\nGabriela.Fraschetti@hospitalitaliano.org.ar','Rechazada',0),(143,0,0,'0.00','0.00','2008-11-21 15:19:58',21,'Sin Identificar',42,'Consulado Paraguay\nno\nno\niralabernal@hotmail.com','Creada',0),(144,0,0,'0.00','0.00','2008-11-24 10:25:09',21,'Sin Identificar',25,'IOSE\nNO\nNO\n','Creada',0),(145,0,0,'0.00','0.00','2008-11-24 10:31:47',21,'Sin Identificar',43,'SES\nBrasil\n(51) 3288-5982\nceres@saude.rs.gov.br','Creada',0),(146,0,0,'0.00','0.00','2008-11-25 12:22:03',37,'Estefania Gimenez',39,'Instituto Dorrego\n3 de febrero 748.Rosario\n(0341)4202411\nfarmacia@institutodorrego.com.ar','Creada',0),(147,0,0,'0.00','0.00','2008-11-26 10:54:24',14,'Gianella Maldonado',16,'Corbiet SA\nCÃ³rdoba\nNO\n','Creada',0),(148,0,0,'0.00','0.00','2008-12-02 10:56:16',8,'Candela Altamira',41,'Alfonso RamÃ³n DarÃ­o\nChaco\nno\nno','Rechazada',0),(149,0,0,'0.00','0.00','2008-12-02 10:57:20',28,'Catarina Magnano',32,'Isabel Magnano\nBrasil\nNO\n','Creada',0),(150,0,0,'0.00','0.00','2008-12-02 12:23:14',33,'Victoria Peralta',37,'Peralta\nDiagonal TucumÃ¡n 1193.Martnez\n4798-5152/154404-9480\n','Creada',0),(151,0,0,'0.00','0.00','2008-12-03 09:43:51',24,'Mateo Elizalde',29,'Rafael Elizalde\nNO\nNO\n','Creada',0),(152,0,0,'0.00','0.00','2008-12-03 14:45:34',30,'Rosaura Lascano',34,'ProtecciÃ³n Social de Ecuador\nEcuador\nNO\n','Creada',0),(153,0,0,'0.00','0.00','2008-12-10 11:51:34',8,'Candela Altamira',9,'DASPU OBRA SOCIAL\nNO\nNO\n','Creada',0),(154,0,0,'0.00','0.00','2008-12-10 12:04:22',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Creada',0),(155,0,0,'0.00','0.00','2008-12-16 08:50:08',35,'Luisina Zabala',38,'OSPECOR\nNO\nNO\nNO','Creada',0),(156,0,0,'0.00','0.00','2008-12-17 11:50:39',23,'Gabriel Marinho',40,'Gina Marinho\nBrasil\nNO\nNO','Anulada',0),(157,0,0,'0.00','0.00','2008-12-17 11:52:20',23,'Gabriel Marinho',40,'Gina Marinho\nBrasil\nNO\nNO','Rechazada',0),(158,0,0,'0.00','0.00','2008-12-17 11:52:20',23,'Gabriel Marinho',40,'Gina Marinho\nBrasil\nNO\nNO','Rechazada',0),(159,0,0,'0.00','0.00','2008-12-17 11:52:20',23,'Gabriel Marinho',40,'Gina Marinho\nBrasil\nNO\nNO','Rechazada',0),(160,0,0,'0.00','0.00','2008-12-17 11:53:21',23,'Gabriel Marinho',40,'Gina Marinho\nBrasil\nNO\nNO','Creada',0),(161,0,0,'0.00','0.00','2008-12-17 11:58:30',33,'Victoria Peralta',37,'Peralta\nDiagonal TucumÃ¡n 1193.Martnez\n4798-5152/154404-9480\n','Creada',0),(162,0,25,'0.00','0.00','2008-12-17 14:13:36',11,'Marlene Guercio',13,'I.N.S.S.J.P\nPerÃº 169 5Â°A\n4344-8701\n','Creada',0),(163,0,0,'0.00','0.00','2008-12-18 10:49:16',3,'JC Rotta',11,'DroguerÃ­a San Miguel\nSan Martin 2102 (Posadas)\n03752-431652\n','Rechazada',0),(164,0,0,'0.00','0.00','2008-12-18 15:08:23',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',0),(165,0,0,'0.00','0.00','2008-12-19 09:42:29',3,'JC Rotta',41,'Alfonso RamÃ³n DarÃ­o\nChaco\nno\nno','Creada',0),(166,0,0,'0.00','0.00','2008-12-19 10:19:31',25,'Michael Hernandez',25,'IOSE\nNO\nNO\n','Creada',0),(167,0,0,'0.00','0.00','2008-12-22 14:50:24',37,'Estefania Gimenez',39,'Instituto Dorrego\n3 de febrero 748.Rosario\n(0341)4202411\nfarmacia@institutodorrego.com.ar','Creada',0),(168,0,0,'0.00','0.00','2008-12-23 12:08:14',34,'Micaela Cabrera',44,'Ministerio de Desarrollo Social\nno\n4121-4604/4121-4611\nno','Creada',0),(169,0,0,'0.00','0.00','2008-12-29 13:24:54',14,'Gianella Maldonado',16,'Corbiet SA\nCÃ³rdoba\nNO\n','Rechazada',0),(170,0,11,'0.00','0.00','2008-12-29 13:28:01',14,'Gianella Maldonado',16,'Corbiet SA\nCÃ³rdoba\nNO\n','Creada',0),(171,0,0,'0.00','0.00','2009-01-05 11:51:53',6,'Melina Mainardi',22,'Smata\nCÃ³rdoba\nNO\n','Creada',0),(172,0,0,'0.00','0.00','2009-01-05 11:55:05',24,'Mateo Elizalde',29,'Rafael Elizalde\nNO\nNO\n','Creada',0),(173,0,0,'0.00','0.00','2009-01-12 08:38:14',1,'Ignacio Levandowsky',1,'OSPIA\nVenezuela 2386\n4383-9026\n','Aprobada',0),(174,0,0,'0.00','0.00','2009-01-12 08:41:16',4,'Lucas Contreras',4,'OSECAC\nMoreno 648 (Capital Federal)\n4332-4217\n','Creada',0),(175,0,0,'0.00','0.00','2009-01-14 09:43:03',35,'Luisina Zabala',38,'OSPECOR\nNO\nNO\ngralbard@yahoo.com.ar','Creada',0),(176,0,0,'0.00','0.00','2009-01-15 16:00:56',39,'Paula Laporta',45,'Galeno \nno\nno\nno','Aprobada',0),(177,0,0,'0.00','0.00','2009-01-21 09:23:55',19,'Arantxa Sola',15,'CEMECO\nCÃ³rdoba\nNO\n','Creada',0),(178,0,0,'0.00','0.00','2009-01-22 09:55:46',22,'Rosario Zelaya',23,'Instituto de PrevisiÃ³n y Seguridad Social\nTucumÃ¡n\nNO\n','Creada',0),(179,0,0,'0.00','0.00','2009-01-23 11:50:21',5,'Maximo Tortolini',5,'Obra Social Jefes de Oficiales Navales\n24 de Noviembre 645\n4932-8079\n','Creada',0),(180,0,20,'100.00','0.00','2009-08-01 11:55:00',1,NULL,1,NULL,'Creada',0),(181,0,10,'200.00','0.00','2009-08-01 12:17:06',7,NULL,0,NULL,'Creada',6),(183,0,10,'0.00','0.00','2009-08-03 09:34:50',1,NULL,0,NULL,'Creada',7),(184,0,10,'10.00','0.00','2009-08-08 19:35:39',2,NULL,0,NULL,'Creada',4),(185,0,10,'10.00','0.00','2009-08-08 19:37:40',1,NULL,0,NULL,'Creada',0),(193,0,0,'100.00','0.00','2009-08-23 20:30:07',39,NULL,0,NULL,'Creada',1);
/*!40000 ALTER TABLE `proformas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_invoices`
--

DROP TABLE IF EXISTS `purchase_invoices`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `purchase_invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` int(10) unsigned NOT NULL DEFAULT '0',
  `invoice_id` int(10) unsigned NOT NULL DEFAULT '0',
  `invoices_idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKFD0D6064C04FC7EF` (`invoice_id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `purchase_invoices`
--

LOCK TABLES `purchase_invoices` WRITE;
/*!40000 ALTER TABLE `purchase_invoices` DISABLE KEYS */;
INSERT INTO `purchase_invoices` VALUES (53,81,82,NULL),(2,2,6,NULL),(3,5,12,NULL),(4,9,22,NULL),(5,10,18,NULL),(6,11,20,NULL),(7,12,30,NULL),(8,13,21,NULL),(9,15,43,NULL),(10,16,47,NULL),(11,19,34,NULL),(12,20,57,NULL),(13,21,36,NULL),(14,22,45,NULL),(15,24,58,NULL),(16,25,56,NULL),(17,26,13,NULL),(18,27,54,NULL),(19,28,51,NULL),(20,29,64,NULL),(21,30,66,NULL),(22,32,69,NULL),(23,33,62,NULL),(24,34,71,NULL),(25,35,78,NULL),(26,36,7,NULL),(27,37,9,NULL),(28,38,16,NULL),(29,39,15,NULL),(30,39,24,NULL),(31,40,25,NULL),(32,41,28,NULL),(33,41,29,NULL),(34,42,67,NULL),(35,43,31,NULL),(36,43,32,NULL),(37,44,40,NULL),(38,44,41,NULL),(39,45,63,NULL),(40,45,65,NULL),(41,46,79,NULL),(51,82,86,NULL),(43,48,4,NULL),(44,49,83,NULL),(45,50,26,NULL),(46,51,33,NULL),(47,52,27,NULL),(48,53,39,NULL),(49,54,84,NULL),(54,0,1,NULL),(59,88,1,0),(66,1,17,0);
/*!40000 ALTER TABLE `purchase_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `expire_date` date NOT NULL DEFAULT '0000-00-00',
  `supplier_id` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(45) NOT NULL DEFAULT '',
  `status` enum('Paid','Pending','Free') NOT NULL DEFAULT 'Pending',
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK95379B9258E8F475` (`supplier_id`),
  KEY `FK95379B92D6C2F785` (`supplier_id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (90,'100.00','2009-08-23','2009-08-23',1,'','Pending',1),(13,'0.00','2008-04-11','2008-07-11',1,'1581','Paid',0),(14,'0.00','2008-04-21','2008-07-21',1,'1587','Free',0),(15,'0.00','2008-05-13','2008-08-13',1,'1622','Paid',0),(16,'0.00','2008-05-13','2008-08-13',1,'1624','Paid',0),(17,'0.00','2008-05-13','2008-08-13',1,'1626','Free',0),(18,'0.00','2008-05-23','2008-08-23',1,'1628','Paid',0),(19,'0.00','2008-06-05','2008-09-05',1,'1660','Paid',0),(20,'0.00','2008-06-18','2008-09-18',1,'1661','Paid',0),(21,'0.00','2008-06-11','2008-09-11',1,'1662','Paid',0),(22,'0.00','2008-06-12','2008-09-12',1,'1663','Paid',0),(23,'0.00','2008-06-25','2008-09-25',1,'1671','Free',0),(24,'0.00','2008-06-30','2008-09-30',1,'1672','Paid',0),(25,'0.00','2008-07-25','2008-10-25',1,'1690','Paid',0),(26,'0.00','2008-07-25','2008-10-25',1,'1691','Paid',0),(27,'0.00','2008-07-28','2008-10-28',1,'1692','Paid',0),(28,'0.00','2008-07-29','2008-10-29',1,'1693','Paid',0),(29,'0.00','2008-08-15','2008-11-15',1,'1725','Pending',0),(30,'0.00','2008-08-19','2008-08-19',1,'1727','Pending',0),(31,'0.00','2008-08-25','2008-11-25',1,'1733','Pending',0),(32,'0.00','2008-08-26','2008-11-26',1,'1734','Pending',0),(33,'0.00','2008-09-08','2008-09-08',1,'1745','Pending',0),(34,'0.00','2008-09-08','2008-12-08',1,'1749','Pending',0),(35,'0.00','2008-09-08','2008-12-08',1,'1749','Pending',0),(36,'0.00','2008-01-08','2008-04-08',2,'90000133','Paid',0),(37,'0.00','2008-01-30','2008-04-30',1,'90001850','Paid',0),(38,'0.00','2008-02-11','2008-05-11',2,'90002522','Paid',0),(39,'0.00','2008-02-26','2008-05-26',2,'90003858','Paid',0),(40,'0.00','2008-03-19','2008-06-19',2,'2630','Paid',0),(41,'0.00','2008-04-01','2008-07-01',2,'90006734','Paid',0),(42,'0.00','2008-05-13','2008-08-13',2,'90011184','Paid',0),(43,'0.00','2008-06-17','2008-09-17',2,'90014537','Paid',0),(44,'0.00','2008-06-24','2008-09-24',2,'90015099','Pending',0),(45,'0.00','2008-08-29','2008-11-29',2,'90021058','Pending',0),(46,'0.00','2008-09-10','2008-12-10',2,'90022033','Pending',0),(47,'0.00','2008-09-11','2008-12-11',2,'90022059','Paid',0),(48,'0.00','2008-01-14','2008-03-14',3,'80153','Paid',0),(49,'0.00','2008-02-12','2008-05-12',3,'80449','Paid',0),(50,'0.00','2008-04-14','2008-07-14',3,'81124','Paid',0),(51,'0.00','2008-04-28','2008-07-28',3,'81285','Paid',0),(52,'0.00','2008-05-13','2008-08-13',3,'81420','Paid',0),(53,'0.00','2008-05-26','2008-08-26',3,'81573','Paid',0),(54,'0.00','2008-06-27','2008-09-27',3,'81929','Pending',0),(55,'0.00','2008-11-04','2009-02-04',1,'1801','Pending',0),(56,'0.00','2008-11-17','2009-02-17',1,'1821','Pending',0),(57,'0.00','2009-11-19','2009-02-11',3,'1822','Free',0),(58,'0.00','2009-12-11','2009-03-12',1,'1826','Pending',0),(59,'0.00','2009-11-27','2009-02-27',1,'1828','Pending',0),(60,'0.00','2009-11-27','2009-02-27',1,'1829','Pending',0),(61,'0.00','2009-11-20','2009-02-20',1,'1836','Free',0),(62,'0.00','2009-11-20','2009-02-20',1,'1837','Pending',0),(63,'0.00','2008-11-20','2009-02-20',1,'1838','Pending',0),(64,'0.00','2008-11-11','2009-02-11',1,'1846','Pending',0),(65,'0.00','2008-12-18','2009-03-18',1,'1847','Pending',0),(66,'0.00','2008-12-24','2009-02-24',1,'1849','Pending',0),(67,'0.00','2008-11-03','2009-02-03',4,'76588','Pending',0),(68,'0.00','2008-03-11','2009-03-11',4,'76591','Pending',0),(69,'0.00','2008-11-12','2009-03-12',4,'77015','Pending',0),(70,'0.00','2009-11-03','2009-02-03',4,'76590','Pending',0),(71,'0.00','2009-03-11','2009-02-11',4,'76591','Pending',0),(72,'0.00','2009-11-12','2009-02-02',3,'77011','Pending',0),(73,'0.00','2008-11-12','2009-02-12',4,'77011','Pending',0),(74,'0.00','2008-11-12','2009-02-12',4,'77015','Pending',0),(75,'0.00','2008-12-02','2009-03-02',4,'78113','Pending',0),(76,'0.00','2008-12-10','2009-02-10',4,'78441','Pending',0),(77,'0.00','2008-12-02','2009-03-02',4,'78442','Pending',0),(78,'0.00','2008-12-17','2009-03-17',4,'78666','Pending',0),(79,'0.00','2008-12-17','2009-03-17',4,'78667','Pending',0),(80,'0.00','2009-01-23','2009-04-23',4,'80212','Pending',0),(81,'0.00','2008-01-23','2008-04-23',2,'802122','Pending',0),(82,'0.00','2009-02-02','2009-02-02',3,'90034145','Pending',0),(83,'100.00','2009-08-22','2009-08-22',1,'1','Pending',8),(85,'100.00','2009-08-22','2009-08-22',4,'2','Pending',7),(86,'100.00','2009-08-22','2009-08-22',1,'200','Pending',0),(87,'100.00','2009-08-22','2009-08-22',1,'3','Pending',9),(88,'100.00','2009-08-22','2009-08-22',1,'4','Pending',3),(89,'100.00','2009-08-23','2009-08-23',1,'01','Pending',0);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_map`
--

DROP TABLE IF EXISTS `request_map`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `request_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `config_attribute` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `request_map`
--

LOCK TABLES `request_map` WRITE;
/*!40000 ALTER TABLE `request_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `authority` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authority` (`authority`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,1,'ROLE_ADMIN','Admin Role'),(2,1,'ROLE_USER','Default User Role');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_people`
--

DROP TABLE IF EXISTS `role_people`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `role_people` (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `FK28B75E7821ABA0A5` (`user_id`),
  KEY `FK28B75E787C80DCC5` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `role_people`
--

LOCK TABLES `role_people` WRITE;
/*!40000 ALTER TABLE `role_people` DISABLE KEYS */;
INSERT INTO `role_people` VALUES (1,2),(2,1);
/*!40000 ALTER TABLE `role_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  `telephone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'RDT','3434','','',1),(2,'UCYCLYD','','','',0),(3,'ORPHAN','','','',0),(4,'Special Products','00441483736950/Fax004411483721926','Gary.Hurley@SpecialProducts.biz','Albert Chan',0),(5,'NO EXISTE','','','',0),(6,'Darío','','','',1);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_to_countries`
--

DROP TABLE IF EXISTS `user_to_countries`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_to_countries` (
  `user_countries_id` bigint(20) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  KEY `FKC0A645E424E35D10` (`user_countries_id`),
  KEY `FKC0A645E4D5F7034F` (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_to_countries`
--

LOCK TABLES `user_to_countries` WRITE;
/*!40000 ALTER TABLE `user_to_countries` DISABLE KEYS */;
INSERT INTO `user_to_countries` VALUES (2,2),(2,1),(1,3);
/*!40000 ALTER TABLE `user_to_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL DEFAULT '',
  `password` varchar(45) NOT NULL DEFAULT '',
  `email` varchar(45) NOT NULL DEFAULT '',
  `version` bigint(20) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `passwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ivan','ivan','igrosny@gmail.com',2,'Ivan','Ivan','','a15f8b81a160b4eebe5c84e9e3b65c87b9b2f18e'),(2,'edu','edu','',4,'edu','edu','','863f8f3edbcde342a53dd30d6d00b81a90e4249d');
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

-- Dump completed on 2009-08-24 15:19:49
