-- MySQL dump 10.11
--
-- Host: localhost    Database: vitaflo_db
-- ------------------------------------------------------
-- Server version	5.0.75-0ubuntu10.5

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
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `audit_log` (
  `id` bigint(20) NOT NULL auto_increment,
  `property_name` varchar(255) default NULL,
  `last_updated` datetime NOT NULL,
  `old_value` varchar(255) default NULL,
  `actor` varchar(255) default NULL,
  `uri` varchar(255) default NULL,
  `new_value` varchar(255) default NULL,
  `persisted_object_version` bigint(20) default NULL,
  `date_created` datetime NOT NULL,
  `class_name` varchar(255) default NULL,
  `event_name` varchar(255) default NULL,
  `persisted_object_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=450 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `audit_log`
--

LOCK TABLES `audit_log` WRITE;
/*!40000 ALTER TABLE `audit_log` DISABLE KEYS */;
INSERT INTO `audit_log` VALUES (21,NULL,'2010-05-18 13:12:53',NULL,'horacio',NULL,NULL,NULL,'2010-05-18 13:12:53','com.vitaflo.innova.Client','INSERT',95),(22,NULL,'2010-05-18 13:13:12',NULL,'horacio',NULL,NULL,NULL,'2010-05-18 13:13:12','com.vitaflo.innova.Client','INSERT',96),(23,NULL,'2010-05-18 13:13:41',NULL,'horacio',NULL,NULL,NULL,'2010-05-18 13:13:41','com.vitaflo.innova.Client','INSERT',97),(24,NULL,'2010-05-18 13:13:58',NULL,'horacio',NULL,NULL,NULL,'2010-05-18 13:13:58','com.vitaflo.innova.Client','INSERT',98),(25,'status','2010-05-18 13:14:06','Enabled','horacio',NULL,'Deleted',NULL,'2010-05-18 13:14:06','com.vitaflo.innova.Client','UPDATE',98),(26,NULL,'2010-05-18 13:14:25',NULL,'horacio',NULL,NULL,NULL,'2010-05-18 13:14:25','com.vitaflo.innova.Client','INSERT',99),(27,NULL,'2010-05-18 13:14:42',NULL,'horacio',NULL,NULL,NULL,'2010-05-18 13:14:42','com.vitaflo.innova.Client','INSERT',100),(28,NULL,'2010-05-18 13:15:03',NULL,'horacio',NULL,NULL,NULL,'2010-05-18 13:15:03','com.vitaflo.innova.Client','INSERT',101),(29,NULL,'2010-05-18 13:26:47',NULL,'horacio',NULL,NULL,NULL,'2010-05-18 13:26:47','com.vitaflo.innova.Client','INSERT',102),(30,NULL,'2010-05-18 14:06:40',NULL,'horacio',NULL,NULL,NULL,'2010-05-18 14:06:40','com.vitaflo.innova.Patient','INSERT',88),(31,NULL,'2010-05-18 14:07:01',NULL,'horacio',NULL,NULL,NULL,'2010-05-18 14:07:01','com.vitaflo.innova.Client','INSERT',103),(32,'client','2010-05-18 14:07:17','Fundacion Co ME. I','horacio',NULL,'Union Personal',NULL,'2010-05-18 14:07:17','com.vitaflo.innova.Patient','UPDATE',88),(33,'country','2010-05-18 14:07:17','Argentina','horacio',NULL,'Argentina',NULL,'2010-05-18 14:07:17','com.vitaflo.innova.Patient','UPDATE',88),(34,NULL,'2010-05-18 14:09:49',NULL,'horacio',NULL,NULL,NULL,'2010-05-18 14:09:49','com.vitaflo.innova.Client','INSERT',104),(35,NULL,'2010-05-18 14:10:05',NULL,'horacio',NULL,NULL,NULL,'2010-05-18 14:10:05','com.vitaflo.innova.Client','INSERT',105),(36,NULL,'2010-05-18 14:12:21',NULL,'horacio',NULL,NULL,NULL,'2010-05-18 14:12:21','com.vitaflo.innova.Client','INSERT',106),(37,NULL,'2010-05-18 14:12:54',NULL,'horacio',NULL,NULL,NULL,'2010-05-18 14:12:54','com.vitaflo.innova.Client','INSERT',107),(38,NULL,'2010-05-18 14:13:10',NULL,'horacio',NULL,NULL,NULL,'2010-05-18 14:13:10','com.vitaflo.innova.Client','INSERT',108),(39,NULL,'2010-05-18 14:13:29',NULL,'horacio',NULL,NULL,NULL,'2010-05-18 14:13:29','com.vitaflo.innova.Client','INSERT',109),(40,NULL,'2010-05-19 09:00:40',NULL,'horacio',NULL,NULL,NULL,'2010-05-19 09:00:40','com.vitaflo.innova.Client','INSERT',111),(41,NULL,'2010-05-19 09:01:04',NULL,'horacio',NULL,NULL,NULL,'2010-05-19 09:01:04','com.vitaflo.innova.Client','INSERT',112),(42,NULL,'2010-05-19 09:01:36',NULL,'horacio',NULL,NULL,NULL,'2010-05-19 09:01:36','com.vitaflo.innova.Client','INSERT',113),(43,NULL,'2010-05-19 09:01:49',NULL,'horacio',NULL,NULL,NULL,'2010-05-19 09:01:49','com.vitaflo.innova.Client','INSERT',114),(44,NULL,'2010-05-19 09:02:06',NULL,'horacio',NULL,NULL,NULL,'2010-05-19 09:02:06','com.vitaflo.innova.Client','INSERT',115),(45,NULL,'2010-05-19 09:02:35',NULL,'horacio',NULL,NULL,NULL,'2010-05-19 09:02:35','com.vitaflo.innova.Client','INSERT',116),(46,NULL,'2010-05-19 09:03:01',NULL,'horacio',NULL,NULL,NULL,'2010-05-19 09:03:01','com.vitaflo.innova.Client','INSERT',117),(47,'phone','2010-05-19 09:05:11',NULL,'horacio',NULL,'4305-1611/48',NULL,'2010-05-19 09:05:11','com.vitaflo.innova.Client','UPDATE',102),(48,'email','2010-05-19 09:05:11',NULL,'horacio',NULL,'compras@ospiacapital.org.ar',NULL,'2010-05-19 09:05:11','com.vitaflo.innova.Client','UPDATE',102),(49,'address','2010-05-19 09:05:11',NULL,'horacio',NULL,'EEUU 1532',NULL,'2010-05-19 09:05:11','com.vitaflo.innova.Client','UPDATE',102),(50,'contact','2010-05-19 09:05:11',NULL,'horacio',NULL,'Dra. Andrea Torre',NULL,'2010-05-19 09:05:11','com.vitaflo.innova.Client','UPDATE',102),(51,'country','2010-05-19 09:05:11','Argentina','horacio',NULL,'Argentina',NULL,'2010-05-19 09:05:11','com.vitaflo.innova.Client','UPDATE',102),(52,NULL,'2010-05-19 09:05:38',NULL,'horacio',NULL,NULL,NULL,'2010-05-19 09:05:38','com.vitaflo.innova.Client','INSERT',118),(53,NULL,'2010-05-19 09:06:16',NULL,'horacio',NULL,NULL,NULL,'2010-05-19 09:06:16','com.vitaflo.innova.Client','INSERT',119),(54,'phone','2010-05-19 09:07:17',NULL,'horacio',NULL,'4503-8852/ 4587-6356',NULL,'2010-05-19 09:07:17','com.vitaflo.innova.Client','UPDATE',119),(55,'address','2010-05-19 09:07:17',NULL,'horacio',NULL,'Gutenberg 3872 Piso: 2 º Villa Devoto CABA)',NULL,'2010-05-19 09:07:17','com.vitaflo.innova.Client','UPDATE',119),(56,'country','2010-05-19 09:07:17','Argentina','horacio',NULL,'Argentina',NULL,'2010-05-19 09:07:17','com.vitaflo.innova.Client','UPDATE',119),(57,'status','2010-05-19 09:07:41','Enabled','horacio',NULL,'Deleted',NULL,'2010-05-19 09:07:41','com.vitaflo.innova.Client','UPDATE',95),(58,'address','2010-05-21 09:47:46',NULL,'horacio',NULL,'Calle 68 N° 1561 La Plata',NULL,'2010-05-21 09:47:46','com.vitaflo.innova.Client','UPDATE',97),(59,'country','2010-05-21 09:47:46','Argentina','horacio',NULL,'Argentina',NULL,'2010-05-21 09:47:46','com.vitaflo.innova.Client','UPDATE',97),(60,'phone','2010-05-21 09:50:48',NULL,'horacio',NULL,'0351-468-8200',NULL,'2010-05-21 09:50:48','com.vitaflo.innova.Client','UPDATE',112),(61,'address','2010-05-21 09:50:48',NULL,'horacio',NULL,'Avenida Naciones Unidas 346 Córdoba',NULL,'2010-05-21 09:50:48','com.vitaflo.innova.Client','UPDATE',112),(62,'country','2010-05-21 09:50:48','Argentina','horacio',NULL,'Argentina',NULL,'2010-05-21 09:50:48','com.vitaflo.innova.Client','UPDATE',112),(63,'phone','2010-05-21 09:54:39',NULL,'horacio',NULL,'03752-448675',NULL,'2010-05-21 09:54:39','com.vitaflo.innova.Client','UPDATE',113),(64,'address','2010-05-21 09:54:39',NULL,'horacio',NULL,'Bolivar 134 - Posadas- Misiones',NULL,'2010-05-21 09:54:39','com.vitaflo.innova.Client','UPDATE',113),(65,'country','2010-05-21 09:54:39','Argentina','horacio',NULL,'Argentina',NULL,'2010-05-21 09:54:39','com.vitaflo.innova.Client','UPDATE',113),(66,NULL,'2010-05-21 11:01:31',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 11:01:31','com.vitaflo.innova.Supplier','INSERT',7),(67,NULL,'2010-05-21 11:02:34',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 11:02:34','com.vitaflo.innova.Drug','INSERT',41),(68,NULL,'2010-05-21 11:04:15',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 11:04:15','com.vitaflo.innova.Product','INSERT',61),(69,NULL,'2010-05-21 11:04:47',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 11:04:47','com.vitaflo.innova.Product','INSERT',62),(70,NULL,'2010-05-21 11:05:27',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 11:05:27','com.vitaflo.innova.Product','INSERT',63),(71,NULL,'2010-05-21 11:06:00',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 11:06:00','com.vitaflo.innova.Product','INSERT',64),(72,NULL,'2010-05-21 11:16:13',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 11:16:13','com.vitaflo.innova.Product','INSERT',65),(73,NULL,'2010-05-21 12:01:43',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:01:43','com.vitaflo.innova.Product','INSERT',66),(74,NULL,'2010-05-21 12:02:43',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:02:43','com.vitaflo.innova.Product','INSERT',67),(75,NULL,'2010-05-21 12:15:23',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:15:23','com.vitaflo.innova.Product','INSERT',68),(76,NULL,'2010-05-21 12:16:15',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:16:15','com.vitaflo.innova.Product','INSERT',69),(77,NULL,'2010-05-21 12:16:50',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:16:50','com.vitaflo.innova.Product','INSERT',70),(78,NULL,'2010-05-21 12:28:07',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:28:07','com.vitaflo.innova.Product','INSERT',71),(79,NULL,'2010-05-21 12:29:26',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:29:26','com.vitaflo.innova.Product','INSERT',72),(80,NULL,'2010-05-21 12:30:14',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:30:14','com.vitaflo.innova.Product','INSERT',73),(81,NULL,'2010-05-21 12:35:06',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:35:06','com.vitaflo.innova.Product','INSERT',74),(82,NULL,'2010-05-21 12:35:43',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:35:43','com.vitaflo.innova.Product','INSERT',75),(83,NULL,'2010-05-21 12:37:05',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:37:05','com.vitaflo.innova.Product','INSERT',76),(84,NULL,'2010-05-21 12:37:44',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:37:44','com.vitaflo.innova.Product','INSERT',77),(85,NULL,'2010-05-21 12:38:39',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:38:39','com.vitaflo.innova.Product','INSERT',78),(86,NULL,'2010-05-21 12:45:04',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:45:04','com.vitaflo.innova.Product','INSERT',79),(87,NULL,'2010-05-21 12:45:56',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:45:56','com.vitaflo.innova.Product','INSERT',80),(88,NULL,'2010-05-21 12:47:00',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:47:00','com.vitaflo.innova.Product','INSERT',81),(89,NULL,'2010-05-21 12:48:01',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:48:01','com.vitaflo.innova.Product','INSERT',82),(90,NULL,'2010-05-21 12:49:19',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:49:19','com.vitaflo.innova.Product','INSERT',83),(91,NULL,'2010-05-21 12:51:02',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:51:02','com.vitaflo.innova.Product','INSERT',84),(92,NULL,'2010-05-21 12:51:54',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:51:54','com.vitaflo.innova.Product','INSERT',85),(93,NULL,'2010-05-21 12:53:30',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:53:30','com.vitaflo.innova.Product','INSERT',86),(94,NULL,'2010-05-21 12:54:40',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:54:40','com.vitaflo.innova.Product','INSERT',87),(95,NULL,'2010-05-21 12:55:19',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:55:19','com.vitaflo.innova.Product','INSERT',88),(96,NULL,'2010-05-21 12:55:54',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:55:54','com.vitaflo.innova.Product','INSERT',89),(97,NULL,'2010-05-21 12:56:50',NULL,'horacio',NULL,NULL,NULL,'2010-05-21 12:56:50','com.vitaflo.innova.Product','INSERT',90),(98,NULL,'2010-05-26 13:06:37',NULL,'horacio',NULL,NULL,NULL,'2010-05-26 13:06:37','com.vitaflo.innova.Patient','INSERT',90),(99,'client','2010-05-26 13:06:56','AMUR','horacio',NULL,'OSDE',NULL,'2010-05-26 13:06:56','com.vitaflo.innova.Patient','UPDATE',90),(100,'country','2010-05-26 13:06:56','Argentina','horacio',NULL,'Argentina',NULL,'2010-05-26 13:06:56','com.vitaflo.innova.Patient','UPDATE',90),(101,NULL,'2010-05-26 13:09:36',NULL,'horacio',NULL,NULL,NULL,'2010-05-26 13:09:36','com.vitaflo.innova.Patient','INSERT',91),(102,NULL,'2010-05-26 13:35:22',NULL,'horacio',NULL,NULL,NULL,'2010-05-26 13:35:22','com.vitaflo.innova.Client','INSERT',120),(103,'client','2010-05-26 13:36:04','AMUR','horacio',NULL,'Reintegro swiss medical',NULL,'2010-05-26 13:36:04','com.vitaflo.innova.Patient','UPDATE',91),(104,'country','2010-05-26 13:36:04','Argentina','horacio',NULL,'Argentina',NULL,'2010-05-26 13:36:04','com.vitaflo.innova.Patient','UPDATE',91),(105,NULL,'2010-05-26 13:49:37',NULL,'horacio',NULL,NULL,NULL,'2010-05-26 13:49:37','com.vitaflo.innova.Drug','INSERT',42),(106,NULL,'2010-05-26 13:51:53',NULL,'horacio',NULL,NULL,NULL,'2010-05-26 13:51:53','com.vitaflo.innova.Drug','INSERT',43),(107,NULL,'2010-05-26 13:54:21',NULL,'horacio',NULL,NULL,NULL,'2010-05-26 13:54:21','com.vitaflo.innova.Drug','INSERT',44),(108,NULL,'2010-05-26 13:55:20',NULL,'horacio',NULL,NULL,NULL,'2010-05-26 13:55:20','com.vitaflo.innova.Drug','INSERT',45),(109,NULL,'2010-05-26 13:56:42',NULL,'horacio',NULL,NULL,NULL,'2010-05-26 13:56:42','com.vitaflo.innova.Drug','INSERT',46),(110,NULL,'2010-05-26 13:57:53',NULL,'horacio',NULL,NULL,NULL,'2010-05-26 13:57:53','com.vitaflo.innova.Drug','INSERT',47),(111,NULL,'2010-05-26 13:58:13',NULL,'horacio',NULL,NULL,NULL,'2010-05-26 13:58:13','com.vitaflo.innova.Drug','INSERT',48),(112,NULL,'2010-05-26 13:58:27',NULL,'horacio',NULL,NULL,NULL,'2010-05-26 13:58:27','com.vitaflo.innova.Drug','INSERT',49),(113,NULL,'2010-05-26 13:58:51',NULL,'horacio',NULL,NULL,NULL,'2010-05-26 13:58:51','com.vitaflo.innova.Drug','INSERT',50),(114,NULL,'2010-05-26 13:59:06',NULL,'horacio',NULL,NULL,NULL,'2010-05-26 13:59:06','com.vitaflo.innova.Drug','INSERT',51),(115,NULL,'2010-05-26 13:59:35',NULL,'horacio',NULL,NULL,NULL,'2010-05-26 13:59:35','com.vitaflo.innova.Drug','INSERT',52),(116,NULL,'2010-05-26 14:00:11',NULL,'horacio',NULL,NULL,NULL,'2010-05-26 14:00:11','com.vitaflo.innova.Drug','INSERT',53),(117,'description','2010-05-26 14:02:20','Arginine Amino Acid Supplement\r\n30 x 4g sachets','horacio',NULL,'Advertencias\r\n\r\n    * Este producto debe ser utilizado bajo estricto control médico.\r\n    * No debe usarse como única fuente de nutrición.\r\n    * No está diseñado para el uso endovenoso.\r\n    * No se aconseja su administración a menores de 12 meses de eda',NULL,'2010-05-26 14:02:20','com.vitaflo.innova.Product','UPDATE',79),(118,'supplier','2010-05-26 14:02:20','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-05-26 14:02:20','com.vitaflo.innova.Product','UPDATE',79),(119,'drug','2010-05-26 14:02:20','Mezcla de Aminoacidos','horacio',NULL,'arginina a base de carbohidratos',NULL,'2010-05-26 14:02:20','com.vitaflo.innova.Product','UPDATE',79),(120,'description','2010-05-26 14:08:47','Cistine Amino Acid Supplement\r\n30 x 4g sachets','horacio',NULL,'Advertencias\r\n\r\n    * Este producto debe ser utilizado bajo estricto control médico.\r\n    * No debe usarse como única fuente de nutrición.\r\n    * No está diseñado para el uso endovenoso.\r\n    * No se aconseja su administración a menores de 12 meses de eda',NULL,'2010-05-26 14:08:47','com.vitaflo.innova.Product','UPDATE',80),(121,'supplier','2010-05-26 14:08:47','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-05-26 14:08:47','com.vitaflo.innova.Product','UPDATE',80),(122,'drug','2010-05-26 14:08:47','Mezcla de Aminoacidos','horacio',NULL,'cistina a base de carbohidratos',NULL,'2010-05-26 14:08:47','com.vitaflo.innova.Product','UPDATE',80),(123,'supplier','2010-05-26 14:09:43','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-05-26 14:09:43','com.vitaflo.innova.Product','UPDATE',66),(124,'drug','2010-05-26 14:09:43','Mezcla de Aminoacidos','horacio',NULL,'Sustituto proteico libre de fenilalanina',NULL,'2010-05-26 14:09:43','com.vitaflo.innova.Product','UPDATE',66),(125,'supplier','2010-05-26 14:10:03','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-05-26 14:10:03','com.vitaflo.innova.Product','UPDATE',84),(126,'drug','2010-05-26 14:10:03','Mezcla de Aminoacidos','horacio',NULL,'Sustituto proteico libre de fenilalanina',NULL,'2010-05-26 14:10:03','com.vitaflo.innova.Product','UPDATE',84),(127,'supplier','2010-05-26 14:10:26','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-05-26 14:10:26','com.vitaflo.innova.Product','UPDATE',67),(128,'drug','2010-05-26 14:10:26','Mezcla de Aminoacidos','horacio',NULL,'Sustituto proteico libre de fenilalanina',NULL,'2010-05-26 14:10:26','com.vitaflo.innova.Product','UPDATE',67),(129,'client','2010-05-27 12:19:45','OSDE','horacio',NULL,'OSDEPYM',NULL,'2010-05-27 12:19:45','com.vitaflo.innova.Patient','UPDATE',92),(130,'country','2010-05-27 12:19:46','Argentina','horacio',NULL,'Argentina',NULL,'2010-05-27 12:19:46','com.vitaflo.innova.Patient','UPDATE',92),(131,NULL,'2010-05-27 12:47:17',NULL,'horacio',NULL,NULL,NULL,'2010-05-27 12:47:17','com.vitaflo.innova.Patient','INSERT',93),(132,'phone','2010-05-27 12:49:43',NULL,'horacio',NULL,'4871-1192',NULL,'2010-05-27 12:49:43','com.vitaflo.innova.Patient','UPDATE',93),(133,'client','2010-05-27 12:49:43','OSDE','horacio',NULL,'OSDE',NULL,'2010-05-27 12:49:43','com.vitaflo.innova.Patient','UPDATE',93),(134,'physician','2010-05-27 12:49:43','Mariana Nuñez','horacio',NULL,'Mariana Nu&ntilde;ez',NULL,'2010-05-27 12:49:43','com.vitaflo.innova.Patient','UPDATE',93),(135,'country','2010-05-27 12:49:43','Argentina','horacio',NULL,'Argentina',NULL,'2010-05-27 12:49:43','com.vitaflo.innova.Patient','UPDATE',93),(136,'contactName','2010-05-27 12:49:43',NULL,'horacio',NULL,'Eugenia cel 15-53296387',NULL,'2010-05-27 12:49:43','com.vitaflo.innova.Patient','UPDATE',93),(137,'deliveryAddress','2010-05-27 12:49:44',NULL,'horacio',NULL,'Casa del paciente\r\nDel Nogal Nº 5, Barrio La Alameda, Nordelta',NULL,'2010-05-27 12:49:44','com.vitaflo.innova.Patient','UPDATE',93),(138,NULL,'2010-05-27 12:51:16',NULL,'horacio',NULL,NULL,NULL,'2010-05-27 12:51:16','com.vitaflo.innova.Patient','INSERT',94),(139,'client','2010-05-27 13:00:52','AMUR','horacio',NULL,'OSDEPYM',NULL,'2010-05-27 13:00:52','com.vitaflo.innova.Patient','UPDATE',94),(140,'country','2010-05-27 13:00:52','Argentina','horacio',NULL,'Argentina',NULL,'2010-05-27 13:00:52','com.vitaflo.innova.Patient','UPDATE',94),(141,NULL,'2010-05-27 13:03:09',NULL,'horacio',NULL,NULL,NULL,'2010-05-27 13:03:09','com.vitaflo.innova.Patient','INSERT',95),(142,NULL,'2010-05-27 13:06:09',NULL,'horacio',NULL,NULL,NULL,'2010-05-27 13:06:09','com.vitaflo.innova.Patient','INSERT',96),(143,'supplier','2010-06-01 09:46:26','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 09:46:26','com.vitaflo.innova.Product','UPDATE',63),(144,'drug','2010-06-01 09:46:27','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 09:46:27','com.vitaflo.innova.Product','UPDATE',63),(145,'description','2010-06-01 09:46:58','Caja de 30 sobres de 20gr conteniendo 8.4 Gramos de Proteina','horacio',NULL,'Caja de 30 sobres de 20gr conteniendo 8.4 Gramos de Proteina\r\n\r\nSustituto proteico en polvo para preparar gel o bebida libre de fenilalanina para el manejo dietario de los niños con fenilcetonuria desde los 12 meses a los 10 años de edad.',NULL,'2010-06-01 09:46:58','com.vitaflo.innova.Product','UPDATE',62),(146,'supplier','2010-06-01 09:46:58','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 09:46:58','com.vitaflo.innova.Product','UPDATE',62),(147,'drug','2010-06-01 09:46:58','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 09:46:58','com.vitaflo.innova.Product','UPDATE',62),(148,'description','2010-06-01 09:47:10','Caja de 30 sobres de 20gr conteniendo 8.4 Gramos de Proteina','horacio',NULL,'Caja de 30 sobres de 20gr conteniendo 8.4 Gramos de Proteina\r\n\r\nSustituto proteico en polvo para preparar gel o bebida libre de fenilalanina para el manejo dietario de los niños con fenilcetonuria desde los 12 meses a los 10 años de edad.',NULL,'2010-06-01 09:47:10','com.vitaflo.innova.Product','UPDATE',61),(149,'supplier','2010-06-01 09:47:10','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 09:47:10','com.vitaflo.innova.Product','UPDATE',61),(150,'drug','2010-06-01 09:47:10','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 09:47:10','com.vitaflo.innova.Product','UPDATE',61),(151,'description','2010-06-01 09:47:58','Caja de 30 sobres de 25gr conteniendo 15 Gramos de Proteina','horacio',NULL,'Caja de 30 sobres de 25gr conteniendo 15 Gramos de Proteina\r\n\r\nSustituto proteico en polvo para preparar bebida libre de fenilalanina para el manejo dietario de los pacientes con fenilcetonuria a partir de los 8 años en adelante.',NULL,'2010-06-01 09:47:58','com.vitaflo.innova.Product','UPDATE',65),(152,'supplier','2010-06-01 09:47:58','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 09:47:58','com.vitaflo.innova.Product','UPDATE',65),(153,'drug','2010-06-01 09:47:58','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 09:47:58','com.vitaflo.innova.Product','UPDATE',65),(154,'description','2010-06-01 10:01:53','Caja de 30 Pomos de 87 ml contentiendo 10 Gramos de Proteina','horacio',NULL,'Caja de 30 Pomos de 87 ml contentiendo 10 Gramos de Proteina\r\n\r\nSustituto proteico libre de fenilalanina, listo para beber, para el manejo dietario de los pacientes con fenilcetonuria desde los tres años en adelante.',NULL,'2010-06-01 10:01:53','com.vitaflo.innova.Product','UPDATE',66),(155,'supplier','2010-06-01 10:01:53','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:01:53','com.vitaflo.innova.Product','UPDATE',66),(156,'drug','2010-06-01 10:01:53','Sustituto proteico libre de fenilalanina','horacio',NULL,'Sustituto proteico libre de fenilalanina',NULL,'2010-06-01 10:01:53','com.vitaflo.innova.Product','UPDATE',66),(157,'description','2010-06-01 10:02:06','Caja de 30 Pomos de 87 ml contentiendo 10 Gramos de Proteina','horacio',NULL,'Caja de 30 Pomos de 87 ml contentiendo 10 Gramos de Proteina\r\n\r\nSustituto proteico libre de fenilalanina, listo para beber, para el manejo dietario de los pacientes con fenilcetonuria desde los tres años en adelante.',NULL,'2010-06-01 10:02:06','com.vitaflo.innova.Product','UPDATE',84),(158,'supplier','2010-06-01 10:02:06','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:02:06','com.vitaflo.innova.Product','UPDATE',84),(159,'drug','2010-06-01 10:02:06','Sustituto proteico libre de fenilalanina','horacio',NULL,'Sustituto proteico libre de fenilalanina',NULL,'2010-06-01 10:02:06','com.vitaflo.innova.Product','UPDATE',84),(160,'description','2010-06-01 10:02:22','Caja de 30 Pomos de 87 ml contentiendo 10 Gramos de Proteina','horacio',NULL,'Caja de 30 Pomos de 87 ml contentiendo 10 Gramos de Proteina\r\n\r\nSustituto proteico libre de fenilalanina, listo para beber, para el manejo dietario de los pacientes con fenilcetonuria desde los tres años en adelante.',NULL,'2010-06-01 10:02:22','com.vitaflo.innova.Product','UPDATE',67),(161,'supplier','2010-06-01 10:02:22','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:02:22','com.vitaflo.innova.Product','UPDATE',67),(162,'drug','2010-06-01 10:02:22','Sustituto proteico libre de fenilalanina','horacio',NULL,'Sustituto proteico libre de fenilalanina',NULL,'2010-06-01 10:02:22','com.vitaflo.innova.Product','UPDATE',67),(163,'description','2010-06-01 10:03:38','Caja de 30 Pomos de 130 ml conteniendo 15 Gramos de Proteina','horacio',NULL,'Caja de 30 Pomos de 130 ml conteniendo 15 Gramos de Proteina\r\n\r\nSustituto proteico libre de fenilalanina, listo para beber, para el manejo dietario de los pacientes con fenilcetonuria desde los 3 años en adelante.',NULL,'2010-06-01 10:03:38','com.vitaflo.innova.Product','UPDATE',68),(164,'supplier','2010-06-01 10:03:38','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:03:38','com.vitaflo.innova.Product','UPDATE',68),(165,'drug','2010-06-01 10:03:38','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 10:03:38','com.vitaflo.innova.Product','UPDATE',68),(166,'description','2010-06-01 10:03:50','Caja de 30 Pomos de 130 ml conteniendo 15 Gramos de Proteina','horacio',NULL,'Caja de 30 Pomos de 130 ml conteniendo 15 Gramos de Proteina\r\n\r\nSustituto proteico libre de fenilalanina, listo para beber, para el manejo dietario de los pacientes con fenilcetonuria desde los 3 años en adelante.',NULL,'2010-06-01 10:03:50','com.vitaflo.innova.Product','UPDATE',85),(167,'supplier','2010-06-01 10:03:50','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:03:50','com.vitaflo.innova.Product','UPDATE',85),(168,'drug','2010-06-01 10:03:50','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 10:03:50','com.vitaflo.innova.Product','UPDATE',85),(169,'description','2010-06-01 10:04:05','Caja de 30 Pomos de 130 ml conteniendo 15 Gramos de Proteina','horacio',NULL,'Caja de 30 Pomos de 130 ml conteniendo 15 Gramos de Proteina\r\n\r\nSustituto proteico libre de fenilalanina, listo para beber, para el manejo dietario de los pacientes con fenilcetonuria desde los 3 años en adelante.',NULL,'2010-06-01 10:04:05','com.vitaflo.innova.Product','UPDATE',69),(170,'supplier','2010-06-01 10:04:05','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:04:05','com.vitaflo.innova.Product','UPDATE',69),(171,'drug','2010-06-01 10:04:05','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 10:04:05','com.vitaflo.innova.Product','UPDATE',69),(172,'description','2010-06-01 10:04:28','Caja de 30 Pomos de 174 ml conteniendo 20 Gramos de Proteina','horacio',NULL,'Caja de 30 Pomos de 174 ml conteniendo 20 Gramos de Proteina\r\n\r\nSustituto proteico libre de fenilalanina, listo para beber, para el manejo dietario de los pacientes con fenilcetonuria desde los 3 años en adelante.',NULL,'2010-06-01 10:04:28','com.vitaflo.innova.Product','UPDATE',86),(173,'supplier','2010-06-01 10:04:28','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:04:28','com.vitaflo.innova.Product','UPDATE',86),(174,'drug','2010-06-01 10:04:28','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 10:04:28','com.vitaflo.innova.Product','UPDATE',86),(175,'description','2010-06-01 10:05:36','Caja de 30 sobres de 25gr conteniendo 15 Gramos de Proteina','horacio',NULL,'Caja de 30 sobres de 25gr conteniendo 15 Gramos de Proteina\r\n\r\nSustituto proteico líquido listo para beber libre de leucina, isoleucina y valina para el manejo dietario de los pacientes con enfermedad de orina con olor a jarabe de arce de desde los 8 años',NULL,'2010-06-01 10:05:36','com.vitaflo.innova.Product','UPDATE',77),(176,'supplier','2010-06-01 10:05:36','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:05:36','com.vitaflo.innova.Product','UPDATE',77),(177,'drug','2010-06-01 10:05:36','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 10:05:36','com.vitaflo.innova.Product','UPDATE',77),(178,'description','2010-06-01 10:06:12','Caja de 30 sobres de 20gr conteniendo 8.4 Gramos de Proteina','horacio',NULL,'Caja de 30 sobres de 20gr conteniendo 8.4 Gramos de Proteina\r\n\r\nSustituto proteico líquido listo para beber libre de leucina, isoleucina y valina para el manejo dietario de los pacientes con enfermedad de orina con olor a jarabe de arce de desde los 8 año',NULL,'2010-06-01 10:06:12','com.vitaflo.innova.Product','UPDATE',76),(179,'supplier','2010-06-01 10:06:12','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:06:12','com.vitaflo.innova.Product','UPDATE',76),(180,'drug','2010-06-01 10:06:12','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 10:06:12','com.vitaflo.innova.Product','UPDATE',76),(181,'description','2010-06-01 10:06:51','Isoleucine Amino Acid Supplement\r\n30 x 4g sachets','horacio',NULL,'Isoleucine Amino Acid Supplement\r\n30 x 4g sachets\r\n\r\nSuplemento en polvo de isoleucina a base de carbohidratos. Para ser usado junto con el sustituto proteico para la enfermedad de orina con olor a jarabe de arce (MSUD)',NULL,'2010-06-01 10:06:51','com.vitaflo.innova.Product','UPDATE',82),(182,'supplier','2010-06-01 10:06:52','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:06:52','com.vitaflo.innova.Product','UPDATE',82),(183,'drug','2010-06-01 10:06:52','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 10:06:52','com.vitaflo.innova.Product','UPDATE',82),(184,'description','2010-06-01 10:08:26','Ingredients\r\n\r\nDry Glucose Syrup and L-Valine.\r\nImportant Information\r\n\r\nThe product must only be given to patients with proven Maple Syrup Urine Disease under strict medical supervision. It is not to be used as a sole source of nutrition.\r\nDosage and Adm','horacio',NULL,'Disponible en envases de 30 sobres de 4 gramos cada uno. Peso Neto : 0,12 Kg \r\n\r\nSuplemento en polvo del aminoácido Valina a base de carbohidratos para ser usado junto con un sustituto proteico para la enfermedad de orina con olor a jarabe de arce (MSUD) ',NULL,'2010-06-01 10:08:26','com.vitaflo.innova.Product','UPDATE',83),(185,'supplier','2010-06-01 10:08:26','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:08:26','com.vitaflo.innova.Product','UPDATE',83),(186,'drug','2010-06-01 10:08:26','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 10:08:26','com.vitaflo.innova.Product','UPDATE',83),(187,'description','2010-06-01 10:09:27','Tyrosine Amino Acid Supplement\r\n30 x 4g sachets','horacio',NULL,'Disponible en envases de 30 sobres de 4 gramos cada uno. Peso Neto : 0,12 Kg \r\n\r\nSuplemento en polvo del aminoácido Tirosina a base de carbohidratos, para ser usado en pacientes desde los 12 meses de edad.',NULL,'2010-06-01 10:09:27','com.vitaflo.innova.Product','UPDATE',81),(188,'supplier','2010-06-01 10:09:27','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:09:27','com.vitaflo.innova.Product','UPDATE',81),(189,'drug','2010-06-01 10:09:27','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 10:09:27','com.vitaflo.innova.Product','UPDATE',81),(190,'description','2010-06-01 10:10:37','Advertencias\r\n\r\n    * Este producto debe ser utilizado bajo estricto control médico.\r\n    * No debe usarse como única fuente de nutrición.\r\n    * No está diseñado para el uso endovenoso.\r\n    * No se aconseja su administración a menores de 12 meses de eda','horacio',NULL,'Disponible en envases de 30 sobres de 4 gramos cada uno. Peso Neto : 0,12 Kg \r\n\r\nSuplemento en polvo del aminoácido Cistina a base de carbohidratos, para ser usado en pacientes desde los 12 meses de edad.',NULL,'2010-06-01 10:10:37','com.vitaflo.innova.Product','UPDATE',80),(191,'name','2010-06-01 10:10:37','Cistine','horacio',NULL,'Cistina',NULL,'2010-06-01 10:10:37','com.vitaflo.innova.Product','UPDATE',80),(192,'comercialName','2010-06-01 10:10:37','Cistine','horacio',NULL,'Cistina',NULL,'2010-06-01 10:10:37','com.vitaflo.innova.Product','UPDATE',80),(193,'supplier','2010-06-01 10:10:37','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:10:37','com.vitaflo.innova.Product','UPDATE',80),(194,'drug','2010-06-01 10:10:37','cistina a base de carbohidratos','horacio',NULL,'cistina a base de carbohidratos',NULL,'2010-06-01 10:10:37','com.vitaflo.innova.Product','UPDATE',80),(195,'comercialName','2010-06-01 10:11:20',NULL,'horacio',NULL,'PKU Cooler 10',NULL,'2010-06-01 10:11:20','com.vitaflo.innova.Product','UPDATE',66),(196,'supplier','2010-06-01 10:11:20','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:11:20','com.vitaflo.innova.Product','UPDATE',66),(197,'drug','2010-06-01 10:11:20','Sustituto proteico libre de fenilalanina','horacio',NULL,'Sustituto proteico libre de fenilalanina',NULL,'2010-06-01 10:11:20','com.vitaflo.innova.Product','UPDATE',66),(198,'comercialName','2010-06-01 10:11:40',NULL,'horacio',NULL,'PKU Cooler',NULL,'2010-06-01 10:11:40','com.vitaflo.innova.Product','UPDATE',67),(199,'supplier','2010-06-01 10:11:40','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:11:40','com.vitaflo.innova.Product','UPDATE',67),(200,'drug','2010-06-01 10:11:40','Sustituto proteico libre de fenilalanina','horacio',NULL,'Sustituto proteico libre de fenilalanina',NULL,'2010-06-01 10:11:40','com.vitaflo.innova.Product','UPDATE',67),(201,'comercialName','2010-06-01 10:12:01',NULL,'horacio',NULL,'PKU Cooler 15',NULL,'2010-06-01 10:12:01','com.vitaflo.innova.Product','UPDATE',68),(202,'supplier','2010-06-01 10:12:01','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:12:01','com.vitaflo.innova.Product','UPDATE',68),(203,'drug','2010-06-01 10:12:01','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 10:12:01','com.vitaflo.innova.Product','UPDATE',68),(204,'comercialName','2010-06-01 10:12:14',NULL,'horacio',NULL,'PKU Cooler 15',NULL,'2010-06-01 10:12:14','com.vitaflo.innova.Product','UPDATE',69),(205,'supplier','2010-06-01 10:12:14','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:12:14','com.vitaflo.innova.Product','UPDATE',69),(206,'drug','2010-06-01 10:12:14','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 10:12:14','com.vitaflo.innova.Product','UPDATE',69),(207,'comercialName','2010-06-01 10:12:42',NULL,'horacio',NULL,'PKU express',NULL,'2010-06-01 10:12:42','com.vitaflo.innova.Product','UPDATE',65),(208,'supplier','2010-06-01 10:12:42','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:12:42','com.vitaflo.innova.Product','UPDATE',65),(209,'drug','2010-06-01 10:12:42','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 10:12:42','com.vitaflo.innova.Product','UPDATE',65),(210,'comercialName','2010-06-01 10:12:53',NULL,'horacio',NULL,'PKU express',NULL,'2010-06-01 10:12:53','com.vitaflo.innova.Product','UPDATE',64),(211,'supplier','2010-06-01 10:12:53','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:12:53','com.vitaflo.innova.Product','UPDATE',64),(212,'drug','2010-06-01 10:12:53','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 10:12:53','com.vitaflo.innova.Product','UPDATE',64),(213,'comercialName','2010-06-01 10:13:08',NULL,'horacio',NULL,'PKU gel',NULL,'2010-06-01 10:13:08','com.vitaflo.innova.Product','UPDATE',62),(214,'supplier','2010-06-01 10:13:08','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:13:08','com.vitaflo.innova.Product','UPDATE',62),(215,'drug','2010-06-01 10:13:08','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 10:13:08','com.vitaflo.innova.Product','UPDATE',62),(216,'comercialName','2010-06-01 10:13:20',NULL,'horacio',NULL,'PKU gel',NULL,'2010-06-01 10:13:20','com.vitaflo.innova.Product','UPDATE',61),(217,'supplier','2010-06-01 10:13:20','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:13:20','com.vitaflo.innova.Product','UPDATE',61),(218,'drug','2010-06-01 10:13:20','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 10:13:20','com.vitaflo.innova.Product','UPDATE',61),(219,'comercialName','2010-06-01 10:13:33',NULL,'horacio',NULL,'PKU gel',NULL,'2010-06-01 10:13:33','com.vitaflo.innova.Product','UPDATE',63),(220,'supplier','2010-06-01 10:13:33','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:13:33','com.vitaflo.innova.Product','UPDATE',63),(221,'drug','2010-06-01 10:13:33','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 10:13:33','com.vitaflo.innova.Product','UPDATE',63),(222,'comercialName','2010-06-01 10:14:00',NULL,'horacio',NULL,'PKUI Cooler 20',NULL,'2010-06-01 10:14:00','com.vitaflo.innova.Product','UPDATE',70),(223,'supplier','2010-06-01 10:14:00','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:14:00','com.vitaflo.innova.Product','UPDATE',70),(224,'drug','2010-06-01 10:14:00','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 10:14:00','com.vitaflo.innova.Product','UPDATE',70),(225,'comercialName','2010-06-01 10:14:15',NULL,'horacio',NULL,'PKUI Cooler 20',NULL,'2010-06-01 10:14:15','com.vitaflo.innova.Product','UPDATE',71),(226,'supplier','2010-06-01 10:14:15','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 10:14:15','com.vitaflo.innova.Product','UPDATE',71),(227,'drug','2010-06-01 10:14:15','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 10:14:15','com.vitaflo.innova.Product','UPDATE',71),(228,NULL,'2010-06-01 11:03:12',NULL,'horacio',NULL,NULL,NULL,'2010-06-01 11:03:12','com.vitaflo.innova.User','INSERT',7),(229,'countries','2010-06-01 11:03:13',NULL,'horacio',NULL,'[Argentina]',NULL,'2010-06-01 11:03:13','com.vitaflo.innova.User','UPDATE',7),(230,'authorities','2010-06-01 11:03:13',NULL,'horacio',NULL,'[ROLE_USER]',NULL,'2010-06-01 11:03:13','com.vitaflo.innova.User','UPDATE',7),(231,'price','2010-06-01 11:12:58','0.0','horacio',NULL,'150.0',NULL,'2010-06-01 11:12:58','com.vitaflo.innova.Product','UPDATE',79),(232,'supplier','2010-06-01 11:12:58','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 11:12:58','com.vitaflo.innova.Product','UPDATE',79),(233,'drug','2010-06-01 11:12:58','arginina a base de carbohidratos','horacio',NULL,'arginina a base de carbohidratos',NULL,'2010-06-01 11:12:58','com.vitaflo.innova.Product','UPDATE',79),(234,'price','2010-06-01 11:13:29','0.0','horacio',NULL,'150.0',NULL,'2010-06-01 11:13:29','com.vitaflo.innova.Product','UPDATE',80),(235,'supplier','2010-06-01 11:13:29','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 11:13:29','com.vitaflo.innova.Product','UPDATE',80),(236,'drug','2010-06-01 11:13:29','cistina a base de carbohidratos','horacio',NULL,'cistina a base de carbohidratos',NULL,'2010-06-01 11:13:29','com.vitaflo.innova.Product','UPDATE',80),(237,'price','2010-06-01 11:14:12','0.0','horacio',NULL,'75.0',NULL,'2010-06-01 11:14:12','com.vitaflo.innova.Product','UPDATE',72),(238,'supplier','2010-06-01 11:14:12','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 11:14:12','com.vitaflo.innova.Product','UPDATE',72),(239,'drug','2010-06-01 11:14:12','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 11:14:12','com.vitaflo.innova.Product','UPDATE',72),(240,'price','2010-06-01 11:14:40','0.0','horacio',NULL,'75.0',NULL,'2010-06-01 11:14:40','com.vitaflo.innova.Product','UPDATE',73),(241,'supplier','2010-06-01 11:14:40','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 11:14:40','com.vitaflo.innova.Product','UPDATE',73),(242,'drug','2010-06-01 11:14:40','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 11:14:40','com.vitaflo.innova.Product','UPDATE',73),(243,'price','2010-06-01 11:14:52','0.0','horacio',NULL,'75.0',NULL,'2010-06-01 11:14:52','com.vitaflo.innova.Product','UPDATE',74),(244,'supplier','2010-06-01 11:14:52','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 11:14:52','com.vitaflo.innova.Product','UPDATE',74),(245,'drug','2010-06-01 11:14:52','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 11:14:52','com.vitaflo.innova.Product','UPDATE',74),(246,'price','2010-06-01 11:15:28','0.0','horacio',NULL,'645.0',NULL,'2010-06-01 11:15:28','com.vitaflo.innova.Product','UPDATE',89),(247,'supplier','2010-06-01 11:15:28','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 11:15:28','com.vitaflo.innova.Product','UPDATE',89),(248,'drug','2010-06-01 11:15:28','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 11:15:28','com.vitaflo.innova.Product','UPDATE',89),(249,'price','2010-06-01 12:23:29','0.0','horacio',NULL,'485.0',NULL,'2010-06-01 12:23:29','com.vitaflo.innova.Product','UPDATE',88),(250,'supplier','2010-06-01 12:23:29','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 12:23:29','com.vitaflo.innova.Product','UPDATE',88),(251,'drug','2010-06-01 12:23:29','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 12:23:29','com.vitaflo.innova.Product','UPDATE',88),(252,'price','2010-06-01 12:24:18','0.0','horacio',NULL,'150.0',NULL,'2010-06-01 12:24:18','com.vitaflo.innova.Product','UPDATE',82),(253,'supplier','2010-06-01 12:24:18','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 12:24:18','com.vitaflo.innova.Product','UPDATE',82),(254,'drug','2010-06-01 12:24:18','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 12:24:18','com.vitaflo.innova.Product','UPDATE',82),(255,'price','2010-06-01 12:24:49','0.0','horacio',NULL,'645.0',NULL,'2010-06-01 12:24:49','com.vitaflo.innova.Product','UPDATE',87),(256,'supplier','2010-06-01 12:24:49','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 12:24:49','com.vitaflo.innova.Product','UPDATE',87),(257,'drug','2010-06-01 12:24:49','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 12:24:49','com.vitaflo.innova.Product','UPDATE',87),(258,'price','2010-06-01 12:26:00','0.0','horacio',NULL,'485.0',NULL,'2010-06-01 12:26:00','com.vitaflo.innova.Product','UPDATE',78),(259,'supplier','2010-06-01 12:26:00','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 12:26:00','com.vitaflo.innova.Product','UPDATE',78),(260,'drug','2010-06-01 12:26:00','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 12:26:00','com.vitaflo.innova.Product','UPDATE',78),(261,'price','2010-06-01 12:26:23','0.0','horacio',NULL,'645.0',NULL,'2010-06-01 12:26:23','com.vitaflo.innova.Product','UPDATE',77),(262,'supplier','2010-06-01 12:26:23','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 12:26:23','com.vitaflo.innova.Product','UPDATE',77),(263,'drug','2010-06-01 12:26:23','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 12:26:23','com.vitaflo.innova.Product','UPDATE',77),(264,'price','2010-06-01 12:26:45','0.0','horacio',NULL,'485.0',NULL,'2010-06-01 12:26:45','com.vitaflo.innova.Product','UPDATE',76),(265,'supplier','2010-06-01 12:26:45','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-01 12:26:45','com.vitaflo.innova.Product','UPDATE',76),(266,'drug','2010-06-01 12:26:45','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-06-01 12:26:45','com.vitaflo.innova.Product','UPDATE',76),(267,NULL,'2010-06-01 12:31:17',NULL,'horacio',NULL,NULL,NULL,'2010-06-01 12:31:17','com.vitaflo.innova.Proforma','INSERT',523),(268,NULL,'2010-06-14 10:31:29',NULL,'horacio',NULL,NULL,NULL,'2010-06-14 10:31:29','com.vitaflo.innova.Patient','INSERT',97),(269,NULL,'2010-06-14 10:40:50',NULL,'horacio',NULL,NULL,NULL,'2010-06-14 10:40:50','com.vitaflo.innova.Patient','INSERT',98),(270,NULL,'2010-06-14 11:23:50',NULL,'horacio',NULL,NULL,NULL,'2010-06-14 11:23:50','com.vitaflo.innova.Patient','INSERT',99),(271,NULL,'2010-06-14 11:26:54',NULL,'horacio',NULL,NULL,NULL,'2010-06-14 11:26:54','com.vitaflo.innova.Patient','INSERT',100),(272,NULL,'2010-06-14 12:10:34',NULL,'horacio',NULL,NULL,NULL,'2010-06-14 12:10:34','com.vitaflo.innova.Patient','INSERT',101),(273,NULL,'2010-06-14 14:57:01',NULL,'horacio',NULL,NULL,NULL,'2010-06-14 14:57:01','com.vitaflo.innova.Patient','INSERT',102),(274,'supplier','2010-06-14 15:31:40','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-06-14 15:31:40','com.vitaflo.innova.Product','UPDATE',89),(275,'drug','2010-06-14 15:31:40','Mezcla de Aminoacidos','horacio',NULL,'Sustituto proteico libre de metionina',NULL,'2010-06-14 15:31:40','com.vitaflo.innova.Product','UPDATE',89),(276,'countries','2010-06-17 11:07:16',NULL,'horacio',NULL,'[Peru, Uruguay, Bolivia, Argentina, Ecuador, Brasil, Venezuela, Chile, Mexico, Colombia]',NULL,'2010-06-17 11:07:16','com.vitaflo.innova.User','UPDATE',8),(277,'authorities','2010-06-17 11:07:16',NULL,'horacio',NULL,'[ROLE_USER]',NULL,'2010-06-17 11:07:16','com.vitaflo.innova.User','UPDATE',8),(278,NULL,'2010-07-12 12:35:08',NULL,'horacio',NULL,NULL,NULL,'2010-07-12 12:35:08','com.vitaflo.innova.Patient','INSERT',103),(279,NULL,'2010-07-12 12:35:56',NULL,'horacio',NULL,NULL,NULL,'2010-07-12 12:35:56','com.vitaflo.innova.Patient','INSERT',104),(280,NULL,'2010-07-12 12:37:26',NULL,'horacio',NULL,NULL,NULL,'2010-07-12 12:37:26','com.vitaflo.innova.Patient','INSERT',105),(281,NULL,'2010-07-12 12:38:40',NULL,'horacio',NULL,NULL,NULL,'2010-07-12 12:38:40','com.vitaflo.innova.Patient','INSERT',106),(282,NULL,'2010-07-14 11:47:49',NULL,'horacio',NULL,NULL,NULL,'2010-07-14 11:47:49','com.vitaflo.innova.Patient','INSERT',108),(283,NULL,'2010-07-14 11:51:26',NULL,'horacio',NULL,NULL,NULL,'2010-07-14 11:51:26','com.vitaflo.innova.Patient','INSERT',109),(284,NULL,'2010-07-14 11:52:46',NULL,'horacio',NULL,NULL,NULL,'2010-07-14 11:52:46','com.vitaflo.innova.Patient','INSERT',110),(285,NULL,'2010-07-14 11:54:53',NULL,'horacio',NULL,NULL,NULL,'2010-07-14 11:54:53','com.vitaflo.innova.Patient','INSERT',111),(286,'client','2010-07-14 11:56:37','OSECAC','horacio',NULL,'IPS Tucumán',NULL,'2010-07-14 11:56:37','com.vitaflo.innova.Patient','UPDATE',111),(287,'pathology','2010-07-14 11:56:37','PKU','horacio',NULL,'Orina con olor a jarabe de Arce',NULL,'2010-07-14 11:56:37','com.vitaflo.innova.Patient','UPDATE',111),(288,'country','2010-07-14 11:56:37','Argentina','horacio',NULL,'Argentina',NULL,'2010-07-14 11:56:37','com.vitaflo.innova.Patient','UPDATE',111),(289,NULL,'2010-07-14 12:01:32',NULL,'horacio',NULL,NULL,NULL,'2010-07-14 12:01:32','com.vitaflo.innova.Patient','INSERT',112),(290,NULL,'2010-07-15 12:38:50',NULL,'horacio',NULL,NULL,NULL,'2010-07-15 12:38:50','com.vitaflo.innova.Patient','INSERT',114),(291,NULL,'2010-07-15 12:40:08',NULL,'horacio',NULL,NULL,NULL,'2010-07-15 12:40:08','com.vitaflo.innova.Patient','INSERT',115),(292,NULL,'2010-07-15 12:43:02',NULL,'horacio',NULL,NULL,NULL,'2010-07-15 12:43:02','com.vitaflo.innova.Patient','INSERT',116),(293,NULL,'2010-07-15 12:45:56',NULL,'horacio',NULL,NULL,NULL,'2010-07-15 12:45:56','com.vitaflo.innova.Patient','INSERT',117),(294,NULL,'2010-07-15 12:47:33',NULL,'horacio',NULL,NULL,NULL,'2010-07-15 12:47:33','com.vitaflo.innova.Patient','INSERT',118),(295,NULL,'2010-07-15 12:48:49',NULL,'horacio',NULL,NULL,NULL,'2010-07-15 12:48:49','com.vitaflo.innova.Patient','INSERT',119),(296,NULL,'2010-07-15 12:51:01',NULL,'horacio',NULL,NULL,NULL,'2010-07-15 12:51:01','com.vitaflo.innova.Patient','INSERT',120),(297,NULL,'2010-07-15 12:53:36',NULL,'horacio',NULL,NULL,NULL,'2010-07-15 12:53:36','com.vitaflo.innova.Patient','INSERT',121),(298,'price','2010-07-15 13:17:22','0.0','horacio',NULL,'590.0',NULL,'2010-07-15 13:17:22','com.vitaflo.innova.Product','UPDATE',66),(299,'supplier','2010-07-15 13:17:22','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-07-15 13:17:22','com.vitaflo.innova.Product','UPDATE',66),(300,'drug','2010-07-15 13:17:22','Sustituto proteico libre de fenilalanina','horacio',NULL,'Sustituto proteico libre de fenilalanina',NULL,'2010-07-15 13:17:22','com.vitaflo.innova.Product','UPDATE',66),(301,'price','2010-07-15 13:17:51','0.0','horacio',NULL,'590.0',NULL,'2010-07-15 13:17:51','com.vitaflo.innova.Product','UPDATE',84),(302,'supplier','2010-07-15 13:17:51','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-07-15 13:17:51','com.vitaflo.innova.Product','UPDATE',84),(303,'drug','2010-07-15 13:17:51','Sustituto proteico libre de fenilalanina','horacio',NULL,'Sustituto proteico libre de fenilalanina',NULL,'2010-07-15 13:17:51','com.vitaflo.innova.Product','UPDATE',84),(304,'price','2010-07-15 13:18:25','0.0','horacio',NULL,'590.0',NULL,'2010-07-15 13:18:25','com.vitaflo.innova.Product','UPDATE',67),(305,'supplier','2010-07-15 13:18:25','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-07-15 13:18:25','com.vitaflo.innova.Product','UPDATE',67),(306,'drug','2010-07-15 13:18:25','Sustituto proteico libre de fenilalanina','horacio',NULL,'Sustituto proteico libre de fenilalanina',NULL,'2010-07-15 13:18:25','com.vitaflo.innova.Product','UPDATE',67),(307,'price','2010-07-15 13:19:59','0.0','horacio',NULL,'910.0',NULL,'2010-07-15 13:19:59','com.vitaflo.innova.Product','UPDATE',68),(308,'supplier','2010-07-15 13:19:59','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-07-15 13:19:59','com.vitaflo.innova.Product','UPDATE',68),(309,'drug','2010-07-15 13:19:59','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-07-15 13:19:59','com.vitaflo.innova.Product','UPDATE',68),(310,'price','2010-07-15 13:20:12','0.0','horacio',NULL,'910.0',NULL,'2010-07-15 13:20:12','com.vitaflo.innova.Product','UPDATE',85),(311,'supplier','2010-07-15 13:20:12','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-07-15 13:20:12','com.vitaflo.innova.Product','UPDATE',85),(312,'drug','2010-07-15 13:20:12','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-07-15 13:20:12','com.vitaflo.innova.Product','UPDATE',85),(313,'price','2010-07-15 13:20:26','0.0','horacio',NULL,'910.0',NULL,'2010-07-15 13:20:26','com.vitaflo.innova.Product','UPDATE',69),(314,'supplier','2010-07-15 13:20:26','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-07-15 13:20:26','com.vitaflo.innova.Product','UPDATE',69),(315,'drug','2010-07-15 13:20:26','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-07-15 13:20:26','com.vitaflo.innova.Product','UPDATE',69),(316,'price','2010-07-15 13:21:14','0.0','horacio',NULL,'1180.0',NULL,'2010-07-15 13:21:14','com.vitaflo.innova.Product','UPDATE',86),(317,'supplier','2010-07-15 13:21:14','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-07-15 13:21:14','com.vitaflo.innova.Product','UPDATE',86),(318,'drug','2010-07-15 13:21:14','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-07-15 13:21:14','com.vitaflo.innova.Product','UPDATE',86),(319,'price','2010-07-15 13:21:59','0.0','horacio',NULL,'430.0',NULL,'2010-07-15 13:21:59','com.vitaflo.innova.Product','UPDATE',65),(320,'supplier','2010-07-15 13:21:59','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-07-15 13:21:59','com.vitaflo.innova.Product','UPDATE',65),(321,'drug','2010-07-15 13:21:59','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-07-15 13:21:59','com.vitaflo.innova.Product','UPDATE',65),(322,'price','2010-07-15 13:22:21','0.0','horacio',NULL,'430.0',NULL,'2010-07-15 13:22:21','com.vitaflo.innova.Product','UPDATE',64),(323,'supplier','2010-07-15 13:22:21','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-07-15 13:22:21','com.vitaflo.innova.Product','UPDATE',64),(324,'drug','2010-07-15 13:22:21','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-07-15 13:22:21','com.vitaflo.innova.Product','UPDATE',64),(325,'price','2010-07-15 13:23:00','0.0','horacio',NULL,'270.0',NULL,'2010-07-15 13:23:00','com.vitaflo.innova.Product','UPDATE',62),(326,'supplier','2010-07-15 13:23:00','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-07-15 13:23:00','com.vitaflo.innova.Product','UPDATE',62),(327,'drug','2010-07-15 13:23:00','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-07-15 13:23:00','com.vitaflo.innova.Product','UPDATE',62),(328,'price','2010-07-15 13:23:19','0.0','horacio',NULL,'270.0',NULL,'2010-07-15 13:23:19','com.vitaflo.innova.Product','UPDATE',61),(329,'supplier','2010-07-15 13:23:19','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-07-15 13:23:19','com.vitaflo.innova.Product','UPDATE',61),(330,'drug','2010-07-15 13:23:19','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-07-15 13:23:19','com.vitaflo.innova.Product','UPDATE',61),(331,'price','2010-07-15 13:23:39','0.0','horacio',NULL,'270.0',NULL,'2010-07-15 13:23:39','com.vitaflo.innova.Product','UPDATE',63),(332,'supplier','2010-07-15 13:23:39','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-07-15 13:23:39','com.vitaflo.innova.Product','UPDATE',63),(333,'drug','2010-07-15 13:23:39','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-07-15 13:23:39','com.vitaflo.innova.Product','UPDATE',63),(334,'price','2010-07-15 13:25:23','0.0','horacio',NULL,'1180.0',NULL,'2010-07-15 13:25:23','com.vitaflo.innova.Product','UPDATE',70),(335,'supplier','2010-07-15 13:25:23','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-07-15 13:25:23','com.vitaflo.innova.Product','UPDATE',70),(336,'drug','2010-07-15 13:25:23','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-07-15 13:25:23','com.vitaflo.innova.Product','UPDATE',70),(337,'price','2010-07-15 13:25:42','0.0','horacio',NULL,'1180.0',NULL,'2010-07-15 13:25:42','com.vitaflo.innova.Product','UPDATE',71),(338,'supplier','2010-07-15 13:25:42','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-07-15 13:25:42','com.vitaflo.innova.Product','UPDATE',71),(339,'drug','2010-07-15 13:25:42','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-07-15 13:25:42','com.vitaflo.innova.Product','UPDATE',71),(340,'price','2010-07-15 13:26:12','0.0','horacio',NULL,'485.0',NULL,'2010-07-15 13:26:12','com.vitaflo.innova.Product','UPDATE',90),(341,'supplier','2010-07-15 13:26:12','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-07-15 13:26:12','com.vitaflo.innova.Product','UPDATE',90),(342,'drug','2010-07-15 13:26:12','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-07-15 13:26:12','com.vitaflo.innova.Product','UPDATE',90),(343,'price','2010-07-15 13:27:27','0.0','horacio',NULL,'150.0',NULL,'2010-07-15 13:27:27','com.vitaflo.innova.Product','UPDATE',81),(344,'supplier','2010-07-15 13:27:27','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-07-15 13:27:27','com.vitaflo.innova.Product','UPDATE',81),(345,'drug','2010-07-15 13:27:27','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-07-15 13:27:27','com.vitaflo.innova.Product','UPDATE',81),(346,'price','2010-07-15 13:27:43','0.0','horacio',NULL,'150.0',NULL,'2010-07-15 13:27:43','com.vitaflo.innova.Product','UPDATE',83),(347,'supplier','2010-07-15 13:27:43','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-07-15 13:27:43','com.vitaflo.innova.Product','UPDATE',83),(348,'drug','2010-07-15 13:27:43','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-07-15 13:27:43','com.vitaflo.innova.Product','UPDATE',83),(349,'price','2010-07-15 13:28:10','0.0','horacio',NULL,'38.0',NULL,'2010-07-15 13:28:10','com.vitaflo.innova.Product','UPDATE',75),(350,'supplier','2010-07-15 13:28:10','Vitaflo U.K','horacio',NULL,'Vitaflo U.K',NULL,'2010-07-15 13:28:10','com.vitaflo.innova.Product','UPDATE',75),(351,'drug','2010-07-15 13:28:10','Mezcla de Aminoacidos','horacio',NULL,'Mezcla de Aminoacidos',NULL,'2010-07-15 13:28:10','com.vitaflo.innova.Product','UPDATE',75),(352,'phone','2010-07-16 14:16:14',NULL,'Flor',NULL,'45865338',NULL,'2010-07-16 14:16:14','com.vitaflo.innova.Patient','UPDATE',113),(353,'client','2010-07-16 14:16:14','IOMA','Flor',NULL,'Obra Social de la Sanidad (OSPSABAMED)',NULL,'2010-07-16 14:16:14','com.vitaflo.innova.Patient','UPDATE',113),(354,'country','2010-07-16 14:16:14','Argentina','Flor',NULL,'Argentina',NULL,'2010-07-16 14:16:14','com.vitaflo.innova.Patient','UPDATE',113),(355,'contactName','2010-07-16 14:16:14',NULL,'Flor',NULL,'María Elena Merela (madre)',NULL,'2010-07-16 14:16:14','com.vitaflo.innova.Patient','UPDATE',113),(356,'status','2010-07-16 14:16:52','Enabled','Flor',NULL,'Deleted',NULL,'2010-07-16 14:16:52','com.vitaflo.innova.Client','UPDATE',118),(357,'status','2010-07-16 14:17:10','Enabled','Flor',NULL,'Deleted',NULL,'2010-07-16 14:17:10','com.vitaflo.innova.Client','UPDATE',105),(358,'phone','2010-07-16 14:23:55',NULL,'Flor',NULL,'52229556',NULL,'2010-07-16 14:23:55','com.vitaflo.innova.Client','UPDATE',103),(359,'email','2010-07-16 14:23:56',NULL,'Flor',NULL,'vfernandez@unionpersonal.com.ar',NULL,'2010-07-16 14:23:56','com.vitaflo.innova.Client','UPDATE',103),(360,'address','2010-07-16 14:23:56',NULL,'Flor',NULL,'Tucuman 949 (1049) CABA',NULL,'2010-07-16 14:23:56','com.vitaflo.innova.Client','UPDATE',103),(361,'contact','2010-07-16 14:23:56',NULL,'Flor',NULL,'Veronica Fernandez, Banco de Drogas',NULL,'2010-07-16 14:23:56','com.vitaflo.innova.Client','UPDATE',103),(362,'country','2010-07-16 14:23:56','Argentina','Flor',NULL,'Argentina',NULL,'2010-07-16 14:23:56','com.vitaflo.innova.Client','UPDATE',103),(363,'phone','2010-07-16 14:33:07',NULL,'Flor',NULL,'Carnicería: 4502-2078',NULL,'2010-07-16 14:33:07','com.vitaflo.innova.Patient','UPDATE',88),(364,'client','2010-07-16 14:33:07','Union Personal','Flor',NULL,'Union Personal',NULL,'2010-07-16 14:33:07','com.vitaflo.innova.Patient','UPDATE',88),(365,'dose','2010-07-16 14:33:07',NULL,'Flor',NULL,'3.0',NULL,'2010-07-16 14:33:07','com.vitaflo.innova.Patient','UPDATE',88),(366,'country','2010-07-16 14:33:07','Argentina','Flor',NULL,'Argentina',NULL,'2010-07-16 14:33:07','com.vitaflo.innova.Patient','UPDATE',88),(367,'contactName','2010-07-16 14:33:07',NULL,'Flor',NULL,'drale55@hotmail.com',NULL,'2010-07-16 14:33:07','com.vitaflo.innova.Patient','UPDATE',88),(368,'deliveryAddress','2010-07-16 14:33:07','Mercedes 4425\r\nC1419BGQ','Flor',NULL,'Mercedes 4425\r\nC1419BGQ CABA\r\nCarnicería Abuelos \r\nHorario 7 a 14,30 y 16,30 a 20 hs',NULL,'2010-07-16 14:33:07','com.vitaflo.innova.Patient','UPDATE',88),(369,'phone','2010-07-16 14:39:12',NULL,'Flor',NULL,'4510-6972',NULL,'2010-07-16 14:39:12','com.vitaflo.innova.Client','UPDATE',100),(370,'address','2010-07-16 14:39:12',NULL,'Flor',NULL,'AV. Leandro N. Alem 1067 Piso: 5º',NULL,'2010-07-16 14:39:12','com.vitaflo.innova.Client','UPDATE',100),(371,'contact','2010-07-16 14:39:12',NULL,'Flor',NULL,'Verónica Castagnino',NULL,'2010-07-16 14:39:12','com.vitaflo.innova.Client','UPDATE',100),(372,'country','2010-07-16 14:39:12','Argentina','Flor',NULL,'Argentina',NULL,'2010-07-16 14:39:12','com.vitaflo.innova.Client','UPDATE',100),(373,'phone','2010-07-16 14:43:49','4552-4276','Flor',NULL,'4552-4276- T: 4571-7416(9a 13 hs)',NULL,'2010-07-16 14:43:49','com.vitaflo.innova.Patient','UPDATE',89),(374,'client','2010-07-16 14:43:49','OSDE','Flor',NULL,'OSDE',NULL,'2010-07-16 14:43:49','com.vitaflo.innova.Patient','UPDATE',89),(375,'country','2010-07-16 14:43:49','Argentina','Flor',NULL,'Argentina',NULL,'2010-07-16 14:43:49','com.vitaflo.innova.Patient','UPDATE',89),(376,'phone','2010-07-16 14:44:08','4552-4276','Flor',NULL,'4552-4276- T: 4571-7416(9a 13 hs)',NULL,'2010-07-16 14:44:08','com.vitaflo.innova.Patient','UPDATE',89),(377,'client','2010-07-16 14:44:08','OSDE','Flor',NULL,'OSDE',NULL,'2010-07-16 14:44:08','com.vitaflo.innova.Patient','UPDATE',89),(378,'country','2010-07-16 14:44:08','Argentina','Flor',NULL,'Argentina',NULL,'2010-07-16 14:44:08','com.vitaflo.innova.Patient','UPDATE',89),(379,'doseUnit','2010-07-16 14:44:08',NULL,'Flor',NULL,'ml',NULL,'2010-07-16 14:44:08','com.vitaflo.innova.Patient','UPDATE',89),(380,'phone','2010-07-16 14:44:43','4552-4276','Flor',NULL,'4552-4276- T: 4571-7416(9a 13 hs)',NULL,'2010-07-16 14:44:43','com.vitaflo.innova.Patient','UPDATE',89),(381,'client','2010-07-16 14:44:43','OSDE','Flor',NULL,'OSDE',NULL,'2010-07-16 14:44:43','com.vitaflo.innova.Patient','UPDATE',89),(382,'dose','2010-07-16 14:44:43',NULL,'Flor',NULL,'2.0',NULL,'2010-07-16 14:44:43','com.vitaflo.innova.Patient','UPDATE',89),(383,'country','2010-07-16 14:44:43','Argentina','Flor',NULL,'Argentina',NULL,'2010-07-16 14:44:43','com.vitaflo.innova.Patient','UPDATE',89),(384,'doseUnit','2010-07-16 14:44:43',NULL,'Flor',NULL,'ml',NULL,'2010-07-16 14:44:43','com.vitaflo.innova.Patient','UPDATE',89),(385,'client','2010-07-16 14:45:03','OSDE','Flor',NULL,'OSDE',NULL,'2010-07-16 14:45:03','com.vitaflo.innova.Patient','UPDATE',89),(386,'dose','2010-07-16 14:45:03','2.0','Flor',NULL,NULL,NULL,'2010-07-16 14:45:03','com.vitaflo.innova.Patient','UPDATE',89),(387,'country','2010-07-16 14:45:03','Argentina','Flor',NULL,'Argentina',NULL,'2010-07-16 14:45:03','com.vitaflo.innova.Patient','UPDATE',89),(388,'client','2010-07-16 14:47:34','OSDE','Flor',NULL,'OSDE',NULL,'2010-07-16 14:47:34','com.vitaflo.innova.Patient','UPDATE',90),(389,'country','2010-07-16 14:47:34','Argentina','Flor',NULL,'Argentina',NULL,'2010-07-16 14:47:34','com.vitaflo.innova.Patient','UPDATE',90),(390,'deliveryAddress','2010-07-16 14:47:34','Casa del paciente\r\nEcheverria 2210 Piso 5 Dto. B','Flor',NULL,'Casa del paciente\r\nEcheverria 2210 Piso 5 Dto. B. CABA C1428DRL',NULL,'2010-07-16 14:47:34','com.vitaflo.innova.Patient','UPDATE',90),(391,'client','2010-07-16 14:49:57','OSDE','Flor',NULL,'OSDE',NULL,'2010-07-16 14:49:57','com.vitaflo.innova.Patient','UPDATE',90),(392,'country','2010-07-16 14:49:57','Argentina','Flor',NULL,'Argentina',NULL,'2010-07-16 14:49:57','com.vitaflo.innova.Patient','UPDATE',90),(393,'deliveryAddress','2010-07-16 14:49:57','Casa del paciente\r\nEcheverria 2210 Piso 5 Dto. B. CABA C1428DRL','Flor',NULL,'Casa del paciente\r\nEcheverria 2210 Piso 5 Dto. B.  C1428DRL CABA',NULL,'2010-07-16 14:49:57','com.vitaflo.innova.Patient','UPDATE',90),(394,'phone','2010-07-16 14:59:24',NULL,'Flor',NULL,'(Cel Norma)0297-156238390',NULL,'2010-07-16 14:59:24','com.vitaflo.innova.Patient','UPDATE',91),(395,'client','2010-07-16 14:59:25','Reintegro swiss medical','Flor',NULL,'Reintegro swiss medical',NULL,'2010-07-16 14:59:25','com.vitaflo.innova.Patient','UPDATE',91),(396,'country','2010-07-16 14:59:25','Argentina','Flor',NULL,'Argentina',NULL,'2010-07-16 14:59:25','com.vitaflo.innova.Patient','UPDATE',91),(397,'doseUnit','2010-07-16 14:59:25',NULL,'Flor',NULL,'ml',NULL,'2010-07-16 14:59:25','com.vitaflo.innova.Patient','UPDATE',91),(398,'contactName','2010-07-16 14:59:25',NULL,'Flor',NULL,'normachehda@live.com.ar',NULL,'2010-07-16 14:59:25','com.vitaflo.innova.Patient','UPDATE',91),(399,'deliveryAddress','2010-07-16 14:59:25','Casa del paciente, se envía encomienda x Andesmar a Terminal a nombre de Norma Chehda\r\nChacabuco 285','Flor',NULL,'Casa del paciente, se envía encomienda x Andesmar a Terminal a nombre de Norma Chehda\r\nChacabuco 285 (9400) Rio Gallegos, Santa Cruz',NULL,'2010-07-16 14:59:25','com.vitaflo.innova.Patient','UPDATE',91),(400,'phone','2010-07-16 15:07:01','4659-8755','Flor',NULL,'4659-8755 T: 4372-5905/4372-6327',NULL,'2010-07-16 15:07:01','com.vitaflo.innova.Patient','UPDATE',92),(401,'client','2010-07-16 15:07:01','OSDEPYM','Flor',NULL,'OSDEPYM',NULL,'2010-07-16 15:07:01','com.vitaflo.innova.Patient','UPDATE',92),(402,'country','2010-07-16 15:07:02','Argentina','Flor',NULL,'Argentina',NULL,'2010-07-16 15:07:02','com.vitaflo.innova.Patient','UPDATE',92),(403,'deliveryAddress','2010-07-16 15:07:02','Obra Social Rodriguez Peña 538, Tel 4373-574\r\nó trabajo madre Callao 232 Piso 7 Dto. 14','Flor',NULL,'Obra Social Rodriguez Peña 538, Tel 4373-5740/4371-8957 (Laura o Analía)\r\nó trabajo madre Callao 232 Piso 7 Dto. 14',NULL,'2010-07-16 15:07:02','com.vitaflo.innova.Patient','UPDATE',92),(404,'phone','2010-07-16 15:09:57',NULL,'Flor',NULL,'4373-5740/4371-8957',NULL,'2010-07-16 15:09:57','com.vitaflo.innova.Client','UPDATE',99),(405,'address','2010-07-16 15:09:57',NULL,'Flor',NULL,'Rodriguez Peña 538',NULL,'2010-07-16 15:09:57','com.vitaflo.innova.Client','UPDATE',99),(406,'contact','2010-07-16 15:09:57',NULL,'Flor',NULL,'Laura o Ana',NULL,'2010-07-16 15:09:57','com.vitaflo.innova.Client','UPDATE',99),(407,'country','2010-07-16 15:09:57','Argentina','Flor',NULL,'Argentina',NULL,'2010-07-16 15:09:57','com.vitaflo.innova.Client','UPDATE',99),(408,'client','2010-07-16 15:11:59','OSDE','Flor',NULL,'OSDE',NULL,'2010-07-16 15:11:59','com.vitaflo.innova.Patient','UPDATE',93),(409,'physician','2010-07-16 15:11:59','Mariana Nu&ntilde;ez','Flor',NULL,'Mariana Nu&amp;ntilde;ez',NULL,'2010-07-16 15:11:59','com.vitaflo.innova.Patient','UPDATE',93),(410,'country','2010-07-16 15:11:59','Argentina','Flor',NULL,'Argentina',NULL,'2010-07-16 15:11:59','com.vitaflo.innova.Patient','UPDATE',93),(411,'deliveryAddress','2010-07-16 15:11:59','Casa del paciente\r\nDel Nogal Nº 5, Barrio La Alameda, Nordelta','Flor',NULL,'Casa del paciente\r\nDel Nogal Nº 5, Barrio La Alameda, 1670 Nordelta Bs As',NULL,'2010-07-16 15:11:59','com.vitaflo.innova.Patient','UPDATE',93),(412,'client','2010-07-16 15:17:25','OSDEPYM','Flor',NULL,'Droguería Biológicas de Nora Witon',NULL,'2010-07-16 15:17:25','com.vitaflo.innova.Patient','UPDATE',94),(413,'physician','2010-07-16 15:17:25','Mariana Nuñez','Flor',NULL,'Mariana Nu&ntilde;ez',NULL,'2010-07-16 15:17:25','com.vitaflo.innova.Patient','UPDATE',94),(414,'country','2010-07-16 15:17:25','Argentina','Flor',NULL,'Argentina',NULL,'2010-07-16 15:17:25','com.vitaflo.innova.Patient','UPDATE',94),(415,'contactName','2010-07-16 15:17:25',NULL,'Flor',NULL,'(cel Milena) 1566754697',NULL,'2010-07-16 15:17:25','com.vitaflo.innova.Patient','UPDATE',94),(416,'deliveryAddress','2010-07-16 15:17:25','Pichincha 443, entre Dorrego y Vicente Lopez','Flor',NULL,'Pichincha 443, entre Dorrego y Vicente Lopez CP 1834 Temperley.\r\nConsultorio Hugo Bertonazzi(padre) día martes de 9 a 19 hs Viamonte 1716 Piso 1 Dto 6 CABA',NULL,'2010-07-16 15:17:25','com.vitaflo.innova.Patient','UPDATE',94),(417,'phone','2010-07-16 15:20:48','0341-156196734','Flor',NULL,'0341-156196734 /(p) 0341-4374322',NULL,'2010-07-16 15:20:48','com.vitaflo.innova.Patient','UPDATE',96),(418,'client','2010-07-16 15:20:48','OSDAAP','Flor',NULL,'OSDAAP',NULL,'2010-07-16 15:20:48','com.vitaflo.innova.Patient','UPDATE',96),(419,'country','2010-07-16 15:20:48','Argentina','Flor',NULL,'Argentina',NULL,'2010-07-16 15:20:48','com.vitaflo.innova.Patient','UPDATE',96),(420,'phone','2010-07-16 15:40:32',NULL,'Flor',NULL,'(p) 4210-2987/',NULL,'2010-07-16 15:40:32','com.vitaflo.innova.Patient','UPDATE',98),(421,'client','2010-07-16 15:40:32','OSDE','Flor',NULL,'OSDE',NULL,'2010-07-16 15:40:32','com.vitaflo.innova.Patient','UPDATE',98),(422,'country','2010-07-16 15:40:32','Argentina','Flor',NULL,'Argentina',NULL,'2010-07-16 15:40:32','com.vitaflo.innova.Patient','UPDATE',98),(423,'contactName','2010-07-16 15:40:32',NULL,'Flor',NULL,'(Madre Yesica) 1551439121',NULL,'2010-07-16 15:40:32','com.vitaflo.innova.Patient','UPDATE',98),(424,'deliveryAddress','2010-07-16 15:40:32',NULL,'Flor',NULL,'Calle 346 Nº3160 entre 381 y 382 . CP 1878 Quilmes Buenos Aires',NULL,'2010-07-16 15:40:32','com.vitaflo.innova.Patient','UPDATE',98),(425,'phone','2010-07-16 15:47:16',NULL,'Flor',NULL,'(cel Paula)  02944-15343832',NULL,'2010-07-16 15:47:16','com.vitaflo.innova.Patient','UPDATE',101),(426,'client','2010-07-16 15:47:16','IOSE','Flor',NULL,'IOSE',NULL,'2010-07-16 15:47:16','com.vitaflo.innova.Patient','UPDATE',101),(427,'country','2010-07-16 15:47:16','Argentina','Flor',NULL,'Argentina',NULL,'2010-07-16 15:47:16','com.vitaflo.innova.Patient','UPDATE',101),(428,'contactName','2010-07-16 15:47:16',NULL,'Flor',NULL,'hermana paula 02944-15689023',NULL,'2010-07-16 15:47:16','com.vitaflo.innova.Patient','UPDATE',101),(429,'deliveryAddress','2010-07-16 15:47:16',NULL,'Flor',NULL,'Centro médico del sur: sarmiento 489 (8370) San Martín de los Andes, Neuquén',NULL,'2010-07-16 15:47:16','com.vitaflo.innova.Patient','UPDATE',101),(430,'phone','2010-07-16 15:49:12',NULL,'Flor',NULL,'4964-1800 int 1777',NULL,'2010-07-16 15:49:12','com.vitaflo.innova.Client','UPDATE',108),(431,'contact','2010-07-16 15:49:12',NULL,'Flor',NULL,'Dra Otegui',NULL,'2010-07-16 15:49:12','com.vitaflo.innova.Client','UPDATE',108),(432,'country','2010-07-16 15:49:12','Argentina','Flor',NULL,'Argentina',NULL,'2010-07-16 15:49:12','com.vitaflo.innova.Client','UPDATE',108),(433,'status','2010-07-21 10:22:54','Enabled','horacio',NULL,'Deleted',NULL,'2010-07-21 10:22:54','com.vitaflo.innova.Client','UPDATE',117),(434,NULL,'2010-10-25 10:43:48',NULL,'horacio',NULL,NULL,NULL,'2010-10-25 10:43:48','com.vitaflo.innova.Proforma','INSERT',524),(435,'client','2010-10-25 10:43:49','Droguería Biológicas de Nora Witon','horacio',NULL,'Fundacion Co ME. I',NULL,'2010-10-25 10:43:49','com.vitaflo.innova.Patient','UPDATE',109),(436,NULL,'2010-10-25 10:46:15',NULL,'horacio',NULL,NULL,0,'2010-10-25 10:46:15','com.vitaflo.innova.Proforma','DELETE',524),(437,'cuit','2010-11-09 10:26:38',NULL,'Flor',NULL,NULL,NULL,'2010-11-09 10:26:38','com.vitaflo.innova.Client','UPDATE',100),(438,'contact','2010-11-09 10:26:38','Verónica Castagnino','Flor',NULL,'Ver&oacute;nica Castagnino',NULL,'2010-11-09 10:26:38','com.vitaflo.innova.Client','UPDATE',100),(439,'country','2010-11-09 10:26:38','Argentina','Flor',NULL,'Argentina',NULL,'2010-11-09 10:26:38','com.vitaflo.innova.Client','UPDATE',100),(440,'address','2010-11-09 10:26:38','AV. Leandro N. Alem 1067 Piso: 5º','Flor',NULL,'AV. Leandro N. Alem 1067 Piso: 5&ordm;',NULL,'2010-11-09 10:26:38','com.vitaflo.innova.Client','UPDATE',100),(441,'ivaResponsibleType','2010-11-09 10:26:38',NULL,'Flor',NULL,'inscripto',NULL,'2010-11-09 10:26:38','com.vitaflo.innova.Client','UPDATE',100),(442,NULL,'2010-11-09 16:05:05',NULL,'Flor',NULL,NULL,NULL,'2010-11-09 16:05:05','com.vitaflo.innova.Proforma','INSERT',525),(443,'client','2010-11-09 16:05:06','Droguería Biológicas de Nora Witon','Flor',NULL,'Fundacion Co ME. I',NULL,'2010-11-09 16:05:06','com.vitaflo.innova.Patient','UPDATE',94),(444,'phone','2010-11-09 16:08:13','0221-410-0500','Flor',NULL,NULL,NULL,'2010-11-09 16:08:13','com.vitaflo.innova.Client','UPDATE',97),(445,'cuit','2010-11-09 16:08:13',NULL,'Flor',NULL,'30665692465',NULL,'2010-11-09 16:08:13','com.vitaflo.innova.Client','UPDATE',97),(446,'contact','2010-11-09 16:08:13',NULL,'Flor',NULL,'Farmacia Sra. Daniela',NULL,'2010-11-09 16:08:13','com.vitaflo.innova.Client','UPDATE',97),(447,'country','2010-11-09 16:08:13','Argentina','Flor',NULL,'Argentina',NULL,'2010-11-09 16:08:13','com.vitaflo.innova.Client','UPDATE',97),(448,'address','2010-11-09 16:08:13','Calle 68 N° 1561 La Plata','Flor',NULL,'Lavalle 1118 Piso 5 CABA',NULL,'2010-11-09 16:08:13','com.vitaflo.innova.Client','UPDATE',97),(449,'ivaResponsibleType','2010-11-09 16:08:13',NULL,'Flor',NULL,'inscripto',NULL,'2010-11-09 16:08:13','com.vitaflo.innova.Client','UPDATE',97);
/*!40000 ALTER TABLE `audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `clients` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) default NULL,
  `telephone` varchar(45) default NULL,
  `email` varchar(45) default NULL,
  `status` enum('Enabled','Disabled','Deleted') default 'Enabled',
  `contact` varchar(45) default NULL,
  `version` bigint(20) default NULL,
  `country_id` bigint(20) default NULL,
  `cuit` varchar(255) default NULL,
  `iva` varchar(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK334B8608D5F7034F` (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (95,'OSECAC',NULL,NULL,'','Deleted','',1,1,NULL,NULL),(96,'MEDICUS S.A',NULL,NULL,'','Enabled','',0,1,NULL,NULL),(97,'Fundacion Co ME. I','Lavalle 1118 Piso 5 CABA',NULL,'','Enabled','Farmacia Sra. Daniela',2,1,'30665692465','inscripto'),(98,'MEDICUS S.A',NULL,NULL,'','Deleted','',1,1,NULL,NULL),(99,'OSDEPYM','Rodriguez Peña 538','4373-5740/4371-8957','','Enabled','Laura o Ana',1,1,NULL,NULL),(100,'OSDE','AV. Leandro N. Alem 1067 Piso: 5&ordm;','4510-6972','','Enabled','Ver&oacute;nica Castagnino',2,1,'','inscripto'),(101,'OSDAAP',NULL,NULL,'','Enabled','',0,1,NULL,NULL),(102,'OSPIA','EEUU 1532','4305-1611/48','compras@ospiacapital.org.ar','Enabled','Dra. Andrea Torre',1,1,NULL,NULL),(103,'Union Personal','Tucuman 949 (1049) CABA','52229556','vfernandez@unionpersonal.com.ar','Enabled','Veronica Fernandez, Banco de Drogas',1,1,NULL,NULL),(104,'OSDEPYM',NULL,NULL,'','Deleted','',1,1,NULL,NULL),(105,'IOMA',NULL,NULL,'','Deleted','',1,1,NULL,NULL),(106,'OSD de la A.A.P',NULL,NULL,'','Enabled','',0,1,NULL,NULL),(107,'Instituto de Seguridad Social de Neuquen',NULL,NULL,'','Enabled','',0,1,NULL,NULL),(108,'IOSE',NULL,'4964-1800 int 1777','','Enabled','Dra Otegui',1,1,NULL,NULL),(109,'PAMI',NULL,NULL,'','Enabled','',0,1,NULL,NULL),(110,'OMINT',NULL,NULL,'','Enabled','',0,1,NULL,NULL),(111,'Obra Social de la Sanidad (OSPSABAMED)',NULL,NULL,'','Enabled','',0,1,NULL,NULL),(112,'Hospital Privado de Córdoba','Avenida Naciones Unidas 346 Córdoba','0351-468-8200','','Enabled','',1,1,NULL,NULL),(113,'Instituto de Previsión Social de Misiones ','Bolivar 134 - Posadas- Misiones','03752-448675','','Enabled','',1,1,NULL,NULL),(114,'OSECAC',NULL,NULL,'','Enabled','',0,1,NULL,NULL),(115,'IPS Tucumán',NULL,NULL,'','Enabled','',0,1,NULL,NULL),(116,'IOMA (Instituto de Obra Medico Asistencial)',NULL,NULL,'','Enabled','',0,1,NULL,NULL),(117,'GALENO',NULL,NULL,'','Deleted','',1,1,NULL,NULL),(118,'AMUR',NULL,NULL,'','Deleted','',1,1,NULL,NULL),(119,'Droguería Biológicas de Nora Witon','Gutenberg 3872 Piso: 2 º Villa Devoto CABA)','4503-8852/ 4587-6356','','Enabled','',1,1,NULL,NULL),(120,'Reintegro swiss medical',NULL,NULL,'','Enabled','',0,1,NULL,NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `countries` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,0,'AR','Argentina'),(2,0,'BR','Brasil'),(3,0,'CO','Colombia'),(4,0,'CH','Chile'),(5,0,'CO','Ecuador'),(6,0,'VE','Venezuela'),(7,0,'UR','Uruguay'),(8,0,'BO','Bolivia'),(9,0,'PE','Peru'),(10,0,'MX','Mexico');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drugs`
--

DROP TABLE IF EXISTS `drugs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `drugs` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `status` enum('Enabled','Disabled') NOT NULL default 'Enabled',
  `version` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `drugs`
--

LOCK TABLES `drugs` WRITE;
/*!40000 ALTER TABLE `drugs` DISABLE KEYS */;
INSERT INTO `drugs` VALUES (41,'Mezcla de Aminoacidos','Enabled',0),(42,'Aminoacido','Enabled',0),(43,'Sustituto proteico libre de fenilalanina','Enabled',0),(44,'libre de leucina, isoleucina y valina','Enabled',0),(45,'Sustituto proteico libre de metionina ','Enabled',0),(46,'Sto proteico libre de tirosina y fenilalanina','Enabled',0),(47,'arginina a base de carbohidratos ','Enabled',0),(48,'cistina a base de carbohidratos ','Enabled',0),(49,'tirosina a base de carbohidratos ','Enabled',0),(50,'isoleucina a base de carbohidratos','Enabled',0),(51,'valina a base de carbohidratos','Enabled',0),(52,'de bajo contenido proteico','Enabled',0),(53,'Saborizantes libres de proteínas','Enabled',0);
/*!40000 ALTER TABLE `drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `invoices` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `created_at` datetime default NULL,
  `proforma_id` int(10) unsigned default NULL,
  `code` varchar(45) default NULL,
  `client_id` int(10) default NULL,
  `amount` decimal(10,2) default NULL,
  `date` date default NULL,
  `status` enum('Pendiente','Pagada','Entregada') NOT NULL default 'Pendiente',
  `concile` int(10) unsigned default NULL,
  `version` bigint(20) default NULL,
  `delivery_date` datetime default NULL,
  `purchase_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK25F222E6E4BB2F65` (`purchase_id`),
  KEY `FK25F222E66E093105` (`proforma_id`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `notes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `patient_id` int(10) unsigned NOT NULL,
  `created_at` datetime default NULL,
  `text` text,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_product_stock`
--

DROP TABLE IF EXISTS `patient_product_stock`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `patient_product_stock` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `next_id` bigint(20) default NULL,
  `notified` bit(1) NOT NULL,
  `patient_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `proforma_id` bigint(20) NOT NULL,
  `running_out_of_stock_date` datetime NOT NULL,
  `start_date` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FKB351080C7C7A5EC8` (`next_id`),
  KEY `FKB351080C2F7C98EF` (`patient_id`),
  KEY `FKB351080C6E093105` (`proforma_id`),
  KEY `FKB351080C2F8F58AF` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `patient_product_stock`
--

LOCK TABLES `patient_product_stock` WRITE;
/*!40000 ALTER TABLE `patient_product_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_product_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `patients` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `first_name` varchar(45) default NULL,
  `last_name` varchar(45) default NULL,
  `client_id` int(10) unsigned default NULL,
  `status` enum('Enabled','Disabled','Deleted') default 'Enabled',
  `telephone` varchar(45) default NULL,
  `contact` varchar(45) default NULL,
  `version` bigint(20) default NULL,
  `adverse_event` varchar(255) default NULL,
  `birth` datetime default NULL,
  `clinical_history` varchar(255) default NULL,
  `clinical_status` varchar(255) default NULL,
  `country_id` bigint(20) default NULL,
  `delivery_address` varchar(255) default NULL,
  `dose` double default NULL,
  `height` double default NULL,
  `pathology` varchar(255) default NULL,
  `physician` varchar(255) default NULL,
  `weight` double default NULL,
  `dose_unit` varchar(2) default NULL,
  `initials` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK49A9760ED5F7034F` (`country_id`),
  KEY `FK49A9760EC07819E5` (`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (88,'Franco ','Casimiro',103,'Enabled','Carnicería: 4502-2078','drale55@hotmail.com',2,NULL,'2010-05-18 00:00:00',NULL,NULL,1,'Mercedes 4425\r\nC1419BGQ CABA\r\nCarnicería Abuelos \r\nHorario 7 a 14,30 y 16,30 a 20 hs',3,NULL,'Acidemia Propionica','Delfina Marchione',NULL,NULL,'FC'),(89,'Mirtha Lydia ','Paszklewicz',100,'Enabled','4552-4276- T: 4571-7416(9a 13 hs)','cabralrosa@arnet.com.ar',2,NULL,'2010-05-26 00:00:00',NULL,NULL,1,'Centro de Discapacitados Trabaja la Madre: Pje Alemania 2782 Capital (hasta las 16hs)',NULL,NULL,'Fenilcetonuria','Norma Specola',NULL,'ml','MLP'),(90,'Marco ','Antonacci',100,'Enabled','4784-8446 /15-62938555','alicia@delcarrilyasociados.com',3,NULL,'2010-05-26 00:00:00',NULL,NULL,1,'Casa del paciente\r\nEcheverria 2210 Piso 5 Dto. B.  C1428DRL CABA',NULL,NULL,'Fenilcetonuria','Norma Specola',NULL,NULL,'MA'),(91,'Agostina','Martinez Chehda',120,'Enabled','(Cel Norma)0297-156238390','normachehda@live.com.ar',2,NULL,'2010-05-26 00:00:00',NULL,NULL,1,'Casa del paciente, se envía encomienda x Andesmar a Terminal a nombre de Norma Chehda\r\nChacabuco 285 (9400) Rio Gallegos, Santa Cruz',NULL,NULL,'Hiperfenilalaninemia','Ana Chiesa',NULL,'ml','AMCh'),(92,'Joaquin ','Marchi',99,'Enabled','4659-8755 T: 4372-5905/4372-6327','mamarchi@ciudad.com.ar',2,NULL,'2010-05-27 00:00:00',NULL,NULL,1,'Obra Social Rodriguez Peña 538, Tel 4373-5740/4371-8957 (Laura o Analía)\r\nó trabajo madre Callao 232 Piso 7 Dto. 14',NULL,NULL,'Fenilcetonuria','Ana Chiesa',NULL,NULL,'JM'),(93,'Beltran ','Araya',100,'Enabled','4871-1192','Eugenia cel 15-53296387',2,NULL,'2010-05-27 00:00:00',NULL,NULL,1,'Casa del paciente\r\nDel Nogal Nº 5, Barrio La Alameda, 1670 Nordelta Bs As',NULL,NULL,'Fenilcetonuria','Mariana Nu&amp;ntilde;ez',NULL,NULL,'BA'),(94,'Delfina ','Bernotazzi',97,'Enabled','4298-9457','(cel Milena) 1566754697',3,NULL,'2010-05-27 00:00:00',NULL,NULL,1,'Pichincha 443, entre Dorrego y Vicente Lopez CP 1834 Temperley.\r\nConsultorio Hugo Bertonazzi(padre) día martes de 9 a 19 hs Viamonte 1716 Piso 1 Dto 6 CABA',NULL,NULL,'Fenilcetonuria','Mariana Nu&ntilde;ez',NULL,NULL,'DB'),(95,'Facundo ','Montenegro Toraño',105,'Enabled',' 0221-4295988','',0,NULL,'2010-05-27 00:00:00',NULL,NULL,1,'Calle 46 Nº 886 Piso 3º (Subdirección Técnico Científico Andrea Mendivel)',NULL,NULL,'Fenilcetonuria ','Mariana Nuñez',NULL,NULL,'FMT'),(96,'Gregorio','Bruzzone',101,'Enabled',' 0341-156196734 /(p) 0341-4374322','danbruzzone@hotmail.com',1,NULL,'2010-05-27 00:00:00',NULL,NULL,1,'OS Filial Rosario: San Lorenzo 1072 Local 1, Rosario, Santa Fe.',NULL,NULL,'Fenilcetonuria','Ana Chiesa',NULL,NULL,'GB'),(97,'Sofia Maia ','Nocera Obey',103,'Enabled','','',0,NULL,'2010-06-14 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'Acidemia Propionica','Delfina Marchione',NULL,NULL,'SMNO'),(98,'Lautaro','Fernandez Vega',100,'Enabled','(p) 4210-2987/ ','(Madre Yesica) 1551439121',1,NULL,'2010-06-14 00:00:00',NULL,NULL,1,'Calle 346 Nº3160 entre 381 y 382 . CP 1878 Quilmes Buenos Aires',NULL,NULL,'Fenilcetonuria','Norma Specola',NULL,NULL,'LFV'),(99,'Juan ','Cullen',96,'Enabled','','',0,NULL,'2010-06-14 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'Fenilcetonuria','Ana Chiesa',NULL,NULL,'JC'),(100,'Rodrigo ','Domingo Sanchez',107,'Enabled','','',0,NULL,'2010-06-14 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'Fenilcetonuria','Ana Chiesa',NULL,NULL,'RDS'),(101,'Michael ','Hernandez',108,'Enabled','(cel Paula)  02944-15343832','hermana paula 02944-15689023',1,NULL,'2010-06-14 00:00:00',NULL,NULL,1,'Centro médico del sur: sarmiento 489 (8370) San Martín de los Andes, Neuquén',NULL,NULL,'Homocistinuria','Dra Graciela Otermin / Soledad Kleppe',NULL,NULL,'MH'),(102,'Juan Bautista ','Calvo',110,'Enabled','','',0,NULL,'2010-06-14 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'Fenilcetonuria','Ana Chiesa',NULL,NULL,'JBC'),(103,'Valentina ','Amoedo',118,'Enabled','','',0,NULL,'2010-07-12 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'PKU','Ana Chiesa / Claudia Fraga FEI',NULL,NULL,'VA'),(104,'Maite',NULL,118,'Enabled','','',0,NULL,'2010-07-12 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'PKU','Norma Specola',NULL,NULL,'M'),(105,'Santiago','Chialva',118,'Enabled','','',0,NULL,'2010-07-12 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'PKU','Mariana Nuñez / Ana La Rosa',NULL,NULL,'SCH'),(106,'Nicolas','Villar',118,'Deleted','','',1,NULL,'2010-07-12 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'PKU','Ana Chiesa',NULL,NULL,'NV'),(107,'Karen','Candia',111,'Enabled','','',0,NULL,'2010-07-14 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'Fenilcetonuria','Mariana Nuñez',NULL,NULL,'KC'),(108,'Angela','Francia',112,'Enabled','','',0,NULL,'2010-07-14 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'Fenilcetonuria','Norma Specola',NULL,NULL,'AF'),(109,'Juan Cruz','Rotta',97,'Enabled','','',1,NULL,'2010-07-14 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'Tirosinemia','Luisa Bay',NULL,NULL,'JR'),(110,'Lucas ','Contreras',114,'Enabled','','',0,NULL,'2010-07-14 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'Tirosinemia','DRA Patricia Caglio / Lic. Silvina Guisande',NULL,NULL,'LC'),(111,'Rocio','Valdez',115,'Enabled','','',1,NULL,'2010-07-14 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'Orina con olor a jarabe de Arce','Norma Specola',NULL,NULL,'RV'),(112,'Tomas','Pisicelli',100,'Enabled','','',0,NULL,'2010-07-14 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'Fenilcetonuria','Mariana Nuñez',NULL,NULL,'TP'),(113,'Nicolas','Villar',111,'Enabled','45865338','María Elena Merela (madre)',1,NULL,'2010-07-15 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'PKU','Ana Chiesa',NULL,NULL,'NV'),(114,'Paula','Watanave',105,'Enabled','','',0,NULL,'2010-07-15 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'Acidemia Metil Malonica','Norma Specola - Ana La Rosa',NULL,NULL,'PW'),(115,'Nicolas Tadeo','Duda',100,'Enabled','','',0,NULL,'2010-07-15 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'PKU','Chiesa',NULL,NULL,'ND'),(116,'Ignacio','Pizzolini',109,'Enabled','','',0,NULL,'2010-07-15 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'Fenilcetonuria','Norma Specola',NULL,NULL,'IP'),(117,'Agustina','Tutic',114,'Enabled','','',0,NULL,'2010-07-15 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'PKU','Norma Specola - Mariana Nuñez',NULL,NULL,'AT'),(118,'De Stefano',NULL,96,'Enabled','','',0,NULL,'2010-07-15 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'PKU','Ana Chiesa',NULL,NULL,'DS'),(119,'Martina','Benitez',118,'Enabled','','',0,NULL,'2010-07-15 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'MSUD','Soledad Kleppe',NULL,NULL,'MB'),(120,'Katherine','Gomez',102,'Enabled','','',0,NULL,'2010-07-15 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'PKU','Lavorgna',NULL,NULL,'KG'),(121,'Rosario','Zelaya',115,'Enabled','','',0,NULL,'2010-07-15 00:00:00',NULL,NULL,1,NULL,NULL,NULL,'Tirosinemia','Luisa Bay - Hernan Eiroa',NULL,NULL,'RZ');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `drug_id` int(10) unsigned NOT NULL default '0',
  `price` float default NULL,
  `description` text,
  `status` enum('Enabled','Disabled') NOT NULL default 'Enabled',
  `supplier_id` int(10) unsigned NOT NULL,
  `version` bigint(20) default NULL,
  `presentation` double default NULL,
  `comercial_name` varchar(255) default NULL,
  `dose_unit` varchar(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKC42BD1649D819485` (`drug_id`),
  KEY `FKC42BD164D6C2F785` (`supplier_id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (61,'PKU gel naranja',41,270,'Caja de 30 sobres de 20gr conteniendo 8.4 Gramos de Proteina\r\n\r\nSustituto proteico en polvo para preparar gel o bebida libre de fenilalanina para el manejo dietario de los niños con fenilcetonuria desde los 12 meses a los 10 años de edad. ','Enabled',7,3,20,'PKU gel',NULL),(62,'PKU gel Frambuesa',41,270,'Caja de 30 sobres de 20gr conteniendo 8.4 Gramos de Proteina\r\n\r\nSustituto proteico en polvo para preparar gel o bebida libre de fenilalanina para el manejo dietario de los niños con fenilcetonuria desde los 12 meses a los 10 años de edad. ','Enabled',7,3,20,'PKU gel',NULL),(63,'PKU gel s/sabor',41,270,'Caja de 30 sobres de 20gr conteniendo 8.4 Gramos de Proteina\r\n\r\nSustituto proteico en polvo para preparar gel o bebida libre de fenilalanina para el manejo dietario de los niños con fenilcetonuria desde los 12 meses a los 10 años de edad. \r\n','Enabled',7,3,20,'PKU gel',NULL),(64,'PKU express naranja',41,430,'Caja de 30 sobres de 25gr conteniendo 15 Gramos de Proteina\r\n','Enabled',7,2,25,'PKU express',NULL),(65,'PKU express limon',41,430,'Caja de 30 sobres de 25gr conteniendo 15 Gramos de Proteina\r\n\r\nSustituto proteico en polvo para preparar bebida libre de fenilalanina para el manejo dietario de los pacientes con fenilcetonuria a partir de los 8 años en adelante. ','Enabled',7,3,25,'PKU express',NULL),(66,'PKU Cooler 10 naranja',43,590,'Caja de 30 Pomos de 87 ml contentiendo 10 Gramos de Proteina\r\n\r\nSustituto proteico libre de fenilalanina, listo para beber, para el manejo dietario de los pacientes con fenilcetonuria desde los tres años en adelante. ','Enabled',7,4,87,'PKU Cooler 10','ml'),(67,'PKU Cooler 10 uva',43,590,'Caja de 30 Pomos de 87 ml contentiendo 10 Gramos de Proteina\r\n\r\nSustituto proteico libre de fenilalanina, listo para beber, para el manejo dietario de los pacientes con fenilcetonuria desde los tres años en adelante. \r\n','Enabled',7,4,87,'PKU Cooler','ml'),(68,'PKU Cooler 15 naranja',41,910,'Caja de 30 Pomos de 130 ml conteniendo 15 Gramos de Proteina\r\n\r\nSustituto proteico libre de fenilalanina, listo para beber, para el manejo dietario de los pacientes con fenilcetonuria desde los 3 años en adelante. ','Enabled',7,3,130,'PKU Cooler 15 ','ml'),(69,'PKU Cooler 15 uva',41,910,'Caja de 30 Pomos de 130 ml conteniendo 15 Gramos de Proteina\r\n\r\nSustituto proteico libre de fenilalanina, listo para beber, para el manejo dietario de los pacientes con fenilcetonuria desde los 3 años en adelante. \r\n','Enabled',7,3,130,'PKU Cooler 15 ','ml'),(70,'PKUI Cooler 20 naranja',41,1180,'Caja de 30 Pomos de 174 ml conteniendo 20 Gramos de Proteina\r\n','Enabled',7,2,174,'PKUI Cooler 20 ','ml'),(71,'PKUI Cooler 20 uva',41,1180,'Caja de 30 Pomos de 174 ml conteniendo 20 Gramos de Proteina\r\n','Enabled',7,2,174,'PKUI Cooler 20 ','ml'),(72,'Flavor Pac Grosella',41,75,'Caja de 30 sobres de 20gr c/u\r\n','Enabled',7,1,20,NULL,NULL),(73,'Flavour Pac limon',41,75,'Caja de 30 sobres de 20gr c/u\r\n','Enabled',7,1,20,NULL,NULL),(74,'Flavour Pac naranja',41,75,'Caja de 30 sobres de 20gr c/u\r\n','Enabled',7,1,20,NULL,NULL),(75,'Vita Bite',41,38,'Caja de 7 barras de 25gr c/u\r\n','Enabled',7,1,25,'Vita Bite',NULL),(76,'MSUD Gel',41,485,'Caja de 30 sobres de 20gr conteniendo 8.4 Gramos de Proteina\r\n\r\nSustituto proteico líquido listo para beber libre de leucina, isoleucina y valina para el manejo dietario de los pacientes con enfermedad de orina con olor a jarabe de arce de desde los 8 años en adelante. ','Enabled',7,2,20,'MSUD Gel',NULL),(77,'MSUD Express',41,645,'Caja de 30 sobres de 25gr conteniendo 15 Gramos de Proteina\r\n\r\nSustituto proteico líquido listo para beber libre de leucina, isoleucina y valina para el manejo dietario de los pacientes con enfermedad de orina con olor a jarabe de arce de desde los 8 años en adelante.','Enabled',7,2,25,'MSUD Express',NULL),(78,'MMAPA Gel',41,485,'Caja de 30 sobres de 20gr conteniendo 8.4 Gramos de Proteina\r\n','Enabled',7,1,20,'MMAPA Gel',NULL),(79,'Arginina',47,150,'Advertencias\r\n\r\n    * Este producto debe ser utilizado bajo estricto control médico.\r\n    * No debe usarse como única fuente de nutrición.\r\n    * No está diseñado para el uso endovenoso.\r\n    * No se aconseja su administración a menores de 12 meses de edad.\r\n\r\nConservación\r\n\r\nConservar en lugar fresco y seco\r\nPresentación\r\n\r\nDisponible en envases de 30 sobres de 4 gramos cada uno. Peso Neto : 0,12 Kg ','Enabled',7,2,4,'Arginina',NULL),(80,'Cistina',48,150,'Disponible en envases de 30 sobres de 4 gramos cada uno. Peso Neto : 0,12 Kg \r\n\r\nSuplemento en polvo del aminoácido Cistina a base de carbohidratos, para ser usado en pacientes desde los 12 meses de edad. ','Enabled',7,3,4,'Cistina',NULL),(81,'Tyrosine',41,150,'Disponible en envases de 30 sobres de 4 gramos cada uno. Peso Neto : 0,12 Kg \r\n\r\nSuplemento en polvo del aminoácido Tirosina a base de carbohidratos, para ser usado en pacientes desde los 12 meses de edad. ','Enabled',7,2,4,'Tyrosine',NULL),(82,'Isoleucina',41,150,'Isoleucine Amino Acid Supplement\r\n30 x 4g sachets\r\n\r\nSuplemento en polvo de isoleucina a base de carbohidratos. Para ser usado junto con el sustituto proteico para la enfermedad de orina con olor a jarabe de arce (MSUD) ','Enabled',7,2,4,'Isoleucina',NULL),(83,'Valina',41,150,'Disponible en envases de 30 sobres de 4 gramos cada uno. Peso Neto : 0,12 Kg \r\n\r\nSuplemento en polvo del aminoácido Valina a base de carbohidratos para ser usado junto con un sustituto proteico para la enfermedad de orina con olor a jarabe de arce (MSUD) en pacientes desde los 12 meses de edad. ','Enabled',7,2,4,'Valina',NULL),(84,'PKU Cooler 10 sin sabor',43,590,'Caja de 30 Pomos de 87 ml contentiendo 10 Gramos de Proteina\r\n\r\nSustituto proteico libre de fenilalanina, listo para beber, para el manejo dietario de los pacientes con fenilcetonuria desde los tres años en adelante. \r\n','Enabled',7,3,87,'PKU Cooler 10','ml'),(85,'PKU Cooler 15 sin sabor',41,910,'Caja de 30 Pomos de 130 ml conteniendo 15 Gramos de Proteina\r\n\r\nSustituto proteico libre de fenilalanina, listo para beber, para el manejo dietario de los pacientes con fenilcetonuria desde los 3 años en adelante. \r\n','Enabled',7,2,130,'PKU Cooler 15','ml'),(86,'PKU Cooler 20 sin sabor',41,1180,'Caja de 30 Pomos de 174 ml conteniendo 20 Gramos de Proteina\r\n\r\nSustituto proteico libre de fenilalanina, listo para beber, para el manejo dietario de los pacientes con fenilcetonuria desde los 3 años en adelante. ','Enabled',7,2,174,'PKU Cooler','ml'),(87,'MMAPA Express',41,645,'Caja de 30 sobres de 25gr conteniendo 15 Gramos de Proteina\r\n','Enabled',7,1,25,'MMAPA Express',NULL),(88,'HCU Gel',41,485,'Caja de 30 sobres de 20gr conteniendo 8.4 Gramos de Proteina\r\n','Enabled',7,1,8.4,'HCU Gel',NULL),(89,'HCU Express',45,645,'Caja de 30 sobres de 25gr conteniendo 15 Gramos de Proteina\r\n','Enabled',7,2,25,'HCU Express',NULL),(90,'TYR Gel',41,485,'Caja de 30 sobres de 20gr conteniendo 8.4 Gramos de Proteina\r\n','Enabled',7,1,20,'TYR Gel',NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proformadetails`
--

DROP TABLE IF EXISTS `proformadetails`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `proformadetails` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `quantity` int(10) unsigned default NULL,
  `price_each` decimal(10,2) default NULL,
  `amount` decimal(10,2) default NULL,
  `product_id` int(10) unsigned NOT NULL,
  `description` text,
  `proforma_id` int(10) unsigned NOT NULL default '0',
  `lot` varchar(45) default NULL,
  `version` bigint(20) default NULL,
  `daily_dose` double default NULL,
  `dose_unit` varchar(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK928612B26E093105` (`proforma_id`),
  KEY `FK928612B22F8F58AF` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=613 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `proformadetails`
--

LOCK TABLES `proformadetails` WRITE;
/*!40000 ALTER TABLE `proformadetails` DISABLE KEYS */;
INSERT INTO `proformadetails` VALUES (610,3,'0.00',NULL,68,NULL,523,NULL,0,3,NULL),(612,4,'270.00',NULL,63,NULL,525,NULL,0,25200,'mg');
/*!40000 ALTER TABLE `proformadetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proformas`
--

DROP TABLE IF EXISTS `proformas`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `proformas` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL default '0',
  `discount` int(10) unsigned default NULL,
  `courier` decimal(10,2) NOT NULL default '0.00',
  `total` decimal(10,2) NOT NULL default '0.00',
  `created_at` datetime default NULL,
  `patient_id` int(10) unsigned default NULL,
  `client_id` int(10) unsigned NOT NULL default '0',
  `status` enum('Creada','Aprobada','Rechazada','Anulada') NOT NULL default 'Creada',
  `version` bigint(20) default NULL,
  `destination_airport` varchar(255) default NULL,
  `donation` bit(1) default NULL,
  `delivery_date` datetime default NULL,
  `dollar_value` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKC46A34E32F7C98EF` (`patient_id`),
  KEY `FKC46A34E3C07819E5` (`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=526 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `proformas`
--

LOCK TABLES `proformas` WRITE;
/*!40000 ALTER TABLE `proformas` DISABLE KEYS */;
INSERT INTO `proformas` VALUES (523,0,0,'200.00','0.00','2010-06-01 12:31:17',90,100,'Creada',0,NULL,'\0',NULL,3.98),(525,0,0,'0.00','0.00','2010-11-09 16:05:02',94,97,'Creada',0,NULL,'\0',NULL,0);
/*!40000 ALTER TABLE `proformas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_invoices`
--

DROP TABLE IF EXISTS `purchase_invoices`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `purchase_invoices` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `purchase_id` int(10) unsigned NOT NULL default '0',
  `invoice_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `purchase_invoices`
--

LOCK TABLES `purchase_invoices` WRITE;
/*!40000 ALTER TABLE `purchase_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `purchases` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `amount` decimal(10,2) default NULL,
  `date` date default NULL,
  `expire_date` date default NULL,
  `supplier_id` int(10) unsigned NOT NULL default '0',
  `code` varchar(45) default NULL,
  `status` enum('Paid','Pending','Free') NOT NULL default 'Pending',
  `version` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK95379B92D6C2F785` (`supplier_id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_map`
--

DROP TABLE IF EXISTS `request_map`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `request_map` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `config_attribute` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `authority` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `authority` (`authority`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,12,'ROLE_ADMIN','Rol Administrador'),(2,9,'ROLE_USER','Rol Usuario'),(3,0,'ROLE_REPORT','Rol Report'),(4,0,'ROLE_ACCOUNTANT','Rol Contador');
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
  PRIMARY KEY  (`role_id`,`user_id`),
  KEY `FK28B75E787C80DCC5` (`role_id`),
  KEY `FK28B75E7821ABA0A5` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `role_people`
--

LOCK TABLES `role_people` WRITE;
/*!40000 ALTER TABLE `role_people` DISABLE KEYS */;
INSERT INTO `role_people` VALUES (1,2),(1,4),(1,5),(2,1),(2,3),(2,6),(2,7),(2,8),(3,2),(3,3);
/*!40000 ALTER TABLE `role_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `suppliers` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `telephone` varchar(45) default NULL,
  `email` varchar(45) default NULL,
  `contact` varchar(45) default NULL,
  `version` bigint(20) default NULL,
  `delivery_period` int(11) default NULL,
  `payment_condition_period` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (7,'Vitaflo U.K','','','',0,20,60);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_to_countries`
--

DROP TABLE IF EXISTS `user_to_countries`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_to_countries` (
  `user_countries_id` bigint(20) default NULL,
  `country_id` bigint(20) default NULL,
  KEY `FKC0A645E424E35D10` (`user_countries_id`),
  KEY `FKC0A645E4D5F7034F` (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_to_countries`
--

LOCK TABLES `user_to_countries` WRITE;
/*!40000 ALTER TABLE `user_to_countries` DISABLE KEYS */;
INSERT INTO `user_to_countries` VALUES (1,1),(2,1),(3,1),(4,1),(2,3),(2,4),(2,2),(2,5),(5,1),(5,5),(5,3),(5,2),(5,4),(4,4),(4,5),(4,3),(4,2),(2,6),(3,6),(3,2),(3,5),(3,4),(3,3),(5,6),(4,6),(2,7),(3,7),(4,7),(5,7),(6,2),(7,1),(8,9),(8,7),(8,8),(8,1),(8,5),(8,2),(8,6),(8,4),(8,10),(8,3);
/*!40000 ALTER TABLE `user_to_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL default '',
  `email` varchar(45) NOT NULL default '',
  `version` bigint(20) default NULL,
  `enabled` bit(1) default NULL,
  `first_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  `passwd` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ivan','igrosny@gmail.com',4,'','','','a15f8b81a160b4eebe5c84e9e3b65c87b9b2f18e'),(2,'edu','evilamoret@vitaflo-latam.com',3,'','Eduardo','Vila Moret','863f8f3edbcde342a53dd30d6d00b81a90e4249d'),(3,'tati','cmassone@innovativemedicines.com.ar',1,'','','','7d595301fe29f25bf9c7c9fc4e406cee1e4c9971'),(4,'vicky','vromero@vitaflo-latam.com',3,'','Victoria','Romero','e79cab55eab4c0a1a63610829a51fd51d5cfb294'),(5,'horacio','horaciovs@gmail.com',2,'','Horacio','Velasco Suarez','e256bb85071e48489efa1a7a5bc1032ee1ef5b37'),(6,'RPires','rpires@innovativemedicines.com',2,'','Ricardo','Pires','d4e7430f1534a12df46cedd1ac369935436dbb94'),(7,'Flor','',1,'','Florencia','Canamasas','d948bf8e3f1b48f9ba366243527da98b54fa0005'),(8,'Mariano','',1,'','Mariano','Albertal','945325b6c70ddc01f9caa96f657a9d5fae4c8b05');
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

-- Dump completed on 2010-12-27 18:56:06
