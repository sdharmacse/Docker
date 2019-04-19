-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: shibboleth
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `StorageRecords`
--

DROP TABLE IF EXISTS `StorageRecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StorageRecords` (
  `context` varchar(255) NOT NULL,
  `id` varchar(255) NOT NULL,
  `expires` bigint(20) DEFAULT NULL,
  `value` longtext NOT NULL,
  `version` bigint(20) NOT NULL,
  PRIMARY KEY (`context`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StorageRecords`
--

LOCK TABLES `StorageRecords` WRITE;
/*!40000 ALTER TABLE `StorageRecords` DISABLE KEYS */;
INSERT INTO `StorageRecords` VALUES ('fe465662d661f1088abaefb2e42013584446ff6e7b44e004b424290e4c57baff','authn/Password',1555335966437,'{\"id\":\"authn/Password\",\"ts\":1555333566437,\"princ\":[{\"typ\":1,\"nam\":108},{\"typ\":1,\"nam\":107},{\"typ\":3,\"nam\":200},{\"LDAPN\":\"clees\",\"LDAPE\":{\"dn\":\"cn=ChristianLees,ou=people,ou=us,dc=vidyayug,dc=com\"}},{\"U\":\"clees\"}]}',1),('fe465662d661f1088abaefb2e42013584446ff6e7b44e004b424290e4c57baff','sp1.vidyayug.com',1555340766506,'net.shibboleth.idp.saml.session.SAML2SPSession:{\"id\":\"sp1.vidyayug.com\",\"ts\":1555333566506,\"nam\":\"<saml2:NameID Format=\\\"urn:oasis:names:tc:SAML:2.0:nameid-format:transient\\\" NameQualifier=\\\"https://idp.vidyayug.com/idp/shibboleth\\\" SPNameQualifier=\\\"sp1.vidyayug.com\\\" xmlns:saml2=\\\"urn:oasis:names:tc:SAML:2.0:assertion\\\">AAdzZWNyZXQxoW7cJBH25+KsZ6OmjGCv328qjxXTovYXY+6ooxoVRoes4oJXeW91pcsi6cS4vVcoR7QhBQ6caq1a9x9cJbZBrqcalsIerDB1gNdyzFUzIldj4klb</saml2:NameID>\",\"ix\":\"_d74252843da4598c912ad4a27922e68f\"}',1),('fe465662d661f1088abaefb2e42013584446ff6e7b44e004b424290e4c57baff','_session',1555337166438,'{\"ts\":1555333566438,\"nam\":\"clees\",\"v4\":\"192.168.1.180\",\"flows\":[\"authn/Password\"],\"svcs\":[\"sp1.vidyayug.com\"]}',3),('intercept/attribute-release','AshishBijlwan:_key_idx',NULL,'[\"AshishBijlwan:sp1.vidyayug.com\"]',1),('intercept/attribute-release','cch:_key_idx',NULL,'[\"cch:sp1.vidyayug.com\"]',1),('intercept/attribute-release','clees:_key_idx',NULL,'[\"clees:sp1.vidyayug.com\"]',1),('intercept/attribute-release','kishore:_key_idx',NULL,'[\"kishore:sp1.vidyayug.com\"]',1),('intercept/attribute-release','tadmin:_key_idx',NULL,'[\"tadmin\"]',1),('org.opensaml.saml.common.binding.security.impl.MessageReplaySecurityHandler','a416ia3hic7e90642icdjd4di9jj7a',1555333741140,'x',1),('sp1.vidyayug.com','AAdzZWNyZXQxoW7cJBH25+KsZ6OmjGCv328qjxXTovYXY+6ooxoVRoes4oJXeW91pcsi6cS4vVcoR7QhBQ6caq1a9x9cJbZBrqcalsIerDB1gNdyzFUzIldj4klb',1555340766506,'fe465662d661f1088abaefb2e42013584446ff6e7b44e004b424290e4c57baff,',1);
/*!40000 ALTER TABLE `StorageRecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shibpid`
--

DROP TABLE IF EXISTS `shibpid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shibpid` (
  `localEntity` varchar(255) NOT NULL,
  `peerEntity` varchar(255) NOT NULL,
  `persistentId` varchar(50) NOT NULL,
  `principalName` varchar(50) NOT NULL,
  `localId` varchar(50) NOT NULL,
  `peerProvidedId` varchar(50) DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deactivationDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`localEntity`,`peerEntity`,`persistentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shibpid`
--

LOCK TABLES `shibpid` WRITE;
/*!40000 ALTER TABLE `shibpid` DISABLE KEYS */;
/*!40000 ALTER TABLE `shibpid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'shibboleth'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-15 13:16:23
