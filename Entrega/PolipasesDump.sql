-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: polipases
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `equipofutbol`
--

DROP TABLE IF EXISTS `equipofutbol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipofutbol` (
  `idEquipoFutbol` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEquipoFutbol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipofutbol`
--

LOCK TABLES `equipofutbol` WRITE;
/*!40000 ALTER TABLE `equipofutbol` DISABLE KEYS */;
INSERT INTO `equipofutbol` VALUES (1,'Babao'),(2,'Itabira'),(3,'Tangwei'),(4,'Boca'),(5,'River'),(6,'Huaquirca'),(7,'Nonohonis'),(8,'Mykonos'),(9,'Jialai'),(10,'Belém'),(11,'Independiente'),(12,'Kralice na Hané'),(13,'San Lorenzo'),(14,'Bang Lamung'),(15,'Barracas'),(16,'San Telmo'),(17,'Chadian'),(18,'Krajan Satu'),(19,'Pengfang'),(20,'Nueva Chicago'),(21,'Francova Lhota'),(22,'Tuusula'),(23,'Palangkaraya'),(24,'Nofoali‘i'),(25,'Viking'),(26,'Uavdoxss'),(27,'Kluczbork'),(28,'La Campora'),(29,'Concordia'),(30,'Ajax'),(31,'Bugana'),(32,'Yingyang'),(33,'Malway'),(34,'Lop Buri'),(35,'Obihiro'),(36,'Santiago Atitlán'),(37,'Santa Catalina'),(38,'Gaojiabu'),(39,'Chapelton');
/*!40000 ALTER TABLE `equipofutbol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fichaje`
--

DROP TABLE IF EXISTS `fichaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fichaje` (
  `idFichaje` int NOT NULL,
  `IdJugadores` int DEFAULT NULL,
  `idEquipoFutbol` int DEFAULT NULL,
  `FechaFichaje` datetime DEFAULT NULL,
  `EstadoDelFichaje` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFichaje`),
  KEY `IdJugadores_idx` (`IdJugadores`),
  KEY `IdEquipoFutbol_idx` (`idEquipoFutbol`),
  CONSTRAINT `FK_IdEquipoFutbol` FOREIGN KEY (`idEquipoFutbol`) REFERENCES `equipofutbol` (`idEquipoFutbol`),
  CONSTRAINT `FK_IdJugadores` FOREIGN KEY (`IdJugadores`) REFERENCES `jugadores` (`IdJugadores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fichaje`
--

LOCK TABLES `fichaje` WRITE;
/*!40000 ALTER TABLE `fichaje` DISABLE KEYS */;
INSERT INTO `fichaje` VALUES (1,1,6,'2020-03-17 14:51:00','Confirmado'),(2,32,2,'2024-10-12 06:23:21','confirmado'),(3,33,3,'2024-10-13 19:51:07',' confirmado'),(4,34,4,'2024-10-14 02:17:16','rechazado'),(6,31,1,'2024-10-11 12:53:00','confirmado');
/*!40000 ALTER TABLE `fichaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores` (
  `idPersona2` int NOT NULL,
  `IdJugadores` int NOT NULL,
  `Representante` int DEFAULT NULL,
  `Salario` int DEFAULT NULL,
  PRIMARY KEY (`IdJugadores`),
  KEY `idPersona2_idx` (`idPersona2`),
  KEY `Representante` (`Representante`),
  CONSTRAINT `IdPersona2` FOREIGN KEY (`idPersona2`) REFERENCES `persona` (`idPersona`),
  CONSTRAINT `Representante` FOREIGN KEY (`Representante`) REFERENCES `managers` (`idManagers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT INTO `jugadores` VALUES (31,1,28,17404),(32,2,30,35078),(33,3,14,23178),(34,4,18,90659),(35,5,3,13755),(36,6,28,56803),(37,7,4,52747),(38,8,12,83329),(39,9,11,68400),(40,10,22,82014),(41,11,9,14870),(42,12,1,88311),(43,13,4,26939),(44,14,17,39767),(45,15,6,18017),(46,16,27,50785),(47,17,17,99876),(48,18,16,67020),(49,19,26,25474),(50,20,27,96314),(51,21,29,35142),(52,22,14,56773),(53,23,19,78439),(54,24,23,31873),(55,25,26,94049),(56,26,19,94624),(57,27,30,90973),(58,28,28,70993),(59,29,3,72046),(60,30,24,47252),(61,31,21,10123),(62,32,17,78858),(63,33,1,83922),(64,34,24,83035),(65,35,3,63409),(66,36,21,57938),(67,37,28,89465),(68,38,27,83510),(69,39,20,49153),(70,40,22,75236),(71,41,25,38721),(72,42,8,47898),(73,43,14,23325),(74,44,7,52933),(75,45,3,94690),(76,46,29,34649),(77,47,26,59179),(78,48,23,91944),(79,49,3,92183),(80,50,3,85084),(81,51,11,48870),(82,52,2,69098),(83,53,30,98880),(84,54,8,97106),(85,55,3,88891),(86,56,29,53134),(87,57,1,78998),(88,58,16,45587),(89,59,19,70941),(90,60,10,27944),(91,61,24,96901),(92,62,5,30666),(93,63,22,32632),(94,64,29,61164),(95,65,16,17919),(96,66,19,76108),(97,67,15,46782),(98,68,19,85585),(99,69,25,97576),(100,70,15,41127),(101,71,15,82907),(102,72,1,11152),(103,73,7,67041),(104,74,21,21747),(105,75,9,77615),(106,76,8,42832),(107,77,26,61318);
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managers` (
  `idManagers` int NOT NULL,
  `IdPersona` int NOT NULL,
  PRIMARY KEY (`idManagers`,`IdPersona`),
  KEY `IdPersona_idx` (`IdPersona`),
  CONSTRAINT `IdPersona` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30);
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `idPersona` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `DNI` int DEFAULT NULL,
  `Manager` tinyint DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  PRIMARY KEY (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Keeley','Le Ball',43675901,1,'1987-01-18'),(2,'Kerry','Murthwaite',44037040,1,'2018-07-10'),(3,'Lexi','Salvador',48079054,1,'2007-06-24'),(4,'Grace','Rumgay',44488150,1,'2007-10-28'),(5,'Terese','Brister',48996636,1,'1992-09-07'),(6,'Reba','Cobleigh',43502089,1,'2015-12-13'),(7,'Bald','Persey',42311961,1,'1977-09-14'),(8,'Shanda','Erskin',43596298,1,'2016-08-27'),(9,'Darrelle','Gwillyam',48932194,1,'1976-03-05'),(10,'Lew','Pallas',49851560,1,'2006-11-29'),(11,'Susann','Whitwham',43340086,1,'1982-01-14'),(12,'Dorothy','Annets',49247903,1,'2015-06-12'),(13,'Cherye','Hauch',48179722,1,'2007-02-14'),(14,'Gayler','Digance',41141944,1,'2015-04-09'),(15,'Anjela','Enstone',44347547,1,'1980-12-31'),(16,'Federica','Durker',49358367,1,'1985-03-05'),(17,'Lauree','Curgenven',42858160,1,'2008-11-14'),(18,'Corrie','Swan',49902942,1,'2014-11-05'),(19,'Jamil','Stoffels',45285840,1,'2023-08-14'),(20,'Britteny','Hulkes',43155236,1,'1999-07-21'),(21,'Jonie','Brim',43579462,1,'2002-11-25'),(22,'Chastity','Orman',40082723,1,'1991-11-08'),(23,'Stanwood','Huffy',44753894,1,'1976-07-26'),(24,'Duffy','Hurlston',49766978,1,'1983-04-09'),(25,'Whitney','Alexandersson',46401484,1,'2012-08-24'),(26,'Roth','Eliff',43152058,1,'1989-06-09'),(27,'Martita','Duiguid',45750981,1,'1985-03-29'),(28,'Morey','Netherwood',47847268,1,'1983-11-23'),(29,'Ike','Olman',45925211,1,'1989-09-27'),(30,'Brena','Leil',43782650,1,'2023-01-08'),(31,'Darcie','Lowsely',41350144,0,'2021-11-22'),(32,'Locke','Bleackly',46820772,0,'2016-05-30'),(33,'Cristine','Tomasutti',43438011,0,'1992-05-17'),(34,'Marlon','Peres',48392854,0,'1988-08-24'),(35,'Kermy','Streather',43409656,0,'1992-02-07'),(36,'Fernande','Piel',45347698,0,'2020-07-27'),(37,'Cacilie','Trase',41176646,0,'2002-07-22'),(38,'Frans','Fabbro',41010426,0,'1977-01-24'),(39,'Evyn','Huthart',45362953,0,'2003-08-28'),(40,'Livvie','Moiser',46139974,0,'2013-02-01'),(41,'Mort','Bellanger',45078191,0,'1980-06-23'),(42,'Bartholomeo','Aspinell',42943625,0,'1989-02-10'),(43,'Candis','Elliker',48245567,0,'1980-02-19'),(44,'Philipa','Ellph',44081950,0,'2009-04-30'),(45,'Felipa','Pollitt',44198932,0,'1982-04-02'),(46,'Corrianne','Kenderdine',45348705,0,'2009-04-07'),(47,'Gill','Greatbach',43732389,0,'1975-08-01'),(48,'Georgi','Natt',45001072,0,'1976-02-07'),(49,'Marketa','Brotherhood',41625262,0,'1979-10-08'),(50,'Bendicty','McCanny',48080218,0,'1996-07-15'),(51,'Cyndi','Adriaens',43934779,0,'2019-05-20'),(52,'Andreana','Mulles',46873802,0,'1983-04-25'),(53,'Janie','Mylchreest',41941401,0,'1984-05-29'),(54,'Celesta','Hendren',46871640,0,'1998-02-08'),(55,'Vivyanne','Sangra',49077341,0,'2013-04-22'),(56,'Marylou','Jannaway',46557839,0,'1998-03-22'),(57,'Catherin','Scrigmour',48388242,0,'1977-03-10'),(58,'Vinnie','Boylan',47466781,0,'2017-04-08'),(59,'Cullie','Kopje',48914942,0,'1980-10-17'),(60,'Joellen','Kenney',44668291,0,'1978-02-27'),(61,'Becki','Ranklin',43828739,0,'1974-05-26'),(62,'Bartholemy','Phillipps',43220254,0,'2013-07-11'),(63,'Aili','Wareham',44779302,0,'2020-06-08'),(64,'Odetta','Djurkovic',42498359,0,'1987-08-13'),(65,'Riannon','O\'Leahy',40107032,0,'2002-10-02'),(66,'Norrie','Pinder',46135170,0,'1976-12-06'),(67,'Raff','Olivas',45075658,0,'2002-05-24'),(68,'Mora','Jori',42090586,0,'2007-03-05'),(69,'Andrej','Rossant',42633811,0,'2004-09-09'),(70,'Othella','Aronowitz',42212490,0,'1977-12-10'),(71,'Brianne','Peizer',42004818,0,'2001-08-18'),(72,'Donella','Furbank',40493854,0,'2000-05-01'),(73,'Van','Bartolacci',42522697,0,'2022-10-07'),(74,'Norris','Barnewille',44359724,0,'1988-11-06'),(75,'Sibeal','Dicky',46032293,0,'2001-12-08'),(76,'Henderson','Van T\'Hoog',49295470,0,'2019-02-21'),(77,'Levi','Colquete',48501185,0,'2015-11-26'),(78,'Elle','Nasi',41426253,0,'1998-02-02'),(79,'Verney','Finnis',42443346,0,'2018-09-28'),(80,'Roshelle','Redihalgh',46389874,0,'1975-06-13'),(81,'Fedora','Morteo',40859131,0,'1997-01-02'),(82,'Joellen','MacLennan',41438551,0,'1984-09-08'),(83,'Callean','Canedo',42039806,0,'2008-06-02'),(84,'Briant','Petrello',47318574,0,'2014-01-16'),(85,'Locke','Beed',46833853,0,'2020-12-18'),(86,'Davide','Morse',40921030,0,'1988-09-09'),(87,'Carlina','O\'Fallone',46616759,0,'2006-07-23'),(88,'Towny','McKintosh',46956005,0,'1992-09-21'),(89,'Lesya','Alenikov',46128853,0,'2019-12-11'),(90,'Federica','Spieght',40338291,0,'1997-07-21'),(91,'Bendite','Santo',40030876,0,'2003-12-08'),(92,'Brooks','Ygou',40489142,0,'2003-01-07'),(93,'Odey','Lecointe',41314301,0,'1979-04-17'),(94,'Alastair','Clyne',42314680,0,'2013-05-23'),(95,'Waylin','Semrad',44585472,0,'2005-02-05'),(96,'Erik','McElane',49802804,0,'2011-04-27'),(97,'Ajay','Treuge',44505768,0,'2017-04-18'),(98,'Trace','Gerhts',46947977,0,'1978-07-15'),(99,'Isak','Bushen',45241765,0,'2016-10-11'),(100,'Alisha','Yanshin',48926713,0,'1974-04-18'),(101,'Inglis','Fendley',43424586,0,'1997-02-16'),(102,'Harlie','McClaughlin',45431038,0,'1988-10-06'),(103,'Waldon','Clarke-Williams',47750707,0,'1978-06-09'),(104,'Merrel','Van Dalen',43944296,0,'2001-11-21'),(105,'Rudd','Gonnet',47559890,0,'2000-02-24'),(106,'Pembroke','Penddreth',41194228,0,'2021-01-25'),(107,'Blair','Cicco',45518603,0,'1980-11-29'),(108,'Jannelle','Martusewicz',40303113,0,'2017-05-03'),(109,'Gradey','Baribal',42707962,0,'2019-12-18'),(110,'Jilleen','Koppen',43045695,0,'2023-10-20'),(111,'Barbabra','Stammirs',41966733,0,'1985-02-14'),(112,'Carissa','Curedell',48277278,0,'1980-03-19'),(113,'Zondra','Ginnally',49366106,0,'2021-09-08'),(114,'Cirillo','Benbrick',46434659,0,'1993-10-23'),(115,'Larry','Iacopo',40454906,0,'1979-12-26'),(116,'Calley','Tantrum',45971134,0,'1994-06-27'),(117,'Sollie','Hannis',42688984,0,'2008-06-28'),(118,'Cullin','Codrington',46540061,0,'1984-12-28'),(119,'Shandra','Ricson',44319253,0,'1975-06-28'),(120,'Mirna','Howlin',42945115,0,'1998-06-18'),(121,'Moll','Bazley',41859900,0,'1991-11-06'),(122,'Ame','Bugbee',42768777,0,'1989-11-07'),(123,'Louella','Bolletti',42678198,0,'1999-09-18'),(124,'Kerk','MacLeod',47703670,0,'2005-01-05'),(125,'Elfrieda','Prine',40773054,0,'2001-12-06'),(126,'Dun','Reinhardt',43074695,0,'2020-08-13'),(127,'Denver','Joy',48977517,0,'2023-04-17'),(128,'Fina','Bails',49637861,0,'1980-08-14'),(129,'Letta','Coslett',46094379,0,'2009-03-19'),(130,'Melita','Lantiff',49869903,0,'1980-03-19'),(131,'Humphrey','Beadnell',42355594,0,'1999-06-03'),(132,'Wynn','Clohisey',42382962,0,'1982-06-19'),(133,'Hildegarde','Chene',45019776,0,'1990-01-23'),(134,'Cad','Warde',49775464,0,'1978-12-04'),(135,'Shaina','Androck',44242719,0,'2000-06-03'),(136,'Franciskus','Lawly',48391830,0,'1991-05-09'),(137,'Lillian','Grimbaldeston',45666627,0,'1981-06-29'),(138,'Garrik','Andreassen',41750066,0,'2009-05-27'),(139,'Alistair','Scarsbrick',48752148,0,'1978-07-18'),(140,'Elysia','Hanigan',40897102,0,'1990-07-03'),(141,'Austine','De Brett',42098046,0,'1992-11-22'),(142,'Belita','Bartol',45302463,0,'2018-12-13'),(143,'Levon','Wisden',44890173,0,'1992-02-01'),(144,'Kelby','Matthiae',40432941,0,'1979-07-30'),(145,'Mitchel','Kroch',49555558,0,'1997-08-12'),(146,'Cammie','Couthard',48994854,0,'1975-05-08'),(147,'Tadeo','Glazer',46647323,0,'2009-11-24'),(148,'Hadley','Chantree',42613113,0,'1999-06-14'),(149,'Bartlet','Robers',40596521,0,'1993-07-24'),(150,'Christen','Goymer',40159873,0,'1995-06-13'),(151,'Jamie','Maraga',42697786,0,'2022-07-22'),(152,'Thorndike','Maleney',40635376,0,'2002-06-14'),(153,'Leroi','Fairpool',46465921,0,'2020-07-30'),(154,'Morse','McRill',44645082,0,'2021-07-19'),(155,'Margret','Rosone',48783647,0,'2022-01-04'),(156,'Thorstein','Dollen',44777303,0,'2021-05-31'),(157,'Eddie','Lots',44759551,0,'2017-01-15'),(158,'Sloan','Ruvel',45479153,0,'1996-12-18'),(159,'Darby','Shallo',44501728,0,'2009-09-11'),(160,'Aurie','Fortescue',41726079,0,'1983-08-07'),(161,'Ignace','Celloni',42216057,0,'2014-11-20'),(162,'Nichole','Hammill',43889119,0,'1999-08-25'),(163,'Thaddeus','Halliburton',48200670,0,'1979-08-01'),(164,'Jessa','O\'Dowd',44503554,0,'1974-12-15'),(165,'Vasili','McGibbon',49528191,0,'2012-01-13'),(166,'Gherardo','Iddenden',41665392,0,'2011-04-24'),(167,'Deanne','Stuckow',42783974,0,'1996-06-17'),(168,'Aidan','Dorricott',44271468,0,'1974-05-15'),(169,'Magda','Relfe',45299379,0,'2008-06-16'),(170,'Carmella','Mammatt',48913317,0,'1995-03-12'),(171,'Charla','Blomfield',49247278,0,'1976-08-01'),(172,'Brigida','Boulding',46434482,0,'2023-05-04'),(173,'Silvio','Randales',43513052,0,'2012-12-13'),(174,'Gaby','Garrat',45761169,0,'2020-09-25'),(175,'Candra','Griffen',42614035,0,'1990-11-01'),(176,'Lark','O\'Howbane',43098059,0,'2017-12-15'),(177,'Tabitha','Cossington',42453344,0,'1993-04-16'),(178,'Humfrey','Vint',49851165,0,'1988-07-30'),(179,'Ferrell','Hrinchenko',47061604,0,'1989-01-07'),(180,'Fonzie','Hurley',43560160,0,'2005-05-10'),(181,'Bradley','Lashley',48949670,0,'1985-09-26'),(182,'Brunhilde','Crimmins',48746938,0,'1988-08-10'),(183,'Bab','O\'Keevan',45749828,0,'2011-11-01'),(184,'Merry','Vooght',41036489,0,'2019-05-10'),(185,'Jeannie','Dunderdale',44487028,0,'1987-04-10'),(186,'Illa','Gorch',41652736,0,'2004-04-17'),(187,'Elbert','Standring',44662305,0,'1985-08-27'),(188,'Carita','Stubbe',47388714,0,'1991-05-24'),(189,'Ladonna','Rawe',49526323,0,'1976-01-01'),(190,'Kennie','Simko',49822956,0,'1981-10-25'),(191,'Bell','Carle',44184593,0,'2007-01-29'),(192,'Yehudit','Nutley',44830435,0,'2015-12-14'),(193,'Phelia','Brandts',44509774,0,'1984-07-14'),(194,'Jessamyn','Bletcher',45585737,0,'2000-10-22'),(195,'Valerie','Giacobelli',40172259,0,'1976-06-11'),(196,'Jeniffer','Mattimoe',49106399,0,'2005-10-14'),(197,'Toma','Pineaux',44382110,0,'1975-08-13'),(198,'Izak','Spriddle',41961165,0,'1986-09-12'),(199,'Kale','Phoenix',49703396,0,'1982-08-26'),(200,'Myer','Blackstock',45261177,0,'1979-03-02'),(201,'Ruthy','Scathard',41326034,0,'2023-11-11'),(202,'Ansley','Mazillius',43986506,0,'2007-10-31'),(203,'Andie','Shavel',42906128,0,'1993-07-28'),(204,'Sergent','Kyte',47937032,0,'2020-05-14'),(205,'Allx','Swendell',46619728,0,'1997-02-15'),(206,'Deana','Kummerlowe',49767594,0,'2000-07-11'),(207,'Abel','Swain',41630602,0,'1987-04-05'),(208,'Mella','Ive',48584375,0,'2010-09-15'),(209,'Tisha','Warricker',46997304,0,'2017-10-07'),(210,'Gustavo','Goldin',46563333,0,'1982-09-18'),(211,'Murielle','Matthew',42595973,0,'1986-04-09'),(212,'Cariotta','Adamsen',44870047,0,'2009-03-14'),(213,'Darcy','Stuchburie',47653038,0,'2013-03-15'),(214,'Petronille','Benza',49887656,0,'2014-05-31'),(215,'Gerome','Merlin',42519214,0,'2008-06-19'),(216,'Franky','Antoniottii',49657672,0,'1975-02-02'),(217,'Clea','Honisch',40236297,0,'1976-01-16'),(218,'Timoteo','Murison',45027017,0,'1980-12-11'),(219,'Lettie','Saunton',43810993,0,'2002-08-06'),(220,'Josefina','Zettoi',42196231,0,'1996-02-27'),(221,'Lorine','Rosenau',40614892,0,'1998-12-28'),(222,'Aldridge','Heersema',41981207,0,'1982-06-27'),(223,'Darrick','Pavluk',47322652,0,'1991-06-15'),(224,'Sherye','Jordine',48980571,0,'1985-10-24'),(225,'Myron','Veschambes',43920480,0,'1980-09-12'),(226,'Rosabella','Dungey',49954791,0,'2022-01-22'),(227,'Alec','Murdy',49303342,0,'1994-03-19'),(228,'Antoni','ducarme',42863055,0,'1980-11-19'),(229,'Zane','Gors',44881342,0,'1997-10-10'),(230,'Thorny','Boshere',42565261,0,'2022-03-24'),(231,'Trixie','Tayloe',48000819,0,'1993-10-27'),(232,'Rozalie','Dain',45890233,0,'1978-06-04'),(233,'Tobit','Grishaev',47648836,0,'1986-08-26'),(234,'Dorie','Richardon',42589383,0,'2023-12-23'),(235,'Wylie','Pleat',40623633,0,'1985-12-10'),(236,'Gay','Rosle',41318476,0,'1983-10-13'),(237,'Brooks','Haglinton',42241324,0,'1987-01-28'),(238,'Casandra','Spellworth',45629247,0,'2010-01-11'),(239,'Humbert','Norcross',45475030,0,'2014-12-06'),(240,'Beckie','Sullivan',43926233,0,'2020-07-26'),(241,'Georgine','Dunniom',43166995,0,'1984-01-20'),(242,'Rhodie','Windross',47037592,0,'1984-07-22'),(243,'Dyan','Overy',46544095,0,'1996-08-13'),(244,'Arty','Bilsborrow',44362204,0,'2005-06-04'),(245,'Indira','Illwell',48422440,0,'2013-04-12'),(246,'Chrisy','Lindman',46457128,0,'1976-02-14'),(247,'Adolphus','Peidro',49940074,0,'2016-10-06'),(248,'Barnard','Bernardo',40883043,0,'1981-06-19'),(249,'Lauretta','Davies',42795166,0,'1983-01-10'),(250,'Dido','Tyer',40819391,0,'1996-09-27');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plantilla`
--

DROP TABLE IF EXISTS `plantilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plantilla` (
  `idPlantilla` int NOT NULL AUTO_INCREMENT,
  `idJugador` int DEFAULT NULL,
  `Posiciones_idPosiciones` int NOT NULL,
  `NumeroDorsal` varchar(45) DEFAULT NULL,
  `idEquipoFutbol` int DEFAULT NULL,
  PRIMARY KEY (`idPlantilla`,`Posiciones_idPosiciones`),
  KEY `IdJugadores_Plantilla_idx` (`idJugador`),
  KEY `fk_Plantilla_Posiciones1_idx` (`Posiciones_idPosiciones`),
  KEY `IdEquipoFutbol_idx` (`idEquipoFutbol`),
  CONSTRAINT `fk_Plantilla_Posiciones1` FOREIGN KEY (`Posiciones_idPosiciones`) REFERENCES `posiciones` (`idPosiciones`),
  CONSTRAINT `IdEquipoFutbol` FOREIGN KEY (`idEquipoFutbol`) REFERENCES `equipofutbol` (`idEquipoFutbol`),
  CONSTRAINT `IdJugador` FOREIGN KEY (`idJugador`) REFERENCES `jugadores` (`IdJugadores`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plantilla`
--

LOCK TABLES `plantilla` WRITE;
/*!40000 ALTER TABLE `plantilla` DISABLE KEYS */;
INSERT INTO `plantilla` VALUES (0,1,1,'1',32),(1,2,2,'2',12),(2,3,3,'2',20),(3,4,4,'3',11),(4,5,1,'4',29),(5,6,2,'5',12),(6,7,3,'6',6),(7,8,4,'7',36),(8,9,4,'8',7),(9,10,4,'9',4),(10,11,3,'10',9),(11,12,4,'11',13),(12,13,3,'12',35),(13,14,3,'13',35),(14,15,2,'14',37),(15,16,3,'15',28),(16,17,2,'16',39),(17,18,3,'17',20),(18,19,2,'18',29),(19,20,2,'19',16),(20,21,4,'20',32),(21,22,1,'21',35),(22,23,1,'22',18),(23,24,3,'23',31),(24,25,1,'24',32),(25,26,4,'25',13),(26,27,3,'26',26),(27,28,1,'27',24),(28,29,3,'28',23),(29,30,4,'29',28),(30,31,4,'30',10),(31,32,3,'31',11),(32,33,3,'32',35),(33,34,4,'33',20),(34,35,1,'34',27),(35,36,2,'35',11),(36,37,3,'36',36),(37,38,4,'37',3),(38,39,2,'38',8),(39,40,2,'39',30),(40,41,2,'40',33),(41,42,4,'41',33),(42,43,3,'42',14),(43,44,1,'43',11),(44,45,1,'44',6),(45,46,1,'45',3),(46,47,1,'46',38),(47,48,3,'47',29);
/*!40000 ALTER TABLE `plantilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posiciones`
--

DROP TABLE IF EXISTS `posiciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posiciones` (
  `idPosiciones` int NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `JugadoresConvocados` int DEFAULT NULL,
  PRIMARY KEY (`idPosiciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posiciones`
--

LOCK TABLES `posiciones` WRITE;
/*!40000 ALTER TABLE `posiciones` DISABLE KEYS */;
INSERT INTO `posiciones` VALUES (1,'ARQUERO',NULL),(2,'DEFENSA',NULL),(3,'MEDIOCAMPO',NULL),(4,'DELANTERO',NULL);
/*!40000 ALTER TABLE `posiciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion`
--

DROP TABLE IF EXISTS `relacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacion` (
  `Managers_idManagers` int NOT NULL,
  `EquipoFutbol_idEquipoFutbol` int NOT NULL,
  `Relacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Managers_idManagers`,`EquipoFutbol_idEquipoFutbol`),
  KEY `fk_Managers_has_EquipoFutbol_EquipoFutbol1_idx` (`EquipoFutbol_idEquipoFutbol`),
  KEY `fk_Managers_has_EquipoFutbol_Managers1_idx` (`Managers_idManagers`),
  CONSTRAINT `fk_Managers_has_EquipoFutbol_EquipoFutbol1` FOREIGN KEY (`EquipoFutbol_idEquipoFutbol`) REFERENCES `equipofutbol` (`idEquipoFutbol`),
  CONSTRAINT `fk_Managers_has_EquipoFutbol_Managers1` FOREIGN KEY (`Managers_idManagers`) REFERENCES `managers` (`idManagers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion`
--

LOCK TABLES `relacion` WRITE;
/*!40000 ALTER TABLE `relacion` DISABLE KEYS */;
INSERT INTO `relacion` VALUES (1,1,'Prohibida'),(2,2,'Asociada'),(3,3,'Asociada'),(4,4,'Prohibida'),(5,5,'Prohibida'),(6,6,'Asociada'),(7,7,'Prohibida'),(8,8,'Prohibida'),(9,9,'Prohibida'),(10,10,'Asociada'),(11,11,'Prohibida'),(12,12,'Asociada'),(13,13,'Asociada'),(14,14,'Prohibida'),(15,15,'Prohibida'),(16,16,'Prohibida'),(17,17,'Prohibida'),(18,18,'Asociada'),(19,19,'Asociada'),(20,20,'Prohibida'),(21,21,'Asociada'),(22,22,'Prohibida'),(23,23,'Asociada'),(24,24,'Asociada'),(25,25,'Prohibida'),(26,26,'Prohibida'),(27,27,'Asociada'),(28,28,'Asociada'),(29,29,'Asociada'),(30,30,'Prohibida');
/*!40000 ALTER TABLE `relacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-20 20:12:13
