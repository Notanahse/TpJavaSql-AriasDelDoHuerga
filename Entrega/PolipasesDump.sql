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
INSERT INTO `fichaje` VALUES (1,1,6,'2020-03-17 14:51:00','Confirmado'),(2,32,2,'2024-10-12 06:23:21','confirmado'),(3,33,3,'2024-10-13 19:51:07','confirmado'),(4,34,4,'2024-10-14 02:17:16','rechazado'),(6,31,1,'2024-10-11 12:53:00','confirmado'),(7,37,7,'2024-10-17 22:03:11','rechazado'),(8,38,8,'2024-10-18 06:28:03','confirmado'),(9,39,9,'2024-10-19 15:10:55','rechazado'),(10,40,10,'2024-10-20 11:24:20','confirmado'),(11,41,11,'2024-10-21 10:20:00','rechazado'),(12,42,12,'2024-10-22 12:50:30','confirmado'),(13,43,13,'2024-10-23 20:55:00','rechazado'),(14,44,14,'2024-10-24 17:37:10','confirmado'),(15,45,15,'2024-10-25 19:23:06','confirmado'),(16,36,6,'2024-10-16 14:15:02','confirmado'),(17,45,15,'2024-10-25 19:23:06','rechazado'),(18,27,15,'2024-10-25 19:23:06','rechazado'),(19,39,15,'2024-10-25 19:23:06','rechazado'),(20,49,15,'2024-10-25 19:23:06','rechazado'),(24,125,17,'2024-01-22 00:00:00','confirmado'),(25,129,10,'2022-04-04 00:00:00','rechazado'),(31,114,12,'2018-04-15 00:00:00','confirmado'),(33,94,20,'2018-12-28 00:00:00','rechazado'),(34,63,2,'2020-01-23 00:00:00','rechazado'),(36,57,13,'2011-05-03 00:00:00','confirmado'),(38,72,4,'2021-05-20 00:00:00','rechazado'),(39,55,27,'2020-01-18 00:00:00','rechazado'),(43,116,7,'2022-09-01 00:00:00','confirmado'),(48,119,28,'2020-01-16 00:00:00','rechazado'),(49,125,22,'2023-05-15 00:00:00','confirmado'),(50,90,1,'2019-01-15 00:00:00','rechazado'),(51,111,21,'2015-05-02 00:00:00','confirmado'),(52,133,20,'2016-07-19 00:00:00','rechazado'),(55,114,38,'2023-02-08 00:00:00','confirmado'),(56,80,12,'2024-09-17 00:00:00','confirmado'),(58,79,29,'2023-07-20 00:00:00','confirmado');
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
INSERT INTO `jugadores` VALUES (31,1,28,17404),(32,2,30,35078),(33,3,14,23178),(34,4,18,90659),(35,5,3,13755),(36,6,28,56803),(37,7,4,52747),(38,8,12,83329),(39,9,11,68400),(40,10,22,82014),(41,11,9,14870),(42,12,1,88311),(43,13,4,26939),(44,14,17,39767),(45,15,6,18017),(46,16,27,50785),(47,17,17,99876),(48,18,16,67020),(49,19,26,25474),(50,20,27,96314),(51,21,29,35142),(52,22,14,56773),(53,23,19,78439),(54,24,23,31873),(55,25,26,94049),(56,26,19,94624),(57,27,30,90973),(58,28,28,70993),(59,29,3,72046),(60,30,24,47252),(61,31,21,10123),(62,32,17,78858),(63,33,1,83922),(64,34,24,83035),(65,35,3,63409),(66,36,21,57938),(67,37,28,89465),(68,38,27,83510),(69,39,20,49153),(70,40,22,75236),(71,41,25,38721),(72,42,8,47898),(73,43,14,23325),(74,44,7,52933),(75,45,3,94690),(76,46,29,34649),(77,47,26,59179),(78,48,23,91944),(79,49,3,92183),(80,50,3,85084),(81,51,11,48870),(82,52,2,69098),(83,53,30,98880),(84,54,8,97106),(85,55,3,88891),(86,56,29,53134),(87,57,1,78998),(88,58,16,45587),(89,59,19,70941),(90,60,10,27944),(91,61,24,96901),(92,62,5,30666),(93,63,22,32632),(94,64,29,61164),(95,65,16,17919),(96,66,19,76108),(97,67,15,46782),(98,68,19,85585),(99,69,25,97576),(100,70,15,41127),(101,71,15,82907),(102,72,1,11152),(103,73,7,67041),(104,74,21,21747),(105,75,9,77615),(106,76,8,42832),(107,77,26,61318),(381,79,9,5375450),(308,80,29,6312447),(332,85,6,4867408),(369,86,28,4424398),(357,89,8,7605279),(373,90,26,4947403),(318,93,22,8186622),(394,94,25,7631681),(324,100,8,4096973),(335,105,19,7210915),(280,111,14,9596459),(337,114,4,5761088),(394,115,15,6102975),(288,116,8,807990),(364,119,2,4269298),(293,125,24,3874114),(330,126,1,6732807),(327,128,20,6378226),(367,129,8,115340),(349,133,28,8770608),(281,140,29,448421),(330,141,13,7232798),(390,148,23,8595401),(395,149,14,528471),(319,150,2,762672),(301,151,6,8524294),(361,156,1,8601236),(395,157,25,9745774),(307,158,14,7446772),(366,160,7,9602109),(334,161,29,5022096),(367,162,15,5045920),(265,166,30,4612321),(332,167,3,390222),(285,171,17,1378170),(291,172,6,3817833),(349,173,19,7899573),(333,175,15,9658368),(308,178,15,5508735),(313,180,1,5311179),(281,181,1,1353808),(310,187,29,6702704),(308,188,29,7072855),(308,192,23,9763651),(251,194,9,4565943),(334,196,14,3045591),(286,198,8,3055878),(296,201,11,3627488),(364,202,27,2979381),(324,203,29,1557519),(371,204,8,2597807),(374,205,3,1542915),(270,206,28,8810320),(320,207,7,732979),(303,209,20,3844172),(316,210,3,7418774),(319,211,30,6170715),(325,213,28,6638389),(276,214,20,1595595),(305,218,30,9555896),(261,219,29,8466321),(276,222,16,9627386),(257,225,24,6091913),(320,229,21,9219607),(254,232,9,4971229),(261,233,26,4678958),(255,236,20,2653118),(332,237,17,8581014),(275,239,30,3807799),(326,242,20,7630048),(361,244,11,5572269),(373,246,3,7711272),(296,249,8,450414),(342,251,28,1322592),(370,254,24,8925763),(290,256,26,4335129),(330,262,12,1736015),(360,263,3,117640),(265,266,8,5975298),(291,273,25,4046281),(270,275,22,5400573),(329,276,3,3139433),(301,278,10,1406749),(366,279,6,5557997),(291,280,26,8874388),(365,282,1,6160476),(365,284,15,4916726),(283,285,12,3977679),(379,291,22,7947077),(395,294,3,830821),(270,296,7,3149880),(307,299,10,7590422);
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
INSERT INTO `persona` VALUES (1,'Keeley','Le Ball',43675901,1,'1987-01-18'),(2,'Kerry','Murthwaite',44037040,1,'2018-07-10'),(3,'Lexi','Salvador',48079054,1,'2007-06-24'),(4,'Grace','Rumgay',44488150,1,'2007-10-28'),(5,'Terese','Brister',48996636,1,'1992-09-07'),(6,'Reba','Cobleigh',43502089,1,'2015-12-13'),(7,'Bald','Persey',42311961,1,'1977-09-14'),(8,'Shanda','Erskin',43596298,1,'2016-08-27'),(9,'Darrelle','Gwillyam',48932194,1,'1976-03-05'),(10,'Lew','Pallas',49851560,1,'2006-11-29'),(11,'Susann','Whitwham',43340086,1,'1982-01-14'),(12,'Dorothy','Annets',49247903,1,'2015-06-12'),(13,'Cherye','Hauch',48179722,1,'2007-02-14'),(14,'Gayler','Digance',41141944,1,'2015-04-09'),(15,'Anjela','Enstone',44347547,1,'1980-12-31'),(16,'Federica','Durker',49358367,1,'1985-03-05'),(17,'Lauree','Curgenven',42858160,1,'2008-11-14'),(18,'Corrie','Swan',49902942,1,'2014-11-05'),(19,'Jamil','Stoffels',45285840,1,'2023-08-14'),(20,'Britteny','Hulkes',43155236,1,'1999-07-21'),(21,'Jonie','Brim',43579462,1,'2002-11-25'),(22,'Chastity','Orman',40082723,1,'1991-11-08'),(23,'Stanwood','Huffy',44753894,1,'1976-07-26'),(24,'Duffy','Hurlston',49766978,1,'1983-04-09'),(25,'Whitney','Alexandersson',46401484,1,'2012-08-24'),(26,'Roth','Eliff',43152058,1,'1989-06-09'),(27,'Martita','Duiguid',45750981,1,'1985-03-29'),(28,'Morey','Netherwood',47847268,1,'1983-11-23'),(29,'Ike','Olman',45925211,1,'1989-09-27'),(30,'Brena','Leil',43782650,1,'2023-01-08'),(31,'Darcie','Lowsely',41350144,0,'2021-11-22'),(32,'Locke','Bleackly',46820772,0,'2016-05-30'),(33,'Cristine','Tomasutti',43438011,0,'1992-05-17'),(34,'Marlon','Peres',48392854,0,'1988-08-24'),(35,'Kermy','Streather',43409656,0,'1992-02-07'),(36,'Fernande','Piel',45347698,0,'2020-07-27'),(37,'Cacilie','Trase',41176646,0,'2002-07-22'),(38,'Frans','Fabbro',41010426,0,'1977-01-24'),(39,'Evyn','Huthart',45362953,0,'2003-08-28'),(40,'Livvie','Moiser',46139974,0,'2013-02-01'),(41,'Mort','Bellanger',45078191,0,'1980-06-23'),(42,'Bartholomeo','Aspinell',42943625,0,'1989-02-10'),(43,'Candis','Elliker',48245567,0,'1980-02-19'),(44,'Philipa','Ellph',44081950,0,'2009-04-30'),(45,'Felipa','Pollitt',44198932,0,'1982-04-02'),(46,'Corrianne','Kenderdine',45348705,0,'2009-04-07'),(47,'Gill','Greatbach',43732389,0,'1975-08-01'),(48,'Georgi','Natt',45001072,0,'1976-02-07'),(49,'Marketa','Brotherhood',41625262,0,'1979-10-08'),(50,'Bendicty','McCanny',48080218,0,'1996-07-15'),(51,'Cyndi','Adriaens',43934779,0,'2019-05-20'),(52,'Andreana','Mulles',46873802,0,'1983-04-25'),(53,'Janie','Mylchreest',41941401,0,'1984-05-29'),(54,'Celesta','Hendren',46871640,0,'1998-02-08'),(55,'Vivyanne','Sangra',49077341,0,'2013-04-22'),(56,'Marylou','Jannaway',46557839,0,'1998-03-22'),(57,'Catherin','Scrigmour',48388242,0,'1977-03-10'),(58,'Vinnie','Boylan',47466781,0,'2017-04-08'),(59,'Cullie','Kopje',48914942,0,'1980-10-17'),(60,'Joellen','Kenney',44668291,0,'1978-02-27'),(61,'Becki','Ranklin',43828739,0,'1974-05-26'),(62,'Bartholemy','Phillipps',43220254,0,'2013-07-11'),(63,'Aili','Wareham',44779302,0,'2020-06-08'),(64,'Odetta','Djurkovic',42498359,0,'1987-08-13'),(65,'Riannon','O\'Leahy',40107032,0,'2002-10-02'),(66,'Norrie','Pinder',46135170,0,'1976-12-06'),(67,'Raff','Olivas',45075658,0,'2002-05-24'),(68,'Mora','Jori',42090586,0,'2007-03-05'),(69,'Andrej','Rossant',42633811,0,'2004-09-09'),(70,'Othella','Aronowitz',42212490,0,'1977-12-10'),(71,'Brianne','Peizer',42004818,0,'2001-08-18'),(72,'Donella','Furbank',40493854,0,'2000-05-01'),(73,'Van','Bartolacci',42522697,0,'2022-10-07'),(74,'Norris','Barnewille',44359724,0,'1988-11-06'),(75,'Sibeal','Dicky',46032293,0,'2001-12-08'),(76,'Henderson','Van T\'Hoog',49295470,0,'2019-02-21'),(77,'Levi','Colquete',48501185,0,'2015-11-26'),(78,'Elle','Nasi',41426253,0,'1998-02-02'),(79,'Verney','Finnis',42443346,0,'2018-09-28'),(80,'Roshelle','Redihalgh',46389874,0,'1975-06-13'),(81,'Fedora','Morteo',40859131,0,'1997-01-02'),(82,'Joellen','MacLennan',41438551,0,'1984-09-08'),(83,'Callean','Canedo',42039806,0,'2008-06-02'),(84,'Briant','Petrello',47318574,0,'2014-01-16'),(85,'Locke','Beed',46833853,0,'2020-12-18'),(86,'Davide','Morse',40921030,0,'1988-09-09'),(87,'Carlina','O\'Fallone',46616759,0,'2006-07-23'),(88,'Towny','McKintosh',46956005,0,'1992-09-21'),(89,'Lesya','Alenikov',46128853,0,'2019-12-11'),(90,'Federica','Spieght',40338291,0,'1997-07-21'),(91,'Bendite','Santo',40030876,0,'2003-12-08'),(92,'Brooks','Ygou',40489142,0,'2003-01-07'),(93,'Odey','Lecointe',41314301,0,'1979-04-17'),(94,'Alastair','Clyne',42314680,0,'2013-05-23'),(95,'Waylin','Semrad',44585472,0,'2005-02-05'),(96,'Erik','McElane',49802804,0,'2011-04-27'),(97,'Ajay','Treuge',44505768,0,'2017-04-18'),(98,'Trace','Gerhts',46947977,0,'1978-07-15'),(99,'Isak','Bushen',45241765,0,'2016-10-11'),(100,'Alisha','Yanshin',48926713,0,'1974-04-18'),(101,'Inglis','Fendley',43424586,0,'1997-02-16'),(102,'Harlie','McClaughlin',45431038,0,'1988-10-06'),(103,'Waldon','Clarke-Williams',47750707,0,'1978-06-09'),(104,'Merrel','Van Dalen',43944296,0,'2001-11-21'),(105,'Rudd','Gonnet',47559890,0,'2000-02-24'),(106,'Pembroke','Penddreth',41194228,0,'2021-01-25'),(107,'Blair','Cicco',45518603,0,'1980-11-29'),(108,'Jannelle','Martusewicz',40303113,0,'2017-05-03'),(109,'Gradey','Baribal',42707962,0,'2019-12-18'),(110,'Jilleen','Koppen',43045695,0,'2023-10-20'),(111,'Barbabra','Stammirs',41966733,0,'1985-02-14'),(112,'Carissa','Curedell',48277278,0,'1980-03-19'),(113,'Zondra','Ginnally',49366106,0,'2021-09-08'),(114,'Cirillo','Benbrick',46434659,0,'1993-10-23'),(115,'Larry','Iacopo',40454906,0,'1979-12-26'),(116,'Calley','Tantrum',45971134,0,'1994-06-27'),(117,'Sollie','Hannis',42688984,0,'2008-06-28'),(118,'Cullin','Codrington',46540061,0,'1984-12-28'),(119,'Shandra','Ricson',44319253,0,'1975-06-28'),(120,'Mirna','Howlin',42945115,0,'1998-06-18'),(121,'Moll','Bazley',41859900,0,'1991-11-06'),(122,'Ame','Bugbee',42768777,0,'1989-11-07'),(123,'Louella','Bolletti',42678198,0,'1999-09-18'),(124,'Kerk','MacLeod',47703670,0,'2005-01-05'),(125,'Elfrieda','Prine',40773054,0,'2001-12-06'),(126,'Dun','Reinhardt',43074695,0,'2020-08-13'),(127,'Denver','Joy',48977517,0,'2023-04-17'),(128,'Fina','Bails',49637861,0,'1980-08-14'),(129,'Letta','Coslett',46094379,0,'2009-03-19'),(130,'Melita','Lantiff',49869903,0,'1980-03-19'),(131,'Humphrey','Beadnell',42355594,0,'1999-06-03'),(132,'Wynn','Clohisey',42382962,0,'1982-06-19'),(133,'Hildegarde','Chene',45019776,0,'1990-01-23'),(134,'Cad','Warde',49775464,0,'1978-12-04'),(135,'Shaina','Androck',44242719,0,'2000-06-03'),(136,'Franciskus','Lawly',48391830,0,'1991-05-09'),(137,'Lillian','Grimbaldeston',45666627,0,'1981-06-29'),(138,'Garrik','Andreassen',41750066,0,'2009-05-27'),(139,'Alistair','Scarsbrick',48752148,0,'1978-07-18'),(140,'Elysia','Hanigan',40897102,0,'1990-07-03'),(141,'Austine','De Brett',42098046,0,'1992-11-22'),(142,'Belita','Bartol',45302463,0,'2018-12-13'),(143,'Levon','Wisden',44890173,0,'1992-02-01'),(144,'Kelby','Matthiae',40432941,0,'1979-07-30'),(145,'Mitchel','Kroch',49555558,0,'1997-08-12'),(146,'Cammie','Couthard',48994854,0,'1975-05-08'),(147,'Tadeo','Glazer',46647323,0,'2009-11-24'),(148,'Hadley','Chantree',42613113,0,'1999-06-14'),(149,'Bartlet','Robers',40596521,0,'1993-07-24'),(150,'Christen','Goymer',40159873,0,'1995-06-13'),(151,'Jamie','Maraga',42697786,0,'2022-07-22'),(152,'Thorndike','Maleney',40635376,0,'2002-06-14'),(153,'Leroi','Fairpool',46465921,0,'2020-07-30'),(154,'Morse','McRill',44645082,0,'2021-07-19'),(155,'Margret','Rosone',48783647,0,'2022-01-04'),(156,'Thorstein','Dollen',44777303,0,'2021-05-31'),(157,'Eddie','Lots',44759551,0,'2017-01-15'),(158,'Sloan','Ruvel',45479153,0,'1996-12-18'),(159,'Darby','Shallo',44501728,0,'2009-09-11'),(160,'Aurie','Fortescue',41726079,0,'1983-08-07'),(161,'Ignace','Celloni',42216057,0,'2014-11-20'),(162,'Nichole','Hammill',43889119,0,'1999-08-25'),(163,'Thaddeus','Halliburton',48200670,0,'1979-08-01'),(164,'Jessa','O\'Dowd',44503554,0,'1974-12-15'),(165,'Vasili','McGibbon',49528191,0,'2012-01-13'),(166,'Gherardo','Iddenden',41665392,0,'2011-04-24'),(167,'Deanne','Stuckow',42783974,0,'1996-06-17'),(168,'Aidan','Dorricott',44271468,0,'1974-05-15'),(169,'Magda','Relfe',45299379,0,'2008-06-16'),(170,'Carmella','Mammatt',48913317,0,'1995-03-12'),(171,'Charla','Blomfield',49247278,0,'1976-08-01'),(172,'Brigida','Boulding',46434482,0,'2023-05-04'),(173,'Silvio','Randales',43513052,0,'2012-12-13'),(174,'Gaby','Garrat',45761169,0,'2020-09-25'),(175,'Candra','Griffen',42614035,0,'1990-11-01'),(176,'Lark','O\'Howbane',43098059,0,'2017-12-15'),(177,'Tabitha','Cossington',42453344,0,'1993-04-16'),(178,'Humfrey','Vint',49851165,0,'1988-07-30'),(179,'Ferrell','Hrinchenko',47061604,0,'1989-01-07'),(180,'Fonzie','Hurley',43560160,0,'2005-05-10'),(181,'Bradley','Lashley',48949670,0,'1985-09-26'),(182,'Brunhilde','Crimmins',48746938,0,'1988-08-10'),(183,'Bab','O\'Keevan',45749828,0,'2011-11-01'),(184,'Merry','Vooght',41036489,0,'2019-05-10'),(185,'Jeannie','Dunderdale',44487028,0,'1987-04-10'),(186,'Illa','Gorch',41652736,0,'2004-04-17'),(187,'Elbert','Standring',44662305,0,'1985-08-27'),(188,'Carita','Stubbe',47388714,0,'1991-05-24'),(189,'Ladonna','Rawe',49526323,0,'1976-01-01'),(190,'Kennie','Simko',49822956,0,'1981-10-25'),(191,'Bell','Carle',44184593,0,'2007-01-29'),(192,'Yehudit','Nutley',44830435,0,'2015-12-14'),(193,'Phelia','Brandts',44509774,0,'1984-07-14'),(194,'Jessamyn','Bletcher',45585737,0,'2000-10-22'),(195,'Valerie','Giacobelli',40172259,0,'1976-06-11'),(196,'Jeniffer','Mattimoe',49106399,0,'2005-10-14'),(197,'Toma','Pineaux',44382110,0,'1975-08-13'),(198,'Izak','Spriddle',41961165,0,'1986-09-12'),(199,'Kale','Phoenix',49703396,0,'1982-08-26'),(200,'Myer','Blackstock',45261177,0,'1979-03-02'),(201,'Ruthy','Scathard',41326034,0,'2023-11-11'),(202,'Ansley','Mazillius',43986506,0,'2007-10-31'),(203,'Andie','Shavel',42906128,0,'1993-07-28'),(204,'Sergent','Kyte',47937032,0,'2020-05-14'),(205,'Allx','Swendell',46619728,0,'1997-02-15'),(206,'Deana','Kummerlowe',49767594,0,'2000-07-11'),(207,'Abel','Swain',41630602,0,'1987-04-05'),(208,'Mella','Ive',48584375,0,'2010-09-15'),(209,'Tisha','Warricker',46997304,0,'2017-10-07'),(210,'Gustavo','Goldin',46563333,0,'1982-09-18'),(211,'Murielle','Matthew',42595973,0,'1986-04-09'),(212,'Cariotta','Adamsen',44870047,0,'2009-03-14'),(213,'Darcy','Stuchburie',47653038,0,'2013-03-15'),(214,'Petronille','Benza',49887656,0,'2014-05-31'),(215,'Gerome','Merlin',42519214,0,'2008-06-19'),(216,'Franky','Antoniottii',49657672,0,'1975-02-02'),(217,'Clea','Honisch',40236297,0,'1976-01-16'),(218,'Timoteo','Murison',45027017,0,'1980-12-11'),(219,'Lettie','Saunton',43810993,0,'2002-08-06'),(220,'Josefina','Zettoi',42196231,0,'1996-02-27'),(221,'Lorine','Rosenau',40614892,0,'1998-12-28'),(222,'Aldridge','Heersema',41981207,0,'1982-06-27'),(223,'Darrick','Pavluk',47322652,0,'1991-06-15'),(224,'Sherye','Jordine',48980571,0,'1985-10-24'),(225,'Myron','Veschambes',43920480,0,'1980-09-12'),(226,'Rosabella','Dungey',49954791,0,'2022-01-22'),(227,'Alec','Murdy',49303342,0,'1994-03-19'),(228,'Antoni','ducarme',42863055,0,'1980-11-19'),(229,'Zane','Gors',44881342,0,'1997-10-10'),(230,'Thorny','Boshere',42565261,0,'2022-03-24'),(231,'Trixie','Tayloe',48000819,0,'1993-10-27'),(232,'Rozalie','Dain',45890233,0,'1978-06-04'),(233,'Tobit','Grishaev',47648836,0,'1986-08-26'),(234,'Dorie','Richardon',42589383,0,'2023-12-23'),(235,'Wylie','Pleat',40623633,0,'1985-12-10'),(236,'Gay','Rosle',41318476,0,'1983-10-13'),(237,'Brooks','Haglinton',42241324,0,'1987-01-28'),(238,'Casandra','Spellworth',45629247,0,'2010-01-11'),(239,'Humbert','Norcross',45475030,0,'2014-12-06'),(240,'Beckie','Sullivan',43926233,0,'2020-07-26'),(241,'Georgine','Dunniom',43166995,0,'1984-01-20'),(242,'Rhodie','Windross',47037592,0,'1984-07-22'),(243,'Dyan','Overy',46544095,0,'1996-08-13'),(244,'Arty','Bilsborrow',44362204,0,'2005-06-04'),(245,'Indira','Illwell',48422440,0,'2013-04-12'),(246,'Chrisy','Lindman',46457128,0,'1976-02-14'),(247,'Adolphus','Peidro',49940074,0,'2016-10-06'),(248,'Barnard','Bernardo',40883043,0,'1981-06-19'),(249,'Lauretta','Davies',42795166,0,'1983-01-10'),(250,'Dido','Tyer',40819391,0,'1996-09-27'),(251,'Alexandros','Santos',3019734,0,'1992-09-07'),(252,'Alessandra','Garbutt',8371541,0,'2019-08-03'),(254,'Gibb','Ungerecht',695346,0,'2002-09-15'),(255,'Carline','O\'Loghlen',7062891,0,'1990-12-04'),(257,'Harwell','Pedden',7702319,0,'1986-01-01'),(258,'Lanette','Raspin',1038956,0,'2009-05-07'),(259,'Cordy','Lowton',3525902,0,'1995-08-24'),(260,'Dinah','Redpath',5995149,0,'2003-08-04'),(261,'Anjanette','Clemow',5870541,0,'1982-06-07'),(263,'Elset','Kinnon',6018106,0,'2010-10-10'),(265,'Levin','Plail',4595199,0,'1998-02-23'),(267,'Hewet','Maestro',4408811,0,'1998-05-26'),(268,'Massimo','Dransfield',8267565,0,'2024-04-25'),(270,'Benedick','Gasnoll',4912437,0,'1986-12-02'),(274,'Klara','Dorant',8635281,0,'1980-08-13'),(275,'Marcelline','Manton',1452659,0,'1984-02-28'),(276,'Munmro','Gerred',7426105,0,'2001-11-16'),(277,'Lorry','Le Conte',7059462,0,'2005-02-09'),(278,'Lester','Nickoles',6309188,0,'2010-11-22'),(280,'Lidia','Gherardi',8806857,0,'2001-07-29'),(281,'Jock','Calton',5697596,0,'1992-01-17'),(282,'Faustine','Bartholomaus',8372603,0,'2015-05-30'),(283,'Zane','Follan',6362548,0,'2010-09-25'),(284,'Cinnamon','Seadon',4889861,0,'2017-09-02'),(285,'Emelita','Osborne',5814814,0,'1985-11-21'),(286,'Corinne','Traite',4427968,0,'1984-11-05'),(288,'Dex','Bezants',3783204,0,'1987-01-08'),(289,'Mufi','Muggeridge',2070099,0,'1994-05-19'),(290,'Madeline','Arnault',5792234,0,'1985-06-11'),(291,'Collin','Cleland',1648625,0,'1985-06-17'),(293,'Shalna','Gribbin',6351160,0,'2000-05-28'),(294,'Lisbeth','Ratley',8470134,0,'2012-09-26'),(295,'Armstrong','Ruit',293561,0,'2003-11-29'),(296,'Ewen','Wrightim',6039121,0,'2024-09-03'),(298,'Kim','Marioneau',8231153,0,'1996-12-24'),(299,'Lew','Melonby',3436873,0,'2003-09-04'),(301,'Cayla','Rablen',1115624,0,'2022-02-10'),(302,'Johna','Hassall',3182083,0,'1988-11-28'),(303,'Reuben','Gant',1010266,0,'1984-09-11'),(304,'Evelyn','Chetwind',985828,0,'2006-01-19'),(305,'Naomi','Cruddace',2913376,0,'1998-11-25'),(307,'Kippie','Jeaves',2903731,0,'2017-08-19'),(308,'Cy','Dangerfield',1036783,0,'2002-02-16'),(309,'Jefferey','Wycliffe',8201118,0,'2001-10-05'),(310,'Jo','Kitchener',5612344,0,'1978-02-04'),(313,'Ivonne','Pollett',9982873,0,'2000-09-30'),(314,'Malissa','Gaskarth',8634940,0,'1980-07-21'),(315,'Hakim','Hayen',5305123,0,'1997-11-16'),(316,'Winny','Vamplers',9529934,0,'1979-02-25'),(317,'Therese','Littlecote',5891993,0,'1980-09-30'),(318,'Harcourt','Thurling',2201614,0,'2011-05-17'),(319,'Cornela','Pawley',3054623,0,'1978-05-15'),(320,'Peri','Guly',5673613,0,'1982-08-16'),(322,'Zandra','Jeste',8959155,0,'2022-04-06'),(324,'Kippie','Geere',3788361,0,'1979-02-17'),(325,'Bari','Dansey',740522,0,'1991-09-05'),(326,'Catharina','De Stoop',9167230,0,'1994-08-09'),(327,'Emogene','Gave',5376316,0,'2024-03-08'),(329,'Caroljean','Heggs',1853122,0,'1984-08-31'),(330,'Deirdre','Berkeley',8267350,0,'1992-07-02'),(332,'Bertrando','Joubert',8929033,0,'1982-05-18'),(333,'Juline','Labet',4743870,0,'2014-03-22'),(334,'Ives','L\'Amie',6087113,0,'1999-01-10'),(335,'Caresa','Kyttor',7191821,0,'1979-09-24'),(336,'Heath','Crotty',5738727,0,'1980-01-14'),(337,'Deny','O\'Siaghail',1776194,0,'1990-04-18'),(339,'Othella','Elcoux',5358620,0,'2017-01-25'),(340,'Breena','Jacob',8407885,0,'1993-06-01'),(342,'Maxy','Pulfer',441986,0,'1996-09-16'),(345,'Mervin','Scougall',2899882,0,'2007-03-21'),(347,'Austin','MacTerrelly',3524119,0,'2022-03-02'),(349,'Henri','Vedenyapin',5158354,0,'1990-02-06'),(350,'Kanya','Jindacek',4356075,0,'2009-06-28'),(351,'Davidde','Moynham',9669183,0,'1991-09-01'),(353,'Hazel','Wellings',1359874,0,'1991-03-06'),(354,'Sonnnie','Hackworthy',1865822,0,'1989-05-13'),(355,'Kristian','Wong',8941659,0,'1993-09-12'),(357,'Jacquetta','Conachy',4087837,0,'2019-04-14'),(358,'Rickie','Rudeforth',2276717,0,'2021-12-10'),(359,'Lian','Carcass',769446,0,'1995-02-04'),(360,'Elyssa','Heffernon',376790,0,'1995-06-07'),(361,'Homere','Yoodall',4143490,0,'1997-08-11'),(363,'Noble','Poller',6106681,0,'2019-01-18'),(364,'Millisent','Ainscow',6138904,0,'1998-05-11'),(365,'Ardith','Fryd',5391509,0,'1980-03-27'),(366,'Adair','Sudy',2593091,0,'2011-09-16'),(367,'Uta','Elvins',9789885,0,'1995-10-30'),(369,'Lenci','Kubatsch',8870124,0,'1988-08-07'),(370,'Dolph','Drogan',3760926,0,'2017-07-18'),(371,'Darb','Howis',6530850,0,'1980-03-10'),(372,'Windy','Ranscomb',3437081,0,'2015-10-04'),(373,'Amalie','Moroney',1679723,0,'1978-10-05'),(374,'Jarrett','Marsden',2857872,0,'2005-07-27'),(376,'Norine','McCrea',8424428,0,'2003-02-11'),(377,'Imelda','Howerd',6192574,0,'2010-09-12'),(378,'Moria','Prendergast',4208964,0,'1997-01-29'),(379,'Dimitri','Crocumbe',825451,0,'2021-02-17'),(380,'Jaime','Yegorov',7373356,0,'1987-09-20'),(381,'Gerladina','Wraxall',7061033,0,'1989-05-09'),(382,'Lenee','Shotter',1341950,0,'1979-06-03'),(383,'Mavis','Hearsey',6163295,0,'1992-05-03'),(385,'Wallis','Jiroudek',8304914,0,'2013-10-26'),(388,'Brina','Beever',7904002,0,'1986-08-24'),(389,'Lou','Godbolt',1911295,0,'1987-03-17'),(390,'Conny','McInteer',3340694,0,'2009-04-04'),(394,'Nona','Flag',8853816,0,'2016-07-30'),(395,'Georgina','Huckster',7684220,0,'1980-05-18'),(396,'Jody','Cullon',5142474,0,'2007-01-30'),(398,'Amalee','Hillitt',3200284,0,'2000-12-15'),(400,'Natka','Belone',681477,0,'1999-11-27');
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
  `NumeroDorsal` int DEFAULT NULL,
  `idEquipoFutbol` int DEFAULT NULL,
  PRIMARY KEY (`idPlantilla`,`Posiciones_idPosiciones`),
  KEY `IdJugadores_Plantilla_idx` (`idJugador`),
  KEY `fk_Plantilla_Posiciones1_idx` (`Posiciones_idPosiciones`),
  KEY `IdEquipoFutbol_idx` (`idEquipoFutbol`),
  CONSTRAINT `fk_Plantilla_Posiciones1` FOREIGN KEY (`Posiciones_idPosiciones`) REFERENCES `posiciones` (`idPosiciones`),
  CONSTRAINT `IdEquipoFutbol` FOREIGN KEY (`idEquipoFutbol`) REFERENCES `equipofutbol` (`idEquipoFutbol`),
  CONSTRAINT `IdJugador` FOREIGN KEY (`idJugador`) REFERENCES `jugadores` (`IdJugadores`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plantilla`
--

LOCK TABLES `plantilla` WRITE;
/*!40000 ALTER TABLE `plantilla` DISABLE KEYS */;
INSERT INTO `plantilla` VALUES (0,1,1,1,32),(1,2,2,2,12),(2,3,3,2,20),(3,4,4,3,11),(4,5,1,4,29),(5,6,2,5,12),(6,7,3,6,6),(7,8,4,7,36),(8,9,4,8,7),(9,10,4,9,4),(10,11,3,10,9),(11,12,4,11,13),(12,13,3,12,35),(13,14,3,13,35),(14,15,2,14,37),(15,16,3,15,28),(16,17,2,16,39),(17,18,3,17,20),(18,19,2,18,29),(19,20,2,19,16),(20,21,4,20,32),(21,22,1,21,35),(22,23,1,22,18),(23,24,3,23,31),(24,25,1,24,32),(25,26,4,25,13),(26,27,3,26,26),(27,28,1,27,24),(28,29,3,28,23),(29,30,4,29,28),(30,31,4,30,10),(31,32,3,31,11),(32,33,3,32,35),(33,34,4,33,20),(34,35,1,34,27),(35,36,2,35,11),(36,37,3,36,36),(37,38,4,37,3),(38,39,2,38,8),(39,40,2,39,30),(40,41,2,40,33),(41,42,4,41,33),(42,43,3,42,14),(43,44,1,43,11),(44,45,1,44,6),(45,46,1,45,3),(46,47,1,46,38),(47,48,3,47,29),(49,49,2,48,3),(50,50,2,48,35),(51,51,1,48,10),(52,52,3,48,26),(53,53,1,48,8),(54,54,1,48,27),(55,55,3,48,2),(56,56,2,48,33),(57,57,4,48,16),(58,58,1,48,6),(59,59,3,48,12),(60,60,4,48,6),(61,61,1,48,34),(62,62,3,48,2),(63,63,3,48,3),(64,64,2,48,28),(65,65,2,48,27),(66,66,2,48,28),(67,67,2,48,4),(68,68,1,48,22),(69,69,1,48,17),(70,70,2,48,4),(71,71,1,48,4),(72,72,1,48,26),(73,73,3,48,27),(74,74,1,48,37),(75,75,1,48,32),(76,76,3,48,4),(77,77,2,48,21),(78,194,2,48,35),(79,232,1,48,14),(80,236,3,48,22),(81,225,3,48,10),(82,219,2,48,24),(83,233,3,48,17),(84,166,1,48,19),(85,266,4,48,10),(86,206,2,48,17),(87,275,4,48,27),(88,296,1,48,1),(89,239,1,48,1),(90,214,1,48,39),(91,222,4,48,38),(92,111,4,48,14),(93,140,1,48,33),(94,181,3,48,21),(95,285,4,48,28),(96,171,4,48,22),(97,198,4,48,12),(98,116,3,48,28),(99,256,4,48,31),(100,172,4,48,23),(101,273,4,48,36),(102,280,3,48,37),(103,125,2,48,27),(104,201,4,48,19),(105,249,3,48,31),(106,151,1,48,28),(107,278,3,48,21),(108,209,4,48,13),(109,218,3,48,24),(110,158,4,48,11),(111,299,4,48,29),(112,80,4,48,15),(113,178,1,48,13),(114,188,2,48,37),(115,192,2,48,26),(116,187,4,48,10),(117,180,3,48,21),(118,210,3,48,28),(119,93,3,48,23),(120,150,1,48,21),(121,211,4,48,36),(122,207,4,48,29),(123,229,4,48,30),(124,100,4,48,36),(125,203,1,48,20),(126,213,2,48,12),(127,242,2,48,8),(128,128,3,48,38),(129,276,3,48,18),(130,126,1,48,31),(131,141,1,48,29),(132,262,4,48,32),(133,85,1,48,2),(134,167,4,48,20),(135,237,4,48,10),(136,175,4,48,2),(137,161,2,48,13),(138,196,4,48,3),(139,105,4,48,12),(140,114,4,48,35),(141,251,1,48,13),(142,133,4,48,35),(143,173,3,48,7),(144,89,1,48,10),(145,263,4,48,7),(146,156,2,48,35),(147,244,1,48,16),(148,119,4,48,24),(149,202,1,48,35),(150,282,1,48,19),(151,284,2,48,35),(152,160,3,48,29),(153,279,3,48,27),(154,129,3,48,20),(155,162,2,48,19),(156,86,1,48,15),(157,254,2,48,28),(158,204,2,48,12),(159,90,1,48,15),(160,246,3,48,12),(161,205,2,48,9),(162,291,4,48,11),(163,79,1,48,20),(164,148,2,48,36),(165,94,3,48,36),(166,115,2,48,38),(167,149,4,48,9),(168,157,3,48,16),(169,294,1,48,28);
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

-- Dump completed on 2024-11-28 16:10:58
