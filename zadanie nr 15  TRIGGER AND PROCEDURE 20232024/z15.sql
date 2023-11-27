-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: exam
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-0+deb11u1

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'AGC Packaging System LTD','8 Lordsbury Field, South Wallington, SM6 9PE Surrey','England'),(2,'Asgaard Packaging','14G, Grants Avenue, Greenouge Business Park D24 TN99 Dublin','Ireland'),(3,'Cabral NV','Buurtstraat 83, 9990 Maldegem','Belgium'),(4,'Van Der Windt Pakaging','Nijverheidsstraat 8, 2390 Malle','Belgium'),(5,'Despol sp. z o.o.','ul. Raszyńska 13, 05-500 Piaseczno','Poland'),(6,'Gustav Ehlert Gmbh & Co. KG','Schinkenstrasse 9, 33415 Verl','Germany'),(7,'Brabopak BVBA','Uilenbaan 200 unit 6, 2160 Wommelgem','Belgium'),(8,'Charles Bourdeau Company','Le Bois De La Noe, 44360 Saint-Etienne De Montluc','France'),(9,'DPG Packaging LTD','22 Whittle Place, South Newmoor Industrial Estate, KA11 4HR Irvine','England'),(10,'DEBO TRADING Johan David','Zocherstaat 64, 2272 SL Voorburg','The Netherlands'),(11,'Haber','Krzysztof Piątkowski, Dziki 8b, 86-100 Świecie','Poland'),(12,'Wenta Opakowania','Barbara Wenta, ul. Tuchomska 48, 80-209 Chwaszczyno','Poland');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` date DEFAULT current_timestamp(),
  `sender` varchar(100) DEFAULT NULL,
  `iban_wn` varchar(28) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `customer` varchar(100) DEFAULT NULL,
  `iban_ma` varchar(28) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `mark` int(11) DEFAULT NULL,
  `transfer` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `license_iban_fk` (`iban_wn`),
  CONSTRAINT `license_iban_fk` FOREIGN KEY (`iban_wn`) REFERENCES `license` (`iban`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bills` (
  `plan` varchar(5) NOT NULL,
  `wn` decimal(10,2) unsigned DEFAULT 0.00,
  `ma` decimal(10,2) unsigned DEFAULT 0.00,
  `code` char(3) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `transfer` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartons`
--

DROP TABLE IF EXISTS `cartons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartons` (
  `model` varchar(2) NOT NULL,
  `w` int(11) DEFAULT NULL,
  `l` int(11) DEFAULT NULL,
  `h` int(11) DEFAULT NULL,
  `density` int(11) DEFAULT NULL,
  `material` varchar(30) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `kg` decimal(10,2) GENERATED ALWAYS AS ((`w` / 1000 + `l` / 1000 + `w` / 1000 + `l` / 1000) * (`w` / 1000 + `h` / 1000) * `density` / 1000) STORED,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartons`
--

LOCK TABLES `cartons` WRITE;
/*!40000 ALTER TABLE `cartons` DISABLE KEYS */;
INSERT INTO `cartons` VALUES ('BO',999,999,999,0,'film PA/PE',9999,0.00),('J',310,410,250,632,'5BC-0-TWT-632 g/m2',1480,0.51),('K',320,410,155,632,'5BC-0-TWT-632 g/m2',10,0.44),('L',310,410,220,632,'5BC-0-TWT-632 g/m2',370,0.48),('M',310,410,185,632,'5BC-0-TWT-632 g/m2',320,0.45),('N',310,410,125,632,'5BC-0-TWT-632 g/m2',450,0.40),('O',310,410,100,632,'5BC-0-TWT-632 g/m2',40,0.37),('P',380,530,120,632,'5BC-0-TWT-632 g/m2',120,0.58),('P1',360,560,180,632,'5BC-0-TWT-632 g/m2',920,0.63),('P2',360,560,250,632,'5BC-0-TWT-632 g/m2',640,0.71),('R',310,620,100,632,'5BC-0-TWT-632 g/m2',50,0.48),('S',310,410,300,632,'5BC-0-TWT-632 g/m2',2840,0.56),('T',250,850,125,632,'5BC-0-TWT-632 g/m2',588,0.52),('Z',750,1150,1600,632,'5BC-0-TWT-632 g/m2',40,5.64);
/*!40000 ALTER TABLE `cartons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `list` int(11) NOT NULL,
  `shipp` date DEFAULT NULL,
  `crm` varchar(500) DEFAULT NULL,
  `client` int(11) DEFAULT NULL,
  PRIMARY KEY (`list`),
  KEY `address_fk` (`client`),
  CONSTRAINT `address_fk` FOREIGN KEY (`client`) REFERENCES `address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (95,'2016-03-04','2016/02/00047',1),(165,'2016-06-27','2016/06/00116,2016/06/00110',1),(405,'2017-02-20','2016/11/00011,2016/11/00096,2016/11/00108,2016/11/00109',4),(486,'2017-02-20','2017/01/00016,2017/00074',3),(646,'2017-05-29','10047680, 1704260, 2017/00481',10),(672,'2017-06-09','2017/00758,2017/00743,2017/00671',6),(758,'2017-07-03','2017/01108,2017/00789,2017/00959,2017/00958,2017/00954',2);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ext`
--

DROP TABLE IF EXISTS `ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `C` int(11) NOT NULL,
  `A` int(11) NOT NULL,
  `pa` int(11) DEFAULT NULL,
  `pe` int(11) DEFAULT NULL,
  `my` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `batch` varchar(10) DEFAULT NULL,
  `start` int(11) DEFAULT 0,
  `stop` int(11) DEFAULT 0,
  `w` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `real_kg` decimal(10,2) DEFAULT NULL,
  `mat_kg` decimal(10,2) GENERATED ALWAYS AS (`w` / 1000 * `total` / (1000 / (`pa` * 1.165 + `pe` * 0.91)) * 2) STORED,
  `loss` decimal(10,2) DEFAULT 0.00,
  `min_h` decimal(10,2) GENERATED ALWAYS AS (timestampdiff(MINUTE,`begin`,`end`) / 60) VIRTUAL,
  `mb_h` decimal(10,2) GENERATED ALWAYS AS (`total` / `min_h`) STORED,
  `real_m2_kg` decimal(10,2) GENERATED ALWAYS AS (`w` / 1000 * `mb_h` * 2 / (`mb_h` * `real_kg` / `total`)) STORED,
  PRIMARY KEY (`id`),
  KEY `silos_c_fk` (`C`),
  KEY `silos_a_fk` (`A`),
  CONSTRAINT `silos_a_fk` FOREIGN KEY (`A`) REFERENCES `silos` (`id`),
  CONSTRAINT `silos_c_fk` FOREIGN KEY (`C`) REFERENCES `silos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext`
--

LOCK TABLES `ext` WRITE;
/*!40000 ALTER TABLE `ext` DISABLE KEYS */;
INSERT INTO `ext` VALUES (1,'2018-03-10 06:00:00','2018-03-10 08:00:00',2,1,15,55,70,26,'004/03ex1',42813,42814,650,1800,154.60,158.01,22.60,2.00,900.00,15.14),(2,'2018-03-10 04:35:00','2018-03-10 06:00:00',2,1,15,55,70,25,'004/03ex1',42812,42813,650,1200,105.50,105.34,6.50,1.42,845.07,14.79),(3,'2018-03-09 18:00:00','2018-03-10 04:30:00',2,1,15,55,70,30,'003/03ex1',42805,42811,600,9150,755.70,741.42,7.20,10.50,871.43,14.53),(4,'2018-03-09 15:50:00','2018-03-09 18:00:00',2,1,15,55,70,35,'003/03ex1',42803,42804,600,1850,153.20,149.91,3.40,2.17,852.53,14.49),(5,'2018-03-09 06:00:00','2018-03-09 15:45:00',2,1,15,55,70,35,'002/03ex1',42794,42802,620,8250,690.85,690.78,12.20,9.75,846.15,14.81),(6,'2018-03-09 02:45:00','2018-03-09 06:00:00',2,1,15,55,70,26,'002/03ex1',42792,42794,620,2820,232.70,236.12,16.20,3.25,867.69,15.03);
/*!40000 ALTER TABLE `ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `list` int(11) DEFAULT NULL,
  `pa` int(11) DEFAULT NULL,
  `pe` int(11) DEFAULT NULL,
  `article` varchar(100) DEFAULT NULL,
  `my` int(11) DEFAULT NULL,
  `w` int(11) DEFAULT NULL,
  `reel` int(11) DEFAULT NULL,
  `mb` int(11) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `total` int(11) GENERATED ALWAYS AS (`reel` * `mb`) STORED,
  `net` decimal(10,2) GENERATED ALWAYS AS (`w` / 1000 * `total` / (1000 / (`pa` * 11.65 / 10 + `pe` * 9.1 / 10))) STORED,
  PRIMARY KEY (`id`),
  KEY `opti_fk` (`list`),
  CONSTRAINT `opti_fk` FOREIGN KEY (`list`) REFERENCES `customer` (`list`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,95,40,120,'OPTIfilm Blue A160',160,426,8,400,1310,3200,212.39),(2,95,40,120,'OPTIfilm Blue A160',160,426,8,420,1310,3360,223.01),(3,95,40,120,'OPTIfilm Blue A160',160,426,4,415,1310,1660,110.18),(4,95,40,120,'OPTIfilm Blue A160',160,426,20,400,1311,8000,530.97),(5,95,40,120,'OPTIfilm Blue A160',160,426,20,400,1312,8000,530.97),(6,95,40,120,'OPTIfilm Blue A160',160,426,20,400,1313,8000,530.97),(7,165,40,120,'OPTIcook Blue A160',160,424,20,400,1687,8000,528.47),(8,165,30,120,'OPTIcook Blue A150',150,415,20,400,1688,8000,478.58),(9,165,30,120,'OPTIcook Blue A150',150,415,20,400,1689,8000,478.58);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iban`
--

DROP TABLE IF EXISTS `iban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iban` (
  `customer` varchar(100) DEFAULT NULL,
  `iban` varchar(28) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`iban`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iban`
--

LOCK TABLES `iban` WRITE;
/*!40000 ALTER TABLE `iban` DISABLE KEYS */;
INSERT INTO `iban` VALUES ('Agnieszka Stępień','PL00876600058141790462178437',NULL),('Jacek Śledziński','PL04124099740243222274708520',NULL),('Magdalena Piejek','PL05124070397593304511231806',NULL),('Sławek Paliwoda','PL17124061750987448828702592',NULL),('Michał Bojanowski','PL18249083598655226706933581',NULL),('Krystyna Plata','PL20249084341561654504971372',NULL),('Marcin Szramka','PL21124004210487651829850068',NULL),('Krzysztof Wójcik','PL25249033673602009382598771',NULL),('Magdalena Mecner','PL28105017641000009030848155',NULL),('Łukasz Tokarski','PL30249082296940279363750521',NULL),('Jacek Wojciechowski','PL33249076687325021406960044',NULL),('Jagoda Kędziora','PL34124018645464677111509165',NULL),('Jurek Drabarek','PL37194012100103656900100000',NULL),('Sebastian Aranowski','PL39249069517896902195583953',NULL),('Tadeusz Szczełuszczenko','PL42249060369113293063743535',NULL),('Aneta Kuświk','PL44124009551989730092960225',NULL),('Dawid Domin','PL44918200064827284627648868',NULL),('Joanna Formela','PL49124020924616100356876470',NULL),('Bogdan Witos','PL51910110268515565119632822',NULL),('Wenta Opakowania','PL58144013870000000013450382',NULL),('Maciej Minasiewicz','PL60124093235264959603821201',NULL),('Karol Kass','PL61203032647676597947504775',NULL),('US Lębork','PL62101000712223221332000000','in.d.'),('Magdalena Lica','PL64124023663365056723152869',NULL),('Tosiek Wiczkowski','PL64249079877217524097568137',NULL),('Artur Regliński','PL69124019230819461556534673',NULL),('Maciej Górczyński','PL69868500016697582197592502',NULL),('Justyna Stefanowska','PL77249043510471279913533090',NULL),('Kamil Jachacy','PL79124032881854465008253111',NULL),('Monika Matuszewska','PL81124081246430688329167295',NULL),('Tomasz Łosiewicz','PL84124032041801202530485617',NULL),('Mateusz Kruk','PL86124038849084378109663550',NULL),('Agnieszka Mogielnicka','PL88249067468985089364712917',NULL),('Magdalena Gorlikowska','PL88915910361520647940221590',NULL),('Bernd Hoerburger','PL92249052315974607849988116',NULL),('Tomasz Krząkała','PL92883400091246449417624867',NULL),('Tomasz Cirocki','PL95943400025555165054545504',NULL);
/*!40000 ALTER TABLE `iban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license` (
  `company` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `iban` varchar(28) NOT NULL,
  `nrs` varchar(28) DEFAULT NULL,
  PRIMARY KEY (`iban`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license`
--

LOCK TABLES `license` WRITE;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
INSERT INTO `license` VALUES ('Northpack sp. z o.o.','ul. Pałacowa 11, 83-330 Małkowo','Poland','www.northpack.com','PL28105017641000009030848155','PL54928810822945097236351573');
/*!40000 ALTER TABLE `license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list`
--

DROP TABLE IF EXISTS `list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `last` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list`
--

LOCK TABLES `list` WRITE;
/*!40000 ALTER TABLE `list` DISABLE KEYS */;
INSERT INTO `list` VALUES (1,'Sebastian','Aranowski','Machine Operator'),(2,'Dawid','Domin','Machine Operator'),(3,'Bogdan','Witos','Machine Operator'),(4,'Sławek','Paliwoda','Machine Operator'),(5,'Tosiek','Wiczkowski','Machine Operator'),(6,'Maciej','Górczyński','Machine Operator'),(7,'Tomasz','Cirocki','Machine Operator');
/*!40000 ALTER TABLE `list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lot`
--

DROP TABLE IF EXISTS `lot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `model` varchar(2) DEFAULT NULL,
  `deal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lot_fk` (`model`),
  CONSTRAINT `lot_fk` FOREIGN KEY (`model`) REFERENCES `cartons` (`model`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lot`
--

LOCK TABLES `lot` WRITE;
/*!40000 ALTER TABLE `lot` DISABLE KEYS */;
INSERT INTO `lot` VALUES (1,'2017-02-21','N',1600),(2,'2017-02-21','K',1600),(3,'2017-02-21','M',1600),(4,'2017-02-21','L',1600),(5,'2017-02-21','J',1600),(6,'2017-02-21','P2',960),(7,'2017-02-27','S',1600),(8,'2017-03-06','N',1920),(9,'2017-03-06','K',1920),(10,'2017-03-06','L',1600),(11,'2017-03-06','T',300),(12,'2017-03-10','N',3200),(13,'2017-03-10','K',3200),(14,'2017-03-10','M',960),(15,'2017-03-10','L',3200),(16,'2017-03-10','J',3200),(17,'2017-03-10','S',3200),(18,'2017-03-10','P2',960),(19,'2017-03-15','Z',20),(20,'2017-03-15','P1',320),(21,'2017-04-24','O',3600),(22,'2017-04-24','N',3600),(23,'2017-04-24','K',3600),(24,'2017-04-24','M',3600),(25,'2017-04-24','L',1600),(26,'2017-04-24','J',1600),(27,'2017-04-24','P2',1000),(28,'2017-04-24','P1',1000),(29,'2017-04-28','T',600),(30,'2017-05-11','P1',1000),(31,'2017-05-29','O',3600),(32,'2017-05-29','N',3600),(33,'2017-05-29','K',1920),(34,'2017-05-29','M',3600),(35,'2017-06-22','O',3600),(36,'2017-06-22','N',3600),(37,'2017-06-22','K',1920),(38,'2017-06-22','M',3600),(39,'2017-06-22','L',1920),(40,'2017-06-22','P1',1000),(41,'2017-06-22','T',600),(42,'2017-07-24','O',2700),(43,'2017-07-24','N',2700),(44,'2017-07-24','K',3200),(45,'2017-07-24','M',2240),(46,'2017-07-24','L',3200),(47,'2017-07-24','P2',640),(48,'2022-02-08','Z',20);
/*!40000 ALTER TABLE `lot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pouch`
--

DROP TABLE IF EXISTS `pouch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pouch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `list` int(11) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `pa` int(11) DEFAULT NULL,
  `pe` int(11) DEFAULT NULL,
  `article` varchar(100) DEFAULT NULL,
  `my` int(11) DEFAULT NULL,
  `w` int(11) DEFAULT NULL,
  `l` int(11) DEFAULT NULL,
  `model` varchar(2) DEFAULT NULL,
  `carton` int(11) DEFAULT NULL,
  `pcs` int(11) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `scales` decimal(10,2) GENERATED ALWAYS AS (`w` / 1000 * (`l` / 1000) * 2000 / (1000 / (`pa` * 11.65 / 10 + `pe` * 9.1 / 10))) STORED,
  `net` decimal(10,2) GENERATED ALWAYS AS (`carton` * `pcs` / 1000 * `scales`) STORED,
  PRIMARY KEY (`id`),
  KEY `list_fk` (`list`),
  KEY `cartons_fk` (`model`),
  CONSTRAINT `cartons_fk` FOREIGN KEY (`model`) REFERENCES `cartons` (`model`),
  CONSTRAINT `list_fk` FOREIGN KEY (`list`) REFERENCES `customer` (`list`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pouch`
--

LOCK TABLES `pouch` WRITE;
/*!40000 ALTER TABLE `pouch` DISABLE KEYS */;
INSERT INTO `pouch` VALUES (1,758,12882,36,44,'OPTIbake PA/PE',80,300,300,'L',36,1000,5428,14.76,531.36),(2,758,12292,12,53,'OPTIpouch PA/PE',65,160,210,'O',15,1000,5430,4.18,62.70),(3,758,12543,12,53,'OPTIpouch Black PA/PE ',65,300,400,'L',10,1000,5429,14.93,149.30),(4,758,12323,12,53,'OPTIcook PA/PE',65,150,200,'O',10,1000,5429,3.73,37.30),(5,758,12321,12,53,'OPTIbake PA/PE',65,160,380,'K',30,1000,5430,7.56,226.80),(6,758,12282,36,44,'OPTIbake PA/PE',80,400,700,'L',10,500,5430,45.91,229.55),(7,758,12882,36,44,'OPTIbake PA/PE',80,300,300,'L',14,1000,5429,14.76,206.64),(8,486,8720,20,80,'OPTIpouch PA/PE',100,250,350,'BO',25,1000,3545,16.82,420.50),(9,486,8719,20,80,'OPTIpouch PA/PE',100,400,600,'BO',10,500,3546,46.13,230.65),(10,486,8724,20,80,'OPTIpouch PA/PE',100,150,250,'BO',5,1000,3546,7.21,36.05),(11,486,9448,18,67,'OPTIpouch PA/PE',85,500,700,'P',8,250,3546,57.36,114.72),(12,486,8722,20,80,'OPTIpouch PA/PE',100,200,300,'BO',40,1000,3547,11.53,461.20),(13,486,8723,20,80,'OPTIpouch PA/PE',100,160,200,'BO',20,1000,3548,6.15,123.00),(14,486,8721,20,80,'OPTIpouch PA/PE',100,300,400,'BO',40,500,3549,23.06,461.20),(15,486,8720,20,80,'OPTIpouch PA/PE',100,250,350,'BO',5,1000,3546,16.82,84.10),(16,486,8722,20,80,'OPTIpouch PA/PE',100,200,300,'BO',15,1000,3548,11.53,172.95),(17,405,8186,18,67,'OPTIpouch PA/PE',85,300,400,'J',32,1000,2896,19.67,629.44),(18,405,8138,18,67,'OPTIpouch PA/PE',85,300,400,'J',25,1000,2897,19.67,491.75),(19,405,7925,40,120,'OPTIpouch PA/PE',160,620,800,'BO',17,200,2899,154.55,525.47),(20,405,7925,40,120,'OPTIpouch PA/PE',160,620,800,'BO',18,200,2900,154.55,556.38),(21,405,8138,18,67,'OPTIpouch PA/PE',85,300,400,'J',25,1000,2898,19.67,491.75),(22,405,7925,40,120,'OPTIpouch PA/PE',160,620,800,'BO',24,100,2901,154.55,370.92),(23,405,8188,18,67,'OPTIpouch PA/PE',85,350,500,'J',20,500,2935,28.68,286.80),(24,672,11786,18,67,'OPTIpouch PA/PE',85,300,400,'J',24,1000,4921,19.67,472.08),(25,672,11785,18,67,'OPTIpouch PA/PE',85,400,500,'S',27,500,4922,32.78,442.53),(26,672,11785,18,67,'OPTIpouch PA/PE',90,400,500,NULL,27,500,4923,32.78,442.53),(27,672,11785,18,67,'OPTIpouch PA/PE',190,400,500,NULL,27,500,4924,32.78,442.53),(28,672,11785,18,67,'OPTIpouch PA/PE',190,400,500,NULL,27,500,4925,32.78,442.53),(29,672,11784,18,67,'OPTIpouch PA/PE',90,220,330,NULL,41,1000,4926,11.90,487.90),(30,672,11784,18,67,'OPTIpouch PA/PE',90,220,330,NULL,40,1000,4927,11.90,476.00),(31,672,11784,18,67,'OPTIpouch PA/PE',90,220,330,NULL,40,1000,4928,11.90,476.00),(32,646,10928,18,67,'OPTIpouch PA/PE',85,200,300,'O',10,1000,4681,9.83,98.30),(33,646,10929,18,67,'OPTIpouch PA/PE',85,150,300,'O',4,1000,4681,7.37,29.48),(34,646,10924,18,67,'OPTIpouch PA/PE',85,400,600,'L',4,500,4681,39.33,78.66),(35,646,11256,18,67,'OPTIpouch PA/PE',85,150,300,'O',16,1000,4681,7.37,117.92);
/*!40000 ALTER TABLE `pouch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(6) DEFAULT NULL,
  `course` decimal(10,2) DEFAULT NULL,
  `month` datetime DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
INSERT INTO `quotes` VALUES (2,'PA6',17.15,'2022-04-10 18:39:13','www.tworzywa.pl'),(3,'LDPE',9.05,'2022-04-10 18:39:53','www.tworzywa.pl');
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` date DEFAULT current_timestamp(),
  `act` int(11) DEFAULT NULL,
  `plan_wn` varchar(5) DEFAULT NULL,
  `plan_ma` varchar(5) DEFAULT NULL,
  `income` decimal(10,2) DEFAULT NULL,
  `expen` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `silos`
--

DROP TABLE IF EXISTS `silos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `silos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `sign` char(1) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `stock` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `silos`
--

LOCK TABLES `silos` WRITE;
/*!40000 ALTER TABLE `silos` DISABLE KEYS */;
INSERT INTO `silos` VALUES (1,'Sabic LDPE 2801H0W','A','blown',1187.98),(2,'Ultramid B40L01','C','blown',934.70),(3,'Coesive LL40M','B','blown',250.00);
/*!40000 ALTER TABLE `silos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `last` varchar(50) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `section` varchar(15) DEFAULT NULL,
  `iban` varchar(28) NOT NULL,
  `employ` date DEFAULT NULL,
  `mark` int(1) DEFAULT 0,
  `a` decimal(10,2) DEFAULT NULL,
  `f` int(11) DEFAULT NULL,
  `delta` decimal(10,2) GENERATED ALWAYS AS (`a` * 19.52 / 100 / 2) VIRTUAL,
  `alpha` decimal(10,2) GENERATED ALWAYS AS (`a` * 19.52 / 100 / 2) VIRTUAL,
  `epsilon` decimal(10,2) GENERATED ALWAYS AS (`a` * 6.5 / 100) VIRTUAL,
  `beta` decimal(10,2) GENERATED ALWAYS AS (`a` * 1.5 / 100) VIRTUAL,
  `gamma` decimal(10,2) GENERATED ALWAYS AS (`a` * 2.45 / 100) VIRTUAL,
  `d` decimal(10,2) GENERATED ALWAYS AS (`a` - `a` * 13.71 / 100) VIRTUAL,
  `e` decimal(10,2) GENERATED ALWAYS AS (`d` * 9 / 100) VIRTUAL,
  `g` decimal(10,2) GENERATED ALWAYS AS (round(`a` - (`a` * 13.71 / 100 + `f`),0)) VIRTUAL,
  `h` decimal(10,2) GENERATED ALWAYS AS (round(`g` * 17 / 100 - 425,0)) VIRTUAL,
  `i` decimal(10,2) GENERATED ALWAYS AS (if(`h` > 0,`a` - `a` * 13.71 / 100 - `e` - `h`,`a` - `a` * 13.71 / 100 - `e`)) VIRTUAL,
  `k` decimal(10,2) GENERATED ALWAYS AS (`a` + `delta` + `epsilon` + `a` * 1.8 / 100 + `a` * 2.45 / 100 + `a` * 0.10 / 100) VIRTUAL,
  PRIMARY KEY (`id`),
  KEY `iban_fk` (`iban`),
  CONSTRAINT `iban_fk` FOREIGN KEY (`iban`) REFERENCES `iban` (`iban`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Agnieszka','Stępień','a.stepien@northpack.com','Customer Service Manager','Office','PL00876600058141790462178437','2007-03-01',1,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(2,'Jacek','Śledziński','j.sledzinski@northpack.com','Key Account Manager','Office','PL04124099740243222274708520','2008-04-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(3,'Magdalena','Piejek','m.piejek@northpack.com','Logistic Assistant','Office','PL05124070397593304511231806','2009-05-01',1,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(4,'Michał','Bojanowski','m.bojanowski@northpack.com','Extruder Operator','Production','PL18249083598655226706933581','2010-06-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(5,'Krystyna','Plata','k.plata@northpack.com','Customer Service Manager','Office','PL20249084341561654504971372','2011-07-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(6,'Marcin','Szramka','m.szramka@northpack.com','Extruder Operator','Production','PL21124004210487651829850068','2012-08-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(7,'Krzysztof','Wójcik','k.wojcik@northpack.com','Warehouse Operator','Production','PL25249033673602009382598771','2013-09-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(8,'Magdalena','Mecner','m.mecner@northpack.com','Logistic Assistant','Office','PL28105017641000009030848155','2014-10-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(9,'Łukasz','Tokarski','l.tokarski@northpack.com','Logistic Assistant','Office','PL30249082296940279363750521','2015-11-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(10,'Jacek','Wojciechowski','j.wojciechowski@northpack.com','Extruder Manager','Production','PL33249076687325021406960044','2016-12-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(11,'Jagoda','Kędziora','j.kedziora@northpack.com','Customer Service Manager','Office','PL34124018645464677111509165','2017-01-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(12,'Jurek','Drabarek','j.drabarek@northpack.com','Customer Service Manager','Office','PL37194012100103656900100000','2018-02-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(13,'Sebastian','Aranowski','s.aranowski@northpack.com','Machine Operator','Production','PL39249069517896902195583953','2019-03-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(14,'Tadeusz','Szczełuszczenko','t.szczełuszczenko@northpack.com','Production Director','Production','PL42249060369113293063743535','2020-04-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(15,'Aneta','Kuświk','a.kuswik@northpack.com','Chief Financial Officer','Office','PL44124009551989730092960225','2021-03-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(16,'Dawid','Domin','d.domin@northpack.com','Machine Operator','Production','PL44918200064827284627648868','2007-01-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(17,'Joanna','Formela','j.formela@northpack.com','Warehouse Operator','Production','PL49124020924616100356876470','2008-02-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(18,'Bogdan','Witos','b.witos@northpack.com','Machine Operator','Production','PL51910110268515565119632822','2009-03-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(19,'Sławek','Paliwoda','s.paliwoda@northpack.com','Machine Operator','Production','PL17124061750987448828702592','2010-04-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(20,'Maciej','Minasiewicz','m.minasiewicz@northpack.com','Sales Manager','Office','PL60124093235264959603821201','2011-05-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(21,'Karol','Kass','k.kass@northpack.com','Extruder Operator','Production','PL61203032647676597947504775','2012-06-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(22,'Magdalena','Lica','m.lica@northpack.com','Assistant','Office','PL64124023663365056723152869','2013-07-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(23,'Tosiek','Wiczkowski','t.wiczkowski@northpack.com','Machine Operator','Production','PL64249079877217524097568137','2014-08-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(24,'Artur','Regliński','a.reglinski@northpack.com','Warehouse Operator','Production','PL69124019230819461556534673','2015-09-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(25,'Maciej','Górczyński','m.gorczynski@northpack.com','Machine Operator','Production','PL69868500016697582197592502','2016-10-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(26,'Justyna','Stefanowska','j.stefanowska@northpack.com','Customer Service Manager','Office','PL77249043510471279913533090','2017-11-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(27,'Kamil','Jachacy','k.jachacy@northpack.com','Extruder Operator','Production','PL79124032881854465008253111','2018-12-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(28,'Monika','Matuszewska','m.matuszewska@northpack.com','Warehouse Operator','Production','PL81124081246430688329167295','2019-01-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(29,'Tomasz','Łosiewicz','t.losiewicz@northpack.com','Chief Technology Officer','Production','PL84124032041801202530485617','2020-02-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(30,'Mateusz','Kruk','m.kruk@northpack.com','Warehouse Operator','Production','PL86124038849084378109663550','2021-03-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(31,'Agnieszka','Mogielnicka','a.mogielnicka@northpack.com','Chief Accountant','Office','PL88249067468985089364712917','2007-05-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(32,'Magdalena','Gorlikowska','m.gorlikowska@northpack.com','Assistant','Office','PL88915910361520647940221590','2008-06-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(33,'Bernd','Hoerburger','b.hoerburger@northpack.com','Chief Executive Officer','Production','PL92249052315974607849988116','2009-07-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(34,'Tomasz','Krząkała','t.krzakala@northpack.com','Production Manager','Production','PL92883400091246449417624867','2010-08-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91),(35,'Tomasz','Cirocki','t.cirocki@northpack.com','Machine Operator','Production','PL95943400025555165054545504','2011-09-01',0,3100.00,250,302.56,302.56,201.50,46.50,75.95,2674.99,240.75,2425.00,-13.00,2434.24,3738.91);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `swift`
--

DROP TABLE IF EXISTS `swift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swift` (
  `iban` varchar(28) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `swift`
--

LOCK TABLES `swift` WRITE;
/*!40000 ALTER TABLE `swift` DISABLE KEYS */;
INSERT INTO `swift` VALUES ('BE68539007547034'),('BE68539007547035'),('BE68539007547036'),('DE89370400440532013000'),('FR1420041010050500013M02606'),('GB29NWBK60161331926818'),('GB29NWBK60161331926819'),('IE29AIBK93115212345678'),('NL91ABNA0417164300'),('PL00876600058141790462178437'),('PL28105017641000009030848155'),('PL37194012100103656900100000'),('PL44918200064827284627648868'),('PL51910110268515565119632822'),('PL58144013870000000013450382'),('PL69868500016697582197592502'),('PL95943400025555165054545504');
/*!40000 ALTER TABLE `swift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tech`
--

DROP TABLE IF EXISTS `tech`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tech` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `C` int(11) DEFAULT NULL,
  `A` int(11) DEFAULT NULL,
  `pa` int(11) DEFAULT NULL,
  `pe` int(11) DEFAULT NULL,
  `w` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `real_kg` decimal(10,2) DEFAULT NULL,
  `loss` decimal(10,2) DEFAULT 0.00,
  `mat_kg` decimal(10,2) GENERATED ALWAYS AS (`w` / 1000 * `total` / (1000 / (`pa` * 1.165 + `pe` * 0.91)) * 2) STORED,
  `pa_kg` decimal(10,2) GENERATED ALWAYS AS (`w` / 1000 * `total` / (1000 / (`pa` * 1.165)) * 2) STORED,
  `pe_kg` decimal(10,2) GENERATED ALWAYS AS (`w` / 1000 * `total` / (1000 / (`pe` * 0.91)) * 2) STORED,
  `loss_m` decimal(10,2) GENERATED ALWAYS AS (`loss` * (1000 / (`pa` * 1.165 + `pe` * 0.91)) / (`w` / 1000) / 2) STORED,
  `pa_loss` decimal(10,2) GENERATED ALWAYS AS (`w` / 1000 * `loss_m` / (1000 / (`pa` * 1.165)) * 2) STORED,
  `pe_loss` decimal(10,2) GENERATED ALWAYS AS (`w` / 1000 * `loss_m` / (1000 / (`pe` * 0.91)) * 2) STORED,
  PRIMARY KEY (`id`),
  KEY `silos_a2_fk` (`A`),
  KEY `silos_c2_fk` (`C`),
  CONSTRAINT `silos_a2_fk` FOREIGN KEY (`A`) REFERENCES `silos` (`id`),
  CONSTRAINT `silos_c2_fk` FOREIGN KEY (`C`) REFERENCES `silos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tech`
--

LOCK TABLES `tech` WRITE;
/*!40000 ALTER TABLE `tech` DISABLE KEYS */;
INSERT INTO `tech` VALUES (1,2,1,15,55,650,1800,154.60,22.60,158.01,40.89,117.12,257.45,5.85,16.75),(2,2,1,15,55,600,1850,153.20,3.40,149.91,38.79,111.11,41.96,0.88,2.52),(3,2,1,15,55,620,8250,690.85,12.20,690.78,178.77,512.01,145.70,3.16,9.04),(4,2,1,15,55,620,2820,232.70,16.20,236.12,61.11,175.01,193.48,4.19,12.01);
/*!40000 ALTER TABLE `tech` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `device` varchar(30) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `start` int(11) DEFAULT 0,
  `stop` int(11) GENERATED ALWAYS AS (`start` + `carton` - 1) VIRTUAL,
  `crm` varchar(50) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `pa` int(11) DEFAULT NULL,
  `pe` int(11) DEFAULT NULL,
  `my` int(11) DEFAULT NULL,
  `w` int(11) DEFAULT NULL,
  `l` int(11) DEFAULT NULL,
  `total` int(11) GENERATED ALWAYS AS (`carton` * `pcs`) STORED,
  `loss` decimal(10,2) DEFAULT 0.00,
  `clipp` decimal(10,2) DEFAULT 0.00,
  `track` int(11) DEFAULT NULL,
  `model` varchar(2) DEFAULT NULL,
  `carton` int(11) DEFAULT NULL,
  `pcs` int(11) DEFAULT NULL,
  `scales` decimal(10,2) GENERATED ALWAYS AS (`w` / 1000 * (`l` / 1000) * 2000 / (1000 / (`pa` * 11.65 / 10 + `pe` * 9.1 / 10))) STORED,
  `net` decimal(10,2) GENERATED ALWAYS AS (`total` / 1000 * `scales`) STORED,
  PRIMARY KEY (`id`),
  KEY `model` (`model`),
  KEY `list_num_fk` (`num`),
  CONSTRAINT `list_num_fk` FOREIGN KEY (`num`) REFERENCES `list` (`num`),
  CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`model`) REFERENCES `cartons` (`model`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workers`
--

LOCK TABLES `workers` WRITE;
/*!40000 ALTER TABLE `workers` DISABLE KEYS */;
INSERT INTO `workers` VALUES (1,'2017-08-01','elba',12882,281769,281775,'2017/01108',1,36,44,80,300,300,7000,7.00,60.50,1,'L',7,1000,14.76,103.32),(2,'2017-07-29','elba',12882,281776,281791,'2017/01108',2,36,44,80,300,300,16000,5.00,22.50,1,'L',16,1000,14.76,236.16),(3,'2017-07-28','elba',12882,281792,281818,'2017/01108',3,36,44,80,300,300,27000,11.00,52.20,2,'L',27,1000,14.76,398.52),(4,'2017-07-26','red',12543,281819,281828,'2017/00789',6,18,67,85,300,400,10000,2.40,0.00,2,'L',10,1000,19.67,196.70),(5,'2017-07-13','totani 1',12323,281829,281838,'2017/00959',7,12,53,65,150,200,10000,4.80,0.00,1,'O',10,1000,3.73,37.30),(6,'2017-07-28','totani 1',12321,281839,281852,'2017/00958',7,36,44,80,160,380,14000,4.00,9.80,1,'K',14,1000,9.97,139.58),(7,'2017-07-28','totani 1',12321,281853,281864,'2017/00958',4,36,44,80,160,380,12000,11.00,12.60,1,'K',12,1000,9.97,119.64),(8,'2017-07-27','totani 1',12321,281865,281868,'2017/00958',6,36,44,80,160,380,4000,1.80,0.00,1,'K',4,1000,9.97,39.88),(9,'2017-07-28','totani 1',12292,281869,281880,'2017/00954',4,12,53,65,160,210,12000,4.40,47.70,1,'O',12,1000,4.18,50.16),(10,'2017-07-28','totani 1',12292,281881,281883,'2017/00954',6,12,53,65,160,210,3000,14.00,2.00,1,'O',3,1000,4.18,12.54),(11,'2017-08-01','red',12282,281884,281893,'2017/00960',4,12,53,65,400,700,5000,1.50,0.00,1,'L',10,500,34.84,174.20),(12,'2017-06-09','white',11786,281894,281894,'2017/00743',7,18,67,85,300,400,1000,0.00,0.00,1,'J',1,1000,19.67,19.67),(13,'2018-03-09','red',14391,281895,281913,'2018/00029',5,20,50,70,395,450,9500,1.80,0.00,1,'K',19,500,24.46,232.37),(14,'2018-03-14','red',14231,281914,281917,'2017/01540',7,15,65,80,150,255,4000,0.00,0.00,1,'O',4,1000,5.86,23.44),(15,'2017-06-09','white',11786,281918,281940,'2017/00743',7,18,67,85,300,400,23000,9.00,0.00,1,'J',23,1000,19.67,452.41),(16,'2017-06-09','elba',11786,281941,281953,'2017/00743',7,18,67,85,300,400,13000,8.00,20.50,1,'J',13,1000,19.67,255.71),(17,'2017-06-08','elba',11786,281955,281995,'2017/00743',6,18,67,85,300,400,41000,19.00,0.00,2,'J',41,1000,19.67,806.47),(18,'2017-06-08','elba',11796,281954,281973,'2017/00743',4,18,67,85,300,400,20000,0.00,0.00,1,'J',20,1000,19.67,393.40),(19,'2017-06-08','elba',11786,281974,282001,'2017/00743',4,18,67,85,300,400,28000,8.00,0.00,1,'J',28,1000,19.67,550.76),(20,'2017-06-08','elba',11786,282002,282037,'2017/00743',7,18,67,85,300,400,36000,20.00,0.00,2,'J',36,1000,19.67,708.12),(21,'2017-06-07','elba',11786,282038,282075,'2017/00743',4,18,67,85,300,400,38000,9.00,0.00,2,'J',38,1000,19.67,747.46),(22,'2018-03-06','white',14453,282076,282085,'2018/00048',5,30,110,140,120,250,10000,2.55,0.00,1,'O',10,1000,8.10,81.00),(24,'2018-03-06','white',14454,282086,282095,'2018/00048',6,30,110,140,90,260,10000,2.80,0.00,1,'O',10,1000,6.32,63.20),(65,'2017-03-03','white',9607,282096,282179,'2017/00143',4,20,50,70,200,300,84000,39.40,0.00,4,'K',84,1000,8.26,693.84),(66,'2017-03-03','white',9607,282180,282239,'2017/00143',6,20,50,70,200,300,60000,21.00,0.00,4,'K',60,1000,8.26,495.60),(67,'2017-03-03','white',9607,282240,282284,'2017/00143',3,20,50,70,200,300,45000,13.50,0.00,4,'K',45,1000,8.26,371.70),(68,'2017-03-08','white',9607,282285,282295,'2017/00143',7,20,50,70,200,300,11000,8.40,0.00,1,'K',11,1000,8.26,90.86),(69,'2017-03-08','white',9607,282296,282312,'2017/00143',6,20,50,70,200,300,17000,9.00,0.00,4,'K',17,1000,8.26,140.42),(70,'2017-03-09','white',9607,282313,282405,'2017/00143',4,20,50,70,200,300,93000,35.05,0.00,4,'K',93,1000,8.26,768.18);
/*!40000 ALTER TABLE `workers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-11  8:14:09
