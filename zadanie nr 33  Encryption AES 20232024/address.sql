-- MariaDB dump 10.19  Distrib 10.5.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: z30
-- ------------------------------------------------------
-- Server version	10.5.11-MariaDB-1

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'AGC Packaging System LTD','8 Lordsbury Field, South Wallington, SM6 9PE Surrey','England'),(2,'Asgaard Packaging','14G, Grants Avenue, Greenouge Business Park D24 TN99 Dublin','Ireland'),(3,'Cabral NV','Buurtstraat 83, 9990 Maldegem','Belgium'),(4,'Van Der Windt Pakaging','Nijverheidsstraat 8, 2390 Malle','Belgium'),(5,'Despol sp. z o.o.','ul. Raszyńska 13, 05-500 Piaseczno','Poland'),(6,'Gustav Ehlert Gmbh & Co. KG','Schinkenstrasse 9, 33415 Verl','Germany'),(7,'Brabopak BVBA','Uilenbaan 200 unit 6, 2160 Wommelgem','Belgium'),(8,'Charles Bourdeau Company','Le Bois De La Noe, 44360 Saint-Etienne De Montluc','France'),(9,'DPG Packaging LTD','22 Whittle Place, South Newmoor Industrial Estate, KA11 4HR Irvine','England'),(10,'DEBO TRADING','Zocherstaat 64, 2272 SL Voorburg','Netherlands'),(11,'Haber','Dziki 8b, 86-100 Świecie','Poland'),(12,'Wenta Opakowania','ul. Tuchomska 48, 80-209 Chwaszczyno','Poland'),(13,'Studio SAS D.0.0.','Heroja Nandeta 37, 2000 Maribor','Slowenia'),(14,'DELI SPICES LTD','12 Bertie Avenue 7460','South Africa'),(15,'Gastronomy Plus LTD','Central Bam Caught Business Park, Hornby Road LA2 9JX Claughton, Lancaster','England'),(16,'Roston','Sterac Transport & Logistik GMBH, Waldweg 1-3, D-22145 Braak','Germany'),(17,'UNI Spring Distribution','34 Inchmuir Road, Whitehill Industrial Estate, Bathgate, West Lothian, EH28 2EP','England'),(18,'Northpack France','36 RUE Du Docteur Duchenne, 62200 Boulogne Sur Mer','France'),(19,'Fol-Pack','Przedsiębiorstwo Produkcyjno-Handlowe FOL-PACK, Leśna 91, 26-200 Końskie','Poland'),(20,'W.H.S.F. Warenhandels GmbH','Hüttenedt 23, A-5204 Straßwalchen','Germany'),(21,'Dagema EG','Siemensring 20, D-47877 Willich','Germany'),(22,'Malcherek','Tor Vorne, Alter Emsteker Weg 22, 49661 Cloppenburg','Germany'),(23,'Food Processing Technology LTD','Unit 72 Cookstown Industrial Estate Tallaght, 00-024 Dublin','Ireland'),(24,'JDM Group LTD','RHYS Davis Logistics, Old Parkbury Lane, Colney St, Hertfordshire AL2 2EB','England'),(25,'Potravinarske','Ke Drackam 1419, Praha 5, Zbraslav','Czech Republic'),(26,'PM Pack A/S','Satellitvej 7, DK8700 Horsens','Denmark'),(27,'Fleischerei-& Gastronomiebedarf Inh.','Torben Schmidt E.K., Gewerbedamm 4, 24955 Harrislee','Germany'),(28,'ENDERS CZ S.R.O.','K Borovemu 101, 251 01 Ricany - Jazlovice','Czech Republic'),(29,'Bomark Ambalaza D.O.O.','Ivana Severa 15, 42000 Varazdin','Croatia'),(30,'VESELY spol. S.R.O.','U Vlecky 12, 400 01 Usti nad Labem','Czech Republic'),(31,'SCOBIE JUNOR (Estd. 1919) LTD','1 Singer Road Kelvin Industrial Estate, East Kilbridge G75 0XS','Scotland'),(32,'Metzgerei-und Gastronomiebedarf','Erbacherstrasse 66, 64380 Rossdorf','Germany'),(33,'BVP Verpakkingen B.V.','Olivijn 600 (Kil III), 03-316 DORDRECHT','Netherlands'),(34,'PCJ Packaging LTD','Unit 1 Sunnyside Road North, Weston-Super-Mare, North Somerset BS23 3PZ','England'),(35,'M.Athanasiadi & CO.','57013 Oreokastro, Postfach 2107, Thessaloniki','Greece'),(36,'COMPAC S.R.L.','Via L.Spallanzani 8/A, 42024 Castelnovo di Sotto (RE)','Italy'),(37,'STERAC Transport & Logistik GmbH','Waldweg 1-3, D-22145 Braak','Germany'),(38,'MARFOL Sp. z o.o.','Siemianowicka 98, 41-902 BYTOM','Poland'),(39,'Allvac Folien GmbH','Dieselstrasse 7, D-87448 Waltenhofen','Germany'),(40,'Mondial Navys','ZI des Hauts Sarts, 2eme avenue 15, 4040 HERSTAL','Belgium'),(41,'IKO Kompania Drobiarska Spółka z o.o.','Augustowo 26, 64-050 Wielichowo','Poland'),(42,'Homburg Verpackungstechnik','Theodor Otte 148, 45897 Gelsenkirchen','Germany'),(43,'Egeturk GmbH & Co.KG','Wurst - Fleischwarenfabrikation, Feldkasseler Weg 5','Germany'),(44,'SODIAL','Zoning Industriel, 4eme rue, 6040 JUMET','Belgium'),(45,'Bleyer & Wichert GmbH & Co. KG','Carl Benz Str. 8, D-24568 Kaltenkirchen','Germany'),(46,'VAMA','Bodendorf GmbH, Opelstrasse 20, 68789 St.Leon-Rot','Germany'),(47,'Wunschs Wurstchen GmbH','Hermann Lons Str. 130, D-51469 Bergisch, Gladbach','Germany'),(48,'Vaessen-Schoemaker','Zona Industrial de Ovar, Avenida 16 de Malo, 3880-102 Ovar','Portugal'),(49,'PAARDEKOOPER','Willem Beukelszstraat 16, 3261 LV OUD Beijerland','Netherlands'),(50,'STARFOL','2310 Szigetszentmiklos, Leshegy u.8','Hungary'),(51,'EuralPack NV','Wijtschotbaan 9, Poort 1, BE 2900 Schoten','Belgium'),(52,'Vestey Foods','Galli Gallo srl, 505100 Codlea, Brasov','Romania');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-01 19:39:00
